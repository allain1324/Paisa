// Dart imports:

// Flutter imports:
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:paisa/core/common.dart';
import 'package:paisa/core/widgets/paisa_widget.dart';
import 'package:paisa/core/widgets/paisa_widgets/paisa_empty_widget.dart';
import 'package:paisa/features/home/presentation/controller/summary_controller.dart';
import 'package:paisa/features/overview/presentation/widgets/filter_tabs_widget.dart';

// Project imports:
import 'package:paisa/features/overview/presentation/widgets/overview_bar_chart.dart';
import 'package:paisa/features/overview/presentation/widgets/overview_pie_chart_widget.dart';
import 'package:paisa/features/overview/presentation/widgets/overview_transaction_widget.dart';
import 'package:paisa/main.dart';
import 'package:responsive_builder/responsive_builder.dart';

class OverViewPage extends StatelessWidget {
  const OverViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SummaryController controller = getIt<SummaryController>();
    return Scaffold(
      body: ScreenTypeLayout.builder(
        tablet: (p0) {
          return OverviewTransactionWidget(
            builder: (transactions) {
              if (transactions.isEmpty) {
                return EmptyWidget(
                  icon: Icons.paid,
                  title: context.loc.emptyOverviewMessageTitle,
                  description: context.loc.emptyOverviewMessageSubtitle,
                );
              }
              return ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.only(bottom: 124),
                physics: const BouncingScrollPhysics(),
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 8,
                              ),
                              child: FilterTabs(
                                valueNotifier: getIt<SummaryController>()
                                    .filterExpenseNotifier,
                              ),
                            ),
                            FilterGroupCategoryTransactionWidget(
                              transactions: transactions,
                              valueNotifier: controller.filterExpenseNotifier,
                              builder: (groupedTransactions) {
                                return OverViewBarChartWidget(
                                  groupedTransactions: groupedTransactions,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CategoryTransactionFilterWidget(),
                            FilterTransactionTypeWidget(
                              valueNotifier: controller.typeNotifier,
                              transactions: transactions,
                              builder: (transactions) {
                                return FilterGroupCategoryTransactionWidget(
                                  transactions: transactions,
                                  valueNotifier:
                                      controller.filterExpenseNotifier,
                                  builder: (groupedTransactions) {
                                    if (groupedTransactions.isNotEmpty) {
                                      controller.dateNotifier.value =
                                          groupedTransactions.keys.first;
                                    }
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0,
                                            vertical: 6,
                                          ),
                                          child: FilterSecondaryTabsWidget(
                                            dates: groupedTransactions.keys
                                                .toList(),
                                            valueNotifier:
                                                controller.dateNotifier,
                                          ),
                                        ),
                                        const ListTile(
                                            title: Text('Category wise')),
                                        ValueListenableBuilder<String>(
                                          valueListenable:
                                              controller.dateNotifier,
                                          builder: (_, value, child) {
                                            return OverviewPieChartWidget(
                                              transactions:
                                                  groupedTransactions[value] ??
                                                      [],
                                            );
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              );
            },
          );
        },
        mobile: (context) {
          return OverviewTransactionWidget(
            builder: (transactions) {
              if (transactions.isEmpty) {
                return EmptyWidget(
                  icon: Icons.paid,
                  title: context.loc.emptyOverviewMessageTitle,
                  description: context.loc.emptyOverviewMessageSubtitle,
                );
              }
              return ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.only(bottom: 124),
                physics: const BouncingScrollPhysics(),
                children: [
                  FilterGroupCategoryTransactionWidget(
                    transactions: transactions,
                    valueNotifier: controller.filterExpenseNotifier,
                    builder: (groupedTransactions) {
                      return OverViewBarChartWidget(
                        groupedTransactions: groupedTransactions,
                      );
                    },
                  ),
                  const ListTile(title: Text('Category wise')),
                  const CategoryTransactionFilterWidget(),
                  FilterTransactionTypeWidget(
                    valueNotifier: controller.typeNotifier,
                    transactions: transactions,
                    builder: (transactions) {
                      return FilterGroupCategoryTransactionWidget(
                        transactions: transactions,
                        valueNotifier: controller.filterExpenseNotifier,
                        builder: (groupedTransactions) {
                          if (groupedTransactions.isNotEmpty) {
                            controller.dateNotifier.value =
                                groupedTransactions.keys.first;
                          }
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 6,
                                ),
                                child: FilterSecondaryTabsWidget(
                                  dates: groupedTransactions.keys.toList(),
                                  valueNotifier: controller.dateNotifier,
                                ),
                              ),
                              ValueListenableBuilder<String>(
                                valueListenable: controller.dateNotifier,
                                builder: (_, value, child) {
                                  return OverviewPieChartWidget(
                                    transactions:
                                        groupedTransactions[value] ?? [],
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  final double animationValue;

  BackgroundPainter({super.repaint, required this.animationValue});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Animate light purple circle
    paint.color = Color(0xFFB19CD9).withOpacity(0.5);
    double radius = 50 + sin(animationValue * 2 * pi) * 10;
    canvas.drawCircle(
        Offset(size.width * 0.1, size.height * (0.1 + animationValue * 0.05)),
        radius,
        paint);

    // Animate light pink circle
    paint.color = Color(0xFFFFC0CB).withOpacity(0.5);
    radius = 80 + cos(animationValue * 2 * pi) * 15;
    canvas.drawCircle(
        Offset(size.width * (0.85 - animationValue * 0.05), size.height * 0.2),
        radius,
        paint);

    // Animate overlapping circles
    paint.color = Color(0xFFB19CD9).withOpacity(0.5);
    canvas.drawCircle(
        Offset(size.width * (0.15 + animationValue * 0.05), size.height * 0.8),
        60,
        paint);
    paint.color = Color(0xFFFFC0CB).withOpacity(0.5);
    canvas.drawCircle(
        Offset(size.width * 0.25, size.height * (0.85 - animationValue * 0.05)),
        50,
        paint);

    // Animate white circles
    paint.color = Colors.white.withOpacity(0.2);
    canvas.drawCircle(
        Offset(size.width * 0.7, size.height * (0.3 + animationValue * 0.05)),
        100,
        paint);
    canvas.drawCircle(
        Offset(size.width * (0.8 - animationValue * 0.05), size.height * 0.4),
        80,
        paint);

    // Animate star
    paint.color = Colors.white;
    final starCenter = Offset(size.width * (0.3 + animationValue * 0.05),
        size.height * (0.3 + sin(animationValue * 2 * pi) * 0.05));
    final starPath = Path()
      ..moveTo(starCenter.dx, starCenter.dy - 10)
      ..lineTo(starCenter.dx + 5, starCenter.dy - 5)
      ..lineTo(starCenter.dx + 10, starCenter.dy)
      ..lineTo(starCenter.dx + 5, starCenter.dy + 5)
      ..lineTo(starCenter.dx, starCenter.dy + 10)
      ..lineTo(starCenter.dx - 5, starCenter.dy + 5)
      ..lineTo(starCenter.dx - 10, starCenter.dy)
      ..lineTo(starCenter.dx - 5, starCenter.dy - 5)
      ..close();
    canvas.drawPath(starPath, paint);

    // Animate sunburst
    paint.color = Colors.white.withOpacity(0.5);
    final sunburstCenter = Offset(size.width * 0.9, size.height * 0.9);
    for (var i = 0; i < 12; i++) {
      final angle = i * pi / 6 + animationValue * 2 * pi;
      canvas.drawLine(
        sunburstCenter,
        sunburstCenter + Offset(cos(angle) * 30, sin(angle) * 30),
        paint..strokeWidth = 2,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
