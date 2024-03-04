// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:paisa/core/common.dart';

extension TextStyleHelper on BuildContext {
  TextStyle? get titleLarge =>
      Theme.of(this).textTheme.titleLarge?.copyWith(fontSize: 22.sp);
  TextStyle? get titleMedium =>
      Theme.of(this).textTheme.titleMedium?.copyWith(fontSize: 16.sp);
  TextStyle? get titleSmall =>
      Theme.of(this).textTheme.titleSmall?.copyWith(fontSize: 14.sp);
  TextStyle? get bodySmall =>
      Theme.of(this).textTheme.bodySmall?.copyWith(fontSize: 12.sp);
  TextStyle? get bodyMedium =>
      Theme.of(this).textTheme.bodyMedium?.copyWith(fontSize: 14.sp);
  TextStyle? get bodyLarge =>
      Theme.of(this).textTheme.bodyLarge?.copyWith(fontSize: 16.sp);
  TextStyle? get labelLarge =>
      Theme.of(this).textTheme.labelLarge?.copyWith(fontSize: 14.sp);
  TextStyle? get labelMedium =>
      Theme.of(this).textTheme.labelMedium?.copyWith(fontSize: 12.sp);
  TextStyle? get labelSmall =>
      Theme.of(this).textTheme.labelSmall?.copyWith(fontSize: 11.sp);
  TextStyle? get displayLarge =>
      Theme.of(this).textTheme.displayLarge?.copyWith(fontSize: 57.sp);
  TextStyle? get displayMedium =>
      Theme.of(this).textTheme.displayMedium?.copyWith(fontSize: 45.sp);
  TextStyle? get displaySmall =>
      Theme.of(this).textTheme.displaySmall?.copyWith(fontSize: 36.sp);
  TextStyle? get headlineLarge =>
      Theme.of(this).textTheme.headlineLarge?.copyWith(fontSize: 32.sp);
  TextStyle? get headlineMedium =>
      Theme.of(this).textTheme.headlineMedium?.copyWith(fontSize: 28.sp);
  TextStyle? get headlineSmall =>
      Theme.of(this).textTheme.headlineSmall?.copyWith(fontSize: 24.sp);
}

extension TextStyleColorMapping on TextStyle {
  TextStyle onPrimary(BuildContext context) {
    return copyWith(color: context.onPrimary);
  }

  TextStyle onSecondary(BuildContext context) {
    return copyWith(color: context.onSecondary);
  }

  TextStyle onTertiary(BuildContext context) {
    return copyWith(color: context.onTertiary);
  }

  TextStyle onPrimaryContainer(BuildContext context) {
    return copyWith(color: context.onPrimaryContainer);
  }

  TextStyle onSecondaryContainer(BuildContext context) {
    return copyWith(color: context.onSecondaryContainer);
  }

  TextStyle onTertiaryContainer(BuildContext context) {
    return copyWith(color: context.onTertiaryContainer);
  }

  TextStyle onSurface(BuildContext context) {
    return copyWith(color: context.onSurface);
  }
}
