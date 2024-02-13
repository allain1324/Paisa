// 📦 Package imports:
import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:paisa/features/debit_transaction/data/model/debit_transactions_model.dart';

abstract class DebtTransactionDataSource {
  Future<void> addTransaction(DebitTransactionsModel debitTransactionsModel);

  Future<void> deleteDebitTransactionsFromDebitId(int parentId);

  Future<void> deleteDebitTransactionFromId(int transactionId);

  Iterable<DebitTransactionsModel> getTransactionsFromId(int? id);

  Iterable<DebitTransactionsModel> export();

  Future<void> clear();

  Future<void> update(DebitTransactionsModel debtModel);
}

@LazySingleton(as: DebtTransactionDataSource)
class DebitTransactionDataStoreImpl implements DebtTransactionDataSource {
  DebitTransactionDataStoreImpl({required this.transactionsBox});

  final Box<DebitTransactionsModel> transactionsBox;

  @override
  Future<void> addTransaction(DebitTransactionsModel transactionsModel) async {
    final int id = await transactionsBox.add(transactionsModel);
    transactionsModel.superId = id;
    return transactionsModel.save();
  }

  @override
  Future<void> clear() {
    return transactionsBox.clear();
  }

  @override
  Future<void> deleteDebitTransactionFromId(int transactionId) {
    return transactionsBox.delete(transactionId);
  }

  @override
  Future<void> deleteDebitTransactionsFromDebitId(int parentId) {
    final Iterable<int> transactionsKeys = transactionsBox.values
        .where((element) => element.parentId == parentId)
        .map((e) => e.superId!);
    return transactionsBox.deleteAll(transactionsKeys);
  }

  @override
  Iterable<DebitTransactionsModel> export() {
    return transactionsBox.values;
  }

  @override
  Iterable<DebitTransactionsModel> getTransactionsFromId(int? id) {
    return transactionsBox.values.where((element) => element.parentId == id);
  }

  @override
  Future<void> update(DebitTransactionsModel debtModel) {
    return transactionsBox.put(debtModel.superId, debtModel);
  }
}
