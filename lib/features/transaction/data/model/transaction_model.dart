// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Project imports:
import 'package:paisa/core/common_enum.dart';
import 'package:paisa/core/data/super_id.dart';

part 'transaction_model.g.dart';
part 'transaction_model.freezed.dart';

@unfreezed
class TransactionModel extends HiveObject
    with _$TransactionModel
    implements SuperId {
  @HiveType(typeId: 0, adapterName: 'TransactionModelAdapter')
  factory TransactionModel({
    @HiveField(5) required int accountId,
    @HiveField(9) int? fromAccountId,
    @HiveField(10) int? toAccountId,
    @HiveField(6) required int categoryId,
    @HiveField(1) @Default(0) double currency,
    @HiveField(8) String? description,
    @HiveField(0) required String name,
    @HiveField(7) int? superId,
    @HiveField(3) required DateTime time,
    @HiveField(4) @Default(TransactionType.expense) TransactionType type,
  }) = _TransactionModel;

  TransactionModel._();

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);
}
