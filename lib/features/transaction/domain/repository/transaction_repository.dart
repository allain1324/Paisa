import 'package:dartz/dartz.dart';
import 'package:paisa/core/enum/transaction_type.dart';
import 'package:paisa/core/error/failures.dart';
import 'package:paisa/features/transaction/domain/entities/transaction_entity.dart';

abstract class TransactionRepository {
  Future<Either<Failure, bool>> addExpense({
    required double amount,
    required int category,
    required int account,
    required TransactionType transactionType,
    required DateTime time,
    required String name,
    String? description,
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
    required double currency,
    required int categoryId,
    required int accountId,
    required TransactionType transactionType,
    required DateTime time,
    required String name,
    String? description,
  });

  Future<void> clearAll();

  List<TransactionEntity> filterExpenses(
    String query,
    List<int> accounts,
    List<int> categories,
  );
}
