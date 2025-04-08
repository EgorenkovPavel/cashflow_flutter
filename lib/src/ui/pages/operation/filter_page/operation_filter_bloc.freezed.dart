// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'operation_filter_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OperationFilterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OperationListFilter filter) init,
    required TResult Function() resetPeriod,
    required TResult Function(DateTimeRange period) setPeriod,
    required TResult Function(AccountView account) addAccount,
    required TResult Function(AccountView account) removeAccount,
    required TResult Function(CategoryView category) addCategory,
    required TResult Function(CategoryView category) removeCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OperationListFilter filter)? init,
    TResult? Function()? resetPeriod,
    TResult? Function(DateTimeRange period)? setPeriod,
    TResult? Function(AccountView account)? addAccount,
    TResult? Function(AccountView account)? removeAccount,
    TResult? Function(CategoryView category)? addCategory,
    TResult? Function(CategoryView category)? removeCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OperationListFilter filter)? init,
    TResult Function()? resetPeriod,
    TResult Function(DateTimeRange period)? setPeriod,
    TResult Function(AccountView account)? addAccount,
    TResult Function(AccountView account)? removeAccount,
    TResult Function(CategoryView category)? addCategory,
    TResult Function(CategoryView category)? removeCategory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitPeriodOperationFilterEvent value) init,
    required TResult Function(_ResetPeriodOperationFilterEvent value)
        resetPeriod,
    required TResult Function(_SetPeriodOperationFilterEvent value) setPeriod,
    required TResult Function(_AddAccountOperationFilterEvent value) addAccount,
    required TResult Function(_RemoveAccountOperationFilterEvent value)
        removeAccount,
    required TResult Function(_AddCategoryOperationFilterEvent value)
        addCategory,
    required TResult Function(_RemoveCategoryOperationFilterEvent value)
        removeCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitPeriodOperationFilterEvent value)? init,
    TResult? Function(_ResetPeriodOperationFilterEvent value)? resetPeriod,
    TResult? Function(_SetPeriodOperationFilterEvent value)? setPeriod,
    TResult? Function(_AddAccountOperationFilterEvent value)? addAccount,
    TResult? Function(_RemoveAccountOperationFilterEvent value)? removeAccount,
    TResult? Function(_AddCategoryOperationFilterEvent value)? addCategory,
    TResult? Function(_RemoveCategoryOperationFilterEvent value)?
        removeCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitPeriodOperationFilterEvent value)? init,
    TResult Function(_ResetPeriodOperationFilterEvent value)? resetPeriod,
    TResult Function(_SetPeriodOperationFilterEvent value)? setPeriod,
    TResult Function(_AddAccountOperationFilterEvent value)? addAccount,
    TResult Function(_RemoveAccountOperationFilterEvent value)? removeAccount,
    TResult Function(_AddCategoryOperationFilterEvent value)? addCategory,
    TResult Function(_RemoveCategoryOperationFilterEvent value)? removeCategory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OperationFilterEventCopyWith<$Res> {
  factory $OperationFilterEventCopyWith(OperationFilterEvent value,
          $Res Function(OperationFilterEvent) then) =
      _$OperationFilterEventCopyWithImpl<$Res, OperationFilterEvent>;
}

/// @nodoc
class _$OperationFilterEventCopyWithImpl<$Res,
        $Val extends OperationFilterEvent>
    implements $OperationFilterEventCopyWith<$Res> {
  _$OperationFilterEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OperationFilterEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitPeriodOperationFilterEventImplCopyWith<$Res> {
  factory _$$InitPeriodOperationFilterEventImplCopyWith(
          _$InitPeriodOperationFilterEventImpl value,
          $Res Function(_$InitPeriodOperationFilterEventImpl) then) =
      __$$InitPeriodOperationFilterEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({OperationListFilter filter});
}

/// @nodoc
class __$$InitPeriodOperationFilterEventImplCopyWithImpl<$Res>
    extends _$OperationFilterEventCopyWithImpl<$Res,
        _$InitPeriodOperationFilterEventImpl>
    implements _$$InitPeriodOperationFilterEventImplCopyWith<$Res> {
  __$$InitPeriodOperationFilterEventImplCopyWithImpl(
      _$InitPeriodOperationFilterEventImpl _value,
      $Res Function(_$InitPeriodOperationFilterEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of OperationFilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
  }) {
    return _then(_$InitPeriodOperationFilterEventImpl(
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as OperationListFilter,
    ));
  }
}

/// @nodoc

class _$InitPeriodOperationFilterEventImpl
    implements _InitPeriodOperationFilterEvent {
  const _$InitPeriodOperationFilterEventImpl({required this.filter});

  @override
  final OperationListFilter filter;

  @override
  String toString() {
    return 'OperationFilterEvent.init(filter: $filter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitPeriodOperationFilterEventImpl &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter);

  /// Create a copy of OperationFilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitPeriodOperationFilterEventImplCopyWith<
          _$InitPeriodOperationFilterEventImpl>
      get copyWith => __$$InitPeriodOperationFilterEventImplCopyWithImpl<
          _$InitPeriodOperationFilterEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OperationListFilter filter) init,
    required TResult Function() resetPeriod,
    required TResult Function(DateTimeRange period) setPeriod,
    required TResult Function(AccountView account) addAccount,
    required TResult Function(AccountView account) removeAccount,
    required TResult Function(CategoryView category) addCategory,
    required TResult Function(CategoryView category) removeCategory,
  }) {
    return init(filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OperationListFilter filter)? init,
    TResult? Function()? resetPeriod,
    TResult? Function(DateTimeRange period)? setPeriod,
    TResult? Function(AccountView account)? addAccount,
    TResult? Function(AccountView account)? removeAccount,
    TResult? Function(CategoryView category)? addCategory,
    TResult? Function(CategoryView category)? removeCategory,
  }) {
    return init?.call(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OperationListFilter filter)? init,
    TResult Function()? resetPeriod,
    TResult Function(DateTimeRange period)? setPeriod,
    TResult Function(AccountView account)? addAccount,
    TResult Function(AccountView account)? removeAccount,
    TResult Function(CategoryView category)? addCategory,
    TResult Function(CategoryView category)? removeCategory,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitPeriodOperationFilterEvent value) init,
    required TResult Function(_ResetPeriodOperationFilterEvent value)
        resetPeriod,
    required TResult Function(_SetPeriodOperationFilterEvent value) setPeriod,
    required TResult Function(_AddAccountOperationFilterEvent value) addAccount,
    required TResult Function(_RemoveAccountOperationFilterEvent value)
        removeAccount,
    required TResult Function(_AddCategoryOperationFilterEvent value)
        addCategory,
    required TResult Function(_RemoveCategoryOperationFilterEvent value)
        removeCategory,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitPeriodOperationFilterEvent value)? init,
    TResult? Function(_ResetPeriodOperationFilterEvent value)? resetPeriod,
    TResult? Function(_SetPeriodOperationFilterEvent value)? setPeriod,
    TResult? Function(_AddAccountOperationFilterEvent value)? addAccount,
    TResult? Function(_RemoveAccountOperationFilterEvent value)? removeAccount,
    TResult? Function(_AddCategoryOperationFilterEvent value)? addCategory,
    TResult? Function(_RemoveCategoryOperationFilterEvent value)?
        removeCategory,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitPeriodOperationFilterEvent value)? init,
    TResult Function(_ResetPeriodOperationFilterEvent value)? resetPeriod,
    TResult Function(_SetPeriodOperationFilterEvent value)? setPeriod,
    TResult Function(_AddAccountOperationFilterEvent value)? addAccount,
    TResult Function(_RemoveAccountOperationFilterEvent value)? removeAccount,
    TResult Function(_AddCategoryOperationFilterEvent value)? addCategory,
    TResult Function(_RemoveCategoryOperationFilterEvent value)? removeCategory,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _InitPeriodOperationFilterEvent implements OperationFilterEvent {
  const factory _InitPeriodOperationFilterEvent(
          {required final OperationListFilter filter}) =
      _$InitPeriodOperationFilterEventImpl;

  OperationListFilter get filter;

  /// Create a copy of OperationFilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitPeriodOperationFilterEventImplCopyWith<
          _$InitPeriodOperationFilterEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetPeriodOperationFilterEventImplCopyWith<$Res> {
  factory _$$ResetPeriodOperationFilterEventImplCopyWith(
          _$ResetPeriodOperationFilterEventImpl value,
          $Res Function(_$ResetPeriodOperationFilterEventImpl) then) =
      __$$ResetPeriodOperationFilterEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetPeriodOperationFilterEventImplCopyWithImpl<$Res>
    extends _$OperationFilterEventCopyWithImpl<$Res,
        _$ResetPeriodOperationFilterEventImpl>
    implements _$$ResetPeriodOperationFilterEventImplCopyWith<$Res> {
  __$$ResetPeriodOperationFilterEventImplCopyWithImpl(
      _$ResetPeriodOperationFilterEventImpl _value,
      $Res Function(_$ResetPeriodOperationFilterEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of OperationFilterEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResetPeriodOperationFilterEventImpl
    implements _ResetPeriodOperationFilterEvent {
  const _$ResetPeriodOperationFilterEventImpl();

  @override
  String toString() {
    return 'OperationFilterEvent.resetPeriod()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPeriodOperationFilterEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OperationListFilter filter) init,
    required TResult Function() resetPeriod,
    required TResult Function(DateTimeRange period) setPeriod,
    required TResult Function(AccountView account) addAccount,
    required TResult Function(AccountView account) removeAccount,
    required TResult Function(CategoryView category) addCategory,
    required TResult Function(CategoryView category) removeCategory,
  }) {
    return resetPeriod();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OperationListFilter filter)? init,
    TResult? Function()? resetPeriod,
    TResult? Function(DateTimeRange period)? setPeriod,
    TResult? Function(AccountView account)? addAccount,
    TResult? Function(AccountView account)? removeAccount,
    TResult? Function(CategoryView category)? addCategory,
    TResult? Function(CategoryView category)? removeCategory,
  }) {
    return resetPeriod?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OperationListFilter filter)? init,
    TResult Function()? resetPeriod,
    TResult Function(DateTimeRange period)? setPeriod,
    TResult Function(AccountView account)? addAccount,
    TResult Function(AccountView account)? removeAccount,
    TResult Function(CategoryView category)? addCategory,
    TResult Function(CategoryView category)? removeCategory,
    required TResult orElse(),
  }) {
    if (resetPeriod != null) {
      return resetPeriod();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitPeriodOperationFilterEvent value) init,
    required TResult Function(_ResetPeriodOperationFilterEvent value)
        resetPeriod,
    required TResult Function(_SetPeriodOperationFilterEvent value) setPeriod,
    required TResult Function(_AddAccountOperationFilterEvent value) addAccount,
    required TResult Function(_RemoveAccountOperationFilterEvent value)
        removeAccount,
    required TResult Function(_AddCategoryOperationFilterEvent value)
        addCategory,
    required TResult Function(_RemoveCategoryOperationFilterEvent value)
        removeCategory,
  }) {
    return resetPeriod(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitPeriodOperationFilterEvent value)? init,
    TResult? Function(_ResetPeriodOperationFilterEvent value)? resetPeriod,
    TResult? Function(_SetPeriodOperationFilterEvent value)? setPeriod,
    TResult? Function(_AddAccountOperationFilterEvent value)? addAccount,
    TResult? Function(_RemoveAccountOperationFilterEvent value)? removeAccount,
    TResult? Function(_AddCategoryOperationFilterEvent value)? addCategory,
    TResult? Function(_RemoveCategoryOperationFilterEvent value)?
        removeCategory,
  }) {
    return resetPeriod?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitPeriodOperationFilterEvent value)? init,
    TResult Function(_ResetPeriodOperationFilterEvent value)? resetPeriod,
    TResult Function(_SetPeriodOperationFilterEvent value)? setPeriod,
    TResult Function(_AddAccountOperationFilterEvent value)? addAccount,
    TResult Function(_RemoveAccountOperationFilterEvent value)? removeAccount,
    TResult Function(_AddCategoryOperationFilterEvent value)? addCategory,
    TResult Function(_RemoveCategoryOperationFilterEvent value)? removeCategory,
    required TResult orElse(),
  }) {
    if (resetPeriod != null) {
      return resetPeriod(this);
    }
    return orElse();
  }
}

abstract class _ResetPeriodOperationFilterEvent
    implements OperationFilterEvent {
  const factory _ResetPeriodOperationFilterEvent() =
      _$ResetPeriodOperationFilterEventImpl;
}

/// @nodoc
abstract class _$$SetPeriodOperationFilterEventImplCopyWith<$Res> {
  factory _$$SetPeriodOperationFilterEventImplCopyWith(
          _$SetPeriodOperationFilterEventImpl value,
          $Res Function(_$SetPeriodOperationFilterEventImpl) then) =
      __$$SetPeriodOperationFilterEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTimeRange period});
}

/// @nodoc
class __$$SetPeriodOperationFilterEventImplCopyWithImpl<$Res>
    extends _$OperationFilterEventCopyWithImpl<$Res,
        _$SetPeriodOperationFilterEventImpl>
    implements _$$SetPeriodOperationFilterEventImplCopyWith<$Res> {
  __$$SetPeriodOperationFilterEventImplCopyWithImpl(
      _$SetPeriodOperationFilterEventImpl _value,
      $Res Function(_$SetPeriodOperationFilterEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of OperationFilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = null,
  }) {
    return _then(_$SetPeriodOperationFilterEventImpl(
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as DateTimeRange,
    ));
  }
}

/// @nodoc

class _$SetPeriodOperationFilterEventImpl
    implements _SetPeriodOperationFilterEvent {
  const _$SetPeriodOperationFilterEventImpl({required this.period});

  @override
  final DateTimeRange period;

  @override
  String toString() {
    return 'OperationFilterEvent.setPeriod(period: $period)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetPeriodOperationFilterEventImpl &&
            (identical(other.period, period) || other.period == period));
  }

  @override
  int get hashCode => Object.hash(runtimeType, period);

  /// Create a copy of OperationFilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetPeriodOperationFilterEventImplCopyWith<
          _$SetPeriodOperationFilterEventImpl>
      get copyWith => __$$SetPeriodOperationFilterEventImplCopyWithImpl<
          _$SetPeriodOperationFilterEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OperationListFilter filter) init,
    required TResult Function() resetPeriod,
    required TResult Function(DateTimeRange period) setPeriod,
    required TResult Function(AccountView account) addAccount,
    required TResult Function(AccountView account) removeAccount,
    required TResult Function(CategoryView category) addCategory,
    required TResult Function(CategoryView category) removeCategory,
  }) {
    return setPeriod(period);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OperationListFilter filter)? init,
    TResult? Function()? resetPeriod,
    TResult? Function(DateTimeRange period)? setPeriod,
    TResult? Function(AccountView account)? addAccount,
    TResult? Function(AccountView account)? removeAccount,
    TResult? Function(CategoryView category)? addCategory,
    TResult? Function(CategoryView category)? removeCategory,
  }) {
    return setPeriod?.call(period);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OperationListFilter filter)? init,
    TResult Function()? resetPeriod,
    TResult Function(DateTimeRange period)? setPeriod,
    TResult Function(AccountView account)? addAccount,
    TResult Function(AccountView account)? removeAccount,
    TResult Function(CategoryView category)? addCategory,
    TResult Function(CategoryView category)? removeCategory,
    required TResult orElse(),
  }) {
    if (setPeriod != null) {
      return setPeriod(period);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitPeriodOperationFilterEvent value) init,
    required TResult Function(_ResetPeriodOperationFilterEvent value)
        resetPeriod,
    required TResult Function(_SetPeriodOperationFilterEvent value) setPeriod,
    required TResult Function(_AddAccountOperationFilterEvent value) addAccount,
    required TResult Function(_RemoveAccountOperationFilterEvent value)
        removeAccount,
    required TResult Function(_AddCategoryOperationFilterEvent value)
        addCategory,
    required TResult Function(_RemoveCategoryOperationFilterEvent value)
        removeCategory,
  }) {
    return setPeriod(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitPeriodOperationFilterEvent value)? init,
    TResult? Function(_ResetPeriodOperationFilterEvent value)? resetPeriod,
    TResult? Function(_SetPeriodOperationFilterEvent value)? setPeriod,
    TResult? Function(_AddAccountOperationFilterEvent value)? addAccount,
    TResult? Function(_RemoveAccountOperationFilterEvent value)? removeAccount,
    TResult? Function(_AddCategoryOperationFilterEvent value)? addCategory,
    TResult? Function(_RemoveCategoryOperationFilterEvent value)?
        removeCategory,
  }) {
    return setPeriod?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitPeriodOperationFilterEvent value)? init,
    TResult Function(_ResetPeriodOperationFilterEvent value)? resetPeriod,
    TResult Function(_SetPeriodOperationFilterEvent value)? setPeriod,
    TResult Function(_AddAccountOperationFilterEvent value)? addAccount,
    TResult Function(_RemoveAccountOperationFilterEvent value)? removeAccount,
    TResult Function(_AddCategoryOperationFilterEvent value)? addCategory,
    TResult Function(_RemoveCategoryOperationFilterEvent value)? removeCategory,
    required TResult orElse(),
  }) {
    if (setPeriod != null) {
      return setPeriod(this);
    }
    return orElse();
  }
}

abstract class _SetPeriodOperationFilterEvent implements OperationFilterEvent {
  const factory _SetPeriodOperationFilterEvent(
          {required final DateTimeRange period}) =
      _$SetPeriodOperationFilterEventImpl;

  DateTimeRange get period;

  /// Create a copy of OperationFilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetPeriodOperationFilterEventImplCopyWith<
          _$SetPeriodOperationFilterEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddAccountOperationFilterEventImplCopyWith<$Res> {
  factory _$$AddAccountOperationFilterEventImplCopyWith(
          _$AddAccountOperationFilterEventImpl value,
          $Res Function(_$AddAccountOperationFilterEventImpl) then) =
      __$$AddAccountOperationFilterEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AccountView account});
}

/// @nodoc
class __$$AddAccountOperationFilterEventImplCopyWithImpl<$Res>
    extends _$OperationFilterEventCopyWithImpl<$Res,
        _$AddAccountOperationFilterEventImpl>
    implements _$$AddAccountOperationFilterEventImplCopyWith<$Res> {
  __$$AddAccountOperationFilterEventImplCopyWithImpl(
      _$AddAccountOperationFilterEventImpl _value,
      $Res Function(_$AddAccountOperationFilterEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of OperationFilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
  }) {
    return _then(_$AddAccountOperationFilterEventImpl(
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as AccountView,
    ));
  }
}

/// @nodoc

class _$AddAccountOperationFilterEventImpl
    implements _AddAccountOperationFilterEvent {
  const _$AddAccountOperationFilterEventImpl({required this.account});

  @override
  final AccountView account;

  @override
  String toString() {
    return 'OperationFilterEvent.addAccount(account: $account)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddAccountOperationFilterEventImpl &&
            (identical(other.account, account) || other.account == account));
  }

  @override
  int get hashCode => Object.hash(runtimeType, account);

  /// Create a copy of OperationFilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddAccountOperationFilterEventImplCopyWith<
          _$AddAccountOperationFilterEventImpl>
      get copyWith => __$$AddAccountOperationFilterEventImplCopyWithImpl<
          _$AddAccountOperationFilterEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OperationListFilter filter) init,
    required TResult Function() resetPeriod,
    required TResult Function(DateTimeRange period) setPeriod,
    required TResult Function(AccountView account) addAccount,
    required TResult Function(AccountView account) removeAccount,
    required TResult Function(CategoryView category) addCategory,
    required TResult Function(CategoryView category) removeCategory,
  }) {
    return addAccount(account);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OperationListFilter filter)? init,
    TResult? Function()? resetPeriod,
    TResult? Function(DateTimeRange period)? setPeriod,
    TResult? Function(AccountView account)? addAccount,
    TResult? Function(AccountView account)? removeAccount,
    TResult? Function(CategoryView category)? addCategory,
    TResult? Function(CategoryView category)? removeCategory,
  }) {
    return addAccount?.call(account);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OperationListFilter filter)? init,
    TResult Function()? resetPeriod,
    TResult Function(DateTimeRange period)? setPeriod,
    TResult Function(AccountView account)? addAccount,
    TResult Function(AccountView account)? removeAccount,
    TResult Function(CategoryView category)? addCategory,
    TResult Function(CategoryView category)? removeCategory,
    required TResult orElse(),
  }) {
    if (addAccount != null) {
      return addAccount(account);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitPeriodOperationFilterEvent value) init,
    required TResult Function(_ResetPeriodOperationFilterEvent value)
        resetPeriod,
    required TResult Function(_SetPeriodOperationFilterEvent value) setPeriod,
    required TResult Function(_AddAccountOperationFilterEvent value) addAccount,
    required TResult Function(_RemoveAccountOperationFilterEvent value)
        removeAccount,
    required TResult Function(_AddCategoryOperationFilterEvent value)
        addCategory,
    required TResult Function(_RemoveCategoryOperationFilterEvent value)
        removeCategory,
  }) {
    return addAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitPeriodOperationFilterEvent value)? init,
    TResult? Function(_ResetPeriodOperationFilterEvent value)? resetPeriod,
    TResult? Function(_SetPeriodOperationFilterEvent value)? setPeriod,
    TResult? Function(_AddAccountOperationFilterEvent value)? addAccount,
    TResult? Function(_RemoveAccountOperationFilterEvent value)? removeAccount,
    TResult? Function(_AddCategoryOperationFilterEvent value)? addCategory,
    TResult? Function(_RemoveCategoryOperationFilterEvent value)?
        removeCategory,
  }) {
    return addAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitPeriodOperationFilterEvent value)? init,
    TResult Function(_ResetPeriodOperationFilterEvent value)? resetPeriod,
    TResult Function(_SetPeriodOperationFilterEvent value)? setPeriod,
    TResult Function(_AddAccountOperationFilterEvent value)? addAccount,
    TResult Function(_RemoveAccountOperationFilterEvent value)? removeAccount,
    TResult Function(_AddCategoryOperationFilterEvent value)? addCategory,
    TResult Function(_RemoveCategoryOperationFilterEvent value)? removeCategory,
    required TResult orElse(),
  }) {
    if (addAccount != null) {
      return addAccount(this);
    }
    return orElse();
  }
}

abstract class _AddAccountOperationFilterEvent implements OperationFilterEvent {
  const factory _AddAccountOperationFilterEvent(
          {required final AccountView account}) =
      _$AddAccountOperationFilterEventImpl;

  AccountView get account;

  /// Create a copy of OperationFilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddAccountOperationFilterEventImplCopyWith<
          _$AddAccountOperationFilterEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveAccountOperationFilterEventImplCopyWith<$Res> {
  factory _$$RemoveAccountOperationFilterEventImplCopyWith(
          _$RemoveAccountOperationFilterEventImpl value,
          $Res Function(_$RemoveAccountOperationFilterEventImpl) then) =
      __$$RemoveAccountOperationFilterEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AccountView account});
}

/// @nodoc
class __$$RemoveAccountOperationFilterEventImplCopyWithImpl<$Res>
    extends _$OperationFilterEventCopyWithImpl<$Res,
        _$RemoveAccountOperationFilterEventImpl>
    implements _$$RemoveAccountOperationFilterEventImplCopyWith<$Res> {
  __$$RemoveAccountOperationFilterEventImplCopyWithImpl(
      _$RemoveAccountOperationFilterEventImpl _value,
      $Res Function(_$RemoveAccountOperationFilterEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of OperationFilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
  }) {
    return _then(_$RemoveAccountOperationFilterEventImpl(
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as AccountView,
    ));
  }
}

/// @nodoc

class _$RemoveAccountOperationFilterEventImpl
    implements _RemoveAccountOperationFilterEvent {
  const _$RemoveAccountOperationFilterEventImpl({required this.account});

  @override
  final AccountView account;

  @override
  String toString() {
    return 'OperationFilterEvent.removeAccount(account: $account)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveAccountOperationFilterEventImpl &&
            (identical(other.account, account) || other.account == account));
  }

  @override
  int get hashCode => Object.hash(runtimeType, account);

  /// Create a copy of OperationFilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveAccountOperationFilterEventImplCopyWith<
          _$RemoveAccountOperationFilterEventImpl>
      get copyWith => __$$RemoveAccountOperationFilterEventImplCopyWithImpl<
          _$RemoveAccountOperationFilterEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OperationListFilter filter) init,
    required TResult Function() resetPeriod,
    required TResult Function(DateTimeRange period) setPeriod,
    required TResult Function(AccountView account) addAccount,
    required TResult Function(AccountView account) removeAccount,
    required TResult Function(CategoryView category) addCategory,
    required TResult Function(CategoryView category) removeCategory,
  }) {
    return removeAccount(account);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OperationListFilter filter)? init,
    TResult? Function()? resetPeriod,
    TResult? Function(DateTimeRange period)? setPeriod,
    TResult? Function(AccountView account)? addAccount,
    TResult? Function(AccountView account)? removeAccount,
    TResult? Function(CategoryView category)? addCategory,
    TResult? Function(CategoryView category)? removeCategory,
  }) {
    return removeAccount?.call(account);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OperationListFilter filter)? init,
    TResult Function()? resetPeriod,
    TResult Function(DateTimeRange period)? setPeriod,
    TResult Function(AccountView account)? addAccount,
    TResult Function(AccountView account)? removeAccount,
    TResult Function(CategoryView category)? addCategory,
    TResult Function(CategoryView category)? removeCategory,
    required TResult orElse(),
  }) {
    if (removeAccount != null) {
      return removeAccount(account);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitPeriodOperationFilterEvent value) init,
    required TResult Function(_ResetPeriodOperationFilterEvent value)
        resetPeriod,
    required TResult Function(_SetPeriodOperationFilterEvent value) setPeriod,
    required TResult Function(_AddAccountOperationFilterEvent value) addAccount,
    required TResult Function(_RemoveAccountOperationFilterEvent value)
        removeAccount,
    required TResult Function(_AddCategoryOperationFilterEvent value)
        addCategory,
    required TResult Function(_RemoveCategoryOperationFilterEvent value)
        removeCategory,
  }) {
    return removeAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitPeriodOperationFilterEvent value)? init,
    TResult? Function(_ResetPeriodOperationFilterEvent value)? resetPeriod,
    TResult? Function(_SetPeriodOperationFilterEvent value)? setPeriod,
    TResult? Function(_AddAccountOperationFilterEvent value)? addAccount,
    TResult? Function(_RemoveAccountOperationFilterEvent value)? removeAccount,
    TResult? Function(_AddCategoryOperationFilterEvent value)? addCategory,
    TResult? Function(_RemoveCategoryOperationFilterEvent value)?
        removeCategory,
  }) {
    return removeAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitPeriodOperationFilterEvent value)? init,
    TResult Function(_ResetPeriodOperationFilterEvent value)? resetPeriod,
    TResult Function(_SetPeriodOperationFilterEvent value)? setPeriod,
    TResult Function(_AddAccountOperationFilterEvent value)? addAccount,
    TResult Function(_RemoveAccountOperationFilterEvent value)? removeAccount,
    TResult Function(_AddCategoryOperationFilterEvent value)? addCategory,
    TResult Function(_RemoveCategoryOperationFilterEvent value)? removeCategory,
    required TResult orElse(),
  }) {
    if (removeAccount != null) {
      return removeAccount(this);
    }
    return orElse();
  }
}

abstract class _RemoveAccountOperationFilterEvent
    implements OperationFilterEvent {
  const factory _RemoveAccountOperationFilterEvent(
          {required final AccountView account}) =
      _$RemoveAccountOperationFilterEventImpl;

  AccountView get account;

  /// Create a copy of OperationFilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveAccountOperationFilterEventImplCopyWith<
          _$RemoveAccountOperationFilterEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddCategoryOperationFilterEventImplCopyWith<$Res> {
  factory _$$AddCategoryOperationFilterEventImplCopyWith(
          _$AddCategoryOperationFilterEventImpl value,
          $Res Function(_$AddCategoryOperationFilterEventImpl) then) =
      __$$AddCategoryOperationFilterEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CategoryView category});
}

/// @nodoc
class __$$AddCategoryOperationFilterEventImplCopyWithImpl<$Res>
    extends _$OperationFilterEventCopyWithImpl<$Res,
        _$AddCategoryOperationFilterEventImpl>
    implements _$$AddCategoryOperationFilterEventImplCopyWith<$Res> {
  __$$AddCategoryOperationFilterEventImplCopyWithImpl(
      _$AddCategoryOperationFilterEventImpl _value,
      $Res Function(_$AddCategoryOperationFilterEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of OperationFilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
  }) {
    return _then(_$AddCategoryOperationFilterEventImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryView,
    ));
  }
}

/// @nodoc

class _$AddCategoryOperationFilterEventImpl
    implements _AddCategoryOperationFilterEvent {
  const _$AddCategoryOperationFilterEventImpl({required this.category});

  @override
  final CategoryView category;

  @override
  String toString() {
    return 'OperationFilterEvent.addCategory(category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddCategoryOperationFilterEventImpl &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  /// Create a copy of OperationFilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddCategoryOperationFilterEventImplCopyWith<
          _$AddCategoryOperationFilterEventImpl>
      get copyWith => __$$AddCategoryOperationFilterEventImplCopyWithImpl<
          _$AddCategoryOperationFilterEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OperationListFilter filter) init,
    required TResult Function() resetPeriod,
    required TResult Function(DateTimeRange period) setPeriod,
    required TResult Function(AccountView account) addAccount,
    required TResult Function(AccountView account) removeAccount,
    required TResult Function(CategoryView category) addCategory,
    required TResult Function(CategoryView category) removeCategory,
  }) {
    return addCategory(category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OperationListFilter filter)? init,
    TResult? Function()? resetPeriod,
    TResult? Function(DateTimeRange period)? setPeriod,
    TResult? Function(AccountView account)? addAccount,
    TResult? Function(AccountView account)? removeAccount,
    TResult? Function(CategoryView category)? addCategory,
    TResult? Function(CategoryView category)? removeCategory,
  }) {
    return addCategory?.call(category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OperationListFilter filter)? init,
    TResult Function()? resetPeriod,
    TResult Function(DateTimeRange period)? setPeriod,
    TResult Function(AccountView account)? addAccount,
    TResult Function(AccountView account)? removeAccount,
    TResult Function(CategoryView category)? addCategory,
    TResult Function(CategoryView category)? removeCategory,
    required TResult orElse(),
  }) {
    if (addCategory != null) {
      return addCategory(category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitPeriodOperationFilterEvent value) init,
    required TResult Function(_ResetPeriodOperationFilterEvent value)
        resetPeriod,
    required TResult Function(_SetPeriodOperationFilterEvent value) setPeriod,
    required TResult Function(_AddAccountOperationFilterEvent value) addAccount,
    required TResult Function(_RemoveAccountOperationFilterEvent value)
        removeAccount,
    required TResult Function(_AddCategoryOperationFilterEvent value)
        addCategory,
    required TResult Function(_RemoveCategoryOperationFilterEvent value)
        removeCategory,
  }) {
    return addCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitPeriodOperationFilterEvent value)? init,
    TResult? Function(_ResetPeriodOperationFilterEvent value)? resetPeriod,
    TResult? Function(_SetPeriodOperationFilterEvent value)? setPeriod,
    TResult? Function(_AddAccountOperationFilterEvent value)? addAccount,
    TResult? Function(_RemoveAccountOperationFilterEvent value)? removeAccount,
    TResult? Function(_AddCategoryOperationFilterEvent value)? addCategory,
    TResult? Function(_RemoveCategoryOperationFilterEvent value)?
        removeCategory,
  }) {
    return addCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitPeriodOperationFilterEvent value)? init,
    TResult Function(_ResetPeriodOperationFilterEvent value)? resetPeriod,
    TResult Function(_SetPeriodOperationFilterEvent value)? setPeriod,
    TResult Function(_AddAccountOperationFilterEvent value)? addAccount,
    TResult Function(_RemoveAccountOperationFilterEvent value)? removeAccount,
    TResult Function(_AddCategoryOperationFilterEvent value)? addCategory,
    TResult Function(_RemoveCategoryOperationFilterEvent value)? removeCategory,
    required TResult orElse(),
  }) {
    if (addCategory != null) {
      return addCategory(this);
    }
    return orElse();
  }
}

abstract class _AddCategoryOperationFilterEvent
    implements OperationFilterEvent {
  const factory _AddCategoryOperationFilterEvent(
          {required final CategoryView category}) =
      _$AddCategoryOperationFilterEventImpl;

  CategoryView get category;

  /// Create a copy of OperationFilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddCategoryOperationFilterEventImplCopyWith<
          _$AddCategoryOperationFilterEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveCategoryOperationFilterEventImplCopyWith<$Res> {
  factory _$$RemoveCategoryOperationFilterEventImplCopyWith(
          _$RemoveCategoryOperationFilterEventImpl value,
          $Res Function(_$RemoveCategoryOperationFilterEventImpl) then) =
      __$$RemoveCategoryOperationFilterEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CategoryView category});
}

/// @nodoc
class __$$RemoveCategoryOperationFilterEventImplCopyWithImpl<$Res>
    extends _$OperationFilterEventCopyWithImpl<$Res,
        _$RemoveCategoryOperationFilterEventImpl>
    implements _$$RemoveCategoryOperationFilterEventImplCopyWith<$Res> {
  __$$RemoveCategoryOperationFilterEventImplCopyWithImpl(
      _$RemoveCategoryOperationFilterEventImpl _value,
      $Res Function(_$RemoveCategoryOperationFilterEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of OperationFilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
  }) {
    return _then(_$RemoveCategoryOperationFilterEventImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryView,
    ));
  }
}

/// @nodoc

class _$RemoveCategoryOperationFilterEventImpl
    implements _RemoveCategoryOperationFilterEvent {
  const _$RemoveCategoryOperationFilterEventImpl({required this.category});

  @override
  final CategoryView category;

  @override
  String toString() {
    return 'OperationFilterEvent.removeCategory(category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveCategoryOperationFilterEventImpl &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  /// Create a copy of OperationFilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveCategoryOperationFilterEventImplCopyWith<
          _$RemoveCategoryOperationFilterEventImpl>
      get copyWith => __$$RemoveCategoryOperationFilterEventImplCopyWithImpl<
          _$RemoveCategoryOperationFilterEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OperationListFilter filter) init,
    required TResult Function() resetPeriod,
    required TResult Function(DateTimeRange period) setPeriod,
    required TResult Function(AccountView account) addAccount,
    required TResult Function(AccountView account) removeAccount,
    required TResult Function(CategoryView category) addCategory,
    required TResult Function(CategoryView category) removeCategory,
  }) {
    return removeCategory(category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OperationListFilter filter)? init,
    TResult? Function()? resetPeriod,
    TResult? Function(DateTimeRange period)? setPeriod,
    TResult? Function(AccountView account)? addAccount,
    TResult? Function(AccountView account)? removeAccount,
    TResult? Function(CategoryView category)? addCategory,
    TResult? Function(CategoryView category)? removeCategory,
  }) {
    return removeCategory?.call(category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OperationListFilter filter)? init,
    TResult Function()? resetPeriod,
    TResult Function(DateTimeRange period)? setPeriod,
    TResult Function(AccountView account)? addAccount,
    TResult Function(AccountView account)? removeAccount,
    TResult Function(CategoryView category)? addCategory,
    TResult Function(CategoryView category)? removeCategory,
    required TResult orElse(),
  }) {
    if (removeCategory != null) {
      return removeCategory(category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitPeriodOperationFilterEvent value) init,
    required TResult Function(_ResetPeriodOperationFilterEvent value)
        resetPeriod,
    required TResult Function(_SetPeriodOperationFilterEvent value) setPeriod,
    required TResult Function(_AddAccountOperationFilterEvent value) addAccount,
    required TResult Function(_RemoveAccountOperationFilterEvent value)
        removeAccount,
    required TResult Function(_AddCategoryOperationFilterEvent value)
        addCategory,
    required TResult Function(_RemoveCategoryOperationFilterEvent value)
        removeCategory,
  }) {
    return removeCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitPeriodOperationFilterEvent value)? init,
    TResult? Function(_ResetPeriodOperationFilterEvent value)? resetPeriod,
    TResult? Function(_SetPeriodOperationFilterEvent value)? setPeriod,
    TResult? Function(_AddAccountOperationFilterEvent value)? addAccount,
    TResult? Function(_RemoveAccountOperationFilterEvent value)? removeAccount,
    TResult? Function(_AddCategoryOperationFilterEvent value)? addCategory,
    TResult? Function(_RemoveCategoryOperationFilterEvent value)?
        removeCategory,
  }) {
    return removeCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitPeriodOperationFilterEvent value)? init,
    TResult Function(_ResetPeriodOperationFilterEvent value)? resetPeriod,
    TResult Function(_SetPeriodOperationFilterEvent value)? setPeriod,
    TResult Function(_AddAccountOperationFilterEvent value)? addAccount,
    TResult Function(_RemoveAccountOperationFilterEvent value)? removeAccount,
    TResult Function(_AddCategoryOperationFilterEvent value)? addCategory,
    TResult Function(_RemoveCategoryOperationFilterEvent value)? removeCategory,
    required TResult orElse(),
  }) {
    if (removeCategory != null) {
      return removeCategory(this);
    }
    return orElse();
  }
}

abstract class _RemoveCategoryOperationFilterEvent
    implements OperationFilterEvent {
  const factory _RemoveCategoryOperationFilterEvent(
          {required final CategoryView category}) =
      _$RemoveCategoryOperationFilterEventImpl;

  CategoryView get category;

  /// Create a copy of OperationFilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveCategoryOperationFilterEventImplCopyWith<
          _$RemoveCategoryOperationFilterEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OperationFilterState {
  DateTimeRange? get period => throw _privateConstructorUsedError;
  Set<int> get accountIds => throw _privateConstructorUsedError;
  Set<int> get categoryIds => throw _privateConstructorUsedError;

  /// Create a copy of OperationFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OperationFilterStateCopyWith<OperationFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OperationFilterStateCopyWith<$Res> {
  factory $OperationFilterStateCopyWith(OperationFilterState value,
          $Res Function(OperationFilterState) then) =
      _$OperationFilterStateCopyWithImpl<$Res, OperationFilterState>;
  @useResult
  $Res call({DateTimeRange? period, Set<int> accountIds, Set<int> categoryIds});
}

/// @nodoc
class _$OperationFilterStateCopyWithImpl<$Res,
        $Val extends OperationFilterState>
    implements $OperationFilterStateCopyWith<$Res> {
  _$OperationFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OperationFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = freezed,
    Object? accountIds = null,
    Object? categoryIds = null,
  }) {
    return _then(_value.copyWith(
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
      accountIds: null == accountIds
          ? _value.accountIds
          : accountIds // ignore: cast_nullable_to_non_nullable
              as Set<int>,
      categoryIds: null == categoryIds
          ? _value.categoryIds
          : categoryIds // ignore: cast_nullable_to_non_nullable
              as Set<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OperationFilterStateImplCopyWith<$Res>
    implements $OperationFilterStateCopyWith<$Res> {
  factory _$$OperationFilterStateImplCopyWith(_$OperationFilterStateImpl value,
          $Res Function(_$OperationFilterStateImpl) then) =
      __$$OperationFilterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTimeRange? period, Set<int> accountIds, Set<int> categoryIds});
}

/// @nodoc
class __$$OperationFilterStateImplCopyWithImpl<$Res>
    extends _$OperationFilterStateCopyWithImpl<$Res, _$OperationFilterStateImpl>
    implements _$$OperationFilterStateImplCopyWith<$Res> {
  __$$OperationFilterStateImplCopyWithImpl(_$OperationFilterStateImpl _value,
      $Res Function(_$OperationFilterStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of OperationFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = freezed,
    Object? accountIds = null,
    Object? categoryIds = null,
  }) {
    return _then(_$OperationFilterStateImpl(
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
      accountIds: null == accountIds
          ? _value._accountIds
          : accountIds // ignore: cast_nullable_to_non_nullable
              as Set<int>,
      categoryIds: null == categoryIds
          ? _value._categoryIds
          : categoryIds // ignore: cast_nullable_to_non_nullable
              as Set<int>,
    ));
  }
}

/// @nodoc

class _$OperationFilterStateImpl extends _OperationFilterState {
  const _$OperationFilterStateImpl(
      {this.period,
      final Set<int> accountIds = const {},
      final Set<int> categoryIds = const {}})
      : _accountIds = accountIds,
        _categoryIds = categoryIds,
        super._();

  @override
  final DateTimeRange? period;
  final Set<int> _accountIds;
  @override
  @JsonKey()
  Set<int> get accountIds {
    if (_accountIds is EqualUnmodifiableSetView) return _accountIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_accountIds);
  }

  final Set<int> _categoryIds;
  @override
  @JsonKey()
  Set<int> get categoryIds {
    if (_categoryIds is EqualUnmodifiableSetView) return _categoryIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_categoryIds);
  }

  @override
  String toString() {
    return 'OperationFilterState(period: $period, accountIds: $accountIds, categoryIds: $categoryIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OperationFilterStateImpl &&
            (identical(other.period, period) || other.period == period) &&
            const DeepCollectionEquality()
                .equals(other._accountIds, _accountIds) &&
            const DeepCollectionEquality()
                .equals(other._categoryIds, _categoryIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      period,
      const DeepCollectionEquality().hash(_accountIds),
      const DeepCollectionEquality().hash(_categoryIds));

  /// Create a copy of OperationFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OperationFilterStateImplCopyWith<_$OperationFilterStateImpl>
      get copyWith =>
          __$$OperationFilterStateImplCopyWithImpl<_$OperationFilterStateImpl>(
              this, _$identity);
}

abstract class _OperationFilterState extends OperationFilterState {
  const factory _OperationFilterState(
      {final DateTimeRange? period,
      final Set<int> accountIds,
      final Set<int> categoryIds}) = _$OperationFilterStateImpl;
  const _OperationFilterState._() : super._();

  @override
  DateTimeRange? get period;
  @override
  Set<int> get accountIds;
  @override
  Set<int> get categoryIds;

  /// Create a copy of OperationFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OperationFilterStateImplCopyWith<_$OperationFilterStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
