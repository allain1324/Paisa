import 'package:freezed_annotation/freezed_annotation.dart';

part 'goal_entity.freezed.dart';

@freezed
class GoalEntity with _$GoalEntity {
  const factory GoalEntity({
    required String name,
    required double amount,
    int? superId,
    required int icon,
  }) = _GoalEntity;
}
