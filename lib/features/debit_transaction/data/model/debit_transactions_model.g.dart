// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debit_transactions_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DebitTransactionsModelAdapter
    extends TypeAdapter<_$DebitTransactionsModelImpl> {
  @override
  final int typeId = 3;

  @override
  _$DebitTransactionsModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$DebitTransactionsModelImpl(
      amount: fields[1] as double,
      now: fields[2] as DateTime,
      parentId: fields[4] == null ? -1 : fields[4] as int,
      superId: fields[3] as int?,
      type: fields[5] as TransactionModelType?,
    );
  }

  @override
  void write(BinaryWriter writer, _$DebitTransactionsModelImpl obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.now)
      ..writeByte(4)
      ..write(obj.parentId)
      ..writeByte(3)
      ..write(obj.superId)
      ..writeByte(5)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DebitTransactionsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DebitTransactionsModelImpl _$$DebitTransactionsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DebitTransactionsModelImpl(
      amount: (json['amount'] as num).toDouble(),
      now: DateTime.parse(json['now'] as String),
      parentId: (json['parentId'] as num).toInt(),
      superId: (json['superId'] as num?)?.toInt(),
      type: $enumDecodeNullable(_$TransactionModelTypeEnumMap, json['type']) ??
          TransactionModelType.debit,
    );

Map<String, dynamic> _$$DebitTransactionsModelImplToJson(
        _$DebitTransactionsModelImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'now': instance.now.toIso8601String(),
      'parentId': instance.parentId,
      'superId': instance.superId,
      'type': _$TransactionModelTypeEnumMap[instance.type],
    };

const _$TransactionModelTypeEnumMap = {
  TransactionModelType.debit: 'debit',
  TransactionModelType.goal: 'goal',
};
