import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:paisa/core/common.dart';
import 'package:paisa/core/enum/filter_expense.dart';
import 'package:paisa/core/widgets/paisa_widgets/paisa_pill_chip.dart';
import 'package:paisa/features/home/presentation/pages/overview/widgets/overview_transaction_widget.dart';
import 'package:paisa/features/transaction/domain/entities/transaction_entity.dart';

final ValueNotifier<FilterExpense> filterNotifier =
    ValueNotifier(FilterExpense.monthly);

class FilterTimeRangeWidget extends StatelessWidget {
  const FilterTimeRangeWidget({
    super.key,
    required this.builder,
  });

  final Widget Function(
      Map<String, List<TransactionEntity>> groupedTransactions) builder;

  @override
  Widget build(BuildContext context) {
    return OverviewTransactionWidget(
      builder: (transactions) {
        return FilterTabsWidget(
          builder: (filterExpense) {
            final Map<String, List<TransactionEntity>> groupedTransactions =
                groupByTime(
              models: transactions,
              filterExpense: filterExpense,
            );
            return builder(groupedTransactions);
          },
        );
      },
    );
  }
}

class FilterTabsWidget extends StatelessWidget {
  const FilterTabsWidget({super.key, required this.builder});
  final Widget Function(FilterExpense filterExpense) builder;

  @override
  Widget build(BuildContext context) {
    final filters = [
      FilterExpense.weekly,
      FilterExpense.monthly,
      FilterExpense.yearly,
    ];
    return ValueListenableBuilder<FilterExpense>(
      valueListenable: filterNotifier,
      builder: (context, snapshot, child) {
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: filters
                    .map((e) => PaisaPillChip(
                          title: e.stringValue(context),
                          onPressed: () {
                            filterNotifier.value = e;
                          },
                          isSelected: e == snapshot,
                        ))
                    .toList(),
              ),
            ),
            builder(snapshot),
          ],
        );
      },
    );
  }
}

Map<String, List<TransactionEntity>> groupByTime({
  required Iterable<TransactionEntity> models,
  FilterExpense filterExpense = FilterExpense.monthly,
}) {
  return groupBy(models.sorted((a, b) => a.time.compareTo(b.time)),
      (p0) => p0.time.readableGraph(filterExpense));
}

class OverviewBarChartData {
  final String xLabel;
  final double expense;
  final double income;

  OverviewBarChartData({
    required this.xLabel,
    required this.expense,
    required this.income,
  });
}
