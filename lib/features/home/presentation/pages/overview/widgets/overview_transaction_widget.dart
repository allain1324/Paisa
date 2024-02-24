import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:paisa/core/common.dart';
import 'package:paisa/core/widgets/paisa_widgets/paisa_empty_widget.dart';
import 'package:paisa/features/transaction/data/model/transaction_model.dart';
import 'package:paisa/features/transaction/domain/entities/transaction_entity.dart';
import 'package:paisa/main.dart';

class OverviewTransactionWidget extends StatelessWidget {
  const OverviewTransactionWidget({super.key, required this.builder});
  final Widget Function(Iterable<TransactionEntity> models) builder;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<TransactionModel>>(
      valueListenable: getIt.get<Box<TransactionModel>>().listenable(),
      builder: (context, expenseBox, _) {
        if (expenseBox.values.isEmpty) {
          return EmptyWidget(
            icon: Icons.paid,
            title: context.loc.emptyOverviewMessageTitle,
            description: context.loc.emptyOverviewMessageSubtitle,
          );
        }
        return builder(expenseBox.values.toEntities());
      },
    );
  }
}
