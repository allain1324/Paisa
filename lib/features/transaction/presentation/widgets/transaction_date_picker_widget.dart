// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// Project imports:
import 'package:paisa/core/common.dart';
import 'package:paisa/core/widgets/paisa_widget.dart';
import 'package:paisa/features/transaction/presentation/bloc/transaction_bloc.dart';

class ExpenseDatePickerWidget extends StatefulWidget {
  const ExpenseDatePickerWidget({
    super.key,
  });

  @override
  State<ExpenseDatePickerWidget> createState() =>
      _ExpenseDatePickerWidgetState();
}

class _ExpenseDatePickerWidgetState extends State<ExpenseDatePickerWidget> {
  late DateTime selectedDateTime = context.read<TransactionBloc>().selectedDate;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionBloc, TransactionState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Expanded(
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  onTap: () async {
                    final DateTime? dateTime = await paisaDatePicker(
                      context,
                      selectedDateTime: selectedDateTime,
                    );
                    if (dateTime != null) {
                      setState(() {
                        selectedDateTime = selectedDateTime.copyWith(
                          day: dateTime.day,
                          month: dateTime.month,
                          year: dateTime.year,
                        );
                        context.read<TransactionBloc>().selectedDate =
                            selectedDateTime;
                      });
                    }
                  },
                  leading: Icon(
                    Icons.today_rounded,
                    color: context.secondary,
                  ),
                  title: Text(
                    selectedDateTime.formattedDate,
                    style: context.bodyMedium,
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  onTap: () async {
                    final TimeOfDay? timeOfDay =
                        await paisaTimerPicker(context);
                    if (timeOfDay != null) {
                      setState(() {
                        selectedDateTime = selectedDateTime.copyWith(
                          hour: timeOfDay.hour,
                          minute: timeOfDay.minute,
                        );
                        context.read<TransactionBloc>().selectedDate =
                            selectedDateTime;
                      });
                    }
                  },
                  leading: Icon(
                    MdiIcons.clockOutline,
                    color: context.secondary,
                  ),
                  title: Text(
                    selectedDateTime.formattedTime,
                    style: context.bodyMedium,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
