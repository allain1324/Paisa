// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// 🌎 Project imports:
import 'package:paisa/core/widgets/filter_widget/paisa_filter_transaction_widget.dart';
import 'package:paisa/core/widgets/paisa_widget.dart';
import 'package:paisa/features/home/presentation/cubit/overview/overview_cubit.dart';
import 'package:paisa/features/home/presentation/pages/overview/widgets/category_transaction_filter_widget.dart';

class OverviewMobile extends StatelessWidget {
  const OverviewMobile({
    super.key,
    required this.budgetCubit,
  });

  final OverviewCubit budgetCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const CategoryTransactionFilterWidget(),
        BlocBuilder(
          bloc: budgetCubit,
          buildWhen: (previous, current) =>
              current is InitialSelectedState ||
              current is EmptyFilterListState,
          builder: (context, state) {
            if (state is InitialSelectedState) {
              return SizedBox(
                height: 70,
                child: Row(
                  children: [
                    const SizedBox(width: 8),
                    const PaisaFilterTransactionWidget(),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.all(16),
                        scrollDirection: Axis.horizontal,
                        itemCount: state.filerTimes.length,
                        itemBuilder: (context, index) {
                          final item = state.filerTimes[index];
                          return PaisaPillChip(
                            title: item,
                            onPressed: () {
                              if (budgetCubit.selectedTime != item) {
                                budgetCubit.updateFilterTime(item);
                              }
                            },
                            isSelected: item == budgetCubit.selectedTime,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
