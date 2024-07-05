// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:

// Project imports:
import 'package:paisa/core/common.dart';
import 'package:paisa/features/account/presentation/widgets/summary_month_card_widget.dart';
import 'package:paisa/features/transaction/domain/entities/transaction_entity.dart';

class AccountSummaryWidget extends StatelessWidget {
  const AccountSummaryWidget({
    super.key,
    required this.expenses,
    this.useAccountsList = false,
  });

  final List<TransactionEntity> expenses;
  final bool useAccountsList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            visualDensity: const VisualDensity(vertical: -3),
            title: Text(
              context.loc.thisMonth,
              style: context.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: context.onBackground,
              ),
            ),
          ),
          SummaryMonthCardWidget(transactions: expenses),
        ],
      ),
    );
  }
}
