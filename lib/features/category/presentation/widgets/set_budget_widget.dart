// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:paisa/core/extensions/build_context_extension.dart';
import 'package:paisa/core/extensions/color_extension.dart';
import 'package:paisa/core/widgets/paisa_widget.dart';
import 'package:paisa/features/category/presentation/bloc/category_bloc.dart';

class SetBudgetWidget extends StatelessWidget {
  const SetBudgetWidget({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      buildWhen: (previous, current) =>
          current is CategorySuccessState ||
          current is UpdateCategoryBudgetState,
      builder: (context, state) {
        bool budget = false;
        if (state is CategorySuccessState) {
          budget = context.read<CategoryBloc>().isBudgetSet ?? false;
        }
        if (state is UpdateCategoryBudgetState) {
          budget = state.isBudget;
        }
        return Column(
          children: [
            SwitchListTile(
              secondary: Icon(
                Icons.wallet,
                color: context.primary,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              title: Text(context.loc.budget),
              subtitle: Text(context.loc.setBudget),
              activeColor: context.primary,
              onChanged: (bool value) => context
                  .read<CategoryBloc>()
                  .add(UpdateCategoryBudgetEvent(value)),
              value: budget,
            ),
            Builder(
              builder: (context) {
                return budget
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: CategoryBudgetWidget(controller: controller),
                      )
                    : const SizedBox.shrink();
              },
            )
          ],
        );
      },
    );
  }
}

class CategoryBudgetWidget extends StatelessWidget {
  const CategoryBudgetWidget({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return PaisaTextFormField(
      controller: controller,
      hintText: context.loc.enterBudget,
      label: context.loc.budget,
      onChanged: (value) {
        double? amount = double.tryParse(value);
        context.read<CategoryBloc>().categoryBudget = amount;
      },
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
        TextInputFormatter.withFunction((oldValue, newValue) {
          try {
            final text = newValue.text;
            if (text.isNotEmpty) double.parse(text);
            return newValue;
          } catch (_) {}
          return oldValue;
        }),
      ],
    );
  }
}
