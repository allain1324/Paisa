// Flutter imports:
import 'package:flutter/material.dart';
import 'package:paisa/features/home/presentation/controller/summary_controller.dart';

// Project imports:
import 'package:paisa/features/home/presentation/pages/summary/widgets/expense_history_widget.dart';
import 'package:paisa/features/home/presentation/pages/summary/widgets/expense_total_widget.dart';
import 'package:paisa/features/home/presentation/pages/summary/widgets/welcome_name_widget.dart';
import 'package:paisa/features/overview/presentation/widgets/filter_tabs_widget.dart';
import 'package:paisa/features/transaction/domain/entities/transaction_entity.dart';
import 'package:paisa/main.dart';

class SummaryTabletWidget extends StatelessWidget {
  const SummaryTabletWidget({
    super.key,
    required this.expenses,
  });

  final List<TransactionEntity> expenses;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const WelcomeNameWidget(),
                  ExpenseTotalWidget(expenses: expenses),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.only(bottom: 124),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: FilterTabs(
                      valueNotifier:
                          getIt<SummaryController>().notifyFilterExpense,
                    ),
                  ),
                  ExpenseHistoryWidget(expenses: expenses),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
