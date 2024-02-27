// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:paisa/core/common.dart';

class TotalBalanceWidget extends StatelessWidget {
  const TotalBalanceWidget({
    super.key,
    required this.title,
    required this.amount,
  });

  final double amount;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.titleMedium?.copyWith(
            color: Theme.of(context)
                .colorScheme
                .onPrimaryContainer
                .withOpacity(0.85),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          amount.toFormateCurrency(context),
          style: context.headlineMedium?.copyWith(
            color: context.onPrimaryContainer,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
