// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:responsive_builder/responsive_builder.dart';

// Project imports:
import 'package:paisa/features/category/domain/entities/category.dart';
import 'package:paisa/features/category/presentation/widgets/category_item_mobile_widget.dart';
import 'package:paisa/features/category/presentation/widgets/category_item_tablet_widget.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key,
    required this.category,
    required this.onPressed,
  });

  final CategoryEntity category;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      tablet: (p0) => CategoryItemTabletWidget(
        category: category,
        onPressed: onPressed,
      ),
      desktop: (p0) => CategoryItemTabletWidget(
        category: category,
        onPressed: onPressed,
      ),
      mobile: (p0) => CategoryItemMobileWidget(category: category),
    );
  }
}
