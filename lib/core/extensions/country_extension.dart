import 'package:paisa/features/intro/data/models/country_model.dart';
import 'package:paisa/features/intro/domain/entities/country_entity.dart';

extension CountryHelper on CountryModel {
  CountryEntity toEntity() {
    return CountryEntity(
      code: code,
      name: name,
      symbol: symbol,
      decimalDigits: decimalDigits,
      number: number,
      namePlural: namePlural,
      thousandsSeparator: thousandsSeparator,
      decimalSeparator: decimalSeparator,
      spaceBetweenAmountAndSymbol: spaceBetweenAmountAndSymbol,
      symbolOnLeft: symbolOnLeft,
      pattern: pattern,
    );
  }
}

extension CountryEntityHelper on CountryEntity {
  CountryModel toModel() {
    return CountryModel(
      code: code,
      name: name,
      symbol: symbol,
      decimalDigits: decimalDigits,
      number: number,
      namePlural: namePlural,
      thousandsSeparator: thousandsSeparator,
      decimalSeparator: decimalSeparator,
      spaceBetweenAmountAndSymbol: spaceBetweenAmountAndSymbol,
      symbolOnLeft: symbolOnLeft,
      pattern: pattern,
    );
  }
}
