import 'package:flutter/material.dart';

extension ThemeModeName on ThemeMode {
  String get stringValue {
    switch (this) {
      case ThemeMode.system:
        return 'System';
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
    }
  }

  IconData get icon {
    switch (this) {
      case ThemeMode.system:
        return Icons.contrast;
      case ThemeMode.light:
        return Icons.light_mode;
      case ThemeMode.dark:
        return Icons.dark_mode;
    }
  }
}
