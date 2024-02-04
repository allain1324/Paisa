import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:paisa/core/use_case/use_case.dart';
import 'package:paisa/features/intro/domain/entities/country.dart';
import 'package:paisa/features/intro/domain/repository/country_repository.dart';

@injectable
class GetCountriesUseCase implements UseCase<List<CountryEntity>, NoParams> {
  GetCountriesUseCase({required this.repository});

  final CountryRepository repository;

  @override
  List<CountryEntity> call({NoParams? params}) {
    return repository
        .fetchCountries()
        .sorted((a, b) => a.name.compareTo(b.name));
  }
}
