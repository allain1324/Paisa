// Project imports:
import 'package:paisa/features/category/data/model/category_model.dart';
import 'package:paisa/features/category/domain/entities/category.dart';

abstract class CategoryRepository {
  Future<void> add({
    required String name,
    required int icon,
    required int? color,
    required String? desc,
    bool isBudget = false,
    required double? budget,
    bool isDefault = false,
  });

  Future<void> delete(int key);

  CategoryModel fetchById(int categoryId);

  Future<void> update({
    required int? key,
    required String name,
    required int icon,
    required int? color,
    required String? desc,
    bool isBudget = false,
    required double? budget,
    bool isDefault = false,
  });

  Future<void> clear();

  List<CategoryEntity> defaultCategories();
}
