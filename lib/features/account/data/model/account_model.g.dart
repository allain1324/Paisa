// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccountModelAdapter extends TypeAdapter<_$AccountModelImpl> {
  @override
  final int typeId = 2;

  @override
  _$AccountModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$AccountModelImpl(
      name: fields[0] as String?,
      currencySymbol: fields[2] as CountryModel?,
      bankName: fields[3] as String?,
      cardType: fields[6] == null ? CardType.bank : fields[6] as CardType?,
      superId: fields[7] as int?,
      amount: fields[8] == null ? 0 : fields[8] as double?,
      color: fields[9] == null ? 4294951175 : fields[9] as int?,
      isAccountDefault: fields[4] == null ? false : fields[4] as bool,
      isAccountExcluded: fields[21] == null ? false : fields[21] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, _$AccountModelImpl obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.currencySymbol)
      ..writeByte(3)
      ..write(obj.bankName)
      ..writeByte(6)
      ..write(obj.cardType)
      ..writeByte(7)
      ..write(obj.superId)
      ..writeByte(8)
      ..write(obj.amount)
      ..writeByte(9)
      ..write(obj.color)
      ..writeByte(4)
      ..write(obj.isAccountDefault)
      ..writeByte(21)
      ..write(obj.isAccountExcluded);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountModelImpl _$$AccountModelImplFromJson(Map<String, dynamic> json) =>
    _$AccountModelImpl(
      name: json['name'] as String?,
      currencySymbol: json['currencySymbol'] == null
          ? null
          : CountryModel.fromJson(
              json['currencySymbol'] as Map<String, dynamic>),
      bankName: json['bankName'] as String?,
      cardType: $enumDecodeNullable(_$CardTypeEnumMap, json['cardType']),
      superId: json['superId'] as int?,
      amount: (json['amount'] as num?)?.toDouble(),
      color: json['color'] as int?,
      isAccountDefault: json['isAccountDefault'] as bool? ?? false,
      isAccountExcluded: json['isAccountExcluded'] as bool?,
    );

Map<String, dynamic> _$$AccountModelImplToJson(_$AccountModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'currencySymbol': instance.currencySymbol,
      'bankName': instance.bankName,
      'cardType': _$CardTypeEnumMap[instance.cardType],
      'superId': instance.superId,
      'amount': instance.amount,
      'color': instance.color,
      'isAccountDefault': instance.isAccountDefault,
      'isAccountExcluded': instance.isAccountExcluded,
    };

const _$CardTypeEnumMap = {
  CardType.cash: 'cash',
  CardType.bank: 'bank',
  CardType.wallet: 'wallet',
};
