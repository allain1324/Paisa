// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:paisa/core/common.dart';

class SettingsOption extends StatelessWidget {
  const SettingsOption({
    super.key,
    required this.title,
    this.icon,
    this.trailing,
    this.subtitle,
    this.onTap,
  });

  final IconData? icon;
  final VoidCallback? onTap;
  final String? subtitle;
  final String title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon == null
          ? null
          : Icon(
              icon,
              color: context.onSurfaceVariant,
            ),
      title: Text(
        title,
        style: context.bodyLarge?.copyWith(
          color: context.onBackground,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: context.bodyMedium?.copyWith(
                color: context.onBackground.withOpacity(0.6),
              ),
            )
          : null,
      onTap: onTap,
      trailing: trailing,
    );
  }
}
