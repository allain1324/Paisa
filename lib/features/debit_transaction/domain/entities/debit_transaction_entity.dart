import 'package:freezed_annotation/freezed_annotation.dart';

part 'debit_transaction_entity.freezed.dart';

@freezed
class DebitTransactionEntity with _$DebitTransactionEntity {
  const factory DebitTransactionEntity({
    required double amount,
    required DateTime now,
    int? parentId,
    int? superId,
  }) = _DebitTransactionEntity;
}
