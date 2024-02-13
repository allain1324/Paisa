// 📦 Package imports:
import 'package:collection/collection.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:paisa/features/debit/data/models/debit_model.dart';

abstract class DebtDataSource {
  Future<void> addDebtOrCredit(DebitModel debt);

  DebitModel? fetchDebtOrCreditFromId(int debtId);

  Future<void> update(DebitModel debtModel);

  Future<void> deleteDebtOrCreditFromId(int debtId);

  Iterable<DebitModel> export();

  Future<void> clear();
}

@LazySingleton(as: DebtDataSource)
class DebitDataSourceImpl extends DebtDataSource {
  DebitDataSourceImpl({
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
  Future<void> clear() {
    return debtBox.clear();
  }

  @override
  Future<void> deleteDebtOrCreditFromId(int debtId) {
    return debtBox.delete(debtId);
  }

  @override
  Iterable<DebitModel> export() {
    return debtBox.values;
  }

  @override
  DebitModel? fetchDebtOrCreditFromId(int debtId) =>
      debtBox.values.firstWhereOrNull((element) => element.superId == debtId);

  @override
  Future<void> update(DebitModel debtModel) {
    return debtBox.put(debtModel.superId!, debtModel);
  }
}
