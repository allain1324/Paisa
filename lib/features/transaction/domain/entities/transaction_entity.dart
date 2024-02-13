import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:paisa/core/common_enum.dart';

part 'transaction_entity.freezed.dart';

@freezed
class TransactionEntity with _$TransactionEntity {
  const factory TransactionEntity({
    required int accountId,
    required int categoryId,
    required double currency,
    String? description,
    String? name,
    int? superId,
    DateTime? time,
    @Default(TransactionType.expense) TransactionType type,
  }) = _TransactionEntity;
}
