import 'package:flutter/material.dart';
import 'package:paisa/config/routes.dart';
import 'package:paisa/core/common.dart';
import 'package:paisa/core/common_enum.dart';

class AppThemeWidget extends StatefulWidget {
  const AppThemeWidget({super.key});

  @override
  State<AppThemeWidget> createState() => _AppThemeWidgetState();
}

class _AppThemeWidgetState extends State<AppThemeWidget> {
  late ThemeMode selectedTheme =
      ThemeMode.values[settings.get(themeModeKey, defaultValue: 0)];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
      child: Row(
        children: List.generate(
          ThemeMode.values.length,
          (index) {
            final ThemeMode currentTheme = ThemeMode.values[index];
            return CurrentTheme(
              currentTheme: currentTheme,
              isSelected: currentTheme == selectedTheme,
              onTap: () {
                setState(() {
                  selectedTheme = currentTheme;
                  settings.put(themeModeKey, index);
                });
              },
            );
          },
        ),
      ),
    );
  }
}

class CurrentTheme extends StatelessWidget {
  const CurrentTheme({
    super.key,
    required this.currentTheme,
    required this.isSelected,
    required this.onTap,
  });
  final ThemeMode currentTheme;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Color color =
        isSelected ? context.primary : Theme.of(context).disabledColor;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: color),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(currentTheme.icon, color: color),
                const SizedBox(height: 24),
                Text(
                  currentTheme.stringValue,
                  style: context.bodyMedium?.copyWith(
                    color: color,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
