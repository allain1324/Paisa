// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/adapters.dart';

// 🌎 Project imports:
import 'package:paisa/core/enum/debt_type.dart';

part 'debit_model.g.dart';
part 'debit_model.freezed.dart';

@unfreezed
class DebitModel extends HiveObject with _$DebitModel {
  @HiveType(typeId: 4, adapterName: 'DebitModelAdapter')
  factory DebitModel({
    @HiveField(2) required double amount,
    @HiveField(3) required DateTime dateTime,
    @HiveField(5) @Default(DebitType.debit) DebitType debtType,
    @HiveField(1) required String description,
    @HiveField(4) required DateTime expiryDateTime,
    @HiveField(7, defaultValue: '') required String name,
    @HiveField(6, defaultValue: 0) int? superId,
  }) = _DebitModel;

  DebitModel._();

  factory DebitModel.fromJson(Map<String, dynamic> json) =>
      _$DebitModelFromJson(json);
}
