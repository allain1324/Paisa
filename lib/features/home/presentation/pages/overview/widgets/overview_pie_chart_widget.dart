import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:paisa/core/common.dart';
import 'package:paisa/features/category/domain/entities/category.dart';
import 'package:paisa/features/home/presentation/pages/overview/widgets/category_list_widget.dart';
import 'package:paisa/features/home/presentation/pages/overview/widgets/overview_category_widget.dart';
import 'package:paisa/features/home/presentation/pages/overview/widgets/overview_transaction_widget.dart';
import 'package:paisa/features/transaction/domain/entities/transaction_entity.dart';
import 'package:collection/collection.dart';

class OverviewPieChartWidget extends StatelessWidget {
  const OverviewPieChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return OverviewTransactionWidget(
      builder: (transactions) {
        return OverviewCategoryWidget(
          builder: (categoryModels) {
            final categoryGroupedExpenses = groupBy(transactions, (entity) {
              final CategoryEntity categoryEntity = categoryModels.firstWhere(
                  (element) => element.superId == entity.categoryId);
              return categoryEntity;
            });
            final List<MapEntry<CategoryEntity, List<TransactionEntity>>>
                mapExpenses = categoryGroupedExpenses.entries
                    .sorted((a, b) => b.value.total.compareTo(a.value.total));
            final double total = transactions.total;
            return Column(
              children: [
                PieChartWidget(
                  map: mapExpenses,
                  total: total,
                ),
                CategoryListWidget(
                  categoryGrouped: mapExpenses,
                  totalExpense: total,
                )
              ],
            );
          },
        );
      },
    );
  }
}

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({
    super.key,
    required this.total,
    required this.map,
  });

  final Iterable<MapEntry<CategoryEntity, List<TransactionEntity>>> map;
  final double total;

  @override
  Widget build(BuildContext context) {
    const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
    final List<PieChartSectionData> sections = map.map((e) {
      return PieChartSectionData(
        color: Color(e.key.color ?? Colors.amber.value).withOpacity(0.5),
        value: e.value.total / total,
        title: '${((e.value.total / total) * 100).toStringAsFixed(0)}%',
        titleStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(e.key.color ?? Colors.amber.value),
          shadows: shadows,
        ),
      );
    }).toList();
    return SizedBox(
      height: 200,
      child: PieChart(
        PieChartData(
          startDegreeOffset: 180,
          pieTouchData: PieTouchData(),
          borderData: FlBorderData(
            show: true,
          ),
          sectionsSpace: 2,
          centerSpaceRadius: 40,
          sections: sections,
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.color,
    required this.text,
    required this.isSquare,
    this.size = 16,
    this.textColor,
  });

  final Color color;
  final bool isSquare;
  final double size;
  final String text;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        )
      ],
    );
  }
}
