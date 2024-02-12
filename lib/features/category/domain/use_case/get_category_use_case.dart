import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:paisa/core/extensions/category_extension.dart';
import 'package:paisa/core/use_case/use_case.dart';
import 'package:paisa/features/category/domain/entities/category.dart';
import 'package:paisa/features/category/domain/repository/category_repository.dart';

part 'get_category_use_case.freezed.dart';

@singleton
class GetCategoryUseCase
    implements UseCase<CategoryEntity?, GetCategoryParams> {
  GetCategoryUseCase({required this.categoryRepository});

  final CategoryRepository categoryRepository;

  @override
  CategoryEntity? call(GetCategoryParams params) {
    return categoryRepository.fetchById(params.categoryId)?.toEntity();
  }
}

@freezed
class GetCategoryParams with _$GetCategoryParams {
  const factory GetCategoryParams(int? categoryId) = _GetCategoryParams;
}
