// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// Project imports:
import 'package:paisa/config/routes.dart';
import 'package:paisa/core/common.dart';
import 'package:paisa/features/category/domain/entities/category.dart';

class CategoryItemMobileWidget extends StatelessWidget {
  const CategoryItemMobileWidget({
    super.key,
    required this.category,
  });

  final CategoryEntity category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        CategoryPageData(
          categoryId: category.superId,
        ).push(context);
      },
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Color(category.color).withOpacity(0.3),
          child: Icon(
            IconData(
              category.icon,
              fontFamily: fontFamilyName,
              fontPackage: fontFamilyPackageName,
            ),
            color: Color(category.color),
          ),
        ),
        title: Text(
          category.name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: context.titleMedium?.copyWith(
            color: context.onSurfaceVariant,
          ),
        ),
        trailing: category.isDefault ? Icon(MdiIcons.swapHorizontal) : null,
        subtitle: category.description == null || category.description == ''
            ? null
            : Text(
                category.description!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: context.bodyLarge?.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurfaceVariant
                      .withOpacity(0.75),
                ),
              ),
      ),
    );
  }
}
