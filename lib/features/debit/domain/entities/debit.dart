// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// 🌎 Project imports:
import 'package:paisa/core/common_enum.dart';

part 'debit.freezed.dart';

@freezed
class DebitEntity with _$DebitEntity {
  const factory DebitEntity({
    required String description,
    required String name,
    required double amount,
    required DateTime dateTime,
    required DateTime expiryDateTime,
    @Default(DebitType.credit) DebitType debtType,
    required int superId,
  }) = _DebitEntity;
}
