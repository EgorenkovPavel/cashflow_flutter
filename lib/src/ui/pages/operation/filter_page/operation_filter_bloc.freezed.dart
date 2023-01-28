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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OperationFilterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OperationListFilter filter) init,
    required TResult Function() resetPeriod,
    required TResult Function(DateTimeRange period) setPeriod,
    required TResult Function(Account account) addAccount,
    required TResult Function(Account account) removeAccount,
    required TResult Function(Category category) addCategory,
    required TResult Function(Category category) removeCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OperationListFilter filter)? init,
    TResult? Function()? resetPeriod,
    TResult? Function(DateTimeRange period)? setPeriod,
    TResult? Function(Account account)? addAccount,
    TResult? Function(Account account)? removeAccount,
    TResult? Function(Category category)? addCategory,
    TResult? Function(Category category)? removeCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OperationListFilter filter)? init,
    TResult Function()? resetPeriod,
    TResult Function(DateTimeRange period)? setPeriod,
    TResult Function(Account account)? addAccount,
    TResult Function(Account account)? removeAccount,
    TResult Function(Category category)? addCategory,
    TResult Function(Category category)? removeCategory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitOperationFilterEvent value) init,
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
    TResult? Function(_InitOperationFilterEvent value)? init,
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
    TResult Function(_InitOperationFilterEvent value)? init,
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
}

/// @nodoc
abstract class _$$_InitOperationFilterEventCopyWith<$Res> {
  factory _$$_InitOperationFilterEventCopyWith(
          _$_InitOperationFilterEvent value,
          $Res Function(_$_InitOperationFilterEvent) then) =
      __$$_InitOperationFilterEventCopyWithImpl<$Res>;
  @useResult
  $Res call({OperationListFilter filter});

  $OperationListFilterCopyWith<$Res> get filter;
}

/// @nodoc
class __$$_InitOperationFilterEventCopyWithImpl<$Res>
    extends _$OperationFilterEventCopyWithImpl<$Res,
        _$_InitOperationFilterEvent>
    implements _$$_InitOperationFilterEventCopyWith<$Res> {
  __$$_InitOperationFilterEventCopyWithImpl(_$_InitOperationFilterEvent _value,
      $Res Function(_$_InitOperationFilterEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
  }) {
    return _then(_$_InitOperationFilterEvent(
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as OperationListFilter,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $OperationListFilterCopyWith<$Res> get filter {
    return $OperationListFilterCopyWith<$Res>(_value.filter, (value) {
      return _then(_value.copyWith(filter: value));
    });
  }
}

/// @nodoc

class _$_InitOperationFilterEvent implements _InitOperationFilterEvent {
  const _$_InitOperationFilterEvent({required this.filter});

  @override
  final OperationListFilter filter;

  @override
  String toString() {
    return 'OperationFilterEvent.init(filter: $filter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InitOperationFilterEvent &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitOperationFilterEventCopyWith<_$_InitOperationFilterEvent>
      get copyWith => __$$_InitOperationFilterEventCopyWithImpl<
          _$_InitOperationFilterEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OperationListFilter filter) init,
    required TResult Function() resetPeriod,
    required TResult Function(DateTimeRange period) setPeriod,
    required TResult Function(Account account) addAccount,
    required TResult Function(Account account) removeAccount,
    required TResult Function(Category category) addCategory,
    required TResult Function(Category category) removeCategory,
  }) {
    return init(filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OperationListFilter filter)? init,
    TResult? Function()? resetPeriod,
    TResult? Function(DateTimeRange period)? setPeriod,
    TResult? Function(Account account)? addAccount,
    TResult? Function(Account account)? removeAccount,
    TResult? Function(Category category)? addCategory,
    TResult? Function(Category category)? removeCategory,
  }) {
    return init?.call(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OperationListFilter filter)? init,
    TResult Function()? resetPeriod,
    TResult Function(DateTimeRange period)? setPeriod,
    TResult Function(Account account)? addAccount,
    TResult Function(Account account)? removeAccount,
    TResult Function(Category category)? addCategory,
    TResult Function(Category category)? removeCategory,
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
    required TResult Function(_InitOperationFilterEvent value) init,
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
    TResult? Function(_InitOperationFilterEvent value)? init,
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
    TResult Function(_InitOperationFilterEvent value)? init,
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

abstract class _InitOperationFilterEvent implements OperationFilterEvent {
  const factory _InitOperationFilterEvent(
          {required final OperationListFilter filter}) =
      _$_InitOperationFilterEvent;

  OperationListFilter get filter;
  @JsonKey(ignore: true)
  _$$_InitOperationFilterEventCopyWith<_$_InitOperationFilterEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ResetPeriodOperationFilterEventCopyWith<$Res> {
  factory _$$_ResetPeriodOperationFilterEventCopyWith(
          _$_ResetPeriodOperationFilterEvent value,
          $Res Function(_$_ResetPeriodOperationFilterEvent) then) =
      __$$_ResetPeriodOperationFilterEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ResetPeriodOperationFilterEventCopyWithImpl<$Res>
    extends _$OperationFilterEventCopyWithImpl<$Res,
        _$_ResetPeriodOperationFilterEvent>
    implements _$$_ResetPeriodOperationFilterEventCopyWith<$Res> {
  __$$_ResetPeriodOperationFilterEventCopyWithImpl(
      _$_ResetPeriodOperationFilterEvent _value,
      $Res Function(_$_ResetPeriodOperationFilterEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ResetPeriodOperationFilterEvent
    implements _ResetPeriodOperationFilterEvent {
  const _$_ResetPeriodOperationFilterEvent();

  @override
  String toString() {
    return 'OperationFilterEvent.resetPeriod()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResetPeriodOperationFilterEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OperationListFilter filter) init,
    required TResult Function() resetPeriod,
    required TResult Function(DateTimeRange period) setPeriod,
    required TResult Function(Account account) addAccount,
    required TResult Function(Account account) removeAccount,
    required TResult Function(Category category) addCategory,
    required TResult Function(Category category) removeCategory,
  }) {
    return resetPeriod();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OperationListFilter filter)? init,
    TResult? Function()? resetPeriod,
    TResult? Function(DateTimeRange period)? setPeriod,
    TResult? Function(Account account)? addAccount,
    TResult? Function(Account account)? removeAccount,
    TResult? Function(Category category)? addCategory,
    TResult? Function(Category category)? removeCategory,
  }) {
    return resetPeriod?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OperationListFilter filter)? init,
    TResult Function()? resetPeriod,
    TResult Function(DateTimeRange period)? setPeriod,
    TResult Function(Account account)? addAccount,
    TResult Function(Account account)? removeAccount,
    TResult Function(Category category)? addCategory,
    TResult Function(Category category)? removeCategory,
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
    required TResult Function(_InitOperationFilterEvent value) init,
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
    TResult? Function(_InitOperationFilterEvent value)? init,
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
    TResult Function(_InitOperationFilterEvent value)? init,
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
      _$_ResetPeriodOperationFilterEvent;
}

/// @nodoc
abstract class _$$_SetPeriodOperationFilterEventCopyWith<$Res> {
  factory _$$_SetPeriodOperationFilterEventCopyWith(
          _$_SetPeriodOperationFilterEvent value,
          $Res Function(_$_SetPeriodOperationFilterEvent) then) =
      __$$_SetPeriodOperationFilterEventCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTimeRange period});
}

/// @nodoc
class __$$_SetPeriodOperationFilterEventCopyWithImpl<$Res>
    extends _$OperationFilterEventCopyWithImpl<$Res,
        _$_SetPeriodOperationFilterEvent>
    implements _$$_SetPeriodOperationFilterEventCopyWith<$Res> {
  __$$_SetPeriodOperationFilterEventCopyWithImpl(
      _$_SetPeriodOperationFilterEvent _value,
      $Res Function(_$_SetPeriodOperationFilterEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = null,
  }) {
    return _then(_$_SetPeriodOperationFilterEvent(
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as DateTimeRange,
    ));
  }
}

/// @nodoc

class _$_SetPeriodOperationFilterEvent
    implements _SetPeriodOperationFilterEvent {
  const _$_SetPeriodOperationFilterEvent({required this.period});

  @override
  final DateTimeRange period;

  @override
  String toString() {
    return 'OperationFilterEvent.setPeriod(period: $period)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetPeriodOperationFilterEvent &&
            (identical(other.period, period) || other.period == period));
  }

  @override
  int get hashCode => Object.hash(runtimeType, period);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetPeriodOperationFilterEventCopyWith<_$_SetPeriodOperationFilterEvent>
      get copyWith => __$$_SetPeriodOperationFilterEventCopyWithImpl<
          _$_SetPeriodOperationFilterEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OperationListFilter filter) init,
    required TResult Function() resetPeriod,
    required TResult Function(DateTimeRange period) setPeriod,
    required TResult Function(Account account) addAccount,
    required TResult Function(Account account) removeAccount,
    required TResult Function(Category category) addCategory,
    required TResult Function(Category category) removeCategory,
  }) {
    return setPeriod(period);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OperationListFilter filter)? init,
    TResult? Function()? resetPeriod,
    TResult? Function(DateTimeRange period)? setPeriod,
    TResult? Function(Account account)? addAccount,
    TResult? Function(Account account)? removeAccount,
    TResult? Function(Category category)? addCategory,
    TResult? Function(Category category)? removeCategory,
  }) {
    return setPeriod?.call(period);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OperationListFilter filter)? init,
    TResult Function()? resetPeriod,
    TResult Function(DateTimeRange period)? setPeriod,
    TResult Function(Account account)? addAccount,
    TResult Function(Account account)? removeAccount,
    TResult Function(Category category)? addCategory,
    TResult Function(Category category)? removeCategory,
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
    required TResult Function(_InitOperationFilterEvent value) init,
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
    TResult? Function(_InitOperationFilterEvent value)? init,
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
    TResult Function(_InitOperationFilterEvent value)? init,
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
      {required final DateTimeRange period}) = _$_SetPeriodOperationFilterEvent;

  DateTimeRange get period;
  @JsonKey(ignore: true)
  _$$_SetPeriodOperationFilterEventCopyWith<_$_SetPeriodOperationFilterEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AddAccountOperationFilterEventCopyWith<$Res> {
  factory _$$_AddAccountOperationFilterEventCopyWith(
          _$_AddAccountOperationFilterEvent value,
          $Res Function(_$_AddAccountOperationFilterEvent) then) =
      __$$_AddAccountOperationFilterEventCopyWithImpl<$Res>;
  @useResult
  $Res call({Account account});

  $AccountCopyWith<$Res> get account;
}

/// @nodoc
class __$$_AddAccountOperationFilterEventCopyWithImpl<$Res>
    extends _$OperationFilterEventCopyWithImpl<$Res,
        _$_AddAccountOperationFilterEvent>
    implements _$$_AddAccountOperationFilterEventCopyWith<$Res> {
  __$$_AddAccountOperationFilterEventCopyWithImpl(
      _$_AddAccountOperationFilterEvent _value,
      $Res Function(_$_AddAccountOperationFilterEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
  }) {
    return _then(_$_AddAccountOperationFilterEvent(
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AccountCopyWith<$Res> get account {
    return $AccountCopyWith<$Res>(_value.account, (value) {
      return _then(_value.copyWith(account: value));
    });
  }
}

/// @nodoc

class _$_AddAccountOperationFilterEvent
    implements _AddAccountOperationFilterEvent {
  const _$_AddAccountOperationFilterEvent({required this.account});

  @override
  final Account account;

  @override
  String toString() {
    return 'OperationFilterEvent.addAccount(account: $account)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddAccountOperationFilterEvent &&
            (identical(other.account, account) || other.account == account));
  }

  @override
  int get hashCode => Object.hash(runtimeType, account);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddAccountOperationFilterEventCopyWith<_$_AddAccountOperationFilterEvent>
      get copyWith => __$$_AddAccountOperationFilterEventCopyWithImpl<
          _$_AddAccountOperationFilterEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OperationListFilter filter) init,
    required TResult Function() resetPeriod,
    required TResult Function(DateTimeRange period) setPeriod,
    required TResult Function(Account account) addAccount,
    required TResult Function(Account account) removeAccount,
    required TResult Function(Category category) addCategory,
    required TResult Function(Category category) removeCategory,
  }) {
    return addAccount(account);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OperationListFilter filter)? init,
    TResult? Function()? resetPeriod,
    TResult? Function(DateTimeRange period)? setPeriod,
    TResult? Function(Account account)? addAccount,
    TResult? Function(Account account)? removeAccount,
    TResult? Function(Category category)? addCategory,
    TResult? Function(Category category)? removeCategory,
  }) {
    return addAccount?.call(account);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OperationListFilter filter)? init,
    TResult Function()? resetPeriod,
    TResult Function(DateTimeRange period)? setPeriod,
    TResult Function(Account account)? addAccount,
    TResult Function(Account account)? removeAccount,
    TResult Function(Category category)? addCategory,
    TResult Function(Category category)? removeCategory,
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
    required TResult Function(_InitOperationFilterEvent value) init,
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
    TResult? Function(_InitOperationFilterEvent value)? init,
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
    TResult Function(_InitOperationFilterEvent value)? init,
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
      {required final Account account}) = _$_AddAccountOperationFilterEvent;

  Account get account;
  @JsonKey(ignore: true)
  _$$_AddAccountOperationFilterEventCopyWith<_$_AddAccountOperationFilterEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RemoveAccountOperationFilterEventCopyWith<$Res> {
  factory _$$_RemoveAccountOperationFilterEventCopyWith(
          _$_RemoveAccountOperationFilterEvent value,
          $Res Function(_$_RemoveAccountOperationFilterEvent) then) =
      __$$_RemoveAccountOperationFilterEventCopyWithImpl<$Res>;
  @useResult
  $Res call({Account account});

  $AccountCopyWith<$Res> get account;
}

/// @nodoc
class __$$_RemoveAccountOperationFilterEventCopyWithImpl<$Res>
    extends _$OperationFilterEventCopyWithImpl<$Res,
        _$_RemoveAccountOperationFilterEvent>
    implements _$$_RemoveAccountOperationFilterEventCopyWith<$Res> {
  __$$_RemoveAccountOperationFilterEventCopyWithImpl(
      _$_RemoveAccountOperationFilterEvent _value,
      $Res Function(_$_RemoveAccountOperationFilterEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
  }) {
    return _then(_$_RemoveAccountOperationFilterEvent(
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AccountCopyWith<$Res> get account {
    return $AccountCopyWith<$Res>(_value.account, (value) {
      return _then(_value.copyWith(account: value));
    });
  }
}

/// @nodoc

class _$_RemoveAccountOperationFilterEvent
    implements _RemoveAccountOperationFilterEvent {
  const _$_RemoveAccountOperationFilterEvent({required this.account});

  @override
  final Account account;

  @override
  String toString() {
    return 'OperationFilterEvent.removeAccount(account: $account)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RemoveAccountOperationFilterEvent &&
            (identical(other.account, account) || other.account == account));
  }

  @override
  int get hashCode => Object.hash(runtimeType, account);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RemoveAccountOperationFilterEventCopyWith<
          _$_RemoveAccountOperationFilterEvent>
      get copyWith => __$$_RemoveAccountOperationFilterEventCopyWithImpl<
          _$_RemoveAccountOperationFilterEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OperationListFilter filter) init,
    required TResult Function() resetPeriod,
    required TResult Function(DateTimeRange period) setPeriod,
    required TResult Function(Account account) addAccount,
    required TResult Function(Account account) removeAccount,
    required TResult Function(Category category) addCategory,
    required TResult Function(Category category) removeCategory,
  }) {
    return removeAccount(account);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OperationListFilter filter)? init,
    TResult? Function()? resetPeriod,
    TResult? Function(DateTimeRange period)? setPeriod,
    TResult? Function(Account account)? addAccount,
    TResult? Function(Account account)? removeAccount,
    TResult? Function(Category category)? addCategory,
    TResult? Function(Category category)? removeCategory,
  }) {
    return removeAccount?.call(account);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OperationListFilter filter)? init,
    TResult Function()? resetPeriod,
    TResult Function(DateTimeRange period)? setPeriod,
    TResult Function(Account account)? addAccount,
    TResult Function(Account account)? removeAccount,
    TResult Function(Category category)? addCategory,
    TResult Function(Category category)? removeCategory,
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
    required TResult Function(_InitOperationFilterEvent value) init,
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
    TResult? Function(_InitOperationFilterEvent value)? init,
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
    TResult Function(_InitOperationFilterEvent value)? init,
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
      {required final Account account}) = _$_RemoveAccountOperationFilterEvent;

  Account get account;
  @JsonKey(ignore: true)
  _$$_RemoveAccountOperationFilterEventCopyWith<
          _$_RemoveAccountOperationFilterEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AddCategoryOperationFilterEventCopyWith<$Res> {
  factory _$$_AddCategoryOperationFilterEventCopyWith(
          _$_AddCategoryOperationFilterEvent value,
          $Res Function(_$_AddCategoryOperationFilterEvent) then) =
      __$$_AddCategoryOperationFilterEventCopyWithImpl<$Res>;
  @useResult
  $Res call({Category category});

  $CategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$$_AddCategoryOperationFilterEventCopyWithImpl<$Res>
    extends _$OperationFilterEventCopyWithImpl<$Res,
        _$_AddCategoryOperationFilterEvent>
    implements _$$_AddCategoryOperationFilterEventCopyWith<$Res> {
  __$$_AddCategoryOperationFilterEventCopyWithImpl(
      _$_AddCategoryOperationFilterEvent _value,
      $Res Function(_$_AddCategoryOperationFilterEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
  }) {
    return _then(_$_AddCategoryOperationFilterEvent(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res> get category {
    return $CategoryCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value));
    });
  }
}

/// @nodoc

class _$_AddCategoryOperationFilterEvent
    implements _AddCategoryOperationFilterEvent {
  const _$_AddCategoryOperationFilterEvent({required this.category});

  @override
  final Category category;

  @override
  String toString() {
    return 'OperationFilterEvent.addCategory(category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddCategoryOperationFilterEvent &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddCategoryOperationFilterEventCopyWith<
          _$_AddCategoryOperationFilterEvent>
      get copyWith => __$$_AddCategoryOperationFilterEventCopyWithImpl<
          _$_AddCategoryOperationFilterEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OperationListFilter filter) init,
    required TResult Function() resetPeriod,
    required TResult Function(DateTimeRange period) setPeriod,
    required TResult Function(Account account) addAccount,
    required TResult Function(Account account) removeAccount,
    required TResult Function(Category category) addCategory,
    required TResult Function(Category category) removeCategory,
  }) {
    return addCategory(category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OperationListFilter filter)? init,
    TResult? Function()? resetPeriod,
    TResult? Function(DateTimeRange period)? setPeriod,
    TResult? Function(Account account)? addAccount,
    TResult? Function(Account account)? removeAccount,
    TResult? Function(Category category)? addCategory,
    TResult? Function(Category category)? removeCategory,
  }) {
    return addCategory?.call(category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OperationListFilter filter)? init,
    TResult Function()? resetPeriod,
    TResult Function(DateTimeRange period)? setPeriod,
    TResult Function(Account account)? addAccount,
    TResult Function(Account account)? removeAccount,
    TResult Function(Category category)? addCategory,
    TResult Function(Category category)? removeCategory,
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
    required TResult Function(_InitOperationFilterEvent value) init,
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
    TResult? Function(_InitOperationFilterEvent value)? init,
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
    TResult Function(_InitOperationFilterEvent value)? init,
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
      {required final Category category}) = _$_AddCategoryOperationFilterEvent;

  Category get category;
  @JsonKey(ignore: true)
  _$$_AddCategoryOperationFilterEventCopyWith<
          _$_AddCategoryOperationFilterEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RemoveCategoryOperationFilterEventCopyWith<$Res> {
  factory _$$_RemoveCategoryOperationFilterEventCopyWith(
          _$_RemoveCategoryOperationFilterEvent value,
          $Res Function(_$_RemoveCategoryOperationFilterEvent) then) =
      __$$_RemoveCategoryOperationFilterEventCopyWithImpl<$Res>;
  @useResult
  $Res call({Category category});

  $CategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$$_RemoveCategoryOperationFilterEventCopyWithImpl<$Res>
    extends _$OperationFilterEventCopyWithImpl<$Res,
        _$_RemoveCategoryOperationFilterEvent>
    implements _$$_RemoveCategoryOperationFilterEventCopyWith<$Res> {
  __$$_RemoveCategoryOperationFilterEventCopyWithImpl(
      _$_RemoveCategoryOperationFilterEvent _value,
      $Res Function(_$_RemoveCategoryOperationFilterEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
  }) {
    return _then(_$_RemoveCategoryOperationFilterEvent(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res> get category {
    return $CategoryCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value));
    });
  }
}

/// @nodoc

class _$_RemoveCategoryOperationFilterEvent
    implements _RemoveCategoryOperationFilterEvent {
  const _$_RemoveCategoryOperationFilterEvent({required this.category});

  @override
  final Category category;

  @override
  String toString() {
    return 'OperationFilterEvent.removeCategory(category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RemoveCategoryOperationFilterEvent &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RemoveCategoryOperationFilterEventCopyWith<
          _$_RemoveCategoryOperationFilterEvent>
      get copyWith => __$$_RemoveCategoryOperationFilterEventCopyWithImpl<
          _$_RemoveCategoryOperationFilterEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OperationListFilter filter) init,
    required TResult Function() resetPeriod,
    required TResult Function(DateTimeRange period) setPeriod,
    required TResult Function(Account account) addAccount,
    required TResult Function(Account account) removeAccount,
    required TResult Function(Category category) addCategory,
    required TResult Function(Category category) removeCategory,
  }) {
    return removeCategory(category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OperationListFilter filter)? init,
    TResult? Function()? resetPeriod,
    TResult? Function(DateTimeRange period)? setPeriod,
    TResult? Function(Account account)? addAccount,
    TResult? Function(Account account)? removeAccount,
    TResult? Function(Category category)? addCategory,
    TResult? Function(Category category)? removeCategory,
  }) {
    return removeCategory?.call(category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OperationListFilter filter)? init,
    TResult Function()? resetPeriod,
    TResult Function(DateTimeRange period)? setPeriod,
    TResult Function(Account account)? addAccount,
    TResult Function(Account account)? removeAccount,
    TResult Function(Category category)? addCategory,
    TResult Function(Category category)? removeCategory,
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
    required TResult Function(_InitOperationFilterEvent value) init,
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
    TResult? Function(_InitOperationFilterEvent value)? init,
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
    TResult Function(_InitOperationFilterEvent value)? init,
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
          {required final Category category}) =
      _$_RemoveCategoryOperationFilterEvent;

  Category get category;
  @JsonKey(ignore: true)
  _$$_RemoveCategoryOperationFilterEventCopyWith<
          _$_RemoveCategoryOperationFilterEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OperationFilterState {
  OperationListFilter get filter => throw _privateConstructorUsedError;
  List<Account> get accounts => throw _privateConstructorUsedError;
  List<Category> get inCategories => throw _privateConstructorUsedError;
  List<Category> get outCategories => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OperationFilterStateCopyWith<OperationFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OperationFilterStateCopyWith<$Res> {
  factory $OperationFilterStateCopyWith(OperationFilterState value,
          $Res Function(OperationFilterState) then) =
      _$OperationFilterStateCopyWithImpl<$Res, OperationFilterState>;
  @useResult
  $Res call(
      {OperationListFilter filter,
      List<Account> accounts,
      List<Category> inCategories,
      List<Category> outCategories});

  $OperationListFilterCopyWith<$Res> get filter;
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
    Object? accounts = null,
    Object? inCategories = null,
    Object? outCategories = null,
  }) {
    return _then(_value.copyWith(
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as OperationListFilter,
      accounts: null == accounts
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<Account>,
      inCategories: null == inCategories
          ? _value.inCategories
          : inCategories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      outCategories: null == outCategories
          ? _value.outCategories
          : outCategories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OperationListFilterCopyWith<$Res> get filter {
    return $OperationListFilterCopyWith<$Res>(_value.filter, (value) {
      return _then(_value.copyWith(filter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OperationFilterStateCopyWith<$Res>
    implements $OperationFilterStateCopyWith<$Res> {
  factory _$$_OperationFilterStateCopyWith(_$_OperationFilterState value,
          $Res Function(_$_OperationFilterState) then) =
      __$$_OperationFilterStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {OperationListFilter filter,
      List<Account> accounts,
      List<Category> inCategories,
      List<Category> outCategories});

  @override
  $OperationListFilterCopyWith<$Res> get filter;
}

/// @nodoc
class __$$_OperationFilterStateCopyWithImpl<$Res>
    extends _$OperationFilterStateCopyWithImpl<$Res, _$_OperationFilterState>
    implements _$$_OperationFilterStateCopyWith<$Res> {
  __$$_OperationFilterStateCopyWithImpl(_$_OperationFilterState _value,
      $Res Function(_$_OperationFilterState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
    Object? accounts = null,
    Object? inCategories = null,
    Object? outCategories = null,
  }) {
    return _then(_$_OperationFilterState(
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as OperationListFilter,
      accounts: null == accounts
          ? _value._accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<Account>,
      inCategories: null == inCategories
          ? _value._inCategories
          : inCategories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      outCategories: null == outCategories
          ? _value._outCategories
          : outCategories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ));
  }
}

/// @nodoc

class _$_OperationFilterState implements _OperationFilterState {
  const _$_OperationFilterState(
      {required this.filter,
      required final List<Account> accounts,
      required final List<Category> inCategories,
      required final List<Category> outCategories})
      : _accounts = accounts,
        _inCategories = inCategories,
        _outCategories = outCategories;

  @override
  final OperationListFilter filter;
  final List<Account> _accounts;
  @override
  List<Account> get accounts {
    if (_accounts is EqualUnmodifiableListView) return _accounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accounts);
  }

  final List<Category> _inCategories;
  @override
  List<Category> get inCategories {
    if (_inCategories is EqualUnmodifiableListView) return _inCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inCategories);
  }

  final List<Category> _outCategories;
  @override
  List<Category> get outCategories {
    if (_outCategories is EqualUnmodifiableListView) return _outCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_outCategories);
  }

  @override
  String toString() {
    return 'OperationFilterState(filter: $filter, accounts: $accounts, inCategories: $inCategories, outCategories: $outCategories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OperationFilterState &&
            (identical(other.filter, filter) || other.filter == filter) &&
            const DeepCollectionEquality().equals(other._accounts, _accounts) &&
            const DeepCollectionEquality()
                .equals(other._inCategories, _inCategories) &&
            const DeepCollectionEquality()
                .equals(other._outCategories, _outCategories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      filter,
      const DeepCollectionEquality().hash(_accounts),
      const DeepCollectionEquality().hash(_inCategories),
      const DeepCollectionEquality().hash(_outCategories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OperationFilterStateCopyWith<_$_OperationFilterState> get copyWith =>
      __$$_OperationFilterStateCopyWithImpl<_$_OperationFilterState>(
          this, _$identity);
}

abstract class _OperationFilterState implements OperationFilterState {
  const factory _OperationFilterState(
      {required final OperationListFilter filter,
      required final List<Account> accounts,
      required final List<Category> inCategories,
      required final List<Category> outCategories}) = _$_OperationFilterState;

  @override
  OperationListFilter get filter;
  @override
  List<Account> get accounts;
  @override
  List<Category> get inCategories;
  @override
  List<Category> get outCategories;
  @override
  @JsonKey(ignore: true)
  _$$_OperationFilterStateCopyWith<_$_OperationFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}
