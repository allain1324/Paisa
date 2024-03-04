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
    final filters = [
      TransactionType.expense,
      TransactionType.income,
      TransactionType.transfer
    ];
    return BlocBuilder<TransactionBloc, TransactionState>(
      buildWhen: (previous, current) => current is ChangeTransactionTypeState,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
            height: 56,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 6),
              itemCount: filters.length,
              itemBuilder: (context, index) {
                final e = filters[index];
                return PaisaPillChip(
                  title: e.stringName(context),
                  isSelected:
                      context.read<TransactionBloc>().transactionType == e,
                  onPressed: () => _update(context, e),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
