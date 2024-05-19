// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GoalModelAdapter extends TypeAdapter<_$GoalsImpl> {
  @override
  final int typeId = 8;

  @override
  _$GoalsImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$GoalsImpl(
      name: fields[0] as String,
      amount: fields[1] as double,
      superId: fields[2] as int?,
      icon: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, _$GoalsImpl obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.superId)
      ..writeByte(3)
      ..write(obj.icon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GoalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GoalsImpl _$$GoalsImplFromJson(Map<String, dynamic> json) => _$GoalsImpl(
      name: json['name'] as String,
      amount: (json['amount'] as num).toDouble(),
      superId: (json['superId'] as num?)?.toInt(),
      icon: (json['icon'] as num).toInt(),
    );

Map<String, dynamic> _$$GoalsImplToJson(_$GoalsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount,
      'superId': instance.superId,
      'icon': instance.icon,
    };
