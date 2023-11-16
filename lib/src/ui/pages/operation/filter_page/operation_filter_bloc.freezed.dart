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
abstract class _$$InitOperationFilterEventImplCopyWith<$Res> {
  factory _$$InitOperationFilterEventImplCopyWith(
          _$InitOperationFilterEventImpl value,
          $Res Function(_$InitOperationFilterEventImpl) then) =
      __$$InitOperationFilterEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({OperationListFilter filter});

  $OperationListFilterCopyWith<$Res> get filter;
}

/// @nodoc
class __$$InitOperationFilterEventImplCopyWithImpl<$Res>
    extends _$OperationFilterEventCopyWithImpl<$Res,
        _$InitOperationFilterEventImpl>
    implements _$$InitOperationFilterEventImplCopyWith<$Res> {
  __$$InitOperationFilterEventImplCopyWithImpl(
      _$InitOperationFilterEventImpl _value,
      $Res Function(_$InitOperationFilterEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
  }) {
    return _then(_$InitOperationFilterEventImpl(
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

class _$InitOperationFilterEventImpl implements _InitOperationFilterEvent {
  const _$InitOperationFilterEventImpl({required this.filter});

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
            other is _$InitOperationFilterEventImpl &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitOperationFilterEventImplCopyWith<_$InitOperationFilterEventImpl>
      get copyWith => __$$InitOperationFilterEventImplCopyWithImpl<
          _$InitOperationFilterEventImpl>(this, _$identity);

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
      _$InitOperationFilterEventImpl;

  OperationListFilter get filter;
  @JsonKey(ignore: true)
  _$$InitOperationFilterEventImplCopyWith<_$InitOperationFilterEventImpl>
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
  bool operator ==(dynamic other) {
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetPeriodOperationFilterEventImpl &&
            (identical(other.period, period) || other.period == period));
  }

  @override
  int get hashCode => Object.hash(runtimeType, period);

  @JsonKey(ignore: true)
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
          {required final DateTimeRange period}) =
      _$SetPeriodOperationFilterEventImpl;

  DateTimeRange get period;
  @JsonKey(ignore: true)
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
  $Res call({Account account});

  $AccountCopyWith<$Res> get account;
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
  }) {
    return _then(_$AddAccountOperationFilterEventImpl(
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

class _$AddAccountOperationFilterEventImpl
    implements _AddAccountOperationFilterEvent {
  const _$AddAccountOperationFilterEventImpl({required this.account});

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
            other is _$AddAccountOperationFilterEventImpl &&
            (identical(other.account, account) || other.account == account));
  }

  @override
  int get hashCode => Object.hash(runtimeType, account);

  @JsonKey(ignore: true)
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
      {required final Account account}) = _$AddAccountOperationFilterEventImpl;

  Account get account;
  @JsonKey(ignore: true)
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
  $Res call({Account account});

  $AccountCopyWith<$Res> get account;
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
  }) {
    return _then(_$RemoveAccountOperationFilterEventImpl(
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

class _$RemoveAccountOperationFilterEventImpl
    implements _RemoveAccountOperationFilterEvent {
  const _$RemoveAccountOperationFilterEventImpl({required this.account});

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
            other is _$RemoveAccountOperationFilterEventImpl &&
            (identical(other.account, account) || other.account == account));
  }

  @override
  int get hashCode => Object.hash(runtimeType, account);

  @JsonKey(ignore: true)
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
          {required final Account account}) =
      _$RemoveAccountOperationFilterEventImpl;

  Account get account;
  @JsonKey(ignore: true)
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
  $Res call({Category category});

  $CategoryCopyWith<$Res> get category;
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
  }) {
    return _then(_$AddCategoryOperationFilterEventImpl(
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

class _$AddCategoryOperationFilterEventImpl
    implements _AddCategoryOperationFilterEvent {
  const _$AddCategoryOperationFilterEventImpl({required this.category});

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
            other is _$AddCategoryOperationFilterEventImpl &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  @JsonKey(ignore: true)
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
          {required final Category category}) =
      _$AddCategoryOperationFilterEventImpl;

  Category get category;
  @JsonKey(ignore: true)
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
  $Res call({Category category});

  $CategoryCopyWith<$Res> get category;
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
  }) {
    return _then(_$RemoveCategoryOperationFilterEventImpl(
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

class _$RemoveCategoryOperationFilterEventImpl
    implements _RemoveCategoryOperationFilterEvent {
  const _$RemoveCategoryOperationFilterEventImpl({required this.category});

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
            other is _$RemoveCategoryOperationFilterEventImpl &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  @JsonKey(ignore: true)
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
      _$RemoveCategoryOperationFilterEventImpl;

  Category get category;
  @JsonKey(ignore: true)
  _$$RemoveCategoryOperationFilterEventImplCopyWith<
          _$RemoveCategoryOperationFilterEventImpl>
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
abstract class _$$OperationFilterStateImplCopyWith<$Res>
    implements $OperationFilterStateCopyWith<$Res> {
  factory _$$OperationFilterStateImplCopyWith(_$OperationFilterStateImpl value,
          $Res Function(_$OperationFilterStateImpl) then) =
      __$$OperationFilterStateImplCopyWithImpl<$Res>;
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
class __$$OperationFilterStateImplCopyWithImpl<$Res>
    extends _$OperationFilterStateCopyWithImpl<$Res, _$OperationFilterStateImpl>
    implements _$$OperationFilterStateImplCopyWith<$Res> {
  __$$OperationFilterStateImplCopyWithImpl(_$OperationFilterStateImpl _value,
      $Res Function(_$OperationFilterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
    Object? accounts = null,
    Object? inCategories = null,
    Object? outCategories = null,
  }) {
    return _then(_$OperationFilterStateImpl(
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

class _$OperationFilterStateImpl implements _OperationFilterState {
  const _$OperationFilterStateImpl(
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
            other is _$OperationFilterStateImpl &&
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
  _$$OperationFilterStateImplCopyWith<_$OperationFilterStateImpl>
      get copyWith =>
          __$$OperationFilterStateImplCopyWithImpl<_$OperationFilterStateImpl>(
              this, _$identity);
}

abstract class _OperationFilterState implements OperationFilterState {
  const factory _OperationFilterState(
          {required final OperationListFilter filter,
          required final List<Account> accounts,
          required final List<Category> inCategories,
          required final List<Category> outCategories}) =
      _$OperationFilterStateImpl;

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
  _$$OperationFilterStateImplCopyWith<_$OperationFilterStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
