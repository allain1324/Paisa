// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CategoryEntity {
  double? get budget => throw _privateConstructorUsedError;
  int get color => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int get icon => throw _privateConstructorUsedError;
  bool get isBudget => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int? get superId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryEntityCopyWith<CategoryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryEntityCopyWith<$Res> {
  factory $CategoryEntityCopyWith(
          CategoryEntity value, $Res Function(CategoryEntity) then) =
      _$CategoryEntityCopyWithImpl<$Res, CategoryEntity>;
  @useResult
  $Res call(
      {double? budget,
      int color,
      String? description,
      int icon,
      bool isBudget,
      bool isDefault,
      String name,
      int? superId});
}

/// @nodoc
class _$CategoryEntityCopyWithImpl<$Res, $Val extends CategoryEntity>
    implements $CategoryEntityCopyWith<$Res> {
  _$CategoryEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? budget = freezed,
    Object? color = null,
    Object? description = freezed,
    Object? icon = null,
    Object? isBudget = null,
    Object? isDefault = null,
    Object? name = null,
    Object? superId = freezed,
  }) {
    return _then(_value.copyWith(
      budget: freezed == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as double?,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as int,
      isBudget: null == isBudget
          ? _value.isBudget
          : isBudget // ignore: cast_nullable_to_non_nullable
              as bool,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      superId: freezed == superId
          ? _value.superId
          : superId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryEntityImplCopyWith<$Res>
    implements $CategoryEntityCopyWith<$Res> {
  factory _$$CategoryEntityImplCopyWith(_$CategoryEntityImpl value,
          $Res Function(_$CategoryEntityImpl) then) =
      __$$CategoryEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? budget,
      int color,
      String? description,
      int icon,
      bool isBudget,
      bool isDefault,
      String name,
      int? superId});
}

/// @nodoc
class __$$CategoryEntityImplCopyWithImpl<$Res>
    extends _$CategoryEntityCopyWithImpl<$Res, _$CategoryEntityImpl>
    implements _$$CategoryEntityImplCopyWith<$Res> {
  __$$CategoryEntityImplCopyWithImpl(
      _$CategoryEntityImpl _value, $Res Function(_$CategoryEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? budget = freezed,
    Object? color = null,
    Object? description = freezed,
    Object? icon = null,
    Object? isBudget = null,
    Object? isDefault = null,
    Object? name = null,
    Object? superId = freezed,
  }) {
    return _then(_$CategoryEntityImpl(
      budget: freezed == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as double?,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as int,
      isBudget: null == isBudget
          ? _value.isBudget
          : isBudget // ignore: cast_nullable_to_non_nullable
              as bool,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      superId: freezed == superId
          ? _value.superId
          : superId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$CategoryEntityImpl implements _CategoryEntity {
  const _$CategoryEntityImpl(
      {this.budget,
      required this.color,
      this.description,
      required this.icon,
      this.isBudget = false,
      this.isDefault = false,
      required this.name,
      this.superId});

  @override
  final double? budget;
  @override
  final int color;
  @override
  final String? description;
  @override
  final int icon;
  @override
  @JsonKey()
  final bool isBudget;
  @override
  @JsonKey()
  final bool isDefault;
  @override
  final String name;
  @override
  final int? superId;

  @override
  String toString() {
    return 'CategoryEntity(budget: $budget, color: $color, description: $description, icon: $icon, isBudget: $isBudget, isDefault: $isDefault, name: $name, superId: $superId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryEntityImpl &&
            (identical(other.budget, budget) || other.budget == budget) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.isBudget, isBudget) ||
                other.isBudget == isBudget) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.superId, superId) || other.superId == superId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, budget, color, description, icon,
      isBudget, isDefault, name, superId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryEntityImplCopyWith<_$CategoryEntityImpl> get copyWith =>
      __$$CategoryEntityImplCopyWithImpl<_$CategoryEntityImpl>(
          this, _$identity);
}

abstract class _CategoryEntity implements CategoryEntity {
  const factory _CategoryEntity(
      {final double? budget,
      required final int color,
      final String? description,
      required final int icon,
      final bool isBudget,
      final bool isDefault,
      required final String name,
      final int? superId}) = _$CategoryEntityImpl;

  @override
  double? get budget;
  @override
  int get color;
  @override
  String? get description;
  @override
  int get icon;
  @override
  bool get isBudget;
  @override
  bool get isDefault;
  @override
  String get name;
  @override
  int? get superId;
  @override
  @JsonKey(ignore: true)
  _$$CategoryEntityImplCopyWith<_$CategoryEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
