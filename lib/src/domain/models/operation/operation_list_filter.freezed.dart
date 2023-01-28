// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'operation_list_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OperationListFilter {
  DateTimeRange? get period => throw _privateConstructorUsedError;
  Set<Account> get accounts => throw _privateConstructorUsedError;
  Set<Category> get categories => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OperationListFilterCopyWith<OperationListFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OperationListFilterCopyWith<$Res> {
  factory $OperationListFilterCopyWith(
          OperationListFilter value, $Res Function(OperationListFilter) then) =
      _$OperationListFilterCopyWithImpl<$Res, OperationListFilter>;
  @useResult
  $Res call(
      {DateTimeRange? period, Set<Account> accounts, Set<Category> categories});
}

/// @nodoc
class _$OperationListFilterCopyWithImpl<$Res, $Val extends OperationListFilter>
    implements $OperationListFilterCopyWith<$Res> {
  _$OperationListFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = freezed,
    Object? accounts = null,
    Object? categories = null,
  }) {
    return _then(_value.copyWith(
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
      accounts: null == accounts
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as Set<Account>,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as Set<Category>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OperationListFilterCopyWith<$Res>
    implements $OperationListFilterCopyWith<$Res> {
  factory _$$_OperationListFilterCopyWith(_$_OperationListFilter value,
          $Res Function(_$_OperationListFilter) then) =
      __$$_OperationListFilterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTimeRange? period, Set<Account> accounts, Set<Category> categories});
}

/// @nodoc
class __$$_OperationListFilterCopyWithImpl<$Res>
    extends _$OperationListFilterCopyWithImpl<$Res, _$_OperationListFilter>
    implements _$$_OperationListFilterCopyWith<$Res> {
  __$$_OperationListFilterCopyWithImpl(_$_OperationListFilter _value,
      $Res Function(_$_OperationListFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = freezed,
    Object? accounts = null,
    Object? categories = null,
  }) {
    return _then(_$_OperationListFilter(
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
      accounts: null == accounts
          ? _value._accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as Set<Account>,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as Set<Category>,
    ));
  }
}

/// @nodoc

class _$_OperationListFilter implements _OperationListFilter {
  const _$_OperationListFilter(
      {this.period,
      final Set<Account> accounts = const {},
      final Set<Category> categories = const {}})
      : _accounts = accounts,
        _categories = categories;

  @override
  final DateTimeRange? period;
  final Set<Account> _accounts;
  @override
  @JsonKey()
  Set<Account> get accounts {
    if (_accounts is EqualUnmodifiableSetView) return _accounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_accounts);
  }

  final Set<Category> _categories;
  @override
  @JsonKey()
  Set<Category> get categories {
    if (_categories is EqualUnmodifiableSetView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_categories);
  }

  @override
  String toString() {
    return 'OperationListFilter(period: $period, accounts: $accounts, categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OperationListFilter &&
            (identical(other.period, period) || other.period == period) &&
            const DeepCollectionEquality().equals(other._accounts, _accounts) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      period,
      const DeepCollectionEquality().hash(_accounts),
      const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OperationListFilterCopyWith<_$_OperationListFilter> get copyWith =>
      __$$_OperationListFilterCopyWithImpl<_$_OperationListFilter>(
          this, _$identity);
}

abstract class _OperationListFilter implements OperationListFilter {
  const factory _OperationListFilter(
      {final DateTimeRange? period,
      final Set<Account> accounts,
      final Set<Category> categories}) = _$_OperationListFilter;

  @override
  DateTimeRange? get period;
  @override
  Set<Account> get accounts;
  @override
  Set<Category> get categories;
  @override
  @JsonKey(ignore: true)
  _$$_OperationListFilterCopyWith<_$_OperationListFilter> get copyWith =>
      throw _privateConstructorUsedError;
}
