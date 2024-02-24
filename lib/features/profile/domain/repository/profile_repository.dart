// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:paisa/core/error/failures.dart';

abstract class ProfileRepository {
  Future<Either<Failure, bool>> pickImageAndSave();
}
