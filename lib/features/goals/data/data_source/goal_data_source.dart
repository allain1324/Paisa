import 'package:collection/collection.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';
import 'package:paisa/features/debit_transaction/data/model/debit_transactions_model.dart';
import 'package:paisa/features/goals/data/models/goal_model.dart';

abstract interface class GoalDataSource {
  Future<int> add(GoalModel goalModel);

  Future<void> delete(int key);

  List<GoalModel> goals();

  GoalModel? findById(int? goalId);

  Iterable<GoalModel> export();

  Future<void> update(GoalModel goalModel);

  Future<void> clear();
}

@LazySingleton(as: GoalDataSource)
class GoalDataSourceImpl implements GoalDataSource {
  final Box<GoalModel> goalBox;
  final Box<DebitTransactionsModel> transactionBox;

  GoalDataSourceImpl({
    required this.goalBox,
    required this.transactionBox,
  });

  @override
  List<GoalModel> goals() => goalBox.values.toList();

  @override
  Future<int> add(GoalModel goalModel) async {
    final int id = await goalBox.add(goalModel);
    goalModel.superId = id;
    await goalModel.save();
    return id;
  }

  @override
  Future<void> clear() => goalBox.clear();

  @override
  Future<void> delete(int key) => goalBox.delete(key);

  @override
  Iterable<GoalModel> export() => goalBox.values;

  @override
  GoalModel? findById(int? goalId) {
    return goalBox.values
        .firstWhereOrNull((element) => element.superId == goalId);
  }

  @override
  Future<void> update(GoalModel goalModel) {
    return goalBox.put(goalModel.superId!, goalModel);
  }
}
