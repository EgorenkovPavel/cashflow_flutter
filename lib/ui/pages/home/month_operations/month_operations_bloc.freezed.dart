// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'month_operations_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MonthOperationsEvent {
  OperationType get operationType => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OperationType operationType) fetch,
    required TResult Function(
            OperationType operationType, List<CategoryCashflow> categories)
        changeCategories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OperationType operationType)? fetch,
    TResult? Function(
            OperationType operationType, List<CategoryCashflow> categories)?
        changeCategories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OperationType operationType)? fetch,
    TResult Function(
            OperationType operationType, List<CategoryCashflow> categories)?
        changeCategories,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchMonthOperationsEvent value) fetch,
    required TResult Function(_ChangeCategoriesMonthOperationsEvent value)
        changeCategories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchMonthOperationsEvent value)? fetch,
    TResult? Function(_ChangeCategoriesMonthOperationsEvent value)?
        changeCategories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchMonthOperationsEvent value)? fetch,
    TResult Function(_ChangeCategoriesMonthOperationsEvent value)?
        changeCategories,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MonthOperationsEventCopyWith<MonthOperationsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthOperationsEventCopyWith<$Res> {
  factory $MonthOperationsEventCopyWith(MonthOperationsEvent value,
          $Res Function(MonthOperationsEvent) then) =
      _$MonthOperationsEventCopyWithImpl<$Res, MonthOperationsEvent>;
  @useResult
  $Res call({OperationType operationType});
}

/// @nodoc
class _$MonthOperationsEventCopyWithImpl<$Res,
        $Val extends MonthOperationsEvent>
    implements $MonthOperationsEventCopyWith<$Res> {
  _$MonthOperationsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operationType = null,
  }) {
    return _then(_value.copyWith(
      operationType: null == operationType
          ? _value.operationType
          : operationType // ignore: cast_nullable_to_non_nullable
              as OperationType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FetchMonthOperationsEventCopyWith<$Res>
    implements $MonthOperationsEventCopyWith<$Res> {
  factory _$$_FetchMonthOperationsEventCopyWith(
          _$_FetchMonthOperationsEvent value,
          $Res Function(_$_FetchMonthOperationsEvent) then) =
      __$$_FetchMonthOperationsEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OperationType operationType});
}

/// @nodoc
class __$$_FetchMonthOperationsEventCopyWithImpl<$Res>
    extends _$MonthOperationsEventCopyWithImpl<$Res,
        _$_FetchMonthOperationsEvent>
    implements _$$_FetchMonthOperationsEventCopyWith<$Res> {
  __$$_FetchMonthOperationsEventCopyWithImpl(
      _$_FetchMonthOperationsEvent _value,
      $Res Function(_$_FetchMonthOperationsEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operationType = null,
  }) {
    return _then(_$_FetchMonthOperationsEvent(
      operationType: null == operationType
          ? _value.operationType
          : operationType // ignore: cast_nullable_to_non_nullable
              as OperationType,
    ));
  }
}

/// @nodoc

class _$_FetchMonthOperationsEvent implements _FetchMonthOperationsEvent {
  const _$_FetchMonthOperationsEvent({required this.operationType});

  @override
  final OperationType operationType;

  @override
  String toString() {
    return 'MonthOperationsEvent.fetch(operationType: $operationType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchMonthOperationsEvent &&
            (identical(other.operationType, operationType) ||
                other.operationType == operationType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, operationType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchMonthOperationsEventCopyWith<_$_FetchMonthOperationsEvent>
      get copyWith => __$$_FetchMonthOperationsEventCopyWithImpl<
          _$_FetchMonthOperationsEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OperationType operationType) fetch,
    required TResult Function(
            OperationType operationType, List<CategoryCashflow> categories)
        changeCategories,
  }) {
    return fetch(operationType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OperationType operationType)? fetch,
    TResult? Function(
            OperationType operationType, List<CategoryCashflow> categories)?
        changeCategories,
  }) {
    return fetch?.call(operationType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OperationType operationType)? fetch,
    TResult Function(
            OperationType operationType, List<CategoryCashflow> categories)?
        changeCategories,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(operationType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchMonthOperationsEvent value) fetch,
    required TResult Function(_ChangeCategoriesMonthOperationsEvent value)
        changeCategories,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchMonthOperationsEvent value)? fetch,
    TResult? Function(_ChangeCategoriesMonthOperationsEvent value)?
        changeCategories,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchMonthOperationsEvent value)? fetch,
    TResult Function(_ChangeCategoriesMonthOperationsEvent value)?
        changeCategories,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _FetchMonthOperationsEvent implements MonthOperationsEvent {
  const factory _FetchMonthOperationsEvent(
          {required final OperationType operationType}) =
      _$_FetchMonthOperationsEvent;

  @override
  OperationType get operationType;
  @override
  @JsonKey(ignore: true)
  _$$_FetchMonthOperationsEventCopyWith<_$_FetchMonthOperationsEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeCategoriesMonthOperationsEventCopyWith<$Res>
    implements $MonthOperationsEventCopyWith<$Res> {
  factory _$$_ChangeCategoriesMonthOperationsEventCopyWith(
          _$_ChangeCategoriesMonthOperationsEvent value,
          $Res Function(_$_ChangeCategoriesMonthOperationsEvent) then) =
      __$$_ChangeCategoriesMonthOperationsEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OperationType operationType, List<CategoryCashflow> categories});
}

/// @nodoc
class __$$_ChangeCategoriesMonthOperationsEventCopyWithImpl<$Res>
    extends _$MonthOperationsEventCopyWithImpl<$Res,
        _$_ChangeCategoriesMonthOperationsEvent>
    implements _$$_ChangeCategoriesMonthOperationsEventCopyWith<$Res> {
  __$$_ChangeCategoriesMonthOperationsEventCopyWithImpl(
      _$_ChangeCategoriesMonthOperationsEvent _value,
      $Res Function(_$_ChangeCategoriesMonthOperationsEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operationType = null,
    Object? categories = null,
  }) {
    return _then(_$_ChangeCategoriesMonthOperationsEvent(
      operationType: null == operationType
          ? _value.operationType
          : operationType // ignore: cast_nullable_to_non_nullable
              as OperationType,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryCashflow>,
    ));
  }
}

/// @nodoc

class _$_ChangeCategoriesMonthOperationsEvent
    implements _ChangeCategoriesMonthOperationsEvent {
  const _$_ChangeCategoriesMonthOperationsEvent(
      {required this.operationType,
      required final List<CategoryCashflow> categories})
      : _categories = categories;

  @override
  final OperationType operationType;
  final List<CategoryCashflow> _categories;
  @override
  List<CategoryCashflow> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'MonthOperationsEvent.changeCategories(operationType: $operationType, categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeCategoriesMonthOperationsEvent &&
            (identical(other.operationType, operationType) ||
                other.operationType == operationType) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(runtimeType, operationType,
      const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeCategoriesMonthOperationsEventCopyWith<
          _$_ChangeCategoriesMonthOperationsEvent>
      get copyWith => __$$_ChangeCategoriesMonthOperationsEventCopyWithImpl<
          _$_ChangeCategoriesMonthOperationsEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OperationType operationType) fetch,
    required TResult Function(
            OperationType operationType, List<CategoryCashflow> categories)
        changeCategories,
  }) {
    return changeCategories(operationType, categories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OperationType operationType)? fetch,
    TResult? Function(
            OperationType operationType, List<CategoryCashflow> categories)?
        changeCategories,
  }) {
    return changeCategories?.call(operationType, categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OperationType operationType)? fetch,
    TResult Function(
            OperationType operationType, List<CategoryCashflow> categories)?
        changeCategories,
    required TResult orElse(),
  }) {
    if (changeCategories != null) {
      return changeCategories(operationType, categories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchMonthOperationsEvent value) fetch,
    required TResult Function(_ChangeCategoriesMonthOperationsEvent value)
        changeCategories,
  }) {
    return changeCategories(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchMonthOperationsEvent value)? fetch,
    TResult? Function(_ChangeCategoriesMonthOperationsEvent value)?
        changeCategories,
  }) {
    return changeCategories?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchMonthOperationsEvent value)? fetch,
    TResult Function(_ChangeCategoriesMonthOperationsEvent value)?
        changeCategories,
    required TResult orElse(),
  }) {
    if (changeCategories != null) {
      return changeCategories(this);
    }
    return orElse();
  }
}

abstract class _ChangeCategoriesMonthOperationsEvent
    implements MonthOperationsEvent {
  const factory _ChangeCategoriesMonthOperationsEvent(
          {required final OperationType operationType,
          required final List<CategoryCashflow> categories}) =
      _$_ChangeCategoriesMonthOperationsEvent;

  @override
  OperationType get operationType;
  List<CategoryCashflow> get categories;
  @override
  @JsonKey(ignore: true)
  _$$_ChangeCategoriesMonthOperationsEventCopyWith<
          _$_ChangeCategoriesMonthOperationsEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MonthOperationsState {
  Map<OperationType, int> get cashflow => throw _privateConstructorUsedError;
  Map<OperationType, int> get budget => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MonthOperationsStateCopyWith<MonthOperationsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthOperationsStateCopyWith<$Res> {
  factory $MonthOperationsStateCopyWith(MonthOperationsState value,
          $Res Function(MonthOperationsState) then) =
      _$MonthOperationsStateCopyWithImpl<$Res, MonthOperationsState>;
  @useResult
  $Res call({Map<OperationType, int> cashflow, Map<OperationType, int> budget});
}

/// @nodoc
class _$MonthOperationsStateCopyWithImpl<$Res,
        $Val extends MonthOperationsState>
    implements $MonthOperationsStateCopyWith<$Res> {
  _$MonthOperationsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cashflow = null,
    Object? budget = null,
  }) {
    return _then(_value.copyWith(
      cashflow: null == cashflow
          ? _value.cashflow
          : cashflow // ignore: cast_nullable_to_non_nullable
              as Map<OperationType, int>,
      budget: null == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as Map<OperationType, int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MonthOperationsStateCopyWith<$Res>
    implements $MonthOperationsStateCopyWith<$Res> {
  factory _$$_MonthOperationsStateCopyWith(_$_MonthOperationsState value,
          $Res Function(_$_MonthOperationsState) then) =
      __$$_MonthOperationsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<OperationType, int> cashflow, Map<OperationType, int> budget});
}

/// @nodoc
class __$$_MonthOperationsStateCopyWithImpl<$Res>
    extends _$MonthOperationsStateCopyWithImpl<$Res, _$_MonthOperationsState>
    implements _$$_MonthOperationsStateCopyWith<$Res> {
  __$$_MonthOperationsStateCopyWithImpl(_$_MonthOperationsState _value,
      $Res Function(_$_MonthOperationsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cashflow = null,
    Object? budget = null,
  }) {
    return _then(_$_MonthOperationsState(
      cashflow: null == cashflow
          ? _value._cashflow
          : cashflow // ignore: cast_nullable_to_non_nullable
              as Map<OperationType, int>,
      budget: null == budget
          ? _value._budget
          : budget // ignore: cast_nullable_to_non_nullable
              as Map<OperationType, int>,
    ));
  }
}

/// @nodoc

class _$_MonthOperationsState implements _MonthOperationsState {
  const _$_MonthOperationsState(
      {required final Map<OperationType, int> cashflow,
      required final Map<OperationType, int> budget})
      : _cashflow = cashflow,
        _budget = budget;

  final Map<OperationType, int> _cashflow;
  @override
  Map<OperationType, int> get cashflow {
    if (_cashflow is EqualUnmodifiableMapView) return _cashflow;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_cashflow);
  }

  final Map<OperationType, int> _budget;
  @override
  Map<OperationType, int> get budget {
    if (_budget is EqualUnmodifiableMapView) return _budget;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_budget);
  }

  @override
  String toString() {
    return 'MonthOperationsState(cashflow: $cashflow, budget: $budget)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MonthOperationsState &&
            const DeepCollectionEquality().equals(other._cashflow, _cashflow) &&
            const DeepCollectionEquality().equals(other._budget, _budget));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cashflow),
      const DeepCollectionEquality().hash(_budget));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MonthOperationsStateCopyWith<_$_MonthOperationsState> get copyWith =>
      __$$_MonthOperationsStateCopyWithImpl<_$_MonthOperationsState>(
          this, _$identity);
}

abstract class _MonthOperationsState implements MonthOperationsState {
  const factory _MonthOperationsState(
      {required final Map<OperationType, int> cashflow,
      required final Map<OperationType, int> budget}) = _$_MonthOperationsState;

  @override
  Map<OperationType, int> get cashflow;
  @override
  Map<OperationType, int> get budget;
  @override
  @JsonKey(ignore: true)
  _$$_MonthOperationsStateCopyWith<_$_MonthOperationsState> get copyWith =>
      throw _privateConstructorUsedError;
}
