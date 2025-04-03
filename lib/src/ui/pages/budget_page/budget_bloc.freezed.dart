// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BudgetEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CategoryType type) fetch,
    required TResult Function() previousYear,
    required TResult Function() nextYear,
    required TResult Function(BudgetType budgetType) showAll,
    required TResult Function(List<CategoryCashFlow> items) changeItems,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CategoryType type)? fetch,
    TResult? Function()? previousYear,
    TResult? Function()? nextYear,
    TResult? Function(BudgetType budgetType)? showAll,
    TResult? Function(List<CategoryCashFlow> items)? changeItems,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CategoryType type)? fetch,
    TResult Function()? previousYear,
    TResult Function()? nextYear,
    TResult Function(BudgetType budgetType)? showAll,
    TResult Function(List<CategoryCashFlow> items)? changeItems,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchBudgetEvent value) fetch,
    required TResult Function(_PreviousYearBudgetEvent value) previousYear,
    required TResult Function(_NextYearBudgetEvent value) nextYear,
    required TResult Function(_ShowAllBudgetEvent value) showAll,
    required TResult Function(_ChangeItemsBudgetEvent value) changeItems,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchBudgetEvent value)? fetch,
    TResult? Function(_PreviousYearBudgetEvent value)? previousYear,
    TResult? Function(_NextYearBudgetEvent value)? nextYear,
    TResult? Function(_ShowAllBudgetEvent value)? showAll,
    TResult? Function(_ChangeItemsBudgetEvent value)? changeItems,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchBudgetEvent value)? fetch,
    TResult Function(_PreviousYearBudgetEvent value)? previousYear,
    TResult Function(_NextYearBudgetEvent value)? nextYear,
    TResult Function(_ShowAllBudgetEvent value)? showAll,
    TResult Function(_ChangeItemsBudgetEvent value)? changeItems,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetEventCopyWith<$Res> {
  factory $BudgetEventCopyWith(
          BudgetEvent value, $Res Function(BudgetEvent) then) =
      _$BudgetEventCopyWithImpl<$Res, BudgetEvent>;
}

/// @nodoc
class _$BudgetEventCopyWithImpl<$Res, $Val extends BudgetEvent>
    implements $BudgetEventCopyWith<$Res> {
  _$BudgetEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BudgetEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchBudgetEventImplCopyWith<$Res> {
  factory _$$FetchBudgetEventImplCopyWith(_$FetchBudgetEventImpl value,
          $Res Function(_$FetchBudgetEventImpl) then) =
      __$$FetchBudgetEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CategoryType type});
}

/// @nodoc
class __$$FetchBudgetEventImplCopyWithImpl<$Res>
    extends _$BudgetEventCopyWithImpl<$Res, _$FetchBudgetEventImpl>
    implements _$$FetchBudgetEventImplCopyWith<$Res> {
  __$$FetchBudgetEventImplCopyWithImpl(_$FetchBudgetEventImpl _value,
      $Res Function(_$FetchBudgetEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of BudgetEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_$FetchBudgetEventImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CategoryType,
    ));
  }
}

/// @nodoc

class _$FetchBudgetEventImpl implements _FetchBudgetEvent {
  const _$FetchBudgetEventImpl({required this.type});

  @override
  final CategoryType type;

  @override
  String toString() {
    return 'BudgetEvent.fetch(type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchBudgetEventImpl &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  /// Create a copy of BudgetEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchBudgetEventImplCopyWith<_$FetchBudgetEventImpl> get copyWith =>
      __$$FetchBudgetEventImplCopyWithImpl<_$FetchBudgetEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CategoryType type) fetch,
    required TResult Function() previousYear,
    required TResult Function() nextYear,
    required TResult Function(BudgetType budgetType) showAll,
    required TResult Function(List<CategoryCashFlow> items) changeItems,
  }) {
    return fetch(type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CategoryType type)? fetch,
    TResult? Function()? previousYear,
    TResult? Function()? nextYear,
    TResult? Function(BudgetType budgetType)? showAll,
    TResult? Function(List<CategoryCashFlow> items)? changeItems,
  }) {
    return fetch?.call(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CategoryType type)? fetch,
    TResult Function()? previousYear,
    TResult Function()? nextYear,
    TResult Function(BudgetType budgetType)? showAll,
    TResult Function(List<CategoryCashFlow> items)? changeItems,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchBudgetEvent value) fetch,
    required TResult Function(_PreviousYearBudgetEvent value) previousYear,
    required TResult Function(_NextYearBudgetEvent value) nextYear,
    required TResult Function(_ShowAllBudgetEvent value) showAll,
    required TResult Function(_ChangeItemsBudgetEvent value) changeItems,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchBudgetEvent value)? fetch,
    TResult? Function(_PreviousYearBudgetEvent value)? previousYear,
    TResult? Function(_NextYearBudgetEvent value)? nextYear,
    TResult? Function(_ShowAllBudgetEvent value)? showAll,
    TResult? Function(_ChangeItemsBudgetEvent value)? changeItems,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchBudgetEvent value)? fetch,
    TResult Function(_PreviousYearBudgetEvent value)? previousYear,
    TResult Function(_NextYearBudgetEvent value)? nextYear,
    TResult Function(_ShowAllBudgetEvent value)? showAll,
    TResult Function(_ChangeItemsBudgetEvent value)? changeItems,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _FetchBudgetEvent implements BudgetEvent {
  const factory _FetchBudgetEvent({required final CategoryType type}) =
      _$FetchBudgetEventImpl;

  CategoryType get type;

  /// Create a copy of BudgetEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchBudgetEventImplCopyWith<_$FetchBudgetEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PreviousYearBudgetEventImplCopyWith<$Res> {
  factory _$$PreviousYearBudgetEventImplCopyWith(
          _$PreviousYearBudgetEventImpl value,
          $Res Function(_$PreviousYearBudgetEventImpl) then) =
      __$$PreviousYearBudgetEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PreviousYearBudgetEventImplCopyWithImpl<$Res>
    extends _$BudgetEventCopyWithImpl<$Res, _$PreviousYearBudgetEventImpl>
    implements _$$PreviousYearBudgetEventImplCopyWith<$Res> {
  __$$PreviousYearBudgetEventImplCopyWithImpl(
      _$PreviousYearBudgetEventImpl _value,
      $Res Function(_$PreviousYearBudgetEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of BudgetEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PreviousYearBudgetEventImpl implements _PreviousYearBudgetEvent {
  const _$PreviousYearBudgetEventImpl();

  @override
  String toString() {
    return 'BudgetEvent.previousYear()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreviousYearBudgetEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CategoryType type) fetch,
    required TResult Function() previousYear,
    required TResult Function() nextYear,
    required TResult Function(BudgetType budgetType) showAll,
    required TResult Function(List<CategoryCashFlow> items) changeItems,
  }) {
    return previousYear();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CategoryType type)? fetch,
    TResult? Function()? previousYear,
    TResult? Function()? nextYear,
    TResult? Function(BudgetType budgetType)? showAll,
    TResult? Function(List<CategoryCashFlow> items)? changeItems,
  }) {
    return previousYear?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CategoryType type)? fetch,
    TResult Function()? previousYear,
    TResult Function()? nextYear,
    TResult Function(BudgetType budgetType)? showAll,
    TResult Function(List<CategoryCashFlow> items)? changeItems,
    required TResult orElse(),
  }) {
    if (previousYear != null) {
      return previousYear();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchBudgetEvent value) fetch,
    required TResult Function(_PreviousYearBudgetEvent value) previousYear,
    required TResult Function(_NextYearBudgetEvent value) nextYear,
    required TResult Function(_ShowAllBudgetEvent value) showAll,
    required TResult Function(_ChangeItemsBudgetEvent value) changeItems,
  }) {
    return previousYear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchBudgetEvent value)? fetch,
    TResult? Function(_PreviousYearBudgetEvent value)? previousYear,
    TResult? Function(_NextYearBudgetEvent value)? nextYear,
    TResult? Function(_ShowAllBudgetEvent value)? showAll,
    TResult? Function(_ChangeItemsBudgetEvent value)? changeItems,
  }) {
    return previousYear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchBudgetEvent value)? fetch,
    TResult Function(_PreviousYearBudgetEvent value)? previousYear,
    TResult Function(_NextYearBudgetEvent value)? nextYear,
    TResult Function(_ShowAllBudgetEvent value)? showAll,
    TResult Function(_ChangeItemsBudgetEvent value)? changeItems,
    required TResult orElse(),
  }) {
    if (previousYear != null) {
      return previousYear(this);
    }
    return orElse();
  }
}

abstract class _PreviousYearBudgetEvent implements BudgetEvent {
  const factory _PreviousYearBudgetEvent() = _$PreviousYearBudgetEventImpl;
}

/// @nodoc
abstract class _$$NextYearBudgetEventImplCopyWith<$Res> {
  factory _$$NextYearBudgetEventImplCopyWith(_$NextYearBudgetEventImpl value,
          $Res Function(_$NextYearBudgetEventImpl) then) =
      __$$NextYearBudgetEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NextYearBudgetEventImplCopyWithImpl<$Res>
    extends _$BudgetEventCopyWithImpl<$Res, _$NextYearBudgetEventImpl>
    implements _$$NextYearBudgetEventImplCopyWith<$Res> {
  __$$NextYearBudgetEventImplCopyWithImpl(_$NextYearBudgetEventImpl _value,
      $Res Function(_$NextYearBudgetEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of BudgetEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NextYearBudgetEventImpl implements _NextYearBudgetEvent {
  const _$NextYearBudgetEventImpl();

  @override
  String toString() {
    return 'BudgetEvent.nextYear()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NextYearBudgetEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CategoryType type) fetch,
    required TResult Function() previousYear,
    required TResult Function() nextYear,
    required TResult Function(BudgetType budgetType) showAll,
    required TResult Function(List<CategoryCashFlow> items) changeItems,
  }) {
    return nextYear();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CategoryType type)? fetch,
    TResult? Function()? previousYear,
    TResult? Function()? nextYear,
    TResult? Function(BudgetType budgetType)? showAll,
    TResult? Function(List<CategoryCashFlow> items)? changeItems,
  }) {
    return nextYear?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CategoryType type)? fetch,
    TResult Function()? previousYear,
    TResult Function()? nextYear,
    TResult Function(BudgetType budgetType)? showAll,
    TResult Function(List<CategoryCashFlow> items)? changeItems,
    required TResult orElse(),
  }) {
    if (nextYear != null) {
      return nextYear();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchBudgetEvent value) fetch,
    required TResult Function(_PreviousYearBudgetEvent value) previousYear,
    required TResult Function(_NextYearBudgetEvent value) nextYear,
    required TResult Function(_ShowAllBudgetEvent value) showAll,
    required TResult Function(_ChangeItemsBudgetEvent value) changeItems,
  }) {
    return nextYear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchBudgetEvent value)? fetch,
    TResult? Function(_PreviousYearBudgetEvent value)? previousYear,
    TResult? Function(_NextYearBudgetEvent value)? nextYear,
    TResult? Function(_ShowAllBudgetEvent value)? showAll,
    TResult? Function(_ChangeItemsBudgetEvent value)? changeItems,
  }) {
    return nextYear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchBudgetEvent value)? fetch,
    TResult Function(_PreviousYearBudgetEvent value)? previousYear,
    TResult Function(_NextYearBudgetEvent value)? nextYear,
    TResult Function(_ShowAllBudgetEvent value)? showAll,
    TResult Function(_ChangeItemsBudgetEvent value)? changeItems,
    required TResult orElse(),
  }) {
    if (nextYear != null) {
      return nextYear(this);
    }
    return orElse();
  }
}

abstract class _NextYearBudgetEvent implements BudgetEvent {
  const factory _NextYearBudgetEvent() = _$NextYearBudgetEventImpl;
}

/// @nodoc
abstract class _$$ShowAllBudgetEventImplCopyWith<$Res> {
  factory _$$ShowAllBudgetEventImplCopyWith(_$ShowAllBudgetEventImpl value,
          $Res Function(_$ShowAllBudgetEventImpl) then) =
      __$$ShowAllBudgetEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BudgetType budgetType});
}

/// @nodoc
class __$$ShowAllBudgetEventImplCopyWithImpl<$Res>
    extends _$BudgetEventCopyWithImpl<$Res, _$ShowAllBudgetEventImpl>
    implements _$$ShowAllBudgetEventImplCopyWith<$Res> {
  __$$ShowAllBudgetEventImplCopyWithImpl(_$ShowAllBudgetEventImpl _value,
      $Res Function(_$ShowAllBudgetEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of BudgetEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? budgetType = null,
  }) {
    return _then(_$ShowAllBudgetEventImpl(
      budgetType: null == budgetType
          ? _value.budgetType
          : budgetType // ignore: cast_nullable_to_non_nullable
              as BudgetType,
    ));
  }
}

/// @nodoc

class _$ShowAllBudgetEventImpl implements _ShowAllBudgetEvent {
  const _$ShowAllBudgetEventImpl({required this.budgetType});

  @override
  final BudgetType budgetType;

  @override
  String toString() {
    return 'BudgetEvent.showAll(budgetType: $budgetType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowAllBudgetEventImpl &&
            (identical(other.budgetType, budgetType) ||
                other.budgetType == budgetType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, budgetType);

  /// Create a copy of BudgetEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowAllBudgetEventImplCopyWith<_$ShowAllBudgetEventImpl> get copyWith =>
      __$$ShowAllBudgetEventImplCopyWithImpl<_$ShowAllBudgetEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CategoryType type) fetch,
    required TResult Function() previousYear,
    required TResult Function() nextYear,
    required TResult Function(BudgetType budgetType) showAll,
    required TResult Function(List<CategoryCashFlow> items) changeItems,
  }) {
    return showAll(budgetType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CategoryType type)? fetch,
    TResult? Function()? previousYear,
    TResult? Function()? nextYear,
    TResult? Function(BudgetType budgetType)? showAll,
    TResult? Function(List<CategoryCashFlow> items)? changeItems,
  }) {
    return showAll?.call(budgetType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CategoryType type)? fetch,
    TResult Function()? previousYear,
    TResult Function()? nextYear,
    TResult Function(BudgetType budgetType)? showAll,
    TResult Function(List<CategoryCashFlow> items)? changeItems,
    required TResult orElse(),
  }) {
    if (showAll != null) {
      return showAll(budgetType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchBudgetEvent value) fetch,
    required TResult Function(_PreviousYearBudgetEvent value) previousYear,
    required TResult Function(_NextYearBudgetEvent value) nextYear,
    required TResult Function(_ShowAllBudgetEvent value) showAll,
    required TResult Function(_ChangeItemsBudgetEvent value) changeItems,
  }) {
    return showAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchBudgetEvent value)? fetch,
    TResult? Function(_PreviousYearBudgetEvent value)? previousYear,
    TResult? Function(_NextYearBudgetEvent value)? nextYear,
    TResult? Function(_ShowAllBudgetEvent value)? showAll,
    TResult? Function(_ChangeItemsBudgetEvent value)? changeItems,
  }) {
    return showAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchBudgetEvent value)? fetch,
    TResult Function(_PreviousYearBudgetEvent value)? previousYear,
    TResult Function(_NextYearBudgetEvent value)? nextYear,
    TResult Function(_ShowAllBudgetEvent value)? showAll,
    TResult Function(_ChangeItemsBudgetEvent value)? changeItems,
    required TResult orElse(),
  }) {
    if (showAll != null) {
      return showAll(this);
    }
    return orElse();
  }
}

abstract class _ShowAllBudgetEvent implements BudgetEvent {
  const factory _ShowAllBudgetEvent({required final BudgetType budgetType}) =
      _$ShowAllBudgetEventImpl;

  BudgetType get budgetType;

  /// Create a copy of BudgetEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShowAllBudgetEventImplCopyWith<_$ShowAllBudgetEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeItemsBudgetEventImplCopyWith<$Res> {
  factory _$$ChangeItemsBudgetEventImplCopyWith(
          _$ChangeItemsBudgetEventImpl value,
          $Res Function(_$ChangeItemsBudgetEventImpl) then) =
      __$$ChangeItemsBudgetEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CategoryCashFlow> items});
}

/// @nodoc
class __$$ChangeItemsBudgetEventImplCopyWithImpl<$Res>
    extends _$BudgetEventCopyWithImpl<$Res, _$ChangeItemsBudgetEventImpl>
    implements _$$ChangeItemsBudgetEventImplCopyWith<$Res> {
  __$$ChangeItemsBudgetEventImplCopyWithImpl(
      _$ChangeItemsBudgetEventImpl _value,
      $Res Function(_$ChangeItemsBudgetEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of BudgetEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$ChangeItemsBudgetEventImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CategoryCashFlow>,
    ));
  }
}

/// @nodoc

class _$ChangeItemsBudgetEventImpl implements _ChangeItemsBudgetEvent {
  const _$ChangeItemsBudgetEventImpl(
      {required final List<CategoryCashFlow> items})
      : _items = items;

  final List<CategoryCashFlow> _items;
  @override
  List<CategoryCashFlow> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'BudgetEvent.changeItems(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeItemsBudgetEventImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  /// Create a copy of BudgetEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeItemsBudgetEventImplCopyWith<_$ChangeItemsBudgetEventImpl>
      get copyWith => __$$ChangeItemsBudgetEventImplCopyWithImpl<
          _$ChangeItemsBudgetEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CategoryType type) fetch,
    required TResult Function() previousYear,
    required TResult Function() nextYear,
    required TResult Function(BudgetType budgetType) showAll,
    required TResult Function(List<CategoryCashFlow> items) changeItems,
  }) {
    return changeItems(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CategoryType type)? fetch,
    TResult? Function()? previousYear,
    TResult? Function()? nextYear,
    TResult? Function(BudgetType budgetType)? showAll,
    TResult? Function(List<CategoryCashFlow> items)? changeItems,
  }) {
    return changeItems?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CategoryType type)? fetch,
    TResult Function()? previousYear,
    TResult Function()? nextYear,
    TResult Function(BudgetType budgetType)? showAll,
    TResult Function(List<CategoryCashFlow> items)? changeItems,
    required TResult orElse(),
  }) {
    if (changeItems != null) {
      return changeItems(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchBudgetEvent value) fetch,
    required TResult Function(_PreviousYearBudgetEvent value) previousYear,
    required TResult Function(_NextYearBudgetEvent value) nextYear,
    required TResult Function(_ShowAllBudgetEvent value) showAll,
    required TResult Function(_ChangeItemsBudgetEvent value) changeItems,
  }) {
    return changeItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchBudgetEvent value)? fetch,
    TResult? Function(_PreviousYearBudgetEvent value)? previousYear,
    TResult? Function(_NextYearBudgetEvent value)? nextYear,
    TResult? Function(_ShowAllBudgetEvent value)? showAll,
    TResult? Function(_ChangeItemsBudgetEvent value)? changeItems,
  }) {
    return changeItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchBudgetEvent value)? fetch,
    TResult Function(_PreviousYearBudgetEvent value)? previousYear,
    TResult Function(_NextYearBudgetEvent value)? nextYear,
    TResult Function(_ShowAllBudgetEvent value)? showAll,
    TResult Function(_ChangeItemsBudgetEvent value)? changeItems,
    required TResult orElse(),
  }) {
    if (changeItems != null) {
      return changeItems(this);
    }
    return orElse();
  }
}

abstract class _ChangeItemsBudgetEvent implements BudgetEvent {
  const factory _ChangeItemsBudgetEvent(
          {required final List<CategoryCashFlow> items}) =
      _$ChangeItemsBudgetEventImpl;

  List<CategoryCashFlow> get items;

  /// Create a copy of BudgetEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeItemsBudgetEventImplCopyWith<_$ChangeItemsBudgetEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BudgetState {
  DateTime get date => throw _privateConstructorUsedError;
  CategoryType get type => throw _privateConstructorUsedError;
  List<CategoryCashFlow> get itemsMonthBudget =>
      throw _privateConstructorUsedError;
  List<CategoryCashFlow> get itemsYearBudget =>
      throw _privateConstructorUsedError;
  List<CategoryCashFlow> get itemsAll => throw _privateConstructorUsedError;
  bool get showAllMonthBudget => throw _privateConstructorUsedError;
  bool get showAllYearBudget => throw _privateConstructorUsedError;

  /// Create a copy of BudgetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BudgetStateCopyWith<BudgetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetStateCopyWith<$Res> {
  factory $BudgetStateCopyWith(
          BudgetState value, $Res Function(BudgetState) then) =
      _$BudgetStateCopyWithImpl<$Res, BudgetState>;
  @useResult
  $Res call(
      {DateTime date,
      CategoryType type,
      List<CategoryCashFlow> itemsMonthBudget,
      List<CategoryCashFlow> itemsYearBudget,
      List<CategoryCashFlow> itemsAll,
      bool showAllMonthBudget,
      bool showAllYearBudget});
}

/// @nodoc
class _$BudgetStateCopyWithImpl<$Res, $Val extends BudgetState>
    implements $BudgetStateCopyWith<$Res> {
  _$BudgetStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BudgetState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? type = null,
    Object? itemsMonthBudget = null,
    Object? itemsYearBudget = null,
    Object? itemsAll = null,
    Object? showAllMonthBudget = null,
    Object? showAllYearBudget = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CategoryType,
      itemsMonthBudget: null == itemsMonthBudget
          ? _value.itemsMonthBudget
          : itemsMonthBudget // ignore: cast_nullable_to_non_nullable
              as List<CategoryCashFlow>,
      itemsYearBudget: null == itemsYearBudget
          ? _value.itemsYearBudget
          : itemsYearBudget // ignore: cast_nullable_to_non_nullable
              as List<CategoryCashFlow>,
      itemsAll: null == itemsAll
          ? _value.itemsAll
          : itemsAll // ignore: cast_nullable_to_non_nullable
              as List<CategoryCashFlow>,
      showAllMonthBudget: null == showAllMonthBudget
          ? _value.showAllMonthBudget
          : showAllMonthBudget // ignore: cast_nullable_to_non_nullable
              as bool,
      showAllYearBudget: null == showAllYearBudget
          ? _value.showAllYearBudget
          : showAllYearBudget // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BudgetStateImplCopyWith<$Res>
    implements $BudgetStateCopyWith<$Res> {
  factory _$$BudgetStateImplCopyWith(
          _$BudgetStateImpl value, $Res Function(_$BudgetStateImpl) then) =
      __$$BudgetStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime date,
      CategoryType type,
      List<CategoryCashFlow> itemsMonthBudget,
      List<CategoryCashFlow> itemsYearBudget,
      List<CategoryCashFlow> itemsAll,
      bool showAllMonthBudget,
      bool showAllYearBudget});
}

/// @nodoc
class __$$BudgetStateImplCopyWithImpl<$Res>
    extends _$BudgetStateCopyWithImpl<$Res, _$BudgetStateImpl>
    implements _$$BudgetStateImplCopyWith<$Res> {
  __$$BudgetStateImplCopyWithImpl(
      _$BudgetStateImpl _value, $Res Function(_$BudgetStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BudgetState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? type = null,
    Object? itemsMonthBudget = null,
    Object? itemsYearBudget = null,
    Object? itemsAll = null,
    Object? showAllMonthBudget = null,
    Object? showAllYearBudget = null,
  }) {
    return _then(_$BudgetStateImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CategoryType,
      itemsMonthBudget: null == itemsMonthBudget
          ? _value._itemsMonthBudget
          : itemsMonthBudget // ignore: cast_nullable_to_non_nullable
              as List<CategoryCashFlow>,
      itemsYearBudget: null == itemsYearBudget
          ? _value._itemsYearBudget
          : itemsYearBudget // ignore: cast_nullable_to_non_nullable
              as List<CategoryCashFlow>,
      itemsAll: null == itemsAll
          ? _value._itemsAll
          : itemsAll // ignore: cast_nullable_to_non_nullable
              as List<CategoryCashFlow>,
      showAllMonthBudget: null == showAllMonthBudget
          ? _value.showAllMonthBudget
          : showAllMonthBudget // ignore: cast_nullable_to_non_nullable
              as bool,
      showAllYearBudget: null == showAllYearBudget
          ? _value.showAllYearBudget
          : showAllYearBudget // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BudgetStateImpl implements _BudgetState {
  const _$BudgetStateImpl(
      {required this.date,
      required this.type,
      required final List<CategoryCashFlow> itemsMonthBudget,
      required final List<CategoryCashFlow> itemsYearBudget,
      required final List<CategoryCashFlow> itemsAll,
      required this.showAllMonthBudget,
      required this.showAllYearBudget})
      : _itemsMonthBudget = itemsMonthBudget,
        _itemsYearBudget = itemsYearBudget,
        _itemsAll = itemsAll;

  @override
  final DateTime date;
  @override
  final CategoryType type;
  final List<CategoryCashFlow> _itemsMonthBudget;
  @override
  List<CategoryCashFlow> get itemsMonthBudget {
    if (_itemsMonthBudget is EqualUnmodifiableListView)
      return _itemsMonthBudget;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_itemsMonthBudget);
  }

  final List<CategoryCashFlow> _itemsYearBudget;
  @override
  List<CategoryCashFlow> get itemsYearBudget {
    if (_itemsYearBudget is EqualUnmodifiableListView) return _itemsYearBudget;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_itemsYearBudget);
  }

  final List<CategoryCashFlow> _itemsAll;
  @override
  List<CategoryCashFlow> get itemsAll {
    if (_itemsAll is EqualUnmodifiableListView) return _itemsAll;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_itemsAll);
  }

  @override
  final bool showAllMonthBudget;
  @override
  final bool showAllYearBudget;

  @override
  String toString() {
    return 'BudgetState(date: $date, type: $type, itemsMonthBudget: $itemsMonthBudget, itemsYearBudget: $itemsYearBudget, itemsAll: $itemsAll, showAllMonthBudget: $showAllMonthBudget, showAllYearBudget: $showAllYearBudget)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetStateImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._itemsMonthBudget, _itemsMonthBudget) &&
            const DeepCollectionEquality()
                .equals(other._itemsYearBudget, _itemsYearBudget) &&
            const DeepCollectionEquality().equals(other._itemsAll, _itemsAll) &&
            (identical(other.showAllMonthBudget, showAllMonthBudget) ||
                other.showAllMonthBudget == showAllMonthBudget) &&
            (identical(other.showAllYearBudget, showAllYearBudget) ||
                other.showAllYearBudget == showAllYearBudget));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      date,
      type,
      const DeepCollectionEquality().hash(_itemsMonthBudget),
      const DeepCollectionEquality().hash(_itemsYearBudget),
      const DeepCollectionEquality().hash(_itemsAll),
      showAllMonthBudget,
      showAllYearBudget);

  /// Create a copy of BudgetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetStateImplCopyWith<_$BudgetStateImpl> get copyWith =>
      __$$BudgetStateImplCopyWithImpl<_$BudgetStateImpl>(this, _$identity);
}

abstract class _BudgetState implements BudgetState {
  const factory _BudgetState(
      {required final DateTime date,
      required final CategoryType type,
      required final List<CategoryCashFlow> itemsMonthBudget,
      required final List<CategoryCashFlow> itemsYearBudget,
      required final List<CategoryCashFlow> itemsAll,
      required final bool showAllMonthBudget,
      required final bool showAllYearBudget}) = _$BudgetStateImpl;

  @override
  DateTime get date;
  @override
  CategoryType get type;
  @override
  List<CategoryCashFlow> get itemsMonthBudget;
  @override
  List<CategoryCashFlow> get itemsYearBudget;
  @override
  List<CategoryCashFlow> get itemsAll;
  @override
  bool get showAllMonthBudget;
  @override
  bool get showAllYearBudget;

  /// Create a copy of BudgetState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BudgetStateImplCopyWith<_$BudgetStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
