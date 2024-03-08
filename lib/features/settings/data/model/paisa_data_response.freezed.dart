// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paisa_data_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaisaDataResponse _$PaisaDataResponseFromJson(Map<String, dynamic> json) {
  return _PaisaDataResponse.fromJson(json);
}

/// @nodoc
mixin _$PaisaDataResponse {
  List<TransactionModel> get expenses => throw _privateConstructorUsedError;
  List<AccountModel> get accounts => throw _privateConstructorUsedError;
  List<CategoryModel> get categories => throw _privateConstructorUsedError;
  List<DebitModel> get debts => throw _privateConstructorUsedError;
  List<DebitTransactionsModel> get debitTransactions =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaisaDataResponseCopyWith<PaisaDataResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaisaDataResponseCopyWith<$Res> {
  factory $PaisaDataResponseCopyWith(
          PaisaDataResponse value, $Res Function(PaisaDataResponse) then) =
      _$PaisaDataResponseCopyWithImpl<$Res, PaisaDataResponse>;
  @useResult
  $Res call(
      {List<TransactionModel> expenses,
      List<AccountModel> accounts,
      List<CategoryModel> categories,
      List<DebitModel> debts,
      List<DebitTransactionsModel> debitTransactions});
}

/// @nodoc
class _$PaisaDataResponseCopyWithImpl<$Res, $Val extends PaisaDataResponse>
    implements $PaisaDataResponseCopyWith<$Res> {
  _$PaisaDataResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expenses = null,
    Object? accounts = null,
    Object? categories = null,
    Object? debts = null,
    Object? debitTransactions = null,
  }) {
    return _then(_value.copyWith(
      expenses: null == expenses
          ? _value.expenses
          : expenses // ignore: cast_nullable_to_non_nullable
              as List<TransactionModel>,
      accounts: null == accounts
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<AccountModel>,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      debts: null == debts
          ? _value.debts
          : debts // ignore: cast_nullable_to_non_nullable
              as List<DebitModel>,
      debitTransactions: null == debitTransactions
          ? _value.debitTransactions
          : debitTransactions // ignore: cast_nullable_to_non_nullable
              as List<DebitTransactionsModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaisaDataResponseImplCopyWith<$Res>
    implements $PaisaDataResponseCopyWith<$Res> {
  factory _$$PaisaDataResponseImplCopyWith(_$PaisaDataResponseImpl value,
          $Res Function(_$PaisaDataResponseImpl) then) =
      __$$PaisaDataResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TransactionModel> expenses,
      List<AccountModel> accounts,
      List<CategoryModel> categories,
      List<DebitModel> debts,
      List<DebitTransactionsModel> debitTransactions});
}

/// @nodoc
class __$$PaisaDataResponseImplCopyWithImpl<$Res>
    extends _$PaisaDataResponseCopyWithImpl<$Res, _$PaisaDataResponseImpl>
    implements _$$PaisaDataResponseImplCopyWith<$Res> {
  __$$PaisaDataResponseImplCopyWithImpl(_$PaisaDataResponseImpl _value,
      $Res Function(_$PaisaDataResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expenses = null,
    Object? accounts = null,
    Object? categories = null,
    Object? debts = null,
    Object? debitTransactions = null,
  }) {
    return _then(_$PaisaDataResponseImpl(
      expenses: null == expenses
          ? _value._expenses
          : expenses // ignore: cast_nullable_to_non_nullable
              as List<TransactionModel>,
      accounts: null == accounts
          ? _value._accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<AccountModel>,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      debts: null == debts
          ? _value._debts
          : debts // ignore: cast_nullable_to_non_nullable
              as List<DebitModel>,
      debitTransactions: null == debitTransactions
          ? _value._debitTransactions
          : debitTransactions // ignore: cast_nullable_to_non_nullable
              as List<DebitTransactionsModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaisaDataResponseImpl implements _PaisaDataResponse {
  const _$PaisaDataResponseImpl(
      {final List<TransactionModel> expenses = const [],
      final List<AccountModel> accounts = const [],
      final List<CategoryModel> categories = const [],
      final List<DebitModel> debts = const [],
      final List<DebitTransactionsModel> debitTransactions = const []})
      : _expenses = expenses,
        _accounts = accounts,
        _categories = categories,
        _debts = debts,
        _debitTransactions = debitTransactions;

  factory _$PaisaDataResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaisaDataResponseImplFromJson(json);

  final List<TransactionModel> _expenses;
  @override
  @JsonKey()
  List<TransactionModel> get expenses {
    if (_expenses is EqualUnmodifiableListView) return _expenses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expenses);
  }

  final List<AccountModel> _accounts;
  @override
  @JsonKey()
  List<AccountModel> get accounts {
    if (_accounts is EqualUnmodifiableListView) return _accounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accounts);
  }

  final List<CategoryModel> _categories;
  @override
  @JsonKey()
  List<CategoryModel> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<DebitModel> _debts;
  @override
  @JsonKey()
  List<DebitModel> get debts {
    if (_debts is EqualUnmodifiableListView) return _debts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_debts);
  }

  final List<DebitTransactionsModel> _debitTransactions;
  @override
  @JsonKey()
  List<DebitTransactionsModel> get debitTransactions {
    if (_debitTransactions is EqualUnmodifiableListView)
      return _debitTransactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_debitTransactions);
  }

  @override
  String toString() {
    return 'PaisaDataResponse(expenses: $expenses, accounts: $accounts, categories: $categories, debts: $debts, debitTransactions: $debitTransactions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaisaDataResponseImpl &&
            const DeepCollectionEquality().equals(other._expenses, _expenses) &&
            const DeepCollectionEquality().equals(other._accounts, _accounts) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._debts, _debts) &&
            const DeepCollectionEquality()
                .equals(other._debitTransactions, _debitTransactions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_expenses),
      const DeepCollectionEquality().hash(_accounts),
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_debts),
      const DeepCollectionEquality().hash(_debitTransactions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaisaDataResponseImplCopyWith<_$PaisaDataResponseImpl> get copyWith =>
      __$$PaisaDataResponseImplCopyWithImpl<_$PaisaDataResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaisaDataResponseImplToJson(
      this,
    );
  }
}

abstract class _PaisaDataResponse implements PaisaDataResponse {
  const factory _PaisaDataResponse(
          {final List<TransactionModel> expenses,
          final List<AccountModel> accounts,
          final List<CategoryModel> categories,
          final List<DebitModel> debts,
          final List<DebitTransactionsModel> debitTransactions}) =
      _$PaisaDataResponseImpl;

  factory _PaisaDataResponse.fromJson(Map<String, dynamic> json) =
      _$PaisaDataResponseImpl.fromJson;

  @override
  List<TransactionModel> get expenses;
  @override
  List<AccountModel> get accounts;
  @override
  List<CategoryModel> get categories;
  @override
  List<DebitModel> get debts;
  @override
  List<DebitTransactionsModel> get debitTransactions;
  @override
  @JsonKey(ignore: true)
  _$$PaisaDataResponseImplCopyWith<_$PaisaDataResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
