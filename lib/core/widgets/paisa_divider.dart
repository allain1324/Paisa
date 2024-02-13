// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class PaisaDivider extends StatelessWidget {
  const PaisaDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Theme.of(context).dividerColor,
    );
  }
}
