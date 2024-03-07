// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:paisa/config/routes.dart';

// Project imports:
import 'package:paisa/core/common.dart';

class JustBlackWidget extends StatefulWidget {
  const JustBlackWidget({super.key});

  @override
  State<JustBlackWidget> createState() => _JustBlackWidgetState();
}

class _JustBlackWidgetState extends State<JustBlackWidget> {
  late bool isSelected = settings.get(blackThemeKey, defaultValue: false);

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      secondary: const SizedBox.shrink(),
      title: Text(context.loc.justBlackText),
      onChanged: (bool value) async {
        setState(() {
          isSelected = value;
        });
        settings.put(blackThemeKey, value);
      },
      value: isSelected,
    );
  }
}
