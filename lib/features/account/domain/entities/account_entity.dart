// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:paisa/core/common_enum.dart';
part 'account_entity.freezed.dart';

@freezed
class AccountEntity with _$AccountEntity {
  const factory AccountEntity({
    double? amount,
    required String bankName,
    @Default(CardType.bank) CardType cardType,
    @Default(0xFFFFFFFF) int color,
    required String name,
    int? superId,
    @Default(false) bool isAccountExcluded,
  }) = _AccountEntity;
}
