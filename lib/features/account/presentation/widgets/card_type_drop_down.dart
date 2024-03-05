// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:paisa/core/common.dart';
import 'package:paisa/core/enum/card_type.dart';
import 'package:paisa/core/widgets/paisa_widget.dart';
import 'package:paisa/features/account/presentation/bloc/accounts_bloc.dart';

class CardTypeButtons extends StatelessWidget {
  const CardTypeButtons({super.key});

  void _update(BuildContext context, CardType type) {
    context.read<AccountBloc>().add(UpdateCardTypeEvent(type));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(
      buildWhen: (previous, current) => current is UpdateCardTypeState,
      builder: (context, state) {
        return SizedBox(
          height: 46,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final CardType type = CardType.values[index];
              return PaisaPillChip(
                title: type.stringValue(context),
                isSelected: context.read<AccountBloc>().selectedType == type,
                onPressed: () => _update(context, type),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 8,
            ),
            itemCount: CardType.values.length,
          ),
        );
      },
    );
  }
}
