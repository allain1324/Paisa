import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:paisa/core/error/failures.dart';
import 'package:paisa/features/goals/domain/repository/goal_repository.dart';

@LazySingleton(as: GoalRepository)
class GoalRepositoryImpl implements GoalRepository {
  @override
  Future<Either<Failure, Unit>> add(
      {required String name, required double amount, required int icon}) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> addTransaction(
      {required String name, required double amount, required int icon}) {
    // TODO: implement addTransaction
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> update(
      {required String name,
      required double amount,
      required int icon,
      required int key}) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
