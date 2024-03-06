// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:paisa/core/enum/debt_type.dart';
import 'package:paisa/core/extensions/debit_extensions.dart';
import 'package:paisa/core/widgets/paisa_widget.dart';
import 'package:paisa/features/debit/presentation/cubit/debts_bloc.dart';

class DebtToggleButtonsWidget extends StatelessWidget {
  const DebtToggleButtonsWidget({
    super.key,
  });

  void _update(BuildContext context, DebitType type) {
    context.read<DebitBloc>().add(ChangeDebtTypeEvent(type));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DebitBloc, DebtsState>(
      buildWhen: (previous, current) => current is DebtsTabState,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
            height: 56,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 6),
              itemCount: DebitType.values.length,
              itemBuilder: (context, index) {
                final DebitType type = DebitType.values[index];
                return PaisaPillChip(
                  title: type.stringValue(context),
                  isSelected: context.read<DebitBloc>().currentDebtType == type,
                  onPressed: () => _update(context, type),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
