import 'package:injectable/injectable.dart';
import 'package:paisa/core/use_case/use_case.dart';
import 'package:paisa/features/intro/domain/entities/country_entity.dart';
import 'package:paisa/features/intro/domain/repository/country_repository.dart';

@singleton
class GetSelectedCountryUseCase implements UseCase<CountryEntity?, NoParams> {
  final CountryRepository repository;

  GetSelectedCountryUseCase({required this.repository});
  @override
  CountryEntity? call(NoParams params) {
    return repository.fetchSelectedCountry();
  }
}
