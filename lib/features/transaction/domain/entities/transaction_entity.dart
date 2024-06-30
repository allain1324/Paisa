// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:paisa/core/common_enum.dart';

part 'transaction_entity.freezed.dart';

@freezed
class TransactionEntity with _$TransactionEntity {
  const factory TransactionEntity({
    required int accountId,
    int? fromAccountId,
    int? toAccountId,
    required int categoryId,
    required double currency,
    @Default('') String description,
    required String name,
    int? superId,
    required DateTime time,
    @Default(TransactionType.expense) TransactionType type,
  }) = _TransactionEntity;
}
