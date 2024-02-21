import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:hive_flutter/hive_flutter.dart';

// 🌎 Project imports:
import 'package:paisa/core/common.dart';
import 'package:paisa/core/common_enum.dart';
import 'package:paisa/core/widgets/paisa_widget.dart';
import 'package:paisa/features/home/presentation/controller/summary_controller.dart';
import 'package:paisa/features/home/presentation/cubit/overview/overview_cubit.dart';
import 'package:paisa/features/home/presentation/pages/overview/widgets/filter_budget_widget.dart';
import 'package:paisa/features/home/presentation/pages/overview/widgets/filter_date_range_widget.dart';
import 'package:paisa/features/home/presentation/pages/overview/widgets/overview_filter_widget.dart';
import 'package:paisa/features/home/presentation/pages/overview/widgets/overview_list_widget.dart';
import 'package:paisa/features/transaction/data/model/transaction_model.dart';
import 'package:paisa/main.dart';

final ValueNotifier<FilterExpense> filterNotifier =
    ValueNotifier(FilterExpense.monthly);

class OverViewPage extends StatelessWidget {
  const OverViewPage({
    Key? key,
    required this.budgetCubit,
  }) : super(key: key);

  final OverviewCubit budgetCubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<Box<TransactionModel>>(
        valueListenable: getIt.get<Box<TransactionModel>>().listenable(),
        builder: (context, expenseBox, _) {
          if (expenseBox.values.isEmpty) {
            return EmptyWidget(
              icon: Icons.paid,
              title: context.loc.emptyOverviewMessageTitle,
              description: context.loc.emptyOverviewMessageSubtitle,
            );
          }

          return Column(
            children: [
              const FilterTimeRangeWidget(),
              GraphWidget(
                models: expenseBox.values.toList(),
              )
            ],
          );
        },
      ),
    );
  }
}

class GraphWidget extends StatelessWidget {
  const GraphWidget({super.key, required this.models});

  final List<TransactionModel> models;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<FilterExpense>(
      valueListenable: filterNotifier,
      builder: (context, value, _) {
        final map = groupBy(models, (p0) => p0.time?.formatted(value));
        final List<(String xLabel, (double expense, double income))> maps = map
            .entries
            .map((e) =>
                (e.key ?? '', (e.value.totalExpense, e.value.totalIncome)))
            .toList();
        return BarChartSample2(values: maps);
      },
    );
  }
}

class FilterTimeRangeWidget extends StatefulWidget {
  const FilterTimeRangeWidget({
    super.key,
  });

  @override
  State<FilterTimeRangeWidget> createState() => _FilterTimeRangeWidgetState();
}

class _FilterTimeRangeWidgetState extends State<FilterTimeRangeWidget> {
  late FilterExpense filterExpense = FilterExpense.monthly;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FilterExpense.monthly,
        FilterExpense.weekly,
        FilterExpense.yearly,
      ]
          .map((e) => PaisaPillChip(
                title: e.stringValue(context),
                onPressed: () {
                  setState(() {
                    filterExpense = e;
                  });
                  filterNotifier.value = e;
                },
                isSelected: filterExpense == e,
              ))
          .toList(),
    );
  }
}

class BarChartSample2 extends StatefulWidget {
  const BarChartSample2({super.key, required this.values});

  final Color avgColor = Colors.amber;
  final Color leftBarColor = Colors.red;
  final Color rightBarColor = Colors.green;

  @override
  State<StatefulWidget> createState() => BarChartSample2State();

  final List<(String xLabel, (double expense, double income))> values;
}

class BarChartSample2State extends State<BarChartSample2> {
  late List<BarChartGroupData> showingBarGroups;
  final double width = 7;

  @override
  void initState() {
    super.initState();

    showingBarGroups = widget.values
        .mapIndexed((index, element) =>
            makeGroupData(index, element.$2.$1, element.$2.$2))
        .toList();
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final Widget text = Text(
      widget.values[value.toInt()].$1,
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: widget.leftBarColor,
          width: width,
        ),
        BarChartRodData(
          toY: y2,
          color: widget.rightBarColor,
          width: width,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: (16 / 9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(
            height: 38,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: widget.values.length * 90,
                child: BarChart(
                  BarChartData(
                    barTouchData: BarTouchData(
                      touchTooltipData: BarTouchTooltipData(
                        tooltipBgColor: Colors.grey,
                        getTooltipItem: (a, b, c, d) => null,
                      ),
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(reservedSize: 1),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: bottomTitles,
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
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
