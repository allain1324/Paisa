// Flutter imports:
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:paisa/core/common.dart';
import 'package:paisa/core/enum/filter_expense.dart';
import 'package:paisa/core/widgets/paisa_widget.dart';
import 'package:paisa/features/home/presentation/controller/summary_controller.dart';
import 'package:paisa/features/home/presentation/pages/summary/widgets/transaction_month_card.dart';
import 'package:paisa/features/home/presentation/pages/summary/widgets/transaction_total_widget.dart';
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
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              const WelcomeNameWidget(),
              TransactionTotalWidget(expenses: expenses),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                title: Text(
                  '${context.loc.transactions} - ${DateFormat(DateFormat.YEAR_MONTH).format(DateTime.now())}',
                  style: context.titleMedium?.copyWith(
                    color: context.onBackground,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: FilterTabs(
                  valueNotifier: getIt<SummaryController>().notifyFilterExpense,
                ),
              ),
            ],
          ),
        ),
        ValueListenableBuilder<FilterExpense>(
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
        )
      ],
    );
  }
}
