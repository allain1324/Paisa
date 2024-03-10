// Flutter imports:
import 'package:flutter/material.dart';
import 'package:paisa/core/extensions/build_context_extension.dart';
import 'package:paisa/core/widgets/paisa_widgets/paisa_sub_title_widget.dart';

// Project imports:
import 'package:paisa/features/transaction/presentation/widgets/select_account_widget.dart';
import 'package:paisa/features/transaction/presentation/widgets/select_category_widget.dart';
import 'package:paisa/features/transaction/presentation/widgets/transaction_amount_widget.dart';
import 'package:paisa/features/transaction/presentation/widgets/transaction_date_picker_widget.dart';
import 'package:paisa/features/transaction/presentation/widgets/transaction_description_widget.dart';
import 'package:paisa/features/transaction/presentation/widgets/transaction_name_widget.dart';

class ExpenseIncomeWidget extends StatelessWidget {
  const ExpenseIncomeWidget({
    super.key,
    required this.nameController,
    required this.descriptionController,
    required this.amountController,
  });

  final TextEditingController amountController;
  final TextEditingController descriptionController;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 16),
        TransactionNameWidget(controller: nameController),
        const SizedBox(height: 16),
        TransactionAmountWidget(controller: amountController),
        const SizedBox(height: 16),
        TransactionDescriptionWidget(
          controller: descriptionController,
        ),
        const SizedBox(height: 16),
        PaisaSubTitle(
          title: context.loc.dateAndTime,
        ),
        const ExpenseDatePickerWidget(),
        const SelectedAccountWidget(),
        const SelectCategoryWidget(),
      ],
    );
  }
}
