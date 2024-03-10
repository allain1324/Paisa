// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:paisa/core/common.dart';

class PaisaPillChip extends StatelessWidget {
  const PaisaPillChip({
    super.key,
    required this.title,
    required this.onPressed,
    required this.isSelected,
  });

  final bool isSelected;
  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    final bgColor = context.tertiaryContainer;
    final textColor = context.onTertiaryContainer;
    final borderColor = isSelected ? context.primary : null;

    return Row(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: bgColor,
              border: Border.all(
                width: 1.5,
                color: borderColor ?? Colors.white.withOpacity(0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kIsWeb ? 28 : 16,
                vertical: 10,
              ),
              child: Text(
                title,
                style: context.bodySmall?.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    super.key,
    required this.selected,
    required this.onSelected,
    required this.icon,
    required this.title,
    required this.color,
  });

  final int icon;
  final Function(bool) onSelected;
  final bool selected;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      selected: selected,
      onSelected: onSelected,
      selectedColor: selected ? color.withOpacity(0.2) : null,
      avatar: Icon(
        color: color,
        IconData(
          icon,
          fontFamily: fontFamilyName,
          fontPackage: fontFamilyPackageName,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
        side: BorderSide(
          color: context.primary,
        ),
      ),
      showCheckmark: false,
      label: Text(title),
      labelStyle: context.titleMedium?.copyWith(color: color),
    );
  }
}
