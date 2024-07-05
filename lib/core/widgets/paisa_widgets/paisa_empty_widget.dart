// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:paisa/core/common.dart';
import 'package:paisa/core/widgets/paisa_widgets/paisa_button.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.description,
    this.onActionPressed,
    this.actionTitle,
  });

  final String? actionTitle;
  final String description;
  final IconData icon;
  final VoidCallback? onActionPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 96,
              color: context.primary,
            ),
            const SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                title,
                style: context.titleLarge?.onSurface(context),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                description,
                style: context.titleMedium?.onSurface(context),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 8),
            if (onActionPressed != null)
              PaisaButton.mediumText(
                onPressed: onActionPressed!,
                text: actionTitle ?? '',
              )
            else
              const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
