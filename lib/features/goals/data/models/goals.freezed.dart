// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goals.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Goals _$GoalsFromJson(Map<String, dynamic> json) {
  return _Goals.fromJson(json);
}

/// @nodoc
mixin _$Goals {
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;
  @HiveField(0)
  set name(String value) => throw _privateConstructorUsedError;
  @HiveField(1)
  double get amount => throw _privateConstructorUsedError;
  @HiveField(1)
  set amount(double value) => throw _privateConstructorUsedError;
  @HiveField(2)
  int? get superId => throw _privateConstructorUsedError;
  @HiveField(2)
  set superId(int? value) => throw _privateConstructorUsedError;
  @HiveField(3)
  int get icon => throw _privateConstructorUsedError;
  @HiveField(3)
  set icon(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GoalsCopyWith<Goals> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalsCopyWith<$Res> {
  factory $GoalsCopyWith(Goals value, $Res Function(Goals) then) =
      _$GoalsCopyWithImpl<$Res, Goals>;
  @useResult
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) double amount,
      @HiveField(2) int? superId,
      @HiveField(3) int icon});
}

/// @nodoc
class _$GoalsCopyWithImpl<$Res, $Val extends Goals>
    implements $GoalsCopyWith<$Res> {
  _$GoalsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? amount = null,
    Object? superId = freezed,
    Object? icon = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      superId: freezed == superId
          ? _value.superId
          : superId // ignore: cast_nullable_to_non_nullable
              as int?,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GoalsImplCopyWith<$Res> implements $GoalsCopyWith<$Res> {
  factory _$$GoalsImplCopyWith(
          _$GoalsImpl value, $Res Function(_$GoalsImpl) then) =
      __$$GoalsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) double amount,
      @HiveField(2) int? superId,
      @HiveField(3) int icon});
}

/// @nodoc
class __$$GoalsImplCopyWithImpl<$Res>
    extends _$GoalsCopyWithImpl<$Res, _$GoalsImpl>
    implements _$$GoalsImplCopyWith<$Res> {
  __$$GoalsImplCopyWithImpl(
      _$GoalsImpl _value, $Res Function(_$GoalsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? amount = null,
    Object? superId = freezed,
    Object? icon = null,
  }) {
    return _then(_$GoalsImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      superId: freezed == superId
          ? _value.superId
          : superId // ignore: cast_nullable_to_non_nullable
              as int?,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 8, adapterName: 'GoalsModelAdapter')
class _$GoalsImpl extends _Goals {
  _$GoalsImpl(
      {@HiveField(0) required this.name,
      @HiveField(1) required this.amount,
      @HiveField(2) this.superId,
      @HiveField(3) required this.icon})
      : super._();

  factory _$GoalsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GoalsImplFromJson(json);

  @override
  @HiveField(0)
  String name;
  @override
  @HiveField(1)
  double amount;
  @override
  @HiveField(2)
  int? superId;
  @override
  @HiveField(3)
  int icon;

  @override
  String toString() {
    return 'Goals(name: $name, amount: $amount, superId: $superId, icon: $icon)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GoalsImplCopyWith<_$GoalsImpl> get copyWith =>
      __$$GoalsImplCopyWithImpl<_$GoalsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GoalsImplToJson(
      this,
    );
  }
}

abstract class _Goals extends Goals {
  factory _Goals(
      {@HiveField(0) required String name,
      @HiveField(1) required double amount,
      @HiveField(2) int? superId,
      @HiveField(3) required int icon}) = _$GoalsImpl;
  _Goals._() : super._();

  factory _Goals.fromJson(Map<String, dynamic> json) = _$GoalsImpl.fromJson;

  @override
  @HiveField(0)
  String get name;
  @HiveField(0)
  set name(String value);
  @override
  @HiveField(1)
  double get amount;
  @HiveField(1)
  set amount(double value);
  @override
  @HiveField(2)
  int? get superId;
  @HiveField(2)
  set superId(int? value);
  @override
  @HiveField(3)
  int get icon;
  @HiveField(3)
  set icon(int value);
  @override
  @JsonKey(ignore: true)
  _$$GoalsImplCopyWith<_$GoalsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
