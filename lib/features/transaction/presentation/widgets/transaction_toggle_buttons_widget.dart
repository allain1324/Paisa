// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:paisa/core/common.dart';
import 'package:paisa/core/enum/transaction_type.dart';
import 'package:paisa/core/widgets/paisa_widget.dart';
import 'package:paisa/features/transaction/presentation/bloc/transaction_bloc.dart';

class TransactionToggleButtons extends StatelessWidget {
  const TransactionToggleButtons({super.key});

  void _update(BuildContext context, TransactionType type) {
    BlocProvider.of<TransactionBloc>(context)
        .add(TransactionEvent.changeTransactionType(type));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionBloc, TransactionState>(
      buildWhen: (previous, current) => current is ChangeTransactionTypeState,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                PaisaPillChip(
                  title: TransactionType.expense.stringName(context),
                  isSelected: BlocProvider.of<TransactionBloc>(context)
                          .transactionType ==
                      TransactionType.expense,
                  onPressed: () => _update(
                    context,
                    TransactionType.expense,
                  ),
                ),
                PaisaPillChip(
                  title: TransactionType.income.stringName(context),
                  isSelected: BlocProvider.of<TransactionBloc>(context)
                          .transactionType ==
                      TransactionType.income,
                  onPressed: () => _update(
                    context,
                    TransactionType.income,
                  ),
                ),
                PaisaPillChip(
                  title: TransactionType.transfer.stringName(context),
                  isSelected: BlocProvider.of<TransactionBloc>(context)
                          .transactionType ==
                      TransactionType.transfer,
                  onPressed: () => _update(
                    context,
                    TransactionType.transfer,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
