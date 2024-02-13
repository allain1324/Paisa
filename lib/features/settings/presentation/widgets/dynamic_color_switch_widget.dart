// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

// 🌎 Project imports:
import 'package:paisa/config/routes.dart';
import 'package:paisa/core/common.dart';
import 'setting_option.dart';

class DynamicColorSwitchWidget extends StatelessWidget {
  const DynamicColorSwitchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return SettingsOption(
          title: context.loc.dynamicColor,
          trailing: Switch(
            activeColor: context.primary,
            value: settings.get(
              dynamicThemeKey,
              defaultValue: false,
            ),
            onChanged: (value) {
              settings.put(dynamicThemeKey, value);
              setState(() {});
            },
          ),
        );
      },
    );
  }
}
