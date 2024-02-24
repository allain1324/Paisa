// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:paisa/core/common.dart';
import 'package:paisa/core/common_enum.dart';
import 'package:paisa/features/debit/data/models/debit_model.dart';
import 'package:paisa/features/debit/domain/entities/debit.dart';

extension DebitTypeHelper on DebitType {
  String stringValue(BuildContext context) {
    switch (this) {
      case DebitType.debit:
        return context.loc.debt;
      case DebitType.credit:
        return context.loc.credit;
    }
  }
}

extension AccountMapping on DebitModel {
  DebitEntity toEntity() {
    return DebitEntity(
      description: description,
      name: name,
      amount: amount,
      dateTime: dateTime,
      expiryDateTime: expiryDateTime,
      debtType: debtType,
      superId: superId ?? -1,
    );
  }
}

extension DebitModelsHelper on Iterable<DebitModel> {
  List<Map<String, dynamic>> toJson() {
    return map((e) => e.toJson()).toList();
  }
}
