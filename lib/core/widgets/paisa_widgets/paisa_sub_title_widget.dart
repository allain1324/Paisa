import 'package:flutter/material.dart';
import 'package:paisa/core/extensions/text_style_extension.dart';

class PaisaSubTitle extends StatelessWidget {
  const PaisaSubTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: context.titleSmall?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
