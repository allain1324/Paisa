// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paisa_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaisaDataResponseImpl _$$PaisaDataResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PaisaDataResponseImpl(
      expenses: (json['expenses'] as List<dynamic>?)
              ?.map((e) => TransactionModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      accounts: (json['accounts'] as List<dynamic>?)
              ?.map((e) => AccountModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      debts: (json['debts'] as List<dynamic>?)
              ?.map((e) => DebitModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      debitTransactions: (json['debitTransactions'] as List<dynamic>?)
              ?.map((e) =>
                  DebitTransactionsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PaisaDataResponseImplToJson(
        _$PaisaDataResponseImpl instance) =>
    <String, dynamic>{
      'expenses': instance.expenses,
      'accounts': instance.accounts,
      'categories': instance.categories,
      'debts': instance.debts,
      'debitTransactions': instance.debitTransactions,
    };
