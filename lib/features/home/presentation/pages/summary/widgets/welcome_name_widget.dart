// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hive_flutter/adapters.dart';

// Project imports:
import 'package:paisa/core/common.dart';
import 'package:paisa/core/common_enum.dart';
import 'package:paisa/main.dart';

class WelcomeNameWidget extends StatelessWidget {
  const WelcomeNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box>(
      valueListenable: getIt
          .get<Box<dynamic>>(instanceName: BoxType.settings.name)
          .listenable(
        keys: [userNameSetKey],
      ),
      builder: (context, value, _) {
        final name = value.get(userNameSetKey, defaultValue: 'Name');

        return ListTile(
          title: Text(
            name,
            style: context.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: context.onBackground,
            ),
          ),
          subtitle: Text(
            context.loc.welcomeMessage,
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: context.bodySmall?.color),
          ),
        );
      },
    );
  }
}
