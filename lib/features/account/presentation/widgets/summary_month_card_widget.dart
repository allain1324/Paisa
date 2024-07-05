// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// Project imports:
import 'package:paisa/core/common.dart';
import 'package:paisa/core/theme/custom_color.dart';
import 'package:paisa/core/widgets/paisa_widgets/paisa_card.dart';
import 'package:paisa/features/transaction/domain/entities/transaction_entity.dart';

class SummaryMonthCardWidget extends StatelessWidget {
  const SummaryMonthCardWidget({
    super.key,
    required this.transactions,
  });

  final List<TransactionEntity> transactions;

  @override
  Widget build(BuildContext context) {
    final Color green = Theme.of(context).extension<CustomColors>()!.green!;
    final Color red = Theme.of(context).extension<CustomColors>()!.red!;
    return PaisaCard(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      CircleAvatar(
                        maxRadius: 16,
                        backgroundColor: green.withOpacity(0.3),
                        child: Icon(
                          MdiIcons.arrowBottomLeft,
                          color: green,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.loc.income,
                                style: context.labelMedium?.copyWith(
                                  color: context.onSurfaceVariant
                                      .withOpacity(0.75),
                                ),
                              ),
                              Text(
                                transactions.thisMonthIncome
                                    .toFormateCurrency(context),
                                style: context.titleSmall
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      CircleAvatar(
                        maxRadius: 16,
                        backgroundColor: red.withOpacity(0.3),
                        child: Icon(
                          MdiIcons.arrowTopRight,
                          color: red,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.loc.expense,
                                style: context.labelMedium?.copyWith(
                                  color: context.onSurfaceVariant
                                      .withOpacity(0.75),
                                ),
                              ),
                              Text(
                                transactions.thisMonthExpense
                                    .toFormateCurrency(context),
                                style: context.titleSmall
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 70,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Stack(
                  children: [
                    Sparkline(
                      data: transactions.incomeDoubleList,
                      useCubicSmoothing: true,
                      cubicSmoothingFactor: 0.2,
                      lineWidth: 3,
                      lineColor: green,
                    ),
                    Sparkline(
                      data: transactions.expenseDoubleList,
                      useCubicSmoothing: true,
                      cubicSmoothingFactor: 0.2,
                      lineWidth: 3,
                      lineColor: red,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
