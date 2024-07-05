// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:paisa/core/common.dart';
import 'package:paisa/core/enum/recurring_type.dart';
import 'package:paisa/core/enum/transaction_type.dart';
import 'package:paisa/core/use_case/use_case.dart';
import 'package:paisa/features/account/domain/entities/account_entity.dart';
import 'package:paisa/features/account/domain/use_case/account_use_case.dart';
import 'package:paisa/features/category/domain/entities/category.dart';
import 'package:paisa/features/settings/domain/use_case/settings_use_case.dart';
import 'package:paisa/features/transaction/domain/entities/transaction_entity.dart';
import 'package:paisa/features/transaction/domain/use_case/transaction_use_case.dart';

part 'transaction_bloc.freezed.dart';
part 'transaction_event.dart';
part 'transaction_state.dart';

@injectable
class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc(
    this.settingsUseCase,
    this._accountsUseCase,
    this._addTransactionUseCase,
    this._deleteTransactionUseCase,
    this._getTransactionUseCase,
    this._updateTransactionUseCase,
  ) : super(const TransactionState.initial()) {
    on<TransactionEvent>((event, emit) {});
    on<_AddOrUpdateExpenseEvent>(_addExpense);
    on<_ClearExpenseEvent>(_deleteExpense);
    on<_ChangeTransactionTypeEvent>(_changeExpense);
    on<_FindTransactionFromIdEvent>(_fetchExpenseFromId);
    on<_ChangeCategoryEvent>(_changeCategory);
    on<_ChangeAccountEvent>(_changeAccount);
    on<_UpdateDateTimeEvent>(_updateDateTime);
    on<_TransferAccountEvent>(_transferAccount);
  }

  final GetAccountsUseCase _accountsUseCase;
  final AddTransactionUseCase _addTransactionUseCase;
  String? currentDescription;
  TransactionEntity? currentExpense;
  final DeleteTransactionUseCase _deleteTransactionUseCase;
  String? expenseName;
  final GetTransactionUseCase _getTransactionUseCase;
  RecurringType recurringType = RecurringType.daily;
  int? selectedAccountId;
  CategoryEntity? selectedCategory;
  int? selectedCategoryId;
  DateTime selectedDate = DateTime.now();
  final SettingsUseCase settingsUseCase;
  TimeOfDay timeOfDay = TimeOfDay.now();
  AccountEntity? fromAccount, toAccount;
  double? transactionAmount;
  TransactionType transactionType = TransactionType.expense;
  final UpdateTransactionUseCase _updateTransactionUseCase;

  Future<void> _fetchExpenseFromId(
    _FindTransactionFromIdEvent event,
    Emitter<TransactionState> emit,
  ) async {
    final int? expenseId = event.expenseId;
    if (expenseId == null) {
      selectedAccountId = settingsUseCase.get(defaultAccountIdKey);
      return;
    }

    final TransactionEntity? transaction =
        await _getTransactionUseCase(GetTransactionParams(expenseId));
    if (transaction != null) {
      transactionAmount = transaction.currency;
      expenseName = transaction.name;
      selectedCategoryId = transaction.categoryId;
      selectedAccountId = transaction.accountId;
      selectedDate = transaction.time;
      timeOfDay = TimeOfDay.fromDateTime(transaction.time);
      transactionType = transaction.type;
      currentDescription = transaction.description;
      currentExpense = transaction;
      emit(TransactionState.transaction(transaction));
      Future.delayed(Duration.zero).then((value) =>
          add(TransactionEvent.changeTransactionType(transactionType)));
    } else {
      emit(const TransactionState.transactionError('Expense not found!'));
    }
  }

  Future<void> _addExpense(
    _AddOrUpdateExpenseEvent event,
    Emitter<TransactionState> emit,
  ) async {
    final double? validAmount = transactionAmount;
    final String? transactionName = expenseName;
    final int? categoryId = selectedCategoryId;
    final int? accountId = selectedAccountId;
    final int? fromAccountId = fromAccount?.superId;
    final int? toAccountId = toAccount?.superId;
    final DateTime dateTime = selectedDate;
    final String? description = currentDescription;

    if (validAmount == null || validAmount == 0.0) {
      return emit(
          const TransactionState.transactionError('Enter valid amount'));
    }
    if (transactionType == TransactionType.transfer) {
      if (fromAccountId == null || toAccountId == null) {
        return emit(
          const TransactionState.transactionError('Select from and to account'),
        );
      }
    } else {
      if (accountId == null || accountId == -1) {
        return emit(const TransactionState.transactionError('Select account'));
      }
    }
    if (categoryId == null) {
      return emit(const TransactionState.transactionError('Select category'));
    }
    final String name = ((transactionName == null || transactionName.isEmpty)
            ? selectedCategory?.name
            : transactionName) ??
        '';
    if (event.isAdding) {
      await _addTransactionUseCase(AddTransactionParams(
        name: name,
        amount: validAmount,
        time: dateTime,
        categoryId: categoryId,
        accountId: accountId ?? 0,
        transactionType: transactionType,
        description: description,
        fromAccountId: fromAccountId ?? -1,
        toAccountId: toAccountId ?? -1,
      ));
    } else {
      if (currentExpense == null) return;
      await _updateTransactionUseCase(UpdateTransactionParams(
        superId: currentExpense!.superId!,
        accountId: accountId ?? 0,
        categoryId: categoryId,
        currency: validAmount,
        description: description,
        name: name,
        time: dateTime,
        type: transactionType,
        fromAccountId: fromAccountId ?? -1,
        toAccountId: toAccountId ?? -1,
      ));
    }
    emit(TransactionState.transactionAdded(isAddOrUpdate: event.isAdding));
  }

  Future<void> _deleteExpense(
    _ClearExpenseEvent event,
    Emitter<TransactionState> emit,
  ) async {
    final int transactionId = event.expenseId;
    await _deleteTransactionUseCase(
      DeleteTransactionParams(transactionId),
    );
    emit(const TransactionState.transactionDeleted());
  }

  void _changeExpense(
    _ChangeTransactionTypeEvent event,
    Emitter<TransactionState> emit,
  ) {
    final List<AccountEntity> accounts = _accountsUseCase(NoParams());
    if (accounts.isEmpty &&
        accounts.length <= 1 &&
        event.transactionType == TransactionType.transfer) {
      emit(const TransactionState.transactionError(
          'Need two or more accounts '));
    } else {
      transactionType = event.transactionType;
      emit(TransactionState.changeTransactionType(event.transactionType));
    }
  }

  FutureOr<void> _changeCategory(
    _ChangeCategoryEvent event,
    Emitter<TransactionState> emit,
  ) {
    selectedCategoryId = event.category.superId;
    selectedCategory = event.category;
    emit(TransactionState.changeCategory(event.category));
  }

  FutureOr<void> _changeAccount(
    _ChangeAccountEvent event,
    Emitter<TransactionState> emit,
  ) {
    selectedAccountId = event.account.superId;
    emit(TransactionState.changeAccount(event.account));
  }

  FutureOr<void> _updateDateTime(
    _UpdateDateTimeEvent event,
    Emitter<TransactionState> emit,
  ) {
    selectedDate = event.dateTime;
    emit(TransactionState.updateDateTime(event.dateTime));
  }

  FutureOr<void> _transferAccount(
    _TransferAccountEvent event,
    Emitter<TransactionState> emit,
  ) {
    if (event.isFromAccount) {
      fromAccount = event.account;
    } else {
      toAccount = event.account;
    }
    emit(TransactionState.transferAccount(
      isFromAccount: event.isFromAccount,
      fromAccount: fromAccount,
      toAccount: toAccount,
    ));
  }
}
