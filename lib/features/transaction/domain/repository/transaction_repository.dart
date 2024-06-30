// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:paisa/core/enum/transaction_type.dart';
import 'package:paisa/core/error/failures.dart';
import 'package:paisa/features/transaction/domain/entities/transaction_entity.dart';

abstract class TransactionRepository {
  Future<Either<Failure, bool>> addExpense({
    required double amount,
    required int categoryId,
    required int accountId,
    required DateTime time,
    required String name,
    String? description,
    required int fromAccountId,
    required int toAccountId,
    TransactionType transactionType = TransactionType.expense,
  });

  Future<void> clearExpense(int expenseId);

  TransactionEntity? fetchExpenseFromId(int expenseId);

  List<TransactionEntity> transactions({int? accountId});

  List<TransactionEntity> fetchExpensesFromAccountId(int accountId);

  List<TransactionEntity> fetchExpensesFromCategoryId(int accountId);

  Future<void> deleteExpensesByAccountId(int accountId);

  Future<void> deleteExpensesByCategoryId(int categoryId);

  Future<void> updateExpense({
    required int key,
    required double amount,
    required int categoryId,
    required int accountId,
    required DateTime time,
    required String name,
    TransactionType transactionType = TransactionType.expense,
    String? description,
    required int fromAccountId,
    required int toAccountId,
  });

  Future<void> clearAll();

  List<TransactionEntity> filterExpenses(
    String query,
    List<int> accounts,
    List<int> categories,
  );
}
