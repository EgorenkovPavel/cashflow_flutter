// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_cashflow_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CategoryCashflowEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CategoryCashFlow> cashflows) change,
    required TResult Function(List<Category> categories) changeCategories,
    required TResult Function(double usd, double eur) changeCurrencyRate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CategoryCashFlow> cashflows)? change,
    TResult? Function(List<Category> categories)? changeCategories,
    TResult? Function(double usd, double eur)? changeCurrencyRate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CategoryCashFlow> cashflows)? change,
    TResult Function(List<Category> categories)? changeCategories,
    TResult Function(double usd, double eur)? changeCurrencyRate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeCategoryCashflowEvent value) change,
    required TResult Function(_ChangeCategoriesCategoryCashflowEvent value)
        changeCategories,
    required TResult Function(_ChangeCurrencyRateCategoryCashflowEvent value)
        changeCurrencyRate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeCategoryCashflowEvent value)? change,
    TResult? Function(_ChangeCategoriesCategoryCashflowEvent value)?
        changeCategories,
    TResult? Function(_ChangeCurrencyRateCategoryCashflowEvent value)?
        changeCurrencyRate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeCategoryCashflowEvent value)? change,
    TResult Function(_ChangeCategoriesCategoryCashflowEvent value)?
        changeCategories,
    TResult Function(_ChangeCurrencyRateCategoryCashflowEvent value)?
        changeCurrencyRate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCashflowEventCopyWith<$Res> {
  factory $CategoryCashflowEventCopyWith(CategoryCashflowEvent value,
          $Res Function(CategoryCashflowEvent) then) =
      _$CategoryCashflowEventCopyWithImpl<$Res, CategoryCashflowEvent>;
}

/// @nodoc
class _$CategoryCashflowEventCopyWithImpl<$Res,
        $Val extends CategoryCashflowEvent>
    implements $CategoryCashflowEventCopyWith<$Res> {
  _$CategoryCashflowEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryCashflowEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ChangeCategoryCashflowEventImplCopyWith<$Res> {
  factory _$$ChangeCategoryCashflowEventImplCopyWith(
          _$ChangeCategoryCashflowEventImpl value,
          $Res Function(_$ChangeCategoryCashflowEventImpl) then) =
      __$$ChangeCategoryCashflowEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CategoryCashFlow> cashflows});
}

/// @nodoc
class __$$ChangeCategoryCashflowEventImplCopyWithImpl<$Res>
    extends _$CategoryCashflowEventCopyWithImpl<$Res,
        _$ChangeCategoryCashflowEventImpl>
    implements _$$ChangeCategoryCashflowEventImplCopyWith<$Res> {
  __$$ChangeCategoryCashflowEventImplCopyWithImpl(
      _$ChangeCategoryCashflowEventImpl _value,
      $Res Function(_$ChangeCategoryCashflowEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryCashflowEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cashflows = null,
  }) {
    return _then(_$ChangeCategoryCashflowEventImpl(
      cashflows: null == cashflows
          ? _value._cashflows
          : cashflows // ignore: cast_nullable_to_non_nullable
              as List<CategoryCashFlow>,
    ));
  }
}

/// @nodoc

class _$ChangeCategoryCashflowEventImpl
    implements _ChangeCategoryCashflowEvent {
  const _$ChangeCategoryCashflowEventImpl(
      {required final List<CategoryCashFlow> cashflows})
      : _cashflows = cashflows;

  final List<CategoryCashFlow> _cashflows;
  @override
  List<CategoryCashFlow> get cashflows {
    if (_cashflows is EqualUnmodifiableListView) return _cashflows;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cashflows);
  }

  @override
  String toString() {
    return 'CategoryCashflowEvent.change(cashflows: $cashflows)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeCategoryCashflowEventImpl &&
            const DeepCollectionEquality()
                .equals(other._cashflows, _cashflows));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_cashflows));

  /// Create a copy of CategoryCashflowEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeCategoryCashflowEventImplCopyWith<_$ChangeCategoryCashflowEventImpl>
      get copyWith => __$$ChangeCategoryCashflowEventImplCopyWithImpl<
          _$ChangeCategoryCashflowEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CategoryCashFlow> cashflows) change,
    required TResult Function(List<Category> categories) changeCategories,
    required TResult Function(double usd, double eur) changeCurrencyRate,
  }) {
    return change(cashflows);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CategoryCashFlow> cashflows)? change,
    TResult? Function(List<Category> categories)? changeCategories,
    TResult? Function(double usd, double eur)? changeCurrencyRate,
  }) {
    return change?.call(cashflows);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CategoryCashFlow> cashflows)? change,
    TResult Function(List<Category> categories)? changeCategories,
    TResult Function(double usd, double eur)? changeCurrencyRate,
    required TResult orElse(),
  }) {
    if (change != null) {
      return change(cashflows);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeCategoryCashflowEvent value) change,
    required TResult Function(_ChangeCategoriesCategoryCashflowEvent value)
        changeCategories,
    required TResult Function(_ChangeCurrencyRateCategoryCashflowEvent value)
        changeCurrencyRate,
  }) {
    return change(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeCategoryCashflowEvent value)? change,
    TResult? Function(_ChangeCategoriesCategoryCashflowEvent value)?
        changeCategories,
    TResult? Function(_ChangeCurrencyRateCategoryCashflowEvent value)?
        changeCurrencyRate,
  }) {
    return change?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeCategoryCashflowEvent value)? change,
    TResult Function(_ChangeCategoriesCategoryCashflowEvent value)?
        changeCategories,
    TResult Function(_ChangeCurrencyRateCategoryCashflowEvent value)?
        changeCurrencyRate,
    required TResult orElse(),
  }) {
    if (change != null) {
      return change(this);
    }
    return orElse();
  }
}

abstract class _ChangeCategoryCashflowEvent implements CategoryCashflowEvent {
  const factory _ChangeCategoryCashflowEvent(
          {required final List<CategoryCashFlow> cashflows}) =
      _$ChangeCategoryCashflowEventImpl;

  List<CategoryCashFlow> get cashflows;

  /// Create a copy of CategoryCashflowEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeCategoryCashflowEventImplCopyWith<_$ChangeCategoryCashflowEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeCategoriesCategoryCashflowEventImplCopyWith<$Res> {
  factory _$$ChangeCategoriesCategoryCashflowEventImplCopyWith(
          _$ChangeCategoriesCategoryCashflowEventImpl value,
          $Res Function(_$ChangeCategoriesCategoryCashflowEventImpl) then) =
      __$$ChangeCategoriesCategoryCashflowEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Category> categories});
}

/// @nodoc
class __$$ChangeCategoriesCategoryCashflowEventImplCopyWithImpl<$Res>
    extends _$CategoryCashflowEventCopyWithImpl<$Res,
        _$ChangeCategoriesCategoryCashflowEventImpl>
    implements _$$ChangeCategoriesCategoryCashflowEventImplCopyWith<$Res> {
  __$$ChangeCategoriesCategoryCashflowEventImplCopyWithImpl(
      _$ChangeCategoriesCategoryCashflowEventImpl _value,
      $Res Function(_$ChangeCategoriesCategoryCashflowEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryCashflowEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_$ChangeCategoriesCategoryCashflowEventImpl(
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ));
  }
}

/// @nodoc

class _$ChangeCategoriesCategoryCashflowEventImpl
    implements _ChangeCategoriesCategoryCashflowEvent {
  const _$ChangeCategoriesCategoryCashflowEventImpl(
      {required final List<Category> categories})
      : _categories = categories;

  final List<Category> _categories;
  @override
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'CategoryCashflowEvent.changeCategories(categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeCategoriesCategoryCashflowEventImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  /// Create a copy of CategoryCashflowEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeCategoriesCategoryCashflowEventImplCopyWith<
          _$ChangeCategoriesCategoryCashflowEventImpl>
      get copyWith => __$$ChangeCategoriesCategoryCashflowEventImplCopyWithImpl<
          _$ChangeCategoriesCategoryCashflowEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CategoryCashFlow> cashflows) change,
    required TResult Function(List<Category> categories) changeCategories,
    required TResult Function(double usd, double eur) changeCurrencyRate,
  }) {
    return changeCategories(categories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CategoryCashFlow> cashflows)? change,
    TResult? Function(List<Category> categories)? changeCategories,
    TResult? Function(double usd, double eur)? changeCurrencyRate,
  }) {
    return changeCategories?.call(categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CategoryCashFlow> cashflows)? change,
    TResult Function(List<Category> categories)? changeCategories,
    TResult Function(double usd, double eur)? changeCurrencyRate,
    required TResult orElse(),
  }) {
    if (changeCategories != null) {
      return changeCategories(categories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeCategoryCashflowEvent value) change,
    required TResult Function(_ChangeCategoriesCategoryCashflowEvent value)
        changeCategories,
    required TResult Function(_ChangeCurrencyRateCategoryCashflowEvent value)
        changeCurrencyRate,
  }) {
    return changeCategories(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeCategoryCashflowEvent value)? change,
    TResult? Function(_ChangeCategoriesCategoryCashflowEvent value)?
        changeCategories,
    TResult? Function(_ChangeCurrencyRateCategoryCashflowEvent value)?
        changeCurrencyRate,
  }) {
    return changeCategories?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeCategoryCashflowEvent value)? change,
    TResult Function(_ChangeCategoriesCategoryCashflowEvent value)?
        changeCategories,
    TResult Function(_ChangeCurrencyRateCategoryCashflowEvent value)?
        changeCurrencyRate,
    required TResult orElse(),
  }) {
    if (changeCategories != null) {
      return changeCategories(this);
    }
    return orElse();
  }
}

abstract class _ChangeCategoriesCategoryCashflowEvent
    implements CategoryCashflowEvent {
  const factory _ChangeCategoriesCategoryCashflowEvent(
          {required final List<Category> categories}) =
      _$ChangeCategoriesCategoryCashflowEventImpl;

  List<Category> get categories;

  /// Create a copy of CategoryCashflowEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeCategoriesCategoryCashflowEventImplCopyWith<
          _$ChangeCategoriesCategoryCashflowEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeCurrencyRateCategoryCashflowEventImplCopyWith<$Res> {
  factory _$$ChangeCurrencyRateCategoryCashflowEventImplCopyWith(
          _$ChangeCurrencyRateCategoryCashflowEventImpl value,
          $Res Function(_$ChangeCurrencyRateCategoryCashflowEventImpl) then) =
      __$$ChangeCurrencyRateCategoryCashflowEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double usd, double eur});
}

/// @nodoc
class __$$ChangeCurrencyRateCategoryCashflowEventImplCopyWithImpl<$Res>
    extends _$CategoryCashflowEventCopyWithImpl<$Res,
        _$ChangeCurrencyRateCategoryCashflowEventImpl>
    implements _$$ChangeCurrencyRateCategoryCashflowEventImplCopyWith<$Res> {
  __$$ChangeCurrencyRateCategoryCashflowEventImplCopyWithImpl(
      _$ChangeCurrencyRateCategoryCashflowEventImpl _value,
      $Res Function(_$ChangeCurrencyRateCategoryCashflowEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryCashflowEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usd = null,
    Object? eur = null,
  }) {
    return _then(_$ChangeCurrencyRateCategoryCashflowEventImpl(
      usd: null == usd
          ? _value.usd
          : usd // ignore: cast_nullable_to_non_nullable
              as double,
      eur: null == eur
          ? _value.eur
          : eur // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$ChangeCurrencyRateCategoryCashflowEventImpl
    implements _ChangeCurrencyRateCategoryCashflowEvent {
  const _$ChangeCurrencyRateCategoryCashflowEventImpl(
      {required this.usd, required this.eur});

  @override
  final double usd;
  @override
  final double eur;

  @override
  String toString() {
    return 'CategoryCashflowEvent.changeCurrencyRate(usd: $usd, eur: $eur)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeCurrencyRateCategoryCashflowEventImpl &&
            (identical(other.usd, usd) || other.usd == usd) &&
            (identical(other.eur, eur) || other.eur == eur));
  }

  @override
  int get hashCode => Object.hash(runtimeType, usd, eur);

  /// Create a copy of CategoryCashflowEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeCurrencyRateCategoryCashflowEventImplCopyWith<
          _$ChangeCurrencyRateCategoryCashflowEventImpl>
      get copyWith =>
          __$$ChangeCurrencyRateCategoryCashflowEventImplCopyWithImpl<
              _$ChangeCurrencyRateCategoryCashflowEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CategoryCashFlow> cashflows) change,
    required TResult Function(List<Category> categories) changeCategories,
    required TResult Function(double usd, double eur) changeCurrencyRate,
  }) {
    return changeCurrencyRate(usd, eur);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CategoryCashFlow> cashflows)? change,
    TResult? Function(List<Category> categories)? changeCategories,
    TResult? Function(double usd, double eur)? changeCurrencyRate,
  }) {
    return changeCurrencyRate?.call(usd, eur);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CategoryCashFlow> cashflows)? change,
    TResult Function(List<Category> categories)? changeCategories,
    TResult Function(double usd, double eur)? changeCurrencyRate,
    required TResult orElse(),
  }) {
    if (changeCurrencyRate != null) {
      return changeCurrencyRate(usd, eur);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeCategoryCashflowEvent value) change,
    required TResult Function(_ChangeCategoriesCategoryCashflowEvent value)
        changeCategories,
    required TResult Function(_ChangeCurrencyRateCategoryCashflowEvent value)
        changeCurrencyRate,
  }) {
    return changeCurrencyRate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeCategoryCashflowEvent value)? change,
    TResult? Function(_ChangeCategoriesCategoryCashflowEvent value)?
        changeCategories,
    TResult? Function(_ChangeCurrencyRateCategoryCashflowEvent value)?
        changeCurrencyRate,
  }) {
    return changeCurrencyRate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeCategoryCashflowEvent value)? change,
    TResult Function(_ChangeCategoriesCategoryCashflowEvent value)?
        changeCategories,
    TResult Function(_ChangeCurrencyRateCategoryCashflowEvent value)?
        changeCurrencyRate,
    required TResult orElse(),
  }) {
    if (changeCurrencyRate != null) {
      return changeCurrencyRate(this);
    }
    return orElse();
  }
}

abstract class _ChangeCurrencyRateCategoryCashflowEvent
    implements CategoryCashflowEvent {
  const factory _ChangeCurrencyRateCategoryCashflowEvent(
          {required final double usd, required final double eur}) =
      _$ChangeCurrencyRateCategoryCashflowEventImpl;

  double get usd;
  double get eur;

  /// Create a copy of CategoryCashflowEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeCurrencyRateCategoryCashflowEventImplCopyWith<
          _$ChangeCurrencyRateCategoryCashflowEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CategoryCashflowState {
  List<CategoryCashFlow> get cashflows => throw _privateConstructorUsedError;
  List<Category> get categories => throw _privateConstructorUsedError;
  double get usd => throw _privateConstructorUsedError;
  double get eur => throw _privateConstructorUsedError;

  /// Create a copy of CategoryCashflowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryCashflowStateCopyWith<CategoryCashflowState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCashflowStateCopyWith<$Res> {
  factory $CategoryCashflowStateCopyWith(CategoryCashflowState value,
          $Res Function(CategoryCashflowState) then) =
      _$CategoryCashflowStateCopyWithImpl<$Res, CategoryCashflowState>;
  @useResult
  $Res call(
      {List<CategoryCashFlow> cashflows,
      List<Category> categories,
      double usd,
      double eur});
}

/// @nodoc
class _$CategoryCashflowStateCopyWithImpl<$Res,
        $Val extends CategoryCashflowState>
    implements $CategoryCashflowStateCopyWith<$Res> {
  _$CategoryCashflowStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryCashflowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cashflows = null,
    Object? categories = null,
    Object? usd = null,
    Object? eur = null,
  }) {
    return _then(_value.copyWith(
      cashflows: null == cashflows
          ? _value.cashflows
          : cashflows // ignore: cast_nullable_to_non_nullable
              as List<CategoryCashFlow>,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      usd: null == usd
          ? _value.usd
          : usd // ignore: cast_nullable_to_non_nullable
              as double,
      eur: null == eur
          ? _value.eur
          : eur // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryCashflowStateImplCopyWith<$Res>
    implements $CategoryCashflowStateCopyWith<$Res> {
  factory _$$CategoryCashflowStateImplCopyWith(
          _$CategoryCashflowStateImpl value,
          $Res Function(_$CategoryCashflowStateImpl) then) =
      __$$CategoryCashflowStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CategoryCashFlow> cashflows,
      List<Category> categories,
      double usd,
      double eur});
}

/// @nodoc
class __$$CategoryCashflowStateImplCopyWithImpl<$Res>
    extends _$CategoryCashflowStateCopyWithImpl<$Res,
        _$CategoryCashflowStateImpl>
    implements _$$CategoryCashflowStateImplCopyWith<$Res> {
  __$$CategoryCashflowStateImplCopyWithImpl(_$CategoryCashflowStateImpl _value,
      $Res Function(_$CategoryCashflowStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryCashflowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cashflows = null,
    Object? categories = null,
    Object? usd = null,
    Object? eur = null,
  }) {
    return _then(_$CategoryCashflowStateImpl(
      cashflows: null == cashflows
          ? _value._cashflows
          : cashflows // ignore: cast_nullable_to_non_nullable
              as List<CategoryCashFlow>,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      usd: null == usd
          ? _value.usd
          : usd // ignore: cast_nullable_to_non_nullable
              as double,
      eur: null == eur
          ? _value.eur
          : eur // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$CategoryCashflowStateImpl extends _CategoryCashflowState {
  const _$CategoryCashflowStateImpl(
      {required final List<CategoryCashFlow> cashflows,
      required final List<Category> categories,
      required this.usd,
      required this.eur})
      : _cashflows = cashflows,
        _categories = categories,
        super._();

  final List<CategoryCashFlow> _cashflows;
  @override
  List<CategoryCashFlow> get cashflows {
    if (_cashflows is EqualUnmodifiableListView) return _cashflows;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cashflows);
  }

  final List<Category> _categories;
  @override
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final double usd;
  @override
  final double eur;

  @override
  String toString() {
    return 'CategoryCashflowState(cashflows: $cashflows, categories: $categories, usd: $usd, eur: $eur)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryCashflowStateImpl &&
            const DeepCollectionEquality()
                .equals(other._cashflows, _cashflows) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.usd, usd) || other.usd == usd) &&
            (identical(other.eur, eur) || other.eur == eur));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cashflows),
      const DeepCollectionEquality().hash(_categories),
      usd,
      eur);

  /// Create a copy of CategoryCashflowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryCashflowStateImplCopyWith<_$CategoryCashflowStateImpl>
      get copyWith => __$$CategoryCashflowStateImplCopyWithImpl<
          _$CategoryCashflowStateImpl>(this, _$identity);
}

abstract class _CategoryCashflowState extends CategoryCashflowState {
  const factory _CategoryCashflowState(
      {required final List<CategoryCashFlow> cashflows,
      required final List<Category> categories,
      required final double usd,
      required final double eur}) = _$CategoryCashflowStateImpl;
  const _CategoryCashflowState._() : super._();

  @override
  List<CategoryCashFlow> get cashflows;
  @override
  List<Category> get categories;
  @override
  double get usd;
  @override
  double get eur;

  /// Create a copy of CategoryCashflowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryCashflowStateImplCopyWith<_$CategoryCashflowStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
