// Dart imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:paisa/features/overview/presentation/widgets/overview_bar_chart.dart';
import 'package:paisa/features/overview/presentation/widgets/overview_pie_chart_widget.dart';
import 'package:paisa/features/overview/presentation/widgets/overview_transaction_widget.dart';

class OverViewPage extends StatelessWidget {
  const OverViewPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OverviewTransactionWidget(builder: (transactions) {
        return ListView(
          padding: const EdgeInsets.only(bottom: 124),
          physics: const BouncingScrollPhysics(),
          children: [
            OverViewBarChartWidget(transactions: transactions),
            OverviewPieChartWidget(transactions: transactions),
          ],
        );
      }),
    );
  }
}
