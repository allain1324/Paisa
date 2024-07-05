// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Package imports:
import 'package:hive_flutter/adapters.dart';

// Project imports:
import 'package:paisa/core/common.dart';
import 'package:paisa/core/widgets/paisa_widget.dart';
import 'package:paisa/features/account/data/model/account_model.dart';
import 'package:paisa/features/home/presentation/pages/summary/widgets/transaction_total_for_month_widget.dart';
import 'package:paisa/features/home/presentation/pages/summary/widgets/total_balance_widget.dart';
import 'package:paisa/features/transaction/domain/entities/transaction_entity.dart';
import 'package:paisa/main.dart';

class TransactionTotalWidget extends StatelessWidget {
  const TransactionTotalWidget({
    super.key,
    required this.expenses,
  });

  final List<TransactionEntity> expenses;

  @override
  Widget build(BuildContext context) {
    final double totalExpenseBalance = expenses.fullTotal;
    final double totalExpenses = expenses.totalExpense;
    final double totalIncome = expenses.totalIncome;
    final double totalAccountBalance =
        getIt<Box<AccountModel>>().totalAccountInitialAmount;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
      child: PaisaCard(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TotalBalanceWidget(
                title: context.loc.totalBalance,
                amount: totalExpenseBalance + totalAccountBalance,
              ),
              SizedBox(height: 32.h),
              TransactionTotalForMonthWidget(
                outcome: totalExpenses,
                income: totalIncome,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
