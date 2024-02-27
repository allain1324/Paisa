// Flutter imports:
import 'package:flutter/material.dart';

class PaisaDivider extends StatelessWidget {
  const PaisaDivider({super.key, this.indent});
  final double? indent;
  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: indent,
      color: Theme.of(context).dividerColor,
    );
  }
}
