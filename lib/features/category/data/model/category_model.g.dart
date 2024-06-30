// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryModelAdapter extends TypeAdapter<_$CategoryModelImpl> {
  @override
  final int typeId = 1;

  @override
  _$CategoryModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$CategoryModelImpl(
      name: fields[0] as String,
      description: fields[1] as String?,
      icon: fields[2] as int,
      isTransferCategory: fields[3] == null ? false : fields[3] as bool,
      superId: fields[4] == null ? 0 : fields[4] as int?,
      budget: fields[6] == null ? 0 : fields[6] as double?,
      isBudget: fields[7] == null ? false : fields[7] as bool,
      color: fields[8] == null ? 4294951175 : fields[8] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, _$CategoryModelImpl obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.icon)
      ..writeByte(3)
      ..write(obj.isTransferCategory)
      ..writeByte(4)
      ..write(obj.superId)
      ..writeByte(6)
      ..write(obj.budget)
      ..writeByte(7)
      ..write(obj.isBudget)
      ..writeByte(8)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryModelImpl _$$CategoryModelImplFromJson(Map<String, dynamic> json) =>
    _$CategoryModelImpl(
      name: json['name'] as String,
      description: json['description'] as String?,
      icon: (json['icon'] as num).toInt(),
      isTransferCategory: json['isTransferCategory'] as bool? ?? false,
      superId: (json['superId'] as num?)?.toInt(),
      budget: (json['budget'] as num?)?.toDouble(),
      isBudget: json['isBudget'] as bool? ?? false,
      color: (json['color'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'icon': instance.icon,
      'isTransferCategory': instance.isTransferCategory,
      'superId': instance.superId,
      'budget': instance.budget,
      'isBudget': instance.isBudget,
      'color': instance.color,
    };
