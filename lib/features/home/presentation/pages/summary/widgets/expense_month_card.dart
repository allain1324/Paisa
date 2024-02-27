// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:paisa/core/common.dart';
import 'package:paisa/core/theme/custom_color.dart';
import 'package:paisa/features/home/presentation/pages/summary/widgets/expense_list_widget.dart';
import 'package:paisa/features/transaction/domain/entities/transaction_entity.dart';

class ExpenseMonthCardWidget extends StatelessWidget {
  const ExpenseMonthCardWidget({
    super.key,
    required this.title,
    required this.total,
    required this.expenses,
  });

  final List<TransactionEntity> expenses;
  final String title;
  final double total;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text(
            title,
            style: context.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: context.onBackground,
            ),
          ),
          trailing: Text(
            total.toFormateCurrency(context),
            style: context.titleSmall?.copyWith(
              color: total.isNegative
                  ? Theme.of(context).extension<CustomColors>()!.red
                  : Theme.of(context).extension<CustomColors>()!.green,
            ),
          ),
        ),
        ExpenseListWidget(
          expenses: expenses,
        ),
      ],
    );
  }
}
