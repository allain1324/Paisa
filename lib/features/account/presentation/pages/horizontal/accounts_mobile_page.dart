// Flutter imports:
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paisa/core/common.dart';
import 'package:paisa/core/enum/filter_expense.dart';
import 'package:paisa/core/theme/custom_color.dart';
import 'package:paisa/core/widgets/paisa_widgets/paisa_divider.dart';
import 'package:paisa/core/widgets/section_list_view/index_path.dart';
import 'package:paisa/core/widgets/section_list_view/sectioned_list_view.dart';

// Project imports:
import 'package:paisa/features/account/domain/entities/account_entity.dart';
import 'package:paisa/features/account/presentation/cubit/accounts_cubit.dart';
import 'package:paisa/features/account/presentation/widgets/accounts_page_view_widget.dart';
import 'package:paisa/features/category/domain/entities/category.dart';
import 'package:paisa/features/home/presentation/controller/summary_controller.dart';
import 'package:paisa/features/home/presentation/pages/home/home_cubit.dart';
import 'package:paisa/features/home/presentation/pages/summary/widgets/transaction_item_widget.dart';
import 'package:paisa/features/home/presentation/pages/summary/widgets/transactions_header_widget.dart';
import 'package:paisa/features/transaction/domain/entities/transaction_entity.dart';
import 'package:provider/provider.dart';

class AccountsHorizontalMobilePage extends StatelessWidget {
  const AccountsHorizontalMobilePage({super.key, required this.accounts});

  final List<AccountEntity> accounts;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              AccountPageViewWidget(accounts: accounts),
              TransactionsHeaderWidget(
                summaryController: Provider.of<SummaryController>(context),
              ),
            ],
          ),
        ),
        BlocBuilder<AccountsCubit, AccountsState>(
          builder: (context, state) {
            return ValueListenableBuilder<FilterExpense>(
              valueListenable: Provider.of<SummaryController>(context)
                  .sortHomeExpenseNotifier,
              builder: (context, value, child) {
                final Map<String, List<TransactionEntity>> maps = groupBy(
                    state.transactions,
                    (element) => element.time.formatted(value));
                return SectionedListView(
                  sectionSeparatorBuilder: (context, section) =>
                      const PaisaDivider(),
                  separatorBuilder: (context, index) =>
                      const PaisaDivider(indent: 72),
                  itemBuilder: (context, IndexPath index) {
                    final TransactionEntity transaction =
                        maps.values.toList()[index.section][index.index];

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
                  },
                  sectionsCount: maps.keys.length,
                  groupHeaderBuilder: (context, section) {
                    final String title = maps.keys.elementAt(section);
                    final double total =
                        maps.values.elementAt(section).filterTotal;
                    return ListTile(
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
                              : Theme.of(context)
                                  .extension<CustomColors>()!
                                  .green,
                        ),
                      ),
                    );
                  },
                  countOfItemInSection: (section) =>
                      maps.values.elementAt(section).length,
                );
              },
            );
          },
        ),
      ],
    );
  }
}
