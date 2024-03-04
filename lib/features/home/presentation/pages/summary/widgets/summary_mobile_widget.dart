// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:paisa/core/common.dart';
import 'package:paisa/features/home/presentation/controller/summary_controller.dart';
import 'package:paisa/features/home/presentation/pages/summary/widgets/expense_history_widget.dart';
import 'package:paisa/features/home/presentation/pages/summary/widgets/expense_total_widget.dart';
import 'package:paisa/features/home/presentation/pages/summary/widgets/welcome_name_widget.dart';
import 'package:paisa/features/overview/presentation/widgets/filter_tabs_widget.dart';
import 'package:paisa/features/transaction/domain/entities/transaction_entity.dart';
import 'package:paisa/main.dart';

class SummaryMobileWidget extends StatelessWidget {
  const SummaryMobileWidget({
    super.key,
    required this.expenses,
  });

  final List<TransactionEntity> expenses;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.surface,
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 5,
        padding: const EdgeInsets.only(bottom: 124),
        itemBuilder: (context, index) {
          if (index == 0) {
            return const WelcomeNameWidget();
          } else if (index == 1) {
            return ExpenseTotalWidget(expenses: expenses);
          } else if (index == 2) {
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              title: Text(
                context.loc.transactions,
                style: context.titleMedium?.copyWith(
                  color: context.onBackground,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          } else if (index == 3) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: FilterTabs(
                valueNotifier: getIt<SummaryController>().notifyFilterExpense,
              ),
            );
          } else if (index == 4) {
            return ExpenseHistoryWidget(expenses: expenses);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
