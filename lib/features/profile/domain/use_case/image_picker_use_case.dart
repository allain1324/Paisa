// 📦 Package imports:
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:paisa/core/error/failures.dart';
import 'package:paisa/features/profile/domain/repository/profile_repository.dart';

@singleton
class ImagePickerUseCase {
  final ProfileRepository profileRepository;

  ImagePickerUseCase(this.profileRepository);

  Future<Either<Failure, bool>> call() => profileRepository.pickImageAndSave();
}
