// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:paisa/config/routes.dart';

// Project imports:
import 'package:paisa/core/common.dart';
import 'package:paisa/core/enum/theme_mode.dart';

class ChooseThemeModeWidget extends StatefulWidget {
  const ChooseThemeModeWidget({
    super.key,
    required this.currentTheme,
  });

  final ThemeMode currentTheme;

  @override
  ChooseThemeModeWidgetState createState() => ChooseThemeModeWidgetState();
}

class ChooseThemeModeWidgetState extends State<ChooseThemeModeWidget> {
  late ThemeMode currentIndex = widget.currentTheme;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Text(
              context.loc.chooseTheme,
              style: context.titleLarge,
            ),
          ),
          ...ThemeMode.values.map(
            (e) => RadioListTile<ThemeMode>(
              value: e,
              activeColor: context.primary,
              groupValue: currentIndex,
              onChanged: (ThemeMode? value) {
                currentIndex = value!;
                setState(() {});
              },
              title: Text(
                e.stringValue,
                style: TextStyle(
                  color: context.onSurface,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    context.loc.cancel,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0, bottom: 16),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  onPressed: () => settings
                      .put(themeModeKey, currentIndex.index)
                      .then((value) => Navigator.pop(context)),
                  child: Text(context.loc.ok),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
