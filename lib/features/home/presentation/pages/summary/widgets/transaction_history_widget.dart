// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:collection/collection.dart';

// Project imports:
import 'package:paisa/core/common.dart';
import 'package:paisa/core/common_enum.dart';
import 'package:paisa/core/widgets/paisa_widget.dart';
import 'package:paisa/features/home/presentation/controller/summary_controller.dart';
import 'package:paisa/features/transaction/domain/entities/transaction_entity.dart';
import 'package:paisa/features/home/presentation/pages/summary/widgets/transaction_month_card.dart';
import 'package:paisa/main.dart';

class TransactionHistoryWidget extends StatelessWidget {
  const TransactionHistoryWidget({
    super.key,
    required this.expenses,
  });

  final List<TransactionEntity> expenses;

  @override
  Widget build(BuildContext context) {
    if (expenses.isEmpty) {
      return EmptyWidget(
        title: context.loc.emptyExpensesMessageTitle,
        icon: Icons.money_off_rounded,
        description: context.loc.emptyExpensesMessageSubTitle,
      );
    } else {
      return ValueListenableBuilder<FilterExpense>(
        valueListenable: getIt<SummaryController>().notifyFilterExpense,
        builder: (context, value, child) {
          final Map<String, List<TransactionEntity>> maps =
              groupBy(expenses, (element) => element.time.formatted(value));
          return SliverList.separated(
            separatorBuilder: (context, index) => const PaisaDivider(),
            itemCount: maps.entries.length,
            itemBuilder: (_, mapIndex) {
              return TransactionByMonthCardWidget(
                title: maps.keys.elementAt(mapIndex),
                total: maps.values.elementAt(mapIndex).filterTotal,
                expenses: maps.values.elementAt(mapIndex),
              );
            },
          );
        },
      );
    }
  }
}
