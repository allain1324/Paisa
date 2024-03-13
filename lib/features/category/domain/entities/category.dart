// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
part 'category.freezed.dart';

@freezed
class CategoryEntity with _$CategoryEntity {
  const factory CategoryEntity({
    double? budget,
    required int color,
    String? description,
    required int icon,
    @Default(false) bool isBudget,
    @Default(false) bool isDefault,
    required String name,
    int? superId,
  }) = _CategoryEntity;
}
