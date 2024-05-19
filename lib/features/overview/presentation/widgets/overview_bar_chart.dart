import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paisa/core/common.dart';
import 'package:paisa/core/theme/custom_color.dart';
import 'package:paisa/core/widgets/paisa_widgets/paisa_card.dart';
import 'package:paisa/features/intro/domain/entities/country_entity.dart';
import 'package:paisa/features/overview/presentation/widgets/overview_transaction_widget.dart';
import 'package:paisa/features/transaction/domain/entities/transaction_entity.dart';
import 'package:provider/provider.dart';

class OverViewBarChartWidget extends StatelessWidget {
  const OverViewBarChartWidget({
    super.key,
    required this.groupedTransactions,
  });

  final Map<String, List<TransactionEntity>> groupedTransactions;

  @override
  Widget build(BuildContext context) {
    return PaisaFilledCard(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BarChartSample(groupedTransactions: groupedTransactions),
      ),
    );
  }
}

class BarChartSample extends StatelessWidget {
  BarChartSample({
    super.key,
    required this.groupedTransactions,
  });

  final List<OverviewBarChartData> barDataList = [];
  final Map<String, List<TransactionEntity>> groupedTransactions;
  final double width = 12;

  Widget leftTitleWidgets(BuildContext context, double value, TitleMeta meta) {
    if (value % 1 != 0) {
      return Container();
    }
    if (meta.max == value) {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 6,
      fitInside: SideTitleFitInsideData.disable(),
      child: Text(
        value.toCompact(context),
        style: context.bodySmall,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget bottomTitles(BuildContext context, double value, TitleMeta meta) {
    final Widget text = Text(
      barDataList[value.toInt()].xLabel,
      textAlign: TextAlign.center,
      style: context.bodySmall?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      fitInside: SideTitleFitInsideData.disable(),
      child: text,
    );
  }

  BarChartGroupData makeGroupData(
      BuildContext context, int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: Theme.of(context).extension<CustomColors>()!.red,
          width: width,
        ),
        BarChartRodData(
          toY: y2,
          color: Theme.of(context).extension<CustomColors>()!.green,
          width: width,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    barDataList.clear();
    barDataList.addAll(groupedTransactions.entries.map((e) {
      return OverviewBarChartData(
        xLabel: e.key,
        expense: e.value.totalExpense,
        income: e.value.totalIncome,
      );
    }));

    final List<BarChartGroupData> showingBarGroups =
        barDataList.mapIndexed((index, element) {
      return makeGroupData(context, index, element.expense, element.income);
    }).toList();
    return AspectRatio(
      aspectRatio: (16 / 9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: barDataList.length * 106,
                child: BarChart(
                  BarChartData(
                    barTouchData: BarTouchData(
                      touchTooltipData: BarTouchTooltipData(
                        fitInsideVertically: true,
                        fitInsideHorizontally: true,
                        tooltipRoundedRadius: 30,
                        direction: TooltipDirection.auto,
                        tooltipPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          return BarTooltipItem(
                            rod.toY.toCompact(context),
                            context.bodySmall!.copyWith(
                              color: context.onPrimary,
                            ),
                          );
                        },
                      ),
                    ),
                    titlesData: FlTitlesData(
                      rightTitles: const AxisTitles(),
                      topTitles: const AxisTitles(),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 46,
                          getTitlesWidget: (value, meta) =>
                              leftTitleWidgets(context, value, meta),
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) =>
                              bottomTitles(context, value, meta),
                          reservedSize: 42,
                        ),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    barGroups: showingBarGroups,
                    gridData: const FlGridData(show: false),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

extension DoubleHelper on double {
  String toCompact(
    BuildContext context, {
    CountryEntity? countryEntity,
  }) {
    final CountryEntity country =
        countryEntity ?? context.read<CountryEntity>();
    return NumberFormat.compactCurrency(
      symbol: country.symbol,
    ).format(this);
  }

  String toCompactWithout() {
    return NumberFormat.compact().format(this);
  }
}
