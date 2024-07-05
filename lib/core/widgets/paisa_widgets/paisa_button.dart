// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:paisa/core/common.dart';

enum ButtonSize { small, medium, large }

enum ButtonStyle { elevated, outlined, text }

class PaisaButton extends StatelessWidget {
  // Factory constructor
  factory PaisaButton({
    required String text,
    required VoidCallback onPressed,
    ButtonSize size = ButtonSize.medium,
    ButtonStyle style = ButtonStyle.elevated,
    Color? color,
    IconData? icon,
  }) {
    return PaisaButton._(
      text: text,
      onPressed: onPressed,
      size: size,
      style: style,
      color: color,
      icon: icon,
    );
  }

  // Private constructor
  const PaisaButton._({
    required this.text,
    required this.onPressed,
    required this.size,
    required this.style,
    this.color,
    this.icon,
  });

  factory PaisaButton.largeElevated({
    required String text,
    required VoidCallback onPressed,
    Color? color,
    IconData? icon,
  }) {
    return PaisaButton(
      text: text,
      onPressed: onPressed,
      size: ButtonSize.large,
      color: color,
      icon: icon,
    );
  }

  factory PaisaButton.largeText({
    required String text,
    required VoidCallback onPressed,
    Color? color,
    IconData? icon,
  }) {
    return PaisaButton(
      text: text,
      onPressed: onPressed,
      size: ButtonSize.large,
      style: ButtonStyle.text,
      color: color,
      icon: icon,
    );
  }
  factory PaisaButton.largeOutlined({
    required String text,
    required VoidCallback onPressed,
    Color? color,
    IconData? icon,
  }) {
    return PaisaButton(
      text: text,
      onPressed: onPressed,
      size: ButtonSize.large,
      style: ButtonStyle.outlined,
      color: color,
      icon: icon,
    );
  }

  factory PaisaButton.mediumElevated({
    required String text,
    required VoidCallback onPressed,
    Color? color,
    IconData? icon,
  }) {
    return PaisaButton(
      text: text,
      onPressed: onPressed,
      color: color,
      icon: icon,
    );
  }

  factory PaisaButton.mediumOutlined({
    required String text,
    required VoidCallback onPressed,
    Color? color,
    IconData? icon,
  }) {
    return PaisaButton(
      text: text,
      onPressed: onPressed,
      style: ButtonStyle.outlined,
      color: color,
      icon: icon,
    );
  }
  factory PaisaButton.mediumText({
    required String text,
    required VoidCallback onPressed,
    Color? color,
    IconData? icon,
  }) {
    return PaisaButton(
      text: text,
      onPressed: onPressed,
      style: ButtonStyle.text,
      color: color,
      icon: icon,
    );
  }

  // Factory methods for specific sizes and styles
  factory PaisaButton.smallElevated({
    required String text,
    required VoidCallback onPressed,
    Color? color,
    IconData? icon,
  }) {
    return PaisaButton(
      text: text,
      onPressed: onPressed,
      size: ButtonSize.small,
      color: color,
      icon: icon,
    );
  }
  factory PaisaButton.smallOutlined({
    required String text,
    required VoidCallback onPressed,
    Color? color,
    IconData? icon,
  }) {
    return PaisaButton(
      text: text,
      onPressed: onPressed,
      size: ButtonSize.small,
      style: ButtonStyle.outlined,
      color: color,
      icon: icon,
    );
  }
  factory PaisaButton.smallText({
    required String text,
    required VoidCallback onPressed,
    Color? color,
    IconData? icon,
  }) {
    return PaisaButton(
      text: text,
      onPressed: onPressed,
      size: ButtonSize.small,
      style: ButtonStyle.text,
      color: color,
      icon: icon,
    );
  }

  final Color? color;
  final IconData? icon;
  final VoidCallback onPressed;
  final ButtonSize size;
  final ButtonStyle style;
  final String text;

  EdgeInsetsGeometry _getPadding() {
    switch (size) {
      case ButtonSize.small:
        return EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h);
      case ButtonSize.medium:
        return EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h);
      case ButtonSize.large:
        return EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h);
    }
  }

  double _getBorderRadius() {
    switch (size) {
      case ButtonSize.small:
        return 32.r;
      case ButtonSize.medium:
        return 32.r;
      case ButtonSize.large:
        return 32.r;
    }
  }

  double? _getFontSize(BuildContext context) {
    switch (size) {
      case ButtonSize.small:
        return context.bodySmall?.fontSize;
      case ButtonSize.medium:
        return context.bodyMedium?.fontSize;
      case ButtonSize.large:
        return context.bodyLarge?.fontSize;
    }
  }

  double _getIconSize() {
    switch (size) {
      case ButtonSize.small:
        return 16.h;
      case ButtonSize.medium:
        return 18.h;
      case ButtonSize.large:
        return 20.h;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = color ?? context.primary;
    final Color foregroundColor = color ?? context.onPrimary;
    final EdgeInsetsGeometry padding = _getPadding();
    final double borderRadius = _getBorderRadius();
    final double? fontSize = _getFontSize(context);
    final double iconSize = _getIconSize();

    Widget button;
    switch (style) {
      case ButtonStyle.elevated:
        button = icon == null
            ? ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: backgroundColor,
                  foregroundColor: foregroundColor,
                  padding: padding,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                ),
                child: Text(text, style: TextStyle(fontSize: fontSize)),
              )
            : ElevatedButton.icon(
                onPressed: onPressed,
                icon: Icon(icon, size: iconSize),
                label: Text(text, style: TextStyle(fontSize: fontSize)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: backgroundColor,
                  foregroundColor: foregroundColor,
                  padding: padding,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                ),
              );
        break;
      case ButtonStyle.outlined:
        button = icon == null
            ? OutlinedButton(
                onPressed: onPressed,
                style: OutlinedButton.styleFrom(
                  padding: padding,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                ),
                child: Text(
                  text,
                  style: TextStyle(fontSize: fontSize),
                ),
              )
            : OutlinedButton.icon(
                onPressed: onPressed,
                icon: Icon(icon, size: iconSize),
                label: Text(
                  text,
                  style: TextStyle(fontSize: fontSize),
                ),
                style: OutlinedButton.styleFrom(
                  padding: padding,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                ),
              );
        break;
      case ButtonStyle.text:
        button = icon == null
            ? TextButton(
                onPressed: onPressed,
                style: TextButton.styleFrom(
                  padding: padding,
                ),
                child: Text(
                  text,
                  style: TextStyle(fontSize: fontSize),
                ),
              )
            : TextButton.icon(
                onPressed: onPressed,
                icon: Icon(icon, size: iconSize),
                label: Text(
                  text,
                  style: TextStyle(fontSize: fontSize),
                ),
                style: TextButton.styleFrom(
                  padding: padding,
                ),
              );
        break;
    }

    return button;
  }
}
