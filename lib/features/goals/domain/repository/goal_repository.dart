import 'package:dartz/dartz.dart';
import 'package:paisa/core/error/failures.dart';

abstract class GoalRepository {
  Future<Either<Failure, Unit>> add({
    required String name,
    required double amount,
    required int icon,
  });
  Future<Either<Failure, Unit>> update({
    required String name,
    required double amount,
    required int icon,
    required int key,
  });

  Future<Either<Failure, Unit>> addTransaction({
    required String name,
    required double amount,
    required int icon,
  });
}
