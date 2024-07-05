// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:paisa/core/common.dart';
import 'package:paisa/core/enum/filter_expense.dart';
import 'package:paisa/core/enum/transaction_type.dart';
import 'package:paisa/core/widgets/paisa_widget.dart';
import 'package:paisa/core/widgets/section_list_view/sectioned_list_view.dart';
import 'package:paisa/features/account/domain/entities/account_entity.dart';
import 'package:paisa/features/account/presentation/widgets/account_summary_widget.dart';
import 'package:paisa/features/category/domain/entities/category.dart';
import 'package:paisa/features/home/presentation/controller/summary_controller.dart';
import 'package:paisa/features/home/presentation/pages/home/home_cubit.dart';
import 'package:paisa/features/home/presentation/pages/summary/widgets/transaction_item_widget.dart';
import 'package:paisa/features/home/presentation/pages/summary/widgets/transaction_total_widget.dart';
import 'package:paisa/features/home/presentation/pages/summary/widgets/welcome_name_widget.dart';
import 'package:paisa/features/overview/presentation/widgets/filter_tabs_widget.dart';
import 'package:paisa/features/transaction/domain/entities/transaction_entity.dart';
import 'package:provider/provider.dart';

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
              AccountSummaryWidget(expenses: expenses),
              ListTile(
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
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: FilterTabs(
                  valueNotifier: Provider.of<SummaryController>(context)
                      .notifyFilterExpense,
                ),
              ),
            ],
          ),
        ),
        ValueListenableBuilder<FilterExpense>(
          valueListenable:
              Provider.of<SummaryController>(context).notifyFilterExpense,
          builder: (context, value, child) {
            return SliverGroupedListView(
              elements: expenses,
              groupBy: (element) => element.time.formatted(value),
              separator: const PaisaDivider(),
              sort: false,
              groupSeparatorBuilder: (value) {
                return ListTile(
                  title: Text(
                    value,
                    style: context.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: context.onBackground,
                    ),
                  ),
                );
              },
              itemBuilder: (context, transaction) {
                if (transaction.type == TransactionType.transfer) {
                  final AccountEntity? fromAccount = context
                      .read<HomeCubit>()
                      .fetchAccountFromId(transaction.fromAccountId);
                  final AccountEntity? toAccount = context
                      .read<HomeCubit>()
                      .fetchAccountFromId(transaction.toAccountId);
                  if (fromAccount == null || toAccount == null) {
                    return const SizedBox.shrink();
                  }
                  return ExpenseTransferItemWidget(
                    expense: transaction,
                    fromAccount: fromAccount,
                    toAccount: toAccount,
                  );
                } else {
                  final AccountEntity? account = context
                      .read<HomeCubit>()
                      .fetchAccountFromId(transaction.accountId);
                  final CategoryEntity? category = context
                      .read<HomeCubit>()
                      .fetchCategoryFromId(transaction.categoryId);
                  if (account == null || category == null) {
                    return const SizedBox.shrink();
                  }
                  return TransactionItemWidget(
                    expense: transaction,
                    account: account,
                    category: category,
                  );
                }
              },
            );
          },
        )
      ],
    );
  }
}
