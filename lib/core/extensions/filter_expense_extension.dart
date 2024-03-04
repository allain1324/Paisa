// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:paisa/core/common.dart';
import 'package:paisa/core/common_enum.dart';

extension FilterExpenseHelper on FilterExpense {
  String stringValue(BuildContext context) {
    switch (this) {
      case FilterExpense.daily:
        return context.loc.daily;
      case FilterExpense.weekly:
        return context.loc.weekly;
      case FilterExpense.monthly:
        return context.loc.monthly;
      case FilterExpense.yearly:
        return context.loc.yearly;
      case FilterExpense.all:
        return context.loc.all;
    }
  }
}

extension Filter on String {
  FilterExpense toFilterExpense(BuildContext context) {
    if (this == context.loc.yearly) {
      return FilterExpense.yearly;
    } else if (this == context.loc.daily) {
      return FilterExpense.daily;
    } else if (this == context.loc.weekly) {
      return FilterExpense.weekly;
    } else if (this == context.loc.monthly) {
      return FilterExpense.monthly;
    } else {
      return FilterExpense.all;
    }
  }
}
