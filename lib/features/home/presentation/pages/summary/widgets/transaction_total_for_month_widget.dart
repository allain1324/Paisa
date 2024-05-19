// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:paisa/core/common.dart';
import 'package:paisa/core/theme/custom_color.dart';

class TransactionTotalForMonthWidget extends StatelessWidget {
  const TransactionTotalForMonthWidget({
    super.key,
    required this.income,
    required this.outcome,
  });

  final double income;
  final double outcome;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.loc.total,
          style: context.titleMedium?.copyWith(
            color: context.onPrimaryContainer.withOpacity(0.85),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: '▼',
                      style: context.bodySmall?.copyWith(
                        color:
                            Theme.of(context).extension<CustomColors>()!.green,
                      ),
                      children: [
                        TextSpan(
                          text: context.loc.income,
                          style: context.bodySmall?.copyWith(
                            color: context.onPrimaryContainer,
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    '+${income.toFormateCurrency(context)}',
                    style: context.titleLarge?.copyWith(
                      color: context.onPrimaryContainer,
                      fontSize: 17.sp,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: '▲',
                      style: context.bodySmall?.copyWith(
                        color: Theme.of(context).extension<CustomColors>()!.red,
                      ),
                      children: [
                        TextSpan(
                          text: context.loc.expense,
                          style: context.bodySmall?.copyWith(
                            color: context.onPrimaryContainer,
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    '-${outcome.toFormateCurrency(context)}',
                    style: context.titleLarge?.copyWith(
                      color: context.onPrimaryContainer,
                      fontSize: 17.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
