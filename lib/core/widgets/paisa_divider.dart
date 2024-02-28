// Flutter imports:
import 'package:flutter/material.dart';

class PaisaDivider extends StatelessWidget {
  const PaisaDivider({
    super.key,
    this.indent,
    this.thickness,
    this.width,
  });

  final double? indent;
  final double? thickness;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: indent,
      thickness: thickness,
      color: Theme.of(context).dividerColor,
    );
  }
}

class PaisaVerticalDivider extends StatelessWidget {
  const PaisaVerticalDivider(
      {super.key, this.indent, this.thickness, this.width});

  final double? indent;
  final double? thickness;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return VerticalDivider(
      indent: indent,
      thickness: thickness,
      width: width,
      color: Theme.of(context).dividerColor,
    );
  }
}
