// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:paisa/core/use_case/use_case.dart';
import 'package:paisa/features/transaction/domain/entities/transaction_entity.dart';
import 'package:paisa/features/transaction/domain/repository/transaction_repository.dart';

@singleton
class GetTransactionsByAccountIdUseCase
    implements
        UseCase<List<TransactionEntity>, GetTransactionsByAccountIdParams> {
  GetTransactionsByAccountIdUseCase({required this.expenseRepository});

  final TransactionRepository expenseRepository;

  @override
  List<TransactionEntity> call(GetTransactionsByAccountIdParams params) =>
      expenseRepository.fetchExpensesFromAccountId(params.accountId);
}

class GetTransactionsByAccountIdParams {
  GetTransactionsByAccountIdParams(this.accountId);

  final int accountId;
}
