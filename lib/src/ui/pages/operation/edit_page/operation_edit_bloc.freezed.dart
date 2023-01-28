// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'operation_edit_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OperationEditEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int operationId) fetch,
    required TResult Function(DateTime date) changeDate,
    required TResult Function(TimeOfDay time) changeTime,
    required TResult Function(OperationType operationType) changeOperationType,
    required TResult Function(Account account) changeAccount,
    required TResult Function(Category category) changeCategory,
    required TResult Function(Account recAccount) changeRecAccount,
    required TResult Function(int sum) changeSum,
    required TResult Function() save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int operationId)? fetch,
    TResult? Function(DateTime date)? changeDate,
    TResult? Function(TimeOfDay time)? changeTime,
    TResult? Function(OperationType operationType)? changeOperationType,
    TResult? Function(Account account)? changeAccount,
    TResult? Function(Category category)? changeCategory,
    TResult? Function(Account recAccount)? changeRecAccount,
    TResult? Function(int sum)? changeSum,
    TResult? Function()? save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int operationId)? fetch,
    TResult Function(DateTime date)? changeDate,
    TResult Function(TimeOfDay time)? changeTime,
    TResult Function(OperationType operationType)? changeOperationType,
    TResult Function(Account account)? changeAccount,
    TResult Function(Category category)? changeCategory,
    TResult Function(Account recAccount)? changeRecAccount,
    TResult Function(int sum)? changeSum,
    TResult Function()? save,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchOperationEditEvent value) fetch,
    required TResult Function(_ChangeDateOperationEditEvent value) changeDate,
    required TResult Function(_ChangeTimeOperationEditEvent value) changeTime,
    required TResult Function(_ChangeOperationTypeOperationEditEvent value)
        changeOperationType,
    required TResult Function(_ChangeAccountOperationEditEvent value)
        changeAccount,
    required TResult Function(_ChangeCategoryOperationEditEvent value)
        changeCategory,
    required TResult Function(_ChangeRecAccountOperationEditEvent value)
        changeRecAccount,
    required TResult Function(_ChangeSumOperationEditEvent value) changeSum,
    required TResult Function(_SaveOperationEditEvent value) save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchOperationEditEvent value)? fetch,
    TResult? Function(_ChangeDateOperationEditEvent value)? changeDate,
    TResult? Function(_ChangeTimeOperationEditEvent value)? changeTime,
    TResult? Function(_ChangeOperationTypeOperationEditEvent value)?
        changeOperationType,
    TResult? Function(_ChangeAccountOperationEditEvent value)? changeAccount,
    TResult? Function(_ChangeCategoryOperationEditEvent value)? changeCategory,
    TResult? Function(_ChangeRecAccountOperationEditEvent value)?
        changeRecAccount,
    TResult? Function(_ChangeSumOperationEditEvent value)? changeSum,
    TResult? Function(_SaveOperationEditEvent value)? save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchOperationEditEvent value)? fetch,
    TResult Function(_ChangeDateOperationEditEvent value)? changeDate,
    TResult Function(_ChangeTimeOperationEditEvent value)? changeTime,
    TResult Function(_ChangeOperationTypeOperationEditEvent value)?
        changeOperationType,
    TResult Function(_ChangeAccountOperationEditEvent value)? changeAccount,
    TResult Function(_ChangeCategoryOperationEditEvent value)? changeCategory,
    TResult Function(_ChangeRecAccountOperationEditEvent value)?
        changeRecAccount,
    TResult Function(_ChangeSumOperationEditEvent value)? changeSum,
    TResult Function(_SaveOperationEditEvent value)? save,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OperationEditEventCopyWith<$Res> {
  factory $OperationEditEventCopyWith(
          OperationEditEvent value, $Res Function(OperationEditEvent) then) =
      _$OperationEditEventCopyWithImpl<$Res, OperationEditEvent>;
}

/// @nodoc
class _$OperationEditEventCopyWithImpl<$Res, $Val extends OperationEditEvent>
    implements $OperationEditEventCopyWith<$Res> {
  _$OperationEditEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_FetchOperationEditEventCopyWith<$Res> {
  factory _$$_FetchOperationEditEventCopyWith(_$_FetchOperationEditEvent value,
          $Res Function(_$_FetchOperationEditEvent) then) =
      __$$_FetchOperationEditEventCopyWithImpl<$Res>;
  @useResult
  $Res call({int operationId});
}

/// @nodoc
class __$$_FetchOperationEditEventCopyWithImpl<$Res>
    extends _$OperationEditEventCopyWithImpl<$Res, _$_FetchOperationEditEvent>
    implements _$$_FetchOperationEditEventCopyWith<$Res> {
  __$$_FetchOperationEditEventCopyWithImpl(_$_FetchOperationEditEvent _value,
      $Res Function(_$_FetchOperationEditEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operationId = null,
  }) {
    return _then(_$_FetchOperationEditEvent(
      operationId: null == operationId
          ? _value.operationId
          : operationId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_FetchOperationEditEvent implements _FetchOperationEditEvent {
  const _$_FetchOperationEditEvent({required this.operationId});

  @override
  final int operationId;

  @override
  String toString() {
    return 'OperationEditEvent.fetch(operationId: $operationId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchOperationEditEvent &&
            (identical(other.operationId, operationId) ||
                other.operationId == operationId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, operationId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchOperationEditEventCopyWith<_$_FetchOperationEditEvent>
      get copyWith =>
          __$$_FetchOperationEditEventCopyWithImpl<_$_FetchOperationEditEvent>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int operationId) fetch,
    required TResult Function(DateTime date) changeDate,
    required TResult Function(TimeOfDay time) changeTime,
    required TResult Function(OperationType operationType) changeOperationType,
    required TResult Function(Account account) changeAccount,
    required TResult Function(Category category) changeCategory,
    required TResult Function(Account recAccount) changeRecAccount,
    required TResult Function(int sum) changeSum,
    required TResult Function() save,
  }) {
    return fetch(operationId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int operationId)? fetch,
    TResult? Function(DateTime date)? changeDate,
    TResult? Function(TimeOfDay time)? changeTime,
    TResult? Function(OperationType operationType)? changeOperationType,
    TResult? Function(Account account)? changeAccount,
    TResult? Function(Category category)? changeCategory,
    TResult? Function(Account recAccount)? changeRecAccount,
    TResult? Function(int sum)? changeSum,
    TResult? Function()? save,
  }) {
    return fetch?.call(operationId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int operationId)? fetch,
    TResult Function(DateTime date)? changeDate,
    TResult Function(TimeOfDay time)? changeTime,
    TResult Function(OperationType operationType)? changeOperationType,
    TResult Function(Account account)? changeAccount,
    TResult Function(Category category)? changeCategory,
    TResult Function(Account recAccount)? changeRecAccount,
    TResult Function(int sum)? changeSum,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(operationId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchOperationEditEvent value) fetch,
    required TResult Function(_ChangeDateOperationEditEvent value) changeDate,
    required TResult Function(_ChangeTimeOperationEditEvent value) changeTime,
    required TResult Function(_ChangeOperationTypeOperationEditEvent value)
        changeOperationType,
    required TResult Function(_ChangeAccountOperationEditEvent value)
        changeAccount,
    required TResult Function(_ChangeCategoryOperationEditEvent value)
        changeCategory,
    required TResult Function(_ChangeRecAccountOperationEditEvent value)
        changeRecAccount,
    required TResult Function(_ChangeSumOperationEditEvent value) changeSum,
    required TResult Function(_SaveOperationEditEvent value) save,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchOperationEditEvent value)? fetch,
    TResult? Function(_ChangeDateOperationEditEvent value)? changeDate,
    TResult? Function(_ChangeTimeOperationEditEvent value)? changeTime,
    TResult? Function(_ChangeOperationTypeOperationEditEvent value)?
        changeOperationType,
    TResult? Function(_ChangeAccountOperationEditEvent value)? changeAccount,
    TResult? Function(_ChangeCategoryOperationEditEvent value)? changeCategory,
    TResult? Function(_ChangeRecAccountOperationEditEvent value)?
        changeRecAccount,
    TResult? Function(_ChangeSumOperationEditEvent value)? changeSum,
    TResult? Function(_SaveOperationEditEvent value)? save,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchOperationEditEvent value)? fetch,
    TResult Function(_ChangeDateOperationEditEvent value)? changeDate,
    TResult Function(_ChangeTimeOperationEditEvent value)? changeTime,
    TResult Function(_ChangeOperationTypeOperationEditEvent value)?
        changeOperationType,
    TResult Function(_ChangeAccountOperationEditEvent value)? changeAccount,
    TResult Function(_ChangeCategoryOperationEditEvent value)? changeCategory,
    TResult Function(_ChangeRecAccountOperationEditEvent value)?
        changeRecAccount,
    TResult Function(_ChangeSumOperationEditEvent value)? changeSum,
    TResult Function(_SaveOperationEditEvent value)? save,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _FetchOperationEditEvent implements OperationEditEvent {
  const factory _FetchOperationEditEvent({required final int operationId}) =
      _$_FetchOperationEditEvent;

  int get operationId;
  @JsonKey(ignore: true)
  _$$_FetchOperationEditEventCopyWith<_$_FetchOperationEditEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeDateOperationEditEventCopyWith<$Res> {
  factory _$$_ChangeDateOperationEditEventCopyWith(
          _$_ChangeDateOperationEditEvent value,
          $Res Function(_$_ChangeDateOperationEditEvent) then) =
      __$$_ChangeDateOperationEditEventCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime date});
}

/// @nodoc
class __$$_ChangeDateOperationEditEventCopyWithImpl<$Res>
    extends _$OperationEditEventCopyWithImpl<$Res,
        _$_ChangeDateOperationEditEvent>
    implements _$$_ChangeDateOperationEditEventCopyWith<$Res> {
  __$$_ChangeDateOperationEditEventCopyWithImpl(
      _$_ChangeDateOperationEditEvent _value,
      $Res Function(_$_ChangeDateOperationEditEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
  }) {
    return _then(_$_ChangeDateOperationEditEvent(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_ChangeDateOperationEditEvent implements _ChangeDateOperationEditEvent {
  const _$_ChangeDateOperationEditEvent({required this.date});

  @override
  final DateTime date;

  @override
  String toString() {
    return 'OperationEditEvent.changeDate(date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeDateOperationEditEvent &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeDateOperationEditEventCopyWith<_$_ChangeDateOperationEditEvent>
      get copyWith => __$$_ChangeDateOperationEditEventCopyWithImpl<
          _$_ChangeDateOperationEditEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int operationId) fetch,
    required TResult Function(DateTime date) changeDate,
    required TResult Function(TimeOfDay time) changeTime,
    required TResult Function(OperationType operationType) changeOperationType,
    required TResult Function(Account account) changeAccount,
    required TResult Function(Category category) changeCategory,
    required TResult Function(Account recAccount) changeRecAccount,
    required TResult Function(int sum) changeSum,
    required TResult Function() save,
  }) {
    return changeDate(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int operationId)? fetch,
    TResult? Function(DateTime date)? changeDate,
    TResult? Function(TimeOfDay time)? changeTime,
    TResult? Function(OperationType operationType)? changeOperationType,
    TResult? Function(Account account)? changeAccount,
    TResult? Function(Category category)? changeCategory,
    TResult? Function(Account recAccount)? changeRecAccount,
    TResult? Function(int sum)? changeSum,
    TResult? Function()? save,
  }) {
    return changeDate?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int operationId)? fetch,
    TResult Function(DateTime date)? changeDate,
    TResult Function(TimeOfDay time)? changeTime,
    TResult Function(OperationType operationType)? changeOperationType,
    TResult Function(Account account)? changeAccount,
    TResult Function(Category category)? changeCategory,
    TResult Function(Account recAccount)? changeRecAccount,
    TResult Function(int sum)? changeSum,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (changeDate != null) {
      return changeDate(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchOperationEditEvent value) fetch,
    required TResult Function(_ChangeDateOperationEditEvent value) changeDate,
    required TResult Function(_ChangeTimeOperationEditEvent value) changeTime,
    required TResult Function(_ChangeOperationTypeOperationEditEvent value)
        changeOperationType,
    required TResult Function(_ChangeAccountOperationEditEvent value)
        changeAccount,
    required TResult Function(_ChangeCategoryOperationEditEvent value)
        changeCategory,
    required TResult Function(_ChangeRecAccountOperationEditEvent value)
        changeRecAccount,
    required TResult Function(_ChangeSumOperationEditEvent value) changeSum,
    required TResult Function(_SaveOperationEditEvent value) save,
  }) {
    return changeDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchOperationEditEvent value)? fetch,
    TResult? Function(_ChangeDateOperationEditEvent value)? changeDate,
    TResult? Function(_ChangeTimeOperationEditEvent value)? changeTime,
    TResult? Function(_ChangeOperationTypeOperationEditEvent value)?
        changeOperationType,
    TResult? Function(_ChangeAccountOperationEditEvent value)? changeAccount,
    TResult? Function(_ChangeCategoryOperationEditEvent value)? changeCategory,
    TResult? Function(_ChangeRecAccountOperationEditEvent value)?
        changeRecAccount,
    TResult? Function(_ChangeSumOperationEditEvent value)? changeSum,
    TResult? Function(_SaveOperationEditEvent value)? save,
  }) {
    return changeDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchOperationEditEvent value)? fetch,
    TResult Function(_ChangeDateOperationEditEvent value)? changeDate,
    TResult Function(_ChangeTimeOperationEditEvent value)? changeTime,
    TResult Function(_ChangeOperationTypeOperationEditEvent value)?
        changeOperationType,
    TResult Function(_ChangeAccountOperationEditEvent value)? changeAccount,
    TResult Function(_ChangeCategoryOperationEditEvent value)? changeCategory,
    TResult Function(_ChangeRecAccountOperationEditEvent value)?
        changeRecAccount,
    TResult Function(_ChangeSumOperationEditEvent value)? changeSum,
    TResult Function(_SaveOperationEditEvent value)? save,
    required TResult orElse(),
  }) {
    if (changeDate != null) {
      return changeDate(this);
    }
    return orElse();
  }
}

abstract class _ChangeDateOperationEditEvent implements OperationEditEvent {
  const factory _ChangeDateOperationEditEvent({required final DateTime date}) =
      _$_ChangeDateOperationEditEvent;

  DateTime get date;
  @JsonKey(ignore: true)
  _$$_ChangeDateOperationEditEventCopyWith<_$_ChangeDateOperationEditEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeTimeOperationEditEventCopyWith<$Res> {
  factory _$$_ChangeTimeOperationEditEventCopyWith(
          _$_ChangeTimeOperationEditEvent value,
          $Res Function(_$_ChangeTimeOperationEditEvent) then) =
      __$$_ChangeTimeOperationEditEventCopyWithImpl<$Res>;
  @useResult
  $Res call({TimeOfDay time});
}

/// @nodoc
class __$$_ChangeTimeOperationEditEventCopyWithImpl<$Res>
    extends _$OperationEditEventCopyWithImpl<$Res,
        _$_ChangeTimeOperationEditEvent>
    implements _$$_ChangeTimeOperationEditEventCopyWith<$Res> {
  __$$_ChangeTimeOperationEditEventCopyWithImpl(
      _$_ChangeTimeOperationEditEvent _value,
      $Res Function(_$_ChangeTimeOperationEditEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
  }) {
    return _then(_$_ChangeTimeOperationEditEvent(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
    ));
  }
}

/// @nodoc

class _$_ChangeTimeOperationEditEvent implements _ChangeTimeOperationEditEvent {
  const _$_ChangeTimeOperationEditEvent({required this.time});

  @override
  final TimeOfDay time;

  @override
  String toString() {
    return 'OperationEditEvent.changeTime(time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeTimeOperationEditEvent &&
            (identical(other.time, time) || other.time == time));
  }

  @override
  int get hashCode => Object.hash(runtimeType, time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeTimeOperationEditEventCopyWith<_$_ChangeTimeOperationEditEvent>
      get copyWith => __$$_ChangeTimeOperationEditEventCopyWithImpl<
          _$_ChangeTimeOperationEditEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int operationId) fetch,
    required TResult Function(DateTime date) changeDate,
    required TResult Function(TimeOfDay time) changeTime,
    required TResult Function(OperationType operationType) changeOperationType,
    required TResult Function(Account account) changeAccount,
    required TResult Function(Category category) changeCategory,
    required TResult Function(Account recAccount) changeRecAccount,
    required TResult Function(int sum) changeSum,
    required TResult Function() save,
  }) {
    return changeTime(time);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int operationId)? fetch,
    TResult? Function(DateTime date)? changeDate,
    TResult? Function(TimeOfDay time)? changeTime,
    TResult? Function(OperationType operationType)? changeOperationType,
    TResult? Function(Account account)? changeAccount,
    TResult? Function(Category category)? changeCategory,
    TResult? Function(Account recAccount)? changeRecAccount,
    TResult? Function(int sum)? changeSum,
    TResult? Function()? save,
  }) {
    return changeTime?.call(time);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int operationId)? fetch,
    TResult Function(DateTime date)? changeDate,
    TResult Function(TimeOfDay time)? changeTime,
    TResult Function(OperationType operationType)? changeOperationType,
    TResult Function(Account account)? changeAccount,
    TResult Function(Category category)? changeCategory,
    TResult Function(Account recAccount)? changeRecAccount,
    TResult Function(int sum)? changeSum,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (changeTime != null) {
      return changeTime(time);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchOperationEditEvent value) fetch,
    required TResult Function(_ChangeDateOperationEditEvent value) changeDate,
    required TResult Function(_ChangeTimeOperationEditEvent value) changeTime,
    required TResult Function(_ChangeOperationTypeOperationEditEvent value)
        changeOperationType,
    required TResult Function(_ChangeAccountOperationEditEvent value)
        changeAccount,
    required TResult Function(_ChangeCategoryOperationEditEvent value)
        changeCategory,
    required TResult Function(_ChangeRecAccountOperationEditEvent value)
        changeRecAccount,
    required TResult Function(_ChangeSumOperationEditEvent value) changeSum,
    required TResult Function(_SaveOperationEditEvent value) save,
  }) {
    return changeTime(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchOperationEditEvent value)? fetch,
    TResult? Function(_ChangeDateOperationEditEvent value)? changeDate,
    TResult? Function(_ChangeTimeOperationEditEvent value)? changeTime,
    TResult? Function(_ChangeOperationTypeOperationEditEvent value)?
        changeOperationType,
    TResult? Function(_ChangeAccountOperationEditEvent value)? changeAccount,
    TResult? Function(_ChangeCategoryOperationEditEvent value)? changeCategory,
    TResult? Function(_ChangeRecAccountOperationEditEvent value)?
        changeRecAccount,
    TResult? Function(_ChangeSumOperationEditEvent value)? changeSum,
    TResult? Function(_SaveOperationEditEvent value)? save,
  }) {
    return changeTime?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchOperationEditEvent value)? fetch,
    TResult Function(_ChangeDateOperationEditEvent value)? changeDate,
    TResult Function(_ChangeTimeOperationEditEvent value)? changeTime,
    TResult Function(_ChangeOperationTypeOperationEditEvent value)?
        changeOperationType,
    TResult Function(_ChangeAccountOperationEditEvent value)? changeAccount,
    TResult Function(_ChangeCategoryOperationEditEvent value)? changeCategory,
    TResult Function(_ChangeRecAccountOperationEditEvent value)?
        changeRecAccount,
    TResult Function(_ChangeSumOperationEditEvent value)? changeSum,
    TResult Function(_SaveOperationEditEvent value)? save,
    required TResult orElse(),
  }) {
    if (changeTime != null) {
      return changeTime(this);
    }
    return orElse();
  }
}

abstract class _ChangeTimeOperationEditEvent implements OperationEditEvent {
  const factory _ChangeTimeOperationEditEvent({required final TimeOfDay time}) =
      _$_ChangeTimeOperationEditEvent;

  TimeOfDay get time;
  @JsonKey(ignore: true)
  _$$_ChangeTimeOperationEditEventCopyWith<_$_ChangeTimeOperationEditEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeOperationTypeOperationEditEventCopyWith<$Res> {
  factory _$$_ChangeOperationTypeOperationEditEventCopyWith(
          _$_ChangeOperationTypeOperationEditEvent value,
          $Res Function(_$_ChangeOperationTypeOperationEditEvent) then) =
      __$$_ChangeOperationTypeOperationEditEventCopyWithImpl<$Res>;
  @useResult
  $Res call({OperationType operationType});
}

/// @nodoc
class __$$_ChangeOperationTypeOperationEditEventCopyWithImpl<$Res>
    extends _$OperationEditEventCopyWithImpl<$Res,
        _$_ChangeOperationTypeOperationEditEvent>
    implements _$$_ChangeOperationTypeOperationEditEventCopyWith<$Res> {
  __$$_ChangeOperationTypeOperationEditEventCopyWithImpl(
      _$_ChangeOperationTypeOperationEditEvent _value,
      $Res Function(_$_ChangeOperationTypeOperationEditEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operationType = null,
  }) {
    return _then(_$_ChangeOperationTypeOperationEditEvent(
      operationType: null == operationType
          ? _value.operationType
          : operationType // ignore: cast_nullable_to_non_nullable
              as OperationType,
    ));
  }
}

/// @nodoc

class _$_ChangeOperationTypeOperationEditEvent
    implements _ChangeOperationTypeOperationEditEvent {
  const _$_ChangeOperationTypeOperationEditEvent({required this.operationType});

  @override
  final OperationType operationType;

  @override
  String toString() {
    return 'OperationEditEvent.changeOperationType(operationType: $operationType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeOperationTypeOperationEditEvent &&
            (identical(other.operationType, operationType) ||
                other.operationType == operationType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, operationType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeOperationTypeOperationEditEventCopyWith<
          _$_ChangeOperationTypeOperationEditEvent>
      get copyWith => __$$_ChangeOperationTypeOperationEditEventCopyWithImpl<
          _$_ChangeOperationTypeOperationEditEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int operationId) fetch,
    required TResult Function(DateTime date) changeDate,
    required TResult Function(TimeOfDay time) changeTime,
    required TResult Function(OperationType operationType) changeOperationType,
    required TResult Function(Account account) changeAccount,
    required TResult Function(Category category) changeCategory,
    required TResult Function(Account recAccount) changeRecAccount,
    required TResult Function(int sum) changeSum,
    required TResult Function() save,
  }) {
    return changeOperationType(operationType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int operationId)? fetch,
    TResult? Function(DateTime date)? changeDate,
    TResult? Function(TimeOfDay time)? changeTime,
    TResult? Function(OperationType operationType)? changeOperationType,
    TResult? Function(Account account)? changeAccount,
    TResult? Function(Category category)? changeCategory,
    TResult? Function(Account recAccount)? changeRecAccount,
    TResult? Function(int sum)? changeSum,
    TResult? Function()? save,
  }) {
    return changeOperationType?.call(operationType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int operationId)? fetch,
    TResult Function(DateTime date)? changeDate,
    TResult Function(TimeOfDay time)? changeTime,
    TResult Function(OperationType operationType)? changeOperationType,
    TResult Function(Account account)? changeAccount,
    TResult Function(Category category)? changeCategory,
    TResult Function(Account recAccount)? changeRecAccount,
    TResult Function(int sum)? changeSum,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (changeOperationType != null) {
      return changeOperationType(operationType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchOperationEditEvent value) fetch,
    required TResult Function(_ChangeDateOperationEditEvent value) changeDate,
    required TResult Function(_ChangeTimeOperationEditEvent value) changeTime,
    required TResult Function(_ChangeOperationTypeOperationEditEvent value)
        changeOperationType,
    required TResult Function(_ChangeAccountOperationEditEvent value)
        changeAccount,
    required TResult Function(_ChangeCategoryOperationEditEvent value)
        changeCategory,
    required TResult Function(_ChangeRecAccountOperationEditEvent value)
        changeRecAccount,
    required TResult Function(_ChangeSumOperationEditEvent value) changeSum,
    required TResult Function(_SaveOperationEditEvent value) save,
  }) {
    return changeOperationType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchOperationEditEvent value)? fetch,
    TResult? Function(_ChangeDateOperationEditEvent value)? changeDate,
    TResult? Function(_ChangeTimeOperationEditEvent value)? changeTime,
    TResult? Function(_ChangeOperationTypeOperationEditEvent value)?
        changeOperationType,
    TResult? Function(_ChangeAccountOperationEditEvent value)? changeAccount,
    TResult? Function(_ChangeCategoryOperationEditEvent value)? changeCategory,
    TResult? Function(_ChangeRecAccountOperationEditEvent value)?
        changeRecAccount,
    TResult? Function(_ChangeSumOperationEditEvent value)? changeSum,
    TResult? Function(_SaveOperationEditEvent value)? save,
  }) {
    return changeOperationType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchOperationEditEvent value)? fetch,
    TResult Function(_ChangeDateOperationEditEvent value)? changeDate,
    TResult Function(_ChangeTimeOperationEditEvent value)? changeTime,
    TResult Function(_ChangeOperationTypeOperationEditEvent value)?
        changeOperationType,
    TResult Function(_ChangeAccountOperationEditEvent value)? changeAccount,
    TResult Function(_ChangeCategoryOperationEditEvent value)? changeCategory,
    TResult Function(_ChangeRecAccountOperationEditEvent value)?
        changeRecAccount,
    TResult Function(_ChangeSumOperationEditEvent value)? changeSum,
    TResult Function(_SaveOperationEditEvent value)? save,
    required TResult orElse(),
  }) {
    if (changeOperationType != null) {
      return changeOperationType(this);
    }
    return orElse();
  }
}

abstract class _ChangeOperationTypeOperationEditEvent
    implements OperationEditEvent {
  const factory _ChangeOperationTypeOperationEditEvent(
          {required final OperationType operationType}) =
      _$_ChangeOperationTypeOperationEditEvent;

  OperationType get operationType;
  @JsonKey(ignore: true)
  _$$_ChangeOperationTypeOperationEditEventCopyWith<
          _$_ChangeOperationTypeOperationEditEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeAccountOperationEditEventCopyWith<$Res> {
  factory _$$_ChangeAccountOperationEditEventCopyWith(
          _$_ChangeAccountOperationEditEvent value,
          $Res Function(_$_ChangeAccountOperationEditEvent) then) =
      __$$_ChangeAccountOperationEditEventCopyWithImpl<$Res>;
  @useResult
  $Res call({Account account});

  $AccountCopyWith<$Res> get account;
}

/// @nodoc
class __$$_ChangeAccountOperationEditEventCopyWithImpl<$Res>
    extends _$OperationEditEventCopyWithImpl<$Res,
        _$_ChangeAccountOperationEditEvent>
    implements _$$_ChangeAccountOperationEditEventCopyWith<$Res> {
  __$$_ChangeAccountOperationEditEventCopyWithImpl(
      _$_ChangeAccountOperationEditEvent _value,
      $Res Function(_$_ChangeAccountOperationEditEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
  }) {
    return _then(_$_ChangeAccountOperationEditEvent(
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

class _$_ChangeAccountOperationEditEvent
    implements _ChangeAccountOperationEditEvent {
  const _$_ChangeAccountOperationEditEvent({required this.account});

  @override
  final Account account;

  @override
  String toString() {
    return 'OperationEditEvent.changeAccount(account: $account)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeAccountOperationEditEvent &&
            (identical(other.account, account) || other.account == account));
  }

  @override
  int get hashCode => Object.hash(runtimeType, account);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeAccountOperationEditEventCopyWith<
          _$_ChangeAccountOperationEditEvent>
      get copyWith => __$$_ChangeAccountOperationEditEventCopyWithImpl<
          _$_ChangeAccountOperationEditEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int operationId) fetch,
    required TResult Function(DateTime date) changeDate,
    required TResult Function(TimeOfDay time) changeTime,
    required TResult Function(OperationType operationType) changeOperationType,
    required TResult Function(Account account) changeAccount,
    required TResult Function(Category category) changeCategory,
    required TResult Function(Account recAccount) changeRecAccount,
    required TResult Function(int sum) changeSum,
    required TResult Function() save,
  }) {
    return changeAccount(account);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int operationId)? fetch,
    TResult? Function(DateTime date)? changeDate,
    TResult? Function(TimeOfDay time)? changeTime,
    TResult? Function(OperationType operationType)? changeOperationType,
    TResult? Function(Account account)? changeAccount,
    TResult? Function(Category category)? changeCategory,
    TResult? Function(Account recAccount)? changeRecAccount,
    TResult? Function(int sum)? changeSum,
    TResult? Function()? save,
  }) {
    return changeAccount?.call(account);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int operationId)? fetch,
    TResult Function(DateTime date)? changeDate,
    TResult Function(TimeOfDay time)? changeTime,
    TResult Function(OperationType operationType)? changeOperationType,
    TResult Function(Account account)? changeAccount,
    TResult Function(Category category)? changeCategory,
    TResult Function(Account recAccount)? changeRecAccount,
    TResult Function(int sum)? changeSum,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (changeAccount != null) {
      return changeAccount(account);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchOperationEditEvent value) fetch,
    required TResult Function(_ChangeDateOperationEditEvent value) changeDate,
    required TResult Function(_ChangeTimeOperationEditEvent value) changeTime,
    required TResult Function(_ChangeOperationTypeOperationEditEvent value)
        changeOperationType,
    required TResult Function(_ChangeAccountOperationEditEvent value)
        changeAccount,
    required TResult Function(_ChangeCategoryOperationEditEvent value)
        changeCategory,
    required TResult Function(_ChangeRecAccountOperationEditEvent value)
        changeRecAccount,
    required TResult Function(_ChangeSumOperationEditEvent value) changeSum,
    required TResult Function(_SaveOperationEditEvent value) save,
  }) {
    return changeAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchOperationEditEvent value)? fetch,
    TResult? Function(_ChangeDateOperationEditEvent value)? changeDate,
    TResult? Function(_ChangeTimeOperationEditEvent value)? changeTime,
    TResult? Function(_ChangeOperationTypeOperationEditEvent value)?
        changeOperationType,
    TResult? Function(_ChangeAccountOperationEditEvent value)? changeAccount,
    TResult? Function(_ChangeCategoryOperationEditEvent value)? changeCategory,
    TResult? Function(_ChangeRecAccountOperationEditEvent value)?
        changeRecAccount,
    TResult? Function(_ChangeSumOperationEditEvent value)? changeSum,
    TResult? Function(_SaveOperationEditEvent value)? save,
  }) {
    return changeAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchOperationEditEvent value)? fetch,
    TResult Function(_ChangeDateOperationEditEvent value)? changeDate,
    TResult Function(_ChangeTimeOperationEditEvent value)? changeTime,
    TResult Function(_ChangeOperationTypeOperationEditEvent value)?
        changeOperationType,
    TResult Function(_ChangeAccountOperationEditEvent value)? changeAccount,
    TResult Function(_ChangeCategoryOperationEditEvent value)? changeCategory,
    TResult Function(_ChangeRecAccountOperationEditEvent value)?
        changeRecAccount,
    TResult Function(_ChangeSumOperationEditEvent value)? changeSum,
    TResult Function(_SaveOperationEditEvent value)? save,
    required TResult orElse(),
  }) {
    if (changeAccount != null) {
      return changeAccount(this);
    }
    return orElse();
  }
}

abstract class _ChangeAccountOperationEditEvent implements OperationEditEvent {
  const factory _ChangeAccountOperationEditEvent(
      {required final Account account}) = _$_ChangeAccountOperationEditEvent;

  Account get account;
  @JsonKey(ignore: true)
  _$$_ChangeAccountOperationEditEventCopyWith<
          _$_ChangeAccountOperationEditEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeCategoryOperationEditEventCopyWith<$Res> {
  factory _$$_ChangeCategoryOperationEditEventCopyWith(
          _$_ChangeCategoryOperationEditEvent value,
          $Res Function(_$_ChangeCategoryOperationEditEvent) then) =
      __$$_ChangeCategoryOperationEditEventCopyWithImpl<$Res>;
  @useResult
  $Res call({Category category});

  $CategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$$_ChangeCategoryOperationEditEventCopyWithImpl<$Res>
    extends _$OperationEditEventCopyWithImpl<$Res,
        _$_ChangeCategoryOperationEditEvent>
    implements _$$_ChangeCategoryOperationEditEventCopyWith<$Res> {
  __$$_ChangeCategoryOperationEditEventCopyWithImpl(
      _$_ChangeCategoryOperationEditEvent _value,
      $Res Function(_$_ChangeCategoryOperationEditEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
  }) {
    return _then(_$_ChangeCategoryOperationEditEvent(
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

class _$_ChangeCategoryOperationEditEvent
    implements _ChangeCategoryOperationEditEvent {
  const _$_ChangeCategoryOperationEditEvent({required this.category});

  @override
  final Category category;

  @override
  String toString() {
    return 'OperationEditEvent.changeCategory(category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeCategoryOperationEditEvent &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeCategoryOperationEditEventCopyWith<
          _$_ChangeCategoryOperationEditEvent>
      get copyWith => __$$_ChangeCategoryOperationEditEventCopyWithImpl<
          _$_ChangeCategoryOperationEditEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int operationId) fetch,
    required TResult Function(DateTime date) changeDate,
    required TResult Function(TimeOfDay time) changeTime,
    required TResult Function(OperationType operationType) changeOperationType,
    required TResult Function(Account account) changeAccount,
    required TResult Function(Category category) changeCategory,
    required TResult Function(Account recAccount) changeRecAccount,
    required TResult Function(int sum) changeSum,
    required TResult Function() save,
  }) {
    return changeCategory(category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int operationId)? fetch,
    TResult? Function(DateTime date)? changeDate,
    TResult? Function(TimeOfDay time)? changeTime,
    TResult? Function(OperationType operationType)? changeOperationType,
    TResult? Function(Account account)? changeAccount,
    TResult? Function(Category category)? changeCategory,
    TResult? Function(Account recAccount)? changeRecAccount,
    TResult? Function(int sum)? changeSum,
    TResult? Function()? save,
  }) {
    return changeCategory?.call(category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int operationId)? fetch,
    TResult Function(DateTime date)? changeDate,
    TResult Function(TimeOfDay time)? changeTime,
    TResult Function(OperationType operationType)? changeOperationType,
    TResult Function(Account account)? changeAccount,
    TResult Function(Category category)? changeCategory,
    TResult Function(Account recAccount)? changeRecAccount,
    TResult Function(int sum)? changeSum,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (changeCategory != null) {
      return changeCategory(category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchOperationEditEvent value) fetch,
    required TResult Function(_ChangeDateOperationEditEvent value) changeDate,
    required TResult Function(_ChangeTimeOperationEditEvent value) changeTime,
    required TResult Function(_ChangeOperationTypeOperationEditEvent value)
        changeOperationType,
    required TResult Function(_ChangeAccountOperationEditEvent value)
        changeAccount,
    required TResult Function(_ChangeCategoryOperationEditEvent value)
        changeCategory,
    required TResult Function(_ChangeRecAccountOperationEditEvent value)
        changeRecAccount,
    required TResult Function(_ChangeSumOperationEditEvent value) changeSum,
    required TResult Function(_SaveOperationEditEvent value) save,
  }) {
    return changeCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchOperationEditEvent value)? fetch,
    TResult? Function(_ChangeDateOperationEditEvent value)? changeDate,
    TResult? Function(_ChangeTimeOperationEditEvent value)? changeTime,
    TResult? Function(_ChangeOperationTypeOperationEditEvent value)?
        changeOperationType,
    TResult? Function(_ChangeAccountOperationEditEvent value)? changeAccount,
    TResult? Function(_ChangeCategoryOperationEditEvent value)? changeCategory,
    TResult? Function(_ChangeRecAccountOperationEditEvent value)?
        changeRecAccount,
    TResult? Function(_ChangeSumOperationEditEvent value)? changeSum,
    TResult? Function(_SaveOperationEditEvent value)? save,
  }) {
    return changeCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchOperationEditEvent value)? fetch,
    TResult Function(_ChangeDateOperationEditEvent value)? changeDate,
    TResult Function(_ChangeTimeOperationEditEvent value)? changeTime,
    TResult Function(_ChangeOperationTypeOperationEditEvent value)?
        changeOperationType,
    TResult Function(_ChangeAccountOperationEditEvent value)? changeAccount,
    TResult Function(_ChangeCategoryOperationEditEvent value)? changeCategory,
    TResult Function(_ChangeRecAccountOperationEditEvent value)?
        changeRecAccount,
    TResult Function(_ChangeSumOperationEditEvent value)? changeSum,
    TResult Function(_SaveOperationEditEvent value)? save,
    required TResult orElse(),
  }) {
    if (changeCategory != null) {
      return changeCategory(this);
    }
    return orElse();
  }
}

abstract class _ChangeCategoryOperationEditEvent implements OperationEditEvent {
  const factory _ChangeCategoryOperationEditEvent(
      {required final Category category}) = _$_ChangeCategoryOperationEditEvent;

  Category get category;
  @JsonKey(ignore: true)
  _$$_ChangeCategoryOperationEditEventCopyWith<
          _$_ChangeCategoryOperationEditEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeRecAccountOperationEditEventCopyWith<$Res> {
  factory _$$_ChangeRecAccountOperationEditEventCopyWith(
          _$_ChangeRecAccountOperationEditEvent value,
          $Res Function(_$_ChangeRecAccountOperationEditEvent) then) =
      __$$_ChangeRecAccountOperationEditEventCopyWithImpl<$Res>;
  @useResult
  $Res call({Account recAccount});

  $AccountCopyWith<$Res> get recAccount;
}

/// @nodoc
class __$$_ChangeRecAccountOperationEditEventCopyWithImpl<$Res>
    extends _$OperationEditEventCopyWithImpl<$Res,
        _$_ChangeRecAccountOperationEditEvent>
    implements _$$_ChangeRecAccountOperationEditEventCopyWith<$Res> {
  __$$_ChangeRecAccountOperationEditEventCopyWithImpl(
      _$_ChangeRecAccountOperationEditEvent _value,
      $Res Function(_$_ChangeRecAccountOperationEditEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recAccount = null,
  }) {
    return _then(_$_ChangeRecAccountOperationEditEvent(
      recAccount: null == recAccount
          ? _value.recAccount
          : recAccount // ignore: cast_nullable_to_non_nullable
              as Account,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AccountCopyWith<$Res> get recAccount {
    return $AccountCopyWith<$Res>(_value.recAccount, (value) {
      return _then(_value.copyWith(recAccount: value));
    });
  }
}

/// @nodoc

class _$_ChangeRecAccountOperationEditEvent
    implements _ChangeRecAccountOperationEditEvent {
  const _$_ChangeRecAccountOperationEditEvent({required this.recAccount});

  @override
  final Account recAccount;

  @override
  String toString() {
    return 'OperationEditEvent.changeRecAccount(recAccount: $recAccount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeRecAccountOperationEditEvent &&
            (identical(other.recAccount, recAccount) ||
                other.recAccount == recAccount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, recAccount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeRecAccountOperationEditEventCopyWith<
          _$_ChangeRecAccountOperationEditEvent>
      get copyWith => __$$_ChangeRecAccountOperationEditEventCopyWithImpl<
          _$_ChangeRecAccountOperationEditEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int operationId) fetch,
    required TResult Function(DateTime date) changeDate,
    required TResult Function(TimeOfDay time) changeTime,
    required TResult Function(OperationType operationType) changeOperationType,
    required TResult Function(Account account) changeAccount,
    required TResult Function(Category category) changeCategory,
    required TResult Function(Account recAccount) changeRecAccount,
    required TResult Function(int sum) changeSum,
    required TResult Function() save,
  }) {
    return changeRecAccount(recAccount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int operationId)? fetch,
    TResult? Function(DateTime date)? changeDate,
    TResult? Function(TimeOfDay time)? changeTime,
    TResult? Function(OperationType operationType)? changeOperationType,
    TResult? Function(Account account)? changeAccount,
    TResult? Function(Category category)? changeCategory,
    TResult? Function(Account recAccount)? changeRecAccount,
    TResult? Function(int sum)? changeSum,
    TResult? Function()? save,
  }) {
    return changeRecAccount?.call(recAccount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int operationId)? fetch,
    TResult Function(DateTime date)? changeDate,
    TResult Function(TimeOfDay time)? changeTime,
    TResult Function(OperationType operationType)? changeOperationType,
    TResult Function(Account account)? changeAccount,
    TResult Function(Category category)? changeCategory,
    TResult Function(Account recAccount)? changeRecAccount,
    TResult Function(int sum)? changeSum,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (changeRecAccount != null) {
      return changeRecAccount(recAccount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchOperationEditEvent value) fetch,
    required TResult Function(_ChangeDateOperationEditEvent value) changeDate,
    required TResult Function(_ChangeTimeOperationEditEvent value) changeTime,
    required TResult Function(_ChangeOperationTypeOperationEditEvent value)
        changeOperationType,
    required TResult Function(_ChangeAccountOperationEditEvent value)
        changeAccount,
    required TResult Function(_ChangeCategoryOperationEditEvent value)
        changeCategory,
    required TResult Function(_ChangeRecAccountOperationEditEvent value)
        changeRecAccount,
    required TResult Function(_ChangeSumOperationEditEvent value) changeSum,
    required TResult Function(_SaveOperationEditEvent value) save,
  }) {
    return changeRecAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchOperationEditEvent value)? fetch,
    TResult? Function(_ChangeDateOperationEditEvent value)? changeDate,
    TResult? Function(_ChangeTimeOperationEditEvent value)? changeTime,
    TResult? Function(_ChangeOperationTypeOperationEditEvent value)?
        changeOperationType,
    TResult? Function(_ChangeAccountOperationEditEvent value)? changeAccount,
    TResult? Function(_ChangeCategoryOperationEditEvent value)? changeCategory,
    TResult? Function(_ChangeRecAccountOperationEditEvent value)?
        changeRecAccount,
    TResult? Function(_ChangeSumOperationEditEvent value)? changeSum,
    TResult? Function(_SaveOperationEditEvent value)? save,
  }) {
    return changeRecAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchOperationEditEvent value)? fetch,
    TResult Function(_ChangeDateOperationEditEvent value)? changeDate,
    TResult Function(_ChangeTimeOperationEditEvent value)? changeTime,
    TResult Function(_ChangeOperationTypeOperationEditEvent value)?
        changeOperationType,
    TResult Function(_ChangeAccountOperationEditEvent value)? changeAccount,
    TResult Function(_ChangeCategoryOperationEditEvent value)? changeCategory,
    TResult Function(_ChangeRecAccountOperationEditEvent value)?
        changeRecAccount,
    TResult Function(_ChangeSumOperationEditEvent value)? changeSum,
    TResult Function(_SaveOperationEditEvent value)? save,
    required TResult orElse(),
  }) {
    if (changeRecAccount != null) {
      return changeRecAccount(this);
    }
    return orElse();
  }
}

abstract class _ChangeRecAccountOperationEditEvent
    implements OperationEditEvent {
  const factory _ChangeRecAccountOperationEditEvent(
          {required final Account recAccount}) =
      _$_ChangeRecAccountOperationEditEvent;

  Account get recAccount;
  @JsonKey(ignore: true)
  _$$_ChangeRecAccountOperationEditEventCopyWith<
          _$_ChangeRecAccountOperationEditEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeSumOperationEditEventCopyWith<$Res> {
  factory _$$_ChangeSumOperationEditEventCopyWith(
          _$_ChangeSumOperationEditEvent value,
          $Res Function(_$_ChangeSumOperationEditEvent) then) =
      __$$_ChangeSumOperationEditEventCopyWithImpl<$Res>;
  @useResult
  $Res call({int sum});
}

/// @nodoc
class __$$_ChangeSumOperationEditEventCopyWithImpl<$Res>
    extends _$OperationEditEventCopyWithImpl<$Res,
        _$_ChangeSumOperationEditEvent>
    implements _$$_ChangeSumOperationEditEventCopyWith<$Res> {
  __$$_ChangeSumOperationEditEventCopyWithImpl(
      _$_ChangeSumOperationEditEvent _value,
      $Res Function(_$_ChangeSumOperationEditEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sum = null,
  }) {
    return _then(_$_ChangeSumOperationEditEvent(
      sum: null == sum
          ? _value.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ChangeSumOperationEditEvent implements _ChangeSumOperationEditEvent {
  const _$_ChangeSumOperationEditEvent({required this.sum});

  @override
  final int sum;

  @override
  String toString() {
    return 'OperationEditEvent.changeSum(sum: $sum)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeSumOperationEditEvent &&
            (identical(other.sum, sum) || other.sum == sum));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sum);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeSumOperationEditEventCopyWith<_$_ChangeSumOperationEditEvent>
      get copyWith => __$$_ChangeSumOperationEditEventCopyWithImpl<
          _$_ChangeSumOperationEditEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int operationId) fetch,
    required TResult Function(DateTime date) changeDate,
    required TResult Function(TimeOfDay time) changeTime,
    required TResult Function(OperationType operationType) changeOperationType,
    required TResult Function(Account account) changeAccount,
    required TResult Function(Category category) changeCategory,
    required TResult Function(Account recAccount) changeRecAccount,
    required TResult Function(int sum) changeSum,
    required TResult Function() save,
  }) {
    return changeSum(sum);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int operationId)? fetch,
    TResult? Function(DateTime date)? changeDate,
    TResult? Function(TimeOfDay time)? changeTime,
    TResult? Function(OperationType operationType)? changeOperationType,
    TResult? Function(Account account)? changeAccount,
    TResult? Function(Category category)? changeCategory,
    TResult? Function(Account recAccount)? changeRecAccount,
    TResult? Function(int sum)? changeSum,
    TResult? Function()? save,
  }) {
    return changeSum?.call(sum);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int operationId)? fetch,
    TResult Function(DateTime date)? changeDate,
    TResult Function(TimeOfDay time)? changeTime,
    TResult Function(OperationType operationType)? changeOperationType,
    TResult Function(Account account)? changeAccount,
    TResult Function(Category category)? changeCategory,
    TResult Function(Account recAccount)? changeRecAccount,
    TResult Function(int sum)? changeSum,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (changeSum != null) {
      return changeSum(sum);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchOperationEditEvent value) fetch,
    required TResult Function(_ChangeDateOperationEditEvent value) changeDate,
    required TResult Function(_ChangeTimeOperationEditEvent value) changeTime,
    required TResult Function(_ChangeOperationTypeOperationEditEvent value)
        changeOperationType,
    required TResult Function(_ChangeAccountOperationEditEvent value)
        changeAccount,
    required TResult Function(_ChangeCategoryOperationEditEvent value)
        changeCategory,
    required TResult Function(_ChangeRecAccountOperationEditEvent value)
        changeRecAccount,
    required TResult Function(_ChangeSumOperationEditEvent value) changeSum,
    required TResult Function(_SaveOperationEditEvent value) save,
  }) {
    return changeSum(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchOperationEditEvent value)? fetch,
    TResult? Function(_ChangeDateOperationEditEvent value)? changeDate,
    TResult? Function(_ChangeTimeOperationEditEvent value)? changeTime,
    TResult? Function(_ChangeOperationTypeOperationEditEvent value)?
        changeOperationType,
    TResult? Function(_ChangeAccountOperationEditEvent value)? changeAccount,
    TResult? Function(_ChangeCategoryOperationEditEvent value)? changeCategory,
    TResult? Function(_ChangeRecAccountOperationEditEvent value)?
        changeRecAccount,
    TResult? Function(_ChangeSumOperationEditEvent value)? changeSum,
    TResult? Function(_SaveOperationEditEvent value)? save,
  }) {
    return changeSum?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchOperationEditEvent value)? fetch,
    TResult Function(_ChangeDateOperationEditEvent value)? changeDate,
    TResult Function(_ChangeTimeOperationEditEvent value)? changeTime,
    TResult Function(_ChangeOperationTypeOperationEditEvent value)?
        changeOperationType,
    TResult Function(_ChangeAccountOperationEditEvent value)? changeAccount,
    TResult Function(_ChangeCategoryOperationEditEvent value)? changeCategory,
    TResult Function(_ChangeRecAccountOperationEditEvent value)?
        changeRecAccount,
    TResult Function(_ChangeSumOperationEditEvent value)? changeSum,
    TResult Function(_SaveOperationEditEvent value)? save,
    required TResult orElse(),
  }) {
    if (changeSum != null) {
      return changeSum(this);
    }
    return orElse();
  }
}

abstract class _ChangeSumOperationEditEvent implements OperationEditEvent {
  const factory _ChangeSumOperationEditEvent({required final int sum}) =
      _$_ChangeSumOperationEditEvent;

  int get sum;
  @JsonKey(ignore: true)
  _$$_ChangeSumOperationEditEventCopyWith<_$_ChangeSumOperationEditEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SaveOperationEditEventCopyWith<$Res> {
  factory _$$_SaveOperationEditEventCopyWith(_$_SaveOperationEditEvent value,
          $Res Function(_$_SaveOperationEditEvent) then) =
      __$$_SaveOperationEditEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SaveOperationEditEventCopyWithImpl<$Res>
    extends _$OperationEditEventCopyWithImpl<$Res, _$_SaveOperationEditEvent>
    implements _$$_SaveOperationEditEventCopyWith<$Res> {
  __$$_SaveOperationEditEventCopyWithImpl(_$_SaveOperationEditEvent _value,
      $Res Function(_$_SaveOperationEditEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SaveOperationEditEvent implements _SaveOperationEditEvent {
  const _$_SaveOperationEditEvent();

  @override
  String toString() {
    return 'OperationEditEvent.save()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SaveOperationEditEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int operationId) fetch,
    required TResult Function(DateTime date) changeDate,
    required TResult Function(TimeOfDay time) changeTime,
    required TResult Function(OperationType operationType) changeOperationType,
    required TResult Function(Account account) changeAccount,
    required TResult Function(Category category) changeCategory,
    required TResult Function(Account recAccount) changeRecAccount,
    required TResult Function(int sum) changeSum,
    required TResult Function() save,
  }) {
    return save();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int operationId)? fetch,
    TResult? Function(DateTime date)? changeDate,
    TResult? Function(TimeOfDay time)? changeTime,
    TResult? Function(OperationType operationType)? changeOperationType,
    TResult? Function(Account account)? changeAccount,
    TResult? Function(Category category)? changeCategory,
    TResult? Function(Account recAccount)? changeRecAccount,
    TResult? Function(int sum)? changeSum,
    TResult? Function()? save,
  }) {
    return save?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int operationId)? fetch,
    TResult Function(DateTime date)? changeDate,
    TResult Function(TimeOfDay time)? changeTime,
    TResult Function(OperationType operationType)? changeOperationType,
    TResult Function(Account account)? changeAccount,
    TResult Function(Category category)? changeCategory,
    TResult Function(Account recAccount)? changeRecAccount,
    TResult Function(int sum)? changeSum,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchOperationEditEvent value) fetch,
    required TResult Function(_ChangeDateOperationEditEvent value) changeDate,
    required TResult Function(_ChangeTimeOperationEditEvent value) changeTime,
    required TResult Function(_ChangeOperationTypeOperationEditEvent value)
        changeOperationType,
    required TResult Function(_ChangeAccountOperationEditEvent value)
        changeAccount,
    required TResult Function(_ChangeCategoryOperationEditEvent value)
        changeCategory,
    required TResult Function(_ChangeRecAccountOperationEditEvent value)
        changeRecAccount,
    required TResult Function(_ChangeSumOperationEditEvent value) changeSum,
    required TResult Function(_SaveOperationEditEvent value) save,
  }) {
    return save(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchOperationEditEvent value)? fetch,
    TResult? Function(_ChangeDateOperationEditEvent value)? changeDate,
    TResult? Function(_ChangeTimeOperationEditEvent value)? changeTime,
    TResult? Function(_ChangeOperationTypeOperationEditEvent value)?
        changeOperationType,
    TResult? Function(_ChangeAccountOperationEditEvent value)? changeAccount,
    TResult? Function(_ChangeCategoryOperationEditEvent value)? changeCategory,
    TResult? Function(_ChangeRecAccountOperationEditEvent value)?
        changeRecAccount,
    TResult? Function(_ChangeSumOperationEditEvent value)? changeSum,
    TResult? Function(_SaveOperationEditEvent value)? save,
  }) {
    return save?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchOperationEditEvent value)? fetch,
    TResult Function(_ChangeDateOperationEditEvent value)? changeDate,
    TResult Function(_ChangeTimeOperationEditEvent value)? changeTime,
    TResult Function(_ChangeOperationTypeOperationEditEvent value)?
        changeOperationType,
    TResult Function(_ChangeAccountOperationEditEvent value)? changeAccount,
    TResult Function(_ChangeCategoryOperationEditEvent value)? changeCategory,
    TResult Function(_ChangeRecAccountOperationEditEvent value)?
        changeRecAccount,
    TResult Function(_ChangeSumOperationEditEvent value)? changeSum,
    TResult Function(_SaveOperationEditEvent value)? save,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save(this);
    }
    return orElse();
  }
}

abstract class _SaveOperationEditEvent implements OperationEditEvent {
  const factory _SaveOperationEditEvent() = _$_SaveOperationEditEvent;
}

/// @nodoc
mixin _$OperationEditState {
  Operation get operation => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  TimeOfDay get time => throw _privateConstructorUsedError;
  OperationType get operationType => throw _privateConstructorUsedError;
  Account get account => throw _privateConstructorUsedError;
  Category? get category => throw _privateConstructorUsedError;
  Account? get recAccount => throw _privateConstructorUsedError;
  int get sum => throw _privateConstructorUsedError;
  List<Account> get accounts => throw _privateConstructorUsedError;
  List<Category> get inCategories => throw _privateConstructorUsedError;
  List<Category> get outCategories => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Operation operation,
            DateTime date,
            TimeOfDay time,
            OperationType operationType,
            Account account,
            Category? category,
            Account? recAccount,
            int sum,
            List<Account> accounts,
            List<Category> inCategories,
            List<Category> outCategories)
        main,
    required TResult Function(
            Operation operation,
            DateTime date,
            TimeOfDay time,
            OperationType operationType,
            Account account,
            Category? category,
            Account? recAccount,
            int sum,
            List<Account> accounts,
            List<Category> inCategories,
            List<Category> outCategories)
        fetched,
    required TResult Function(
            Operation operation,
            DateTime date,
            TimeOfDay time,
            OperationType operationType,
            Account account,
            Category? category,
            Account? recAccount,
            int sum,
            List<Account> accounts,
            List<Category> inCategories,
            List<Category> outCategories)
        saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Operation operation,
            DateTime date,
            TimeOfDay time,
            OperationType operationType,
            Account account,
            Category? category,
            Account? recAccount,
            int sum,
            List<Account> accounts,
            List<Category> inCategories,
            List<Category> outCategories)?
        main,
    TResult? Function(
            Operation operation,
            DateTime date,
            TimeOfDay time,
            OperationType operationType,
            Account account,
            Category? category,
            Account? recAccount,
            int sum,
            List<Account> accounts,
            List<Category> inCategories,
            List<Category> outCategories)?
        fetched,
    TResult? Function(
            Operation operation,
            DateTime date,
            TimeOfDay time,
            OperationType operationType,
            Account account,
            Category? category,
            Account? recAccount,
            int sum,
            List<Account> accounts,
            List<Category> inCategories,
            List<Category> outCategories)?
        saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Operation operation,
            DateTime date,
            TimeOfDay time,
            OperationType operationType,
            Account account,
            Category? category,
            Account? recAccount,
            int sum,
            List<Account> accounts,
            List<Category> inCategories,
            List<Category> outCategories)?
        main,
    TResult Function(
            Operation operation,
            DateTime date,
            TimeOfDay time,
            OperationType operationType,
            Account account,
            Category? category,
            Account? recAccount,
            int sum,
            List<Account> accounts,
            List<Category> inCategories,
            List<Category> outCategories)?
        fetched,
    TResult Function(
            Operation operation,
            DateTime date,
            TimeOfDay time,
            OperationType operationType,
            Account account,
            Category? category,
            Account? recAccount,
            int sum,
            List<Account> accounts,
            List<Category> inCategories,
            List<Category> outCategories)?
        saved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MainOperationEditState value) main,
    required TResult Function(_FetchedOperationEditState value) fetched,
    required TResult Function(_SavedOperationEditState value) saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MainOperationEditState value)? main,
    TResult? Function(_FetchedOperationEditState value)? fetched,
    TResult? Function(_SavedOperationEditState value)? saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MainOperationEditState value)? main,
    TResult Function(_FetchedOperationEditState value)? fetched,
    TResult Function(_SavedOperationEditState value)? saved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OperationEditStateCopyWith<OperationEditState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OperationEditStateCopyWith<$Res> {
  factory $OperationEditStateCopyWith(
          OperationEditState value, $Res Function(OperationEditState) then) =
      _$OperationEditStateCopyWithImpl<$Res, OperationEditState>;
  @useResult
  $Res call(
      {Operation operation,
      DateTime date,
      TimeOfDay time,
      OperationType operationType,
      Account account,
      Category? category,
      Account? recAccount,
      int sum,
      List<Account> accounts,
      List<Category> inCategories,
      List<Category> outCategories});

  $OperationCopyWith<$Res> get operation;
  $AccountCopyWith<$Res> get account;
  $CategoryCopyWith<$Res>? get category;
  $AccountCopyWith<$Res>? get recAccount;
}

/// @nodoc
class _$OperationEditStateCopyWithImpl<$Res, $Val extends OperationEditState>
    implements $OperationEditStateCopyWith<$Res> {
  _$OperationEditStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operation = null,
    Object? date = null,
    Object? time = null,
    Object? operationType = null,
    Object? account = null,
    Object? category = freezed,
    Object? recAccount = freezed,
    Object? sum = null,
    Object? accounts = null,
    Object? inCategories = null,
    Object? outCategories = null,
  }) {
    return _then(_value.copyWith(
      operation: null == operation
          ? _value.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as Operation,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      operationType: null == operationType
          ? _value.operationType
          : operationType // ignore: cast_nullable_to_non_nullable
              as OperationType,
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      recAccount: freezed == recAccount
          ? _value.recAccount
          : recAccount // ignore: cast_nullable_to_non_nullable
              as Account?,
      sum: null == sum
          ? _value.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as int,
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
  $OperationCopyWith<$Res> get operation {
    return $OperationCopyWith<$Res>(_value.operation, (value) {
      return _then(_value.copyWith(operation: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AccountCopyWith<$Res> get account {
    return $AccountCopyWith<$Res>(_value.account, (value) {
      return _then(_value.copyWith(account: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AccountCopyWith<$Res>? get recAccount {
    if (_value.recAccount == null) {
      return null;
    }

    return $AccountCopyWith<$Res>(_value.recAccount!, (value) {
      return _then(_value.copyWith(recAccount: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MainOperationEditStateCopyWith<$Res>
    implements $OperationEditStateCopyWith<$Res> {
  factory _$$_MainOperationEditStateCopyWith(_$_MainOperationEditState value,
          $Res Function(_$_MainOperationEditState) then) =
      __$$_MainOperationEditStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Operation operation,
      DateTime date,
      TimeOfDay time,
      OperationType operationType,
      Account account,
      Category? category,
      Account? recAccount,
      int sum,
      List<Account> accounts,
      List<Category> inCategories,
      List<Category> outCategories});

  @override
  $OperationCopyWith<$Res> get operation;
  @override
  $AccountCopyWith<$Res> get account;
  @override
  $CategoryCopyWith<$Res>? get category;
  @override
  $AccountCopyWith<$Res>? get recAccount;
}

/// @nodoc
class __$$_MainOperationEditStateCopyWithImpl<$Res>
    extends _$OperationEditStateCopyWithImpl<$Res, _$_MainOperationEditState>
    implements _$$_MainOperationEditStateCopyWith<$Res> {
  __$$_MainOperationEditStateCopyWithImpl(_$_MainOperationEditState _value,
      $Res Function(_$_MainOperationEditState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operation = null,
    Object? date = null,
    Object? time = null,
    Object? operationType = null,
    Object? account = null,
    Object? category = freezed,
    Object? recAccount = freezed,
    Object? sum = null,
    Object? accounts = null,
    Object? inCategories = null,
    Object? outCategories = null,
  }) {
    return _then(_$_MainOperationEditState(
      operation: null == operation
          ? _value.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as Operation,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      operationType: null == operationType
          ? _value.operationType
          : operationType // ignore: cast_nullable_to_non_nullable
              as OperationType,
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      recAccount: freezed == recAccount
          ? _value.recAccount
          : recAccount // ignore: cast_nullable_to_non_nullable
              as Account?,
      sum: null == sum
          ? _value.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as int,
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

class _$_MainOperationEditState extends _MainOperationEditState {
  const _$_MainOperationEditState(
      {required this.operation,
      required this.date,
      required this.time,
      required this.operationType,
      required this.account,
      this.category,
      this.recAccount,
      required this.sum,
      required final List<Account> accounts,
      required final List<Category> inCategories,
      required final List<Category> outCategories})
      : _accounts = accounts,
        _inCategories = inCategories,
        _outCategories = outCategories,
        super._();

  @override
  final Operation operation;
  @override
  final DateTime date;
  @override
  final TimeOfDay time;
  @override
  final OperationType operationType;
  @override
  final Account account;
  @override
  final Category? category;
  @override
  final Account? recAccount;
  @override
  final int sum;
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
    return 'OperationEditState.main(operation: $operation, date: $date, time: $time, operationType: $operationType, account: $account, category: $category, recAccount: $recAccount, sum: $sum, accounts: $accounts, inCategories: $inCategories, outCategories: $outCategories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MainOperationEditState &&
            (identical(other.operation, operation) ||
                other.operation == operation) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.operationType, operationType) ||
                other.operationType == operationType) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.recAccount, recAccount) ||
                other.recAccount == recAccount) &&
            (identical(other.sum, sum) || other.sum == sum) &&
            const DeepCollectionEquality().equals(other._accounts, _accounts) &&
            const DeepCollectionEquality()
                .equals(other._inCategories, _inCategories) &&
            const DeepCollectionEquality()
                .equals(other._outCategories, _outCategories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      operation,
      date,
      time,
      operationType,
      account,
      category,
      recAccount,
      sum,
      const DeepCollectionEquality().hash(_accounts),
      const DeepCollectionEquality().hash(_inCategories),
      const DeepCollectionEquality().hash(_outCategories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MainOperationEditStateCopyWith<_$_MainOperationEditState> get copyWith =>
      __$$_MainOperationEditStateCopyWithImpl<_$_MainOperationEditState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Operation operation,
            DateTime date,
            TimeOfDay time,
            OperationType operationType,
            Account account,
            Category? category,
            Account? recAccount,
            int sum,
            List<Account> accounts,
            List<Category> inCategories,
            List<Category> outCategories)
        main,
    required TResult Function(
            Operation operation,
            DateTime date,
            TimeOfDay time,
            OperationType operationType,
            Account account,
            Category? category,
            Account? recAccount,
            int sum,
            List<Account> accounts,
            List<Category> inCategories,
            List<Category> outCategories)
        fetched,
    required TResult Function(
            Operation operation,
            DateTime date,
            TimeOfDay time,
            OperationType operationType,
            Account account,
            Category? category,
            Account? recAccount,
            int sum,
            List<Account> accounts,
            List<Category> inCategories,
            List<Category> outCategories)
        saved,
  }) {
    return main(operation, date, time, operationType, account, category,
        recAccount, sum, accounts, inCategories, outCategories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Operation operation,
            DateTime date,
            TimeOfDay time,
            OperationType operationType,
            Account account,
            Category? category,
            Account? recAccount,
            int sum,
            List<Account> accounts,
            List<Category> inCategories,
            List<Category> outCategories)?
        main,
    TResult? Function(
            Operation operation,
            DateTime date,
            TimeOfDay time,
            OperationType operationType,
            Account account,
            Category? category,
            Account? recAccount,
            int sum,
            List<Account> accounts,
            List<Category> inCategories,
            List<Category> outCategories)?
        fetched,
    TResult? Function(
            Operation operation,
            DateTime date,
            TimeOfDay time,
            OperationType operationType,
            Account account,
            Category? category,
            Account? recAccount,
            int sum,
            List<Account> accounts,
            List<Category> inCategories,
            List<Category> outCategories)?
        saved,
  }) {
    return main?.call(operation, date, time, operationType, account, category,
        recAccount, sum, accounts, inCategories, outCategories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Operation operation,
            DateTime date,
            TimeOfDay time,
            OperationType operationType,
            Account account,
            Category? category,
            Account? recAccount,
            int sum,
            List<Account> accounts,
            List<Category> inCategories,
            List<Category> outCategories)?
        main,
    TResult Function(
            Operation operation,
            DateTime date,
            TimeOfDay time,
            OperationType operationType,
            Account account,
            Category? category,
            Account? recAccount,
            int sum,
            List<Account> accounts,
            List<Category> inCategories,
            List<Category> outCategories)?
        fetched,
    TResult Function(
            Operation operation,
            DateTime date,
            TimeOfDay time,
            OperationType operationType,
            Account account,
            Category? category,
            Account? recAccount,
            int sum,
            List<Account> accounts,
            List<Category> inCategories,
            List<Category> outCategories)?
        saved,
    required TResult orElse(),
  }) {
    if (main != null) {
      return main(operation, date, time, operationType, account, category,
          recAccount, sum, accounts, inCategories, outCategories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MainOperationEditState value) main,
    required TResult Function(_FetchedOperationEditState value) fetched,
    required TResult Function(_SavedOperationEditState value) saved,
  }) {
    return main(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MainOperationEditState value)? main,
    TResult? Function(_FetchedOperationEditState value)? fetched,
    TResult? Function(_SavedOperationEditState value)? saved,
  }) {
    return main?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MainOperationEditState value)? main,
    TResult Function(_FetchedOperationEditState value)? fetched,
    TResult Function(_SavedOperationEditState value)? saved,
    required TResult orElse(),
  }) {
    if (main != null) {
      return main(this);
    }
    return orElse();
  }
}

abstract class _MainOperationEditState extends OperationEditState {
  const factory _MainOperationEditState(
      {required final Operation operation,
      required final DateTime date,
      required final TimeOfDay time,
      required final OperationType operationType,
      required final Account account,
      final Category? category,
      final Account? recAccount,
      required final int sum,
      required final List<Account> accounts,
      required final List<Category> inCategories,
      required final List<Category> outCategories}) = _$_MainOperationEditState;
  const _MainOperationEditState._() : super._();

  @override
  Operation get operation;
  @override
  DateTime get date;
  @override
  TimeOfDay get time;
  @override
  OperationType get operationType;
  @override
  Account get account;
  @override
  Category? get category;
  @override
  Account? get recAccount;
  @override
  int get sum;
  @override
  List<Account> get accounts;
  @override
  List<Category> get inCategories;
  @override
  List<Category> get outCategories;
  @override
  @JsonKey(ignore: true)
  _$$_MainOperationEditStateCopyWith<_$_MainOperationEditState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchedOperationEditStateCopyWith<$Res>
    implements $OperationEditStateCopyWith<$Res> {
  factory _$$_FetchedOperationEditStateCopyWith(
          _$_FetchedOperationEditState value,
          $Res Function(_$_FetchedOperationEditState) then) =
      __$$_FetchedOperationEditStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Operation operation,
      DateTime date,
      TimeOfDay time,
      OperationType operationType,
      Account account,
      Category? category,
      Account? recAccount,
      int sum,
      List<Account> accounts,
      List<Category> inCategories,
      List<Category> outCategories});

  @override
  $OperationCopyWith<$Res> get operation;
  @override
  $AccountCopyWith<$Res> get account;
  @override
  $CategoryCopyWith<$Res>? get category;
  @override
  $AccountCopyWith<$Res>? get recAccount;
}

/// @nodoc
class __$$_FetchedOperationEditStateCopyWithImpl<$Res>
    extends _$OperationEditStateCopyWithImpl<$Res, _$_FetchedOperationEditState>
    implements _$$_FetchedOperationEditStateCopyWith<$Res> {
  __$$_FetchedOperationEditStateCopyWithImpl(
      _$_FetchedOperationEditState _value,
      $Res Function(_$_FetchedOperationEditState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operation = null,
    Object? date = null,
    Object? time = null,
    Object? operationType = null,
    Object? account = null,
    Object? category = freezed,
    Object? recAccount = freezed,
    Object? sum = null,
    Object? accounts = null,
    Object? inCategories = null,
    Object? outCategories = null,
  }) {
    return _then(_$_FetchedOperationEditState(
      operation: null == operation
          ? _value.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as Operation,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      operationType: null == operationType
          ? _value.operationType
          : operationType // ignore: cast_nullable_to_non_nullable
              as OperationType,
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      recAccount: freezed == recAccount
          ? _value.recAccount
          : recAccount // ignore: cast_nullable_to_non_nullable
              as Account?,
      sum: null == sum
          ? _value.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as int,
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

class _$_FetchedOperationEditState extends _FetchedOperationEditState {
  const _$_FetchedOperationEditState(
      {required this.operation,
      required this.date,
      required this.time,
      required this.operationType,
      required this.account,
      this.category,
      this.recAccount,
      required this.sum,
      required final List<Account> accounts,
      required final List<Category> inCategories,
      required final List<Category> outCategories})
      : _accounts = accounts,
        _inCategories = inCategories,
        _outCategories = outCategories,
        super._();

  @override
  final Operation operation;
  @override
  final DateTime date;
  @override
  final TimeOfDay time;
  @override
  final OperationType operationType;
  @override
  final Account account;
  @override
  final Category? category;
  @override
  final Account? recAccount;
  @override
  final int sum;
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
    return 'OperationEditState.fetched(operation: $operation, date: $date, time: $time, operationType: $operationType, account: $account, category: $category, recAccount: $recAccount, sum: $sum, accounts: $accounts, inCategories: $inCategories, outCategories: $outCategories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchedOperationEditState &&
            (identical(other.operation, operation) ||
                other.operation == operation) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.operationType, operationType) ||
                other.operationType == operationType) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.recAccount, recAccount) ||
                other.recAccount == recAccount) &&
            (identical(other.sum, sum) || other.sum == sum) &&
            const DeepCollectionEquality().equals(other._accounts, _accounts) &&
            const DeepCollectionEquality()
                .equals(other._inCategories, _inCategories) &&
            const DeepCollectionEquality()
                .equals(other._outCategories, _outCategories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      operation,
      date,
      time,
      operationType,
      account,
      category,
      recAccount,
      sum,
      const DeepCollectionEquality().hash(_accounts),
      const DeepCollectionEquality().hash(_inCategories),
      const DeepCollectionEquality().hash(_outCategories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchedOperationEditStateCopyWith<_$_FetchedOperationEditState>
      get copyWith => __$$_FetchedOperationEditStateCopyWithImpl<
          _$_FetchedOperationEditState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Operation operation,
            DateTime date,
            TimeOfDay time,
            OperationType operationType,
            Account account,
            Category? category,
            Account? recAccount,
            int sum,
            List<Account> accounts,
            List<Category> inCategories,
            List<Category> outCategories)
        main,
    required TResult Function(
            Operation operation,
            DateTime date,
            TimeOfDay time,
            OperationType operationType,
            Account account,
            Category? category,
            Account? recAccount,
            int sum,
            List<Account> accounts,
            List<Category> inCategories,
            List<Category> outCategories)
        fetched,
    required TResult Function(
            Operation operation,
            DateTime date,
            TimeOfDay time,
            OperationType operationType,
            Account account,
            Category? category,
            Account? recAccount,
            int sum,
            List<Account> accounts,
            List<Category> inCategories,
            List<Category> outCategories)
        saved,
  }) {
    return fetched(operation, date, time, operationType, account, category,
        recAccount, sum, accounts, inCategories, outCategories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Operation operation,
            DateTime date,
            TimeOfDay time,
            OperationType operationType,
            Account account,
            Category? category,
            Account? recAccount,
            int sum,
            List<Account> accounts,
            List<Category> inCategories,
            List<Category> outCategories)?
        main,
    TResult? Function(
            Operation operation,
            DateTime date,
            TimeOfDay time,
            OperationType operationType,
            Account account,
            Category? category,
            Account? recAccount,
            int sum,
            List<Account> accounts,
            List<Category> inCategories,
            List<Category> outCategories)?
        fetched,
    TResult? Function(
            Operation operation,
            DateTime date,
            TimeOfDay time,
            OperationType operationType,
            Account account,
            Category? category,
            Account? recAccount,
            int sum,
            List<Account> accounts,
            List<Category> inCategories,
            List<Category> outCategories)?
        saved,
  }) {
    return fetched?.call(operation, date, time, operationType, account,
        category, recAccount, sum, accounts, inCategories, outCategories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Operation operation,
            DateTime date,
            TimeOfDay time,
            OperationType operationType,
            Account account,
            Category? category,
            Account? recAccount,
            int sum,
            List<Account> accounts,
            List<Category> inCategories,
            List<Category> outCategories)?
        main,
    TResult Function(
            Operation operation,
            DateTime date,
            TimeOfDay time,
            OperationType operationType,
            Account account,
            Category? category,
            Account? recAccount,
            int sum,
            List<Account> accounts,
            List<Category> inCategories,
            List<Category> outCategories)?
        fetched,
    TResult Function(
            Operation operation,
            DateTime date,
            TimeOfDay time,
            OperationType operationType,
            Account account,
            Category? category,
            Account? recAccount,
            int sum,
            List<Account> accounts,
            List<Category> inCategories,
            List<Category> outCategories)?
        saved,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(operation, date, time, operationType, account, category,
          recAccount, sum, accounts, inCategories, outCategories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MainOperationEditState value) main,
    required TResult Function(_FetchedOperationEditState value) fetched,
    required TResult Function(_SavedOperationEditState value) saved,
  }) {
    return fetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MainOperationEditState value)? main,
    TResult? Function(_FetchedOperationEditState value)? fetched,
    TResult? Function(_SavedOperationEditState value)? saved,
  }) {
    return fetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MainOperationEditState value)? main,
    TResult Function(_FetchedOperationEditState value)? fetched,
    TResult Function(_SavedOperationEditState value)? saved,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(this);
    }
    return orElse();
  }
}

abstract class _FetchedOperationEditState extends OperationEditState {
  const factory _FetchedOperationEditState(
          {required final Operation operation,
          required final DateTime date,
          required final TimeOfDay time,
          required final OperationType operationType,
          required final Account account,
          final Category? category,
          final Account? recAccount,
          required final int sum,
          required final List<Account> accounts,
          required final List<Category> inCategories,
          required final List<Category> outCategories}) =
      _$_FetchedOperationEditState;
  const _FetchedOperationEditState._() : super._();

  @override
  Operation get operation;
  @override
  DateTime get date;
  @override
  TimeOfDay get time;
  @override
  OperationType get operationType;
  @override
  Account get account;
  @override
  Category? get category;
  @override
  Account? get recAccount;
  @override
  int get sum;
  @override
  List<Account> get accounts;
  @override
  List<Category> get inCategories;
  @override
  List<Category> get outCategories;
  @override
  @JsonKey(ignore: true)
  _$$_FetchedOperationEditStateCopyWith<_$_FetchedOperationEditState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SavedOperationEditStateCopyWith<$Res>
    implements $OperationEditStateCopyWith<$Res> {
  factory _$$_SavedOperationEditStateCopyWith(_$_SavedOperationEditState value,
          $Res Function(_$_SavedOperationEditState) then) =
      __$$_SavedOperationEditStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Operation operation,
      DateTime date,
      TimeOfDay time,
      OperationType operationType,
      Account account,
      Category? category,
      Account? recAccount,
      int sum,
      List<Account> accounts,
      List<Category> inCategories,
      List<Category> outCategories});

  @override
  $OperationCopyWith<$Res> get operation;
  @override
  $AccountCopyWith<$Res> get account;
  @override
  $CategoryCopyWith<$Res>? get category;
  @override
  $AccountCopyWith<$Res>? get recAccount;
}

/// @nodoc
class __$$_SavedOperationEditStateCopyWithImpl<$Res>
    extends _$OperationEditStateCopyWithImpl<$Res, _$_SavedOperationEditState>
    implements _$$_SavedOperationEditStateCopyWith<$Res> {
  __$$_SavedOperationEditStateCopyWithImpl(_$_SavedOperationEditState _value,
      $Res Function(_$_SavedOperationEditState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operation = null,
    Object? date = null,
    Object? time = null,
    Object? operationType = null,
    Object? account = null,
    Object? category = freezed,
    Object? recAccount = freezed,
    Object? sum = null,
    Object? accounts = null,
    Object? inCategories = null,
    Object? outCategories = null,
  }) {
    return _then(_$_SavedOperationEditState(
      operation: null == operation
          ? _value.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as Operation,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      operationType: null == operationType
          ? _value.operationType
          : operationType // ignore: cast_nullable_to_non_nullable
              as OperationType,
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      recAccount: freezed == recAccount
          ? _value.recAccount
          : recAccount // ignore: cast_nullable_to_non_nullable
              as Account?,
      sum: null == sum
          ? _value.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as int,
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

class _$_SavedOperationEditState extends _SavedOperationEditState {
  const _$_SavedOperationEditState(
      {required this.operation,
      required this.date,
      required this.time,
      required this.operationType,
      required this.account,
      this.category,
      this.recAccount,
      required this.sum,
      required final List<Account> accounts,
      required final List<Category> inCategories,
      required final List<Category> outCategories})
      : _accounts = accounts,
        _inCategories = inCategories,
        _outCategories = outCategories,
        super._();

  @override
  final Operation operation;
  @override
  final DateTime date;
  @override
  final TimeOfDay time;
  @override
  final OperationType operationType;
  @override
  final Account account;
  @override
  final Category? category;
  @override
  final Account? recAccount;
  @override
  final int sum;
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
    return 'OperationEditState.saved(operation: $operation, date: $date, time: $time, operationType: $operationType, account: $account, category: $category, recAccount: $recAccount, sum: $sum, accounts: $accounts, inCategories: $inCategories, outCategories: $outCategories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SavedOperationEditState &&
            (identical(other.operation, operation) ||
                other.operation == operation) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.operationType, operationType) ||
                other.operationType == operationType) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.recAccount, recAccount) ||
                other.recAccount == recAccount) &&
            (identical(other.sum, sum) || other.sum == sum) &&
            const DeepCollectionEquality().equals(other._accounts, _accounts) &&
            const DeepCollectionEquality()
                .equals(other._inCategories, _inCategories) &&
            const DeepCollectionEquality()
                .equals(other._outCategories, _outCategories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      operation,
      date,
      time,
      operationType,
      account,
      category,
      recAccount,
      sum,
      const DeepCollectionEquality().hash(_accounts),
      const DeepCollectionEquality().hash(_inCategories),
      const DeepCollectionEquality().hash(_outCategories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SavedOperationEditStateCopyWith<_$_SavedOperationEditState>
      get copyWith =>
          __$$_SavedOperationEditStateCopyWithImpl<_$_SavedOperationEditState>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Operation operation,
            DateTime date,
            TimeOfDay time,
            OperationType operationType,
            Account account,
            Category? category,
            Account? recAccount,
            int sum,
            List<Account> accounts,
            List<Category> inCategories,
            List<Category> outCategories)
        main,
    required TResult Function(
            Operation operation,
            DateTime date,
            TimeOfDay time,
            OperationType operationType,
            Account account,
            Category? category,
            Account? recAccount,
            int sum,
            List<Account> accounts,
            List<Category> inCategories,
            List<Category> outCategories)
        fetched,
    required TResult Function(
            Operation operation,
            DateTime date,
            TimeOfDay time,
            OperationType operationType,
            Account account,
            Category? category,
            Account? recAccount,
            int sum,
            List<Account> accounts,
            List<Category> inCategories,
            List<Category> outCategories)
        saved,
  }) {
    return saved(operation, date, time, operationType, account, category,
        recAccount, sum, accounts, inCategories, outCategories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Operation operation,
            DateTime date,
            TimeOfDay time,
            OperationType operationType,
            Account account,
            Category? category,
            Account? recAccount,
            int sum,
            List<Account> accounts,
            List<Category> inCategories,
            List<Category> outCategories)?
        main,
    TResult? Function(
            Operation operation,
            DateTime date,
            TimeOfDay time,
            OperationType operationType,
            Account account,
            Category? category,
            Account? recAccount,
            int sum,
            List<Account> accounts,
            List<Category> inCategories,
            List<Category> outCategories)?
        fetched,
    TResult? Function(
            Operation operation,
            DateTime date,
            TimeOfDay time,
            OperationType operationType,
            Account account,
            Category? category,
            Account? recAccount,
            int sum,
            List<Account> accounts,
            List<Category> inCategories,
            List<Category> outCategories)?
        saved,
  }) {
    return saved?.call(operation, date, time, operationType, account, category,
        recAccount, sum, accounts, inCategories, outCategories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Operation operation,
            DateTime date,
            TimeOfDay time,
            OperationType operationType,
            Account account,
            Category? category,
            Account? recAccount,
            int sum,
            List<Account> accounts,
            List<Category> inCategories,
            List<Category> outCategories)?
        main,
    TResult Function(
            Operation operation,
            DateTime date,
            TimeOfDay time,
            OperationType operationType,
            Account account,
            Category? category,
            Account? recAccount,
            int sum,
            List<Account> accounts,
            List<Category> inCategories,
            List<Category> outCategories)?
        fetched,
    TResult Function(
            Operation operation,
            DateTime date,
            TimeOfDay time,
            OperationType operationType,
            Account account,
            Category? category,
            Account? recAccount,
            int sum,
            List<Account> accounts,
            List<Category> inCategories,
            List<Category> outCategories)?
        saved,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(operation, date, time, operationType, account, category,
          recAccount, sum, accounts, inCategories, outCategories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MainOperationEditState value) main,
    required TResult Function(_FetchedOperationEditState value) fetched,
    required TResult Function(_SavedOperationEditState value) saved,
  }) {
    return saved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MainOperationEditState value)? main,
    TResult? Function(_FetchedOperationEditState value)? fetched,
    TResult? Function(_SavedOperationEditState value)? saved,
  }) {
    return saved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MainOperationEditState value)? main,
    TResult Function(_FetchedOperationEditState value)? fetched,
    TResult Function(_SavedOperationEditState value)? saved,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(this);
    }
    return orElse();
  }
}

abstract class _SavedOperationEditState extends OperationEditState {
  const factory _SavedOperationEditState(
          {required final Operation operation,
          required final DateTime date,
          required final TimeOfDay time,
          required final OperationType operationType,
          required final Account account,
          final Category? category,
          final Account? recAccount,
          required final int sum,
          required final List<Account> accounts,
          required final List<Category> inCategories,
          required final List<Category> outCategories}) =
      _$_SavedOperationEditState;
  const _SavedOperationEditState._() : super._();

  @override
  Operation get operation;
  @override
  DateTime get date;
  @override
  TimeOfDay get time;
  @override
  OperationType get operationType;
  @override
  Account get account;
  @override
  Category? get category;
  @override
  Account? get recAccount;
  @override
  int get sum;
  @override
  List<Account> get accounts;
  @override
  List<Category> get inCategories;
  @override
  List<Category> get outCategories;
  @override
  @JsonKey(ignore: true)
  _$$_SavedOperationEditStateCopyWith<_$_SavedOperationEditState>
      get copyWith => throw _privateConstructorUsedError;
}
