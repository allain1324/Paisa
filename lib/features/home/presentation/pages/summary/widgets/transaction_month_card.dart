// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:paisa/core/common.dart';
import 'package:paisa/core/theme/custom_color.dart';
import 'package:paisa/features/account/domain/entities/account_entity.dart';
import 'package:paisa/features/category/domain/entities/category.dart';
import 'package:paisa/features/home/presentation/pages/home/home_cubit.dart';
import 'package:paisa/features/home/presentation/pages/summary/widgets/transaction_item_widget.dart';
import 'package:paisa/features/transaction/domain/entities/transaction_entity.dart';

class TransactionByMonthCardWidget extends StatelessWidget {
  const TransactionByMonthCardWidget({
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
    return CustomScrollView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: ListTile(
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
        ),
        SliverList.separated(
          separatorBuilder: (context, index) => Divider(
            indent: 72,
            height: 0,
            color: Theme.of(context).dividerColor,
          ),
          itemCount: expenses.length,
          itemBuilder: (_, index) {
            final TransactionEntity expense = expenses[index];
            final AccountEntity? account =
                context.read<HomeCubit>().fetchAccountFromId(expense.accountId);
            final CategoryEntity? category = context
                .read<HomeCubit>()
                .fetchCategoryFromId(expense.categoryId);
            if (account == null || category == null) {
              return const SizedBox.shrink();
            } else {
              return TransactionItemWidget(
                expense: expense,
                account: account,
                category: category,
              );
            }
          },
        )
      ],
    );
  }
}
