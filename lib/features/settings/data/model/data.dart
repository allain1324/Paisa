// To parse this JSON data, do
//
//     final data = dataFromJson(jsonString);

// 🎯 Dart imports:
import 'dart:convert';

// 🌎 Project imports:
import 'package:paisa/features/account/data/model/account_model.dart';
import 'package:paisa/features/category/data/model/category_model.dart';
import 'package:paisa/features/debit/data/models/debit_model.dart';
import 'package:paisa/features/debit_transaction/data/model/debit_transactions_model.dart';
import 'package:paisa/features/transaction/data/model/transaction_model.dart';

class Data {
  Data({
    required this.expenses,
    required this.accounts,
    required this.categories,
    required this.debts,
    required this.debitTransactions,
  });

  final List<TransactionModel> expenses;
  final List<AccountModel> accounts;
  final List<CategoryModel> categories;
  final List<DebitModel> debts;
  final List<DebitTransactionsModel> debitTransactions;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        expenses: List<TransactionModel>.from(
            json["expenses"].map((x) => TransactionModel.fromJson(x))),
        accounts: List<AccountModel>.from(
            json["accounts"].map((x) => AccountModel.fromJson(x))),
        categories: List<CategoryModel>.from(
            json["categories"].map((x) => CategoryModel.fromJson(x))),
        debts: List<DebitModel>.from(
            json["debts"].map((x) => DebitModel.fromJson(x))),
        debitTransactions: List<DebitTransactionsModel>.from(
            json["transactions"]
                .map((x) => DebitTransactionsModel.fromJson(x))),
      );
}
