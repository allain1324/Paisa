import 'package:collection/collection.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';
import 'package:paisa/features/debit/data/models/debit_model.dart';

abstract class LocalDebitDataSource {
  Future<void> addDebtOrCredit(DebitModel debt);

  DebitModel? fetchDebtOrCreditFromId(int debtId);

  Future<void> updateDebt(DebitModel debtModel);

  Future<void> deleteDebtOrCreditFromId(int debtId);
}

@Singleton(as: LocalDebitDataSource)
class LocalDebitDataSourceImpl extends LocalDebitDataSource {
  LocalDebitDataSourceImpl({
    required this.debtBox,
  });

  final Box<DebitModel> debtBox;

  @override
  Future<void> addDebtOrCredit(DebitModel debt) async {
    final int id = await debtBox.add(debt);
    debt.superId = id;
    return debt.save();
  }

  @override
  Future<void> deleteDebtOrCreditFromId(int debtId) {
    return debtBox.delete(debtId);
  }

  @override
  DebitModel? fetchDebtOrCreditFromId(int debtId) =>
      debtBox.values.firstWhereOrNull((element) => element.superId == debtId);

  @override
  Future<void> updateDebt(DebitModel debtModel) {
    return debtBox.put(debtModel.superId!, debtModel);
  }
}
