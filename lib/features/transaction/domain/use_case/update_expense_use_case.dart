import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:paisa/core/enum/transaction_type.dart';
import 'package:paisa/core/use_case/use_case.dart';
import 'package:paisa/features/transaction/domain/repository/transaction_repository.dart';

part 'update_expense_use_case.freezed.dart';

@singleton
class UpdateTransactionUseCase
    implements UseCase<void, UpdateTransactionParams> {
  UpdateTransactionUseCase({required this.expenseRepository});

  final TransactionRepository expenseRepository;

  @override
  Future<void> call(UpdateTransactionParams params) {
    return expenseRepository.updateExpense(
      params.superId,
      params.name,
      params.currency,
      params.time,
      params.categoryId,
      params.accountId,
      params.type,
      params.description,
    );
  }
}

@freezed
class UpdateTransactionParams with _$UpdateTransactionParams {
  const factory UpdateTransactionParams({
    int? accountId,
    int? categoryId,
    double? currency,
    String? description,
    String? name,
    required int superId,
    DateTime? time,
    @Default(TransactionType.expense) TransactionType type,
  }) = _UpdateTransactionParams;
}
