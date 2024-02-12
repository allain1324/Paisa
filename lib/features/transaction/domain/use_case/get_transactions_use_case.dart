import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:paisa/core/use_case/use_case.dart';
import 'package:paisa/features/transaction/domain/entities/transaction.dart';
import 'package:paisa/features/transaction/domain/repository/transaction_repository.dart';

part 'get_transactions_use_case.freezed.dart';

@singleton
class GetTransactionsUseCase
    implements UseCase<List<TransactionEntity>, ParamsDefaultAccountId> {
  GetTransactionsUseCase({required this.expenseRepository});

  final TransactionRepository expenseRepository;

  @override
  List<TransactionEntity> call(ParamsDefaultAccountId params) {
    return expenseRepository.transactions(accountId: params.accountId);
  }
}

@freezed
class ParamsDefaultAccountId with _$ParamsDefaultAccountId {
  const factory ParamsDefaultAccountId(int? accountId) =
      _ParamsDefaultAccountId;
}
