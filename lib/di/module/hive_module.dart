// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:paisa/core/common_enum.dart';
import 'package:paisa/features/account/data/model/account_model.dart';
import 'package:paisa/features/category/data/model/category_model.dart';
import 'package:paisa/features/debit/data/models/debit_model.dart';
import 'package:paisa/features/debit_transaction/data/model/debit_transactions_model.dart';
import 'package:paisa/features/goals/data/models/goal_model.dart';
import 'package:paisa/features/intro/data/models/country_model.dart';
import 'package:paisa/features/recurring/data/model/recurring.dart';
import 'package:paisa/features/transaction/data/model/transaction_model.dart';

@module
abstract class HiveBoxModule {
  @lazySingleton
  @preResolve
  Future<Box<TransactionModel>> expenseBox() =>
      Hive.openBox<TransactionModel>(BoxType.expense.name);

  @lazySingleton
  @preResolve
  Future<Box<AccountModel>> accountBox() =>
      Hive.openBox<AccountModel>(BoxType.accounts.name);

  @lazySingleton
  @preResolve
  Future<Box<CategoryModel>> categoryBox() =>
      Hive.openBox<CategoryModel>(BoxType.category.name);

  @lazySingleton
  @preResolve
  Future<Box<DebitModel>> debtsBox() =>
      Hive.openBox<DebitModel>(BoxType.debts.name);

  @lazySingleton
  @preResolve
  Future<Box<DebitTransactionsModel>> transactionsBox() =>
      Hive.openBox<DebitTransactionsModel>(BoxType.transactions.name);

  @lazySingleton
  @preResolve
  Future<Box<RecurringModel>> recurringBox() =>
      Hive.openBox<RecurringModel>(BoxType.recurring.name);

  @lazySingleton
  @preResolve
  Future<Box<GoalModel>> goalBox() =>
      Hive.openBox<GoalModel>(BoxType.goal.name);

  @lazySingleton
  @preResolve
  @Named('settings')
  Future<Box<dynamic>> boxDynamic() =>
      Hive.openBox<dynamic>(BoxType.settings.name);
}

class HiveAdapters {
  Future<void> initHive() async {
    await Hive.initFlutter(hivePath);
    Hive
      ..registerAdapter(TransactionModelAdapter())
      ..registerAdapter(CategoryModelAdapter())
      ..registerAdapter(CountryModelAdapter())
      ..registerAdapter(AccountModelAdapter())
      ..registerAdapter(TransactionTypeAdapter())
      ..registerAdapter(DebitModelAdapter())
      ..registerAdapter(DebitTypeAdapter())
      ..registerAdapter(DebitTransactionsModelAdapter())
      ..registerAdapter(CardTypeAdapter())
      ..registerAdapter(RecurringTypeAdapter())
      ..registerAdapter(RecurringModelAdapter())
      ..registerAdapter(GoalModelAdapter())
      ..registerAdapter(TransactionModelTypeAdapter())
      ..registerAdapter(FilterExpenseAdapter());
  }

  String? get hivePath {
    if (kIsWeb) {
      return 'paisa';
    } else if (TargetPlatform.windows == defaultTargetPlatform) {
      return 'paisa';
    } else {
      return null;
    }
  }
}
