// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debit_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DebitModelAdapter extends TypeAdapter<_$DebitModelImpl> {
  @override
  final int typeId = 4;

  @override
  _$DebitModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$DebitModelImpl(
      amount: fields[2] as double,
      dateTime: fields[3] as DateTime,
      debtType: fields[5] as DebitType,
      description: fields[1] as String,
      expiryDateTime: fields[4] as DateTime,
      name: fields[7] == null ? '' : fields[7] as String,
      superId: fields[6] == null ? 0 : fields[6] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, _$DebitModelImpl obj) {
    writer
      ..writeByte(7)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.dateTime)
      ..writeByte(5)
      ..write(obj.debtType)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.expiryDateTime)
      ..writeByte(7)
      ..write(obj.name)
      ..writeByte(6)
      ..write(obj.superId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DebitModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DebitModelImpl _$$DebitModelImplFromJson(Map<String, dynamic> json) =>
    _$DebitModelImpl(
      amount: (json['amount'] as num).toDouble(),
      dateTime: DateTime.parse(json['dateTime'] as String),
      debtType: $enumDecodeNullable(_$DebitTypeEnumMap, json['debtType']) ??
          DebitType.debit,
      description: json['description'] as String,
      expiryDateTime: DateTime.parse(json['expiryDateTime'] as String),
      name: json['name'] as String,
      superId: (json['superId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DebitModelImplToJson(_$DebitModelImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'dateTime': instance.dateTime.toIso8601String(),
      'debtType': _$DebitTypeEnumMap[instance.debtType]!,
      'description': instance.description,
      'expiryDateTime': instance.expiryDateTime.toIso8601String(),
      'name': instance.name,
      'superId': instance.superId,
    };

const _$DebitTypeEnumMap = {
  DebitType.debit: 'debit',
  DebitType.credit: 'credit',
};
