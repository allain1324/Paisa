// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:paisa/config/routes.dart';

// Project imports:
import 'package:paisa/core/common.dart';

class SmallSizeFabWidget extends StatefulWidget {
  const SmallSizeFabWidget({super.key});

  @override
  State<SmallSizeFabWidget> createState() => _SmallSizeFabWidgetState();
}

class _SmallSizeFabWidgetState extends State<SmallSizeFabWidget> {
  late bool isSelected = settings.get(smallSizeFabKey, defaultValue: false);

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      secondary: Icon(MdiIcons.resize),
      title: Text(
        context.loc.smallSizeFab,
      ),
      subtitle: Text(
        context.loc.smallSizeFabMessage,
        style: context.bodyMedium?.copyWith(
          color: context.onBackground.withOpacity(0.6),
        ),
      ),
      onChanged: (bool value) async {
        setState(() {
          isSelected = value;
        });
        settings.put(smallSizeFabKey, value);
      },
      value: isSelected,
    );
  }
}
