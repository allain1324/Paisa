import 'package:paisa/features/intro/domain/entities/country.dart';

abstract class CountryRepository {
  List<CountryEntity> fetchCountries();
  CountryEntity? fetchSelectedCountry();
  Future<void> saveSelectedCountry(CountryEntity entity);
}
