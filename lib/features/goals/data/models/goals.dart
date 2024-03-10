import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:paisa/core/data/super_id.dart';

part 'goals.freezed.dart';
part 'goals.g.dart';

@unfreezed
class Goals extends HiveObject with _$Goals implements SuperId {
  @HiveType(typeId: 8, adapterName: 'GoalsModelAdapter')
  factory Goals({
    @HiveField(0) required String name,
    @HiveField(1) required double amount,
    @HiveField(2) int? superId,
    @HiveField(3) required int icon,
  }) = _Goals;

  Goals._();

  factory Goals.fromJson(Map<String, dynamic> json) => _$GoalsFromJson(json);
}
