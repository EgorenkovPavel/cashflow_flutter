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
    required TResult Function(int sum) changeRecSum,
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
    TResult? Function(int sum)? changeRecSum,
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
    TResult Function(int sum)? changeRecSum,
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
    required TResult Function(_ChangeRecSumOperationEditEvent value)
        changeRecSum,
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
    TResult? Function(_ChangeRecSumOperationEditEvent value)? changeRecSum,
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
    TResult Function(_ChangeRecSumOperationEditEvent value)? changeRecSum,
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
abstract class _$$FetchOperationEditEventImplCopyWith<$Res> {
  factory _$$FetchOperationEditEventImplCopyWith(
          _$FetchOperationEditEventImpl value,
          $Res Function(_$FetchOperationEditEventImpl) then) =
      __$$FetchOperationEditEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int operationId});
}

/// @nodoc
class __$$FetchOperationEditEventImplCopyWithImpl<$Res>
    extends _$OperationEditEventCopyWithImpl<$Res,
        _$FetchOperationEditEventImpl>
    implements _$$FetchOperationEditEventImplCopyWith<$Res> {
  __$$FetchOperationEditEventImplCopyWithImpl(
      _$FetchOperationEditEventImpl _value,
      $Res Function(_$FetchOperationEditEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operationId = null,
  }) {
    return _then(_$FetchOperationEditEventImpl(
      operationId: null == operationId
          ? _value.operationId
          : operationId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FetchOperationEditEventImpl implements _FetchOperationEditEvent {
  const _$FetchOperationEditEventImpl({required this.operationId});

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
            other is _$FetchOperationEditEventImpl &&
            (identical(other.operationId, operationId) ||
                other.operationId == operationId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, operationId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchOperationEditEventImplCopyWith<_$FetchOperationEditEventImpl>
      get copyWith => __$$FetchOperationEditEventImplCopyWithImpl<
          _$FetchOperationEditEventImpl>(this, _$identity);

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
    required TResult Function(int sum) changeRecSum,
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
    TResult? Function(int sum)? changeRecSum,
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
    TResult Function(int sum)? changeRecSum,
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
    required TResult Function(_ChangeRecSumOperationEditEvent value)
        changeRecSum,
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
    TResult? Function(_ChangeRecSumOperationEditEvent value)? changeRecSum,
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
    TResult Function(_ChangeRecSumOperationEditEvent value)? changeRecSum,
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
      _$FetchOperationEditEventImpl;

  int get operationId;
  @JsonKey(ignore: true)
  _$$FetchOperationEditEventImplCopyWith<_$FetchOperationEditEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeDateOperationEditEventImplCopyWith<$Res> {
  factory _$$ChangeDateOperationEditEventImplCopyWith(
          _$ChangeDateOperationEditEventImpl value,
          $Res Function(_$ChangeDateOperationEditEventImpl) then) =
      __$$ChangeDateOperationEditEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime date});
}

/// @nodoc
class __$$ChangeDateOperationEditEventImplCopyWithImpl<$Res>
    extends _$OperationEditEventCopyWithImpl<$Res,
        _$ChangeDateOperationEditEventImpl>
    implements _$$ChangeDateOperationEditEventImplCopyWith<$Res> {
  __$$ChangeDateOperationEditEventImplCopyWithImpl(
      _$ChangeDateOperationEditEventImpl _value,
      $Res Function(_$ChangeDateOperationEditEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
  }) {
    return _then(_$ChangeDateOperationEditEventImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$ChangeDateOperationEditEventImpl
    implements _ChangeDateOperationEditEvent {
  const _$ChangeDateOperationEditEventImpl({required this.date});

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
            other is _$ChangeDateOperationEditEventImpl &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeDateOperationEditEventImplCopyWith<
          _$ChangeDateOperationEditEventImpl>
      get copyWith => __$$ChangeDateOperationEditEventImplCopyWithImpl<
          _$ChangeDateOperationEditEventImpl>(this, _$identity);

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
    required TResult Function(int sum) changeRecSum,
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
    TResult? Function(int sum)? changeRecSum,
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
    TResult Function(int sum)? changeRecSum,
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
    required TResult Function(_ChangeRecSumOperationEditEvent value)
        changeRecSum,
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
    TResult? Function(_ChangeRecSumOperationEditEvent value)? changeRecSum,
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
    TResult Function(_ChangeRecSumOperationEditEvent value)? changeRecSum,
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
      _$ChangeDateOperationEditEventImpl;

  DateTime get date;
  @JsonKey(ignore: true)
  _$$ChangeDateOperationEditEventImplCopyWith<
          _$ChangeDateOperationEditEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeTimeOperationEditEventImplCopyWith<$Res> {
  factory _$$ChangeTimeOperationEditEventImplCopyWith(
          _$ChangeTimeOperationEditEventImpl value,
          $Res Function(_$ChangeTimeOperationEditEventImpl) then) =
      __$$ChangeTimeOperationEditEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TimeOfDay time});
}

/// @nodoc
class __$$ChangeTimeOperationEditEventImplCopyWithImpl<$Res>
    extends _$OperationEditEventCopyWithImpl<$Res,
        _$ChangeTimeOperationEditEventImpl>
    implements _$$ChangeTimeOperationEditEventImplCopyWith<$Res> {
  __$$ChangeTimeOperationEditEventImplCopyWithImpl(
      _$ChangeTimeOperationEditEventImpl _value,
      $Res Function(_$ChangeTimeOperationEditEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
  }) {
    return _then(_$ChangeTimeOperationEditEventImpl(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
    ));
  }
}

/// @nodoc

class _$ChangeTimeOperationEditEventImpl
    implements _ChangeTimeOperationEditEvent {
  const _$ChangeTimeOperationEditEventImpl({required this.time});

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
            other is _$ChangeTimeOperationEditEventImpl &&
            (identical(other.time, time) || other.time == time));
  }

  @override
  int get hashCode => Object.hash(runtimeType, time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeTimeOperationEditEventImplCopyWith<
          _$ChangeTimeOperationEditEventImpl>
      get copyWith => __$$ChangeTimeOperationEditEventImplCopyWithImpl<
          _$ChangeTimeOperationEditEventImpl>(this, _$identity);

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
    required TResult Function(int sum) changeRecSum,
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
    TResult? Function(int sum)? changeRecSum,
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
    TResult Function(int sum)? changeRecSum,
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
    required TResult Function(_ChangeRecSumOperationEditEvent value)
        changeRecSum,
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
    TResult? Function(_ChangeRecSumOperationEditEvent value)? changeRecSum,
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
    TResult Function(_ChangeRecSumOperationEditEvent value)? changeRecSum,
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
      _$ChangeTimeOperationEditEventImpl;

  TimeOfDay get time;
  @JsonKey(ignore: true)
  _$$ChangeTimeOperationEditEventImplCopyWith<
          _$ChangeTimeOperationEditEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeOperationTypeOperationEditEventImplCopyWith<$Res> {
  factory _$$ChangeOperationTypeOperationEditEventImplCopyWith(
          _$ChangeOperationTypeOperationEditEventImpl value,
          $Res Function(_$ChangeOperationTypeOperationEditEventImpl) then) =
      __$$ChangeOperationTypeOperationEditEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({OperationType operationType});
}

/// @nodoc
class __$$ChangeOperationTypeOperationEditEventImplCopyWithImpl<$Res>
    extends _$OperationEditEventCopyWithImpl<$Res,
        _$ChangeOperationTypeOperationEditEventImpl>
    implements _$$ChangeOperationTypeOperationEditEventImplCopyWith<$Res> {
  __$$ChangeOperationTypeOperationEditEventImplCopyWithImpl(
      _$ChangeOperationTypeOperationEditEventImpl _value,
      $Res Function(_$ChangeOperationTypeOperationEditEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operationType = null,
  }) {
    return _then(_$ChangeOperationTypeOperationEditEventImpl(
      operationType: null == operationType
          ? _value.operationType
          : operationType // ignore: cast_nullable_to_non_nullable
              as OperationType,
    ));
  }
}

/// @nodoc

class _$ChangeOperationTypeOperationEditEventImpl
    implements _ChangeOperationTypeOperationEditEvent {
  const _$ChangeOperationTypeOperationEditEventImpl(
      {required this.operationType});

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
            other is _$ChangeOperationTypeOperationEditEventImpl &&
            (identical(other.operationType, operationType) ||
                other.operationType == operationType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, operationType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeOperationTypeOperationEditEventImplCopyWith<
          _$ChangeOperationTypeOperationEditEventImpl>
      get copyWith => __$$ChangeOperationTypeOperationEditEventImplCopyWithImpl<
          _$ChangeOperationTypeOperationEditEventImpl>(this, _$identity);

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
    required TResult Function(int sum) changeRecSum,
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
    TResult? Function(int sum)? changeRecSum,
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
    TResult Function(int sum)? changeRecSum,
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
    required TResult Function(_ChangeRecSumOperationEditEvent value)
        changeRecSum,
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
    TResult? Function(_ChangeRecSumOperationEditEvent value)? changeRecSum,
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
    TResult Function(_ChangeRecSumOperationEditEvent value)? changeRecSum,
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
      _$ChangeOperationTypeOperationEditEventImpl;

  OperationType get operationType;
  @JsonKey(ignore: true)
  _$$ChangeOperationTypeOperationEditEventImplCopyWith<
          _$ChangeOperationTypeOperationEditEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeAccountOperationEditEventImplCopyWith<$Res> {
  factory _$$ChangeAccountOperationEditEventImplCopyWith(
          _$ChangeAccountOperationEditEventImpl value,
          $Res Function(_$ChangeAccountOperationEditEventImpl) then) =
      __$$ChangeAccountOperationEditEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Account account});

  $AccountCopyWith<$Res> get account;
}

/// @nodoc
class __$$ChangeAccountOperationEditEventImplCopyWithImpl<$Res>
    extends _$OperationEditEventCopyWithImpl<$Res,
        _$ChangeAccountOperationEditEventImpl>
    implements _$$ChangeAccountOperationEditEventImplCopyWith<$Res> {
  __$$ChangeAccountOperationEditEventImplCopyWithImpl(
      _$ChangeAccountOperationEditEventImpl _value,
      $Res Function(_$ChangeAccountOperationEditEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
  }) {
    return _then(_$ChangeAccountOperationEditEventImpl(
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

class _$ChangeAccountOperationEditEventImpl
    implements _ChangeAccountOperationEditEvent {
  const _$ChangeAccountOperationEditEventImpl({required this.account});

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
            other is _$ChangeAccountOperationEditEventImpl &&
            (identical(other.account, account) || other.account == account));
  }

  @override
  int get hashCode => Object.hash(runtimeType, account);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeAccountOperationEditEventImplCopyWith<
          _$ChangeAccountOperationEditEventImpl>
      get copyWith => __$$ChangeAccountOperationEditEventImplCopyWithImpl<
          _$ChangeAccountOperationEditEventImpl>(this, _$identity);

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
    required TResult Function(int sum) changeRecSum,
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
    TResult? Function(int sum)? changeRecSum,
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
    TResult Function(int sum)? changeRecSum,
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
    required TResult Function(_ChangeRecSumOperationEditEvent value)
        changeRecSum,
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
    TResult? Function(_ChangeRecSumOperationEditEvent value)? changeRecSum,
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
    TResult Function(_ChangeRecSumOperationEditEvent value)? changeRecSum,
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
      {required final Account account}) = _$ChangeAccountOperationEditEventImpl;

  Account get account;
  @JsonKey(ignore: true)
  _$$ChangeAccountOperationEditEventImplCopyWith<
          _$ChangeAccountOperationEditEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeCategoryOperationEditEventImplCopyWith<$Res> {
  factory _$$ChangeCategoryOperationEditEventImplCopyWith(
          _$ChangeCategoryOperationEditEventImpl value,
          $Res Function(_$ChangeCategoryOperationEditEventImpl) then) =
      __$$ChangeCategoryOperationEditEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Category category});

  $CategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$$ChangeCategoryOperationEditEventImplCopyWithImpl<$Res>
    extends _$OperationEditEventCopyWithImpl<$Res,
        _$ChangeCategoryOperationEditEventImpl>
    implements _$$ChangeCategoryOperationEditEventImplCopyWith<$Res> {
  __$$ChangeCategoryOperationEditEventImplCopyWithImpl(
      _$ChangeCategoryOperationEditEventImpl _value,
      $Res Function(_$ChangeCategoryOperationEditEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
  }) {
    return _then(_$ChangeCategoryOperationEditEventImpl(
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

class _$ChangeCategoryOperationEditEventImpl
    implements _ChangeCategoryOperationEditEvent {
  const _$ChangeCategoryOperationEditEventImpl({required this.category});

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
            other is _$ChangeCategoryOperationEditEventImpl &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeCategoryOperationEditEventImplCopyWith<
          _$ChangeCategoryOperationEditEventImpl>
      get copyWith => __$$ChangeCategoryOperationEditEventImplCopyWithImpl<
          _$ChangeCategoryOperationEditEventImpl>(this, _$identity);

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
    required TResult Function(int sum) changeRecSum,
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
    TResult? Function(int sum)? changeRecSum,
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
    TResult Function(int sum)? changeRecSum,
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
    required TResult Function(_ChangeRecSumOperationEditEvent value)
        changeRecSum,
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
    TResult? Function(_ChangeRecSumOperationEditEvent value)? changeRecSum,
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
    TResult Function(_ChangeRecSumOperationEditEvent value)? changeRecSum,
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
          {required final Category category}) =
      _$ChangeCategoryOperationEditEventImpl;

  Category get category;
  @JsonKey(ignore: true)
  _$$ChangeCategoryOperationEditEventImplCopyWith<
          _$ChangeCategoryOperationEditEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeRecAccountOperationEditEventImplCopyWith<$Res> {
  factory _$$ChangeRecAccountOperationEditEventImplCopyWith(
          _$ChangeRecAccountOperationEditEventImpl value,
          $Res Function(_$ChangeRecAccountOperationEditEventImpl) then) =
      __$$ChangeRecAccountOperationEditEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Account recAccount});

  $AccountCopyWith<$Res> get recAccount;
}

/// @nodoc
class __$$ChangeRecAccountOperationEditEventImplCopyWithImpl<$Res>
    extends _$OperationEditEventCopyWithImpl<$Res,
        _$ChangeRecAccountOperationEditEventImpl>
    implements _$$ChangeRecAccountOperationEditEventImplCopyWith<$Res> {
  __$$ChangeRecAccountOperationEditEventImplCopyWithImpl(
      _$ChangeRecAccountOperationEditEventImpl _value,
      $Res Function(_$ChangeRecAccountOperationEditEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recAccount = null,
  }) {
    return _then(_$ChangeRecAccountOperationEditEventImpl(
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

class _$ChangeRecAccountOperationEditEventImpl
    implements _ChangeRecAccountOperationEditEvent {
  const _$ChangeRecAccountOperationEditEventImpl({required this.recAccount});

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
            other is _$ChangeRecAccountOperationEditEventImpl &&
            (identical(other.recAccount, recAccount) ||
                other.recAccount == recAccount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, recAccount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeRecAccountOperationEditEventImplCopyWith<
          _$ChangeRecAccountOperationEditEventImpl>
      get copyWith => __$$ChangeRecAccountOperationEditEventImplCopyWithImpl<
          _$ChangeRecAccountOperationEditEventImpl>(this, _$identity);

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
    required TResult Function(int sum) changeRecSum,
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
    TResult? Function(int sum)? changeRecSum,
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
    TResult Function(int sum)? changeRecSum,
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
    required TResult Function(_ChangeRecSumOperationEditEvent value)
        changeRecSum,
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
    TResult? Function(_ChangeRecSumOperationEditEvent value)? changeRecSum,
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
    TResult Function(_ChangeRecSumOperationEditEvent value)? changeRecSum,
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
      _$ChangeRecAccountOperationEditEventImpl;

  Account get recAccount;
  @JsonKey(ignore: true)
  _$$ChangeRecAccountOperationEditEventImplCopyWith<
          _$ChangeRecAccountOperationEditEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeSumOperationEditEventImplCopyWith<$Res> {
  factory _$$ChangeSumOperationEditEventImplCopyWith(
          _$ChangeSumOperationEditEventImpl value,
          $Res Function(_$ChangeSumOperationEditEventImpl) then) =
      __$$ChangeSumOperationEditEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int sum});
}

/// @nodoc
class __$$ChangeSumOperationEditEventImplCopyWithImpl<$Res>
    extends _$OperationEditEventCopyWithImpl<$Res,
        _$ChangeSumOperationEditEventImpl>
    implements _$$ChangeSumOperationEditEventImplCopyWith<$Res> {
  __$$ChangeSumOperationEditEventImplCopyWithImpl(
      _$ChangeSumOperationEditEventImpl _value,
      $Res Function(_$ChangeSumOperationEditEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sum = null,
  }) {
    return _then(_$ChangeSumOperationEditEventImpl(
      sum: null == sum
          ? _value.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ChangeSumOperationEditEventImpl
    implements _ChangeSumOperationEditEvent {
  const _$ChangeSumOperationEditEventImpl({required this.sum});

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
            other is _$ChangeSumOperationEditEventImpl &&
            (identical(other.sum, sum) || other.sum == sum));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sum);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeSumOperationEditEventImplCopyWith<_$ChangeSumOperationEditEventImpl>
      get copyWith => __$$ChangeSumOperationEditEventImplCopyWithImpl<
          _$ChangeSumOperationEditEventImpl>(this, _$identity);

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
    required TResult Function(int sum) changeRecSum,
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
    TResult? Function(int sum)? changeRecSum,
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
    TResult Function(int sum)? changeRecSum,
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
    required TResult Function(_ChangeRecSumOperationEditEvent value)
        changeRecSum,
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
    TResult? Function(_ChangeRecSumOperationEditEvent value)? changeRecSum,
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
    TResult Function(_ChangeRecSumOperationEditEvent value)? changeRecSum,
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
      _$ChangeSumOperationEditEventImpl;

  int get sum;
  @JsonKey(ignore: true)
  _$$ChangeSumOperationEditEventImplCopyWith<_$ChangeSumOperationEditEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeRecSumOperationEditEventImplCopyWith<$Res> {
  factory _$$ChangeRecSumOperationEditEventImplCopyWith(
          _$ChangeRecSumOperationEditEventImpl value,
          $Res Function(_$ChangeRecSumOperationEditEventImpl) then) =
      __$$ChangeRecSumOperationEditEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int sum});
}

/// @nodoc
class __$$ChangeRecSumOperationEditEventImplCopyWithImpl<$Res>
    extends _$OperationEditEventCopyWithImpl<$Res,
        _$ChangeRecSumOperationEditEventImpl>
    implements _$$ChangeRecSumOperationEditEventImplCopyWith<$Res> {
  __$$ChangeRecSumOperationEditEventImplCopyWithImpl(
      _$ChangeRecSumOperationEditEventImpl _value,
      $Res Function(_$ChangeRecSumOperationEditEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sum = null,
  }) {
    return _then(_$ChangeRecSumOperationEditEventImpl(
      sum: null == sum
          ? _value.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ChangeRecSumOperationEditEventImpl
    implements _ChangeRecSumOperationEditEvent {
  const _$ChangeRecSumOperationEditEventImpl({required this.sum});

  @override
  final int sum;

  @override
  String toString() {
    return 'OperationEditEvent.changeRecSum(sum: $sum)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeRecSumOperationEditEventImpl &&
            (identical(other.sum, sum) || other.sum == sum));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sum);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeRecSumOperationEditEventImplCopyWith<
          _$ChangeRecSumOperationEditEventImpl>
      get copyWith => __$$ChangeRecSumOperationEditEventImplCopyWithImpl<
          _$ChangeRecSumOperationEditEventImpl>(this, _$identity);

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
    required TResult Function(int sum) changeRecSum,
    required TResult Function() save,
  }) {
    return changeRecSum(sum);
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
    TResult? Function(int sum)? changeRecSum,
    TResult? Function()? save,
  }) {
    return changeRecSum?.call(sum);
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
    TResult Function(int sum)? changeRecSum,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (changeRecSum != null) {
      return changeRecSum(sum);
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
    required TResult Function(_ChangeRecSumOperationEditEvent value)
        changeRecSum,
    required TResult Function(_SaveOperationEditEvent value) save,
  }) {
    return changeRecSum(this);
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
    TResult? Function(_ChangeRecSumOperationEditEvent value)? changeRecSum,
    TResult? Function(_SaveOperationEditEvent value)? save,
  }) {
    return changeRecSum?.call(this);
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
    TResult Function(_ChangeRecSumOperationEditEvent value)? changeRecSum,
    TResult Function(_SaveOperationEditEvent value)? save,
    required TResult orElse(),
  }) {
    if (changeRecSum != null) {
      return changeRecSum(this);
    }
    return orElse();
  }
}

abstract class _ChangeRecSumOperationEditEvent implements OperationEditEvent {
  const factory _ChangeRecSumOperationEditEvent({required final int sum}) =
      _$ChangeRecSumOperationEditEventImpl;

  int get sum;
  @JsonKey(ignore: true)
  _$$ChangeRecSumOperationEditEventImplCopyWith<
          _$ChangeRecSumOperationEditEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SaveOperationEditEventImplCopyWith<$Res> {
  factory _$$SaveOperationEditEventImplCopyWith(
          _$SaveOperationEditEventImpl value,
          $Res Function(_$SaveOperationEditEventImpl) then) =
      __$$SaveOperationEditEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SaveOperationEditEventImplCopyWithImpl<$Res>
    extends _$OperationEditEventCopyWithImpl<$Res, _$SaveOperationEditEventImpl>
    implements _$$SaveOperationEditEventImplCopyWith<$Res> {
  __$$SaveOperationEditEventImplCopyWithImpl(
      _$SaveOperationEditEventImpl _value,
      $Res Function(_$SaveOperationEditEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SaveOperationEditEventImpl implements _SaveOperationEditEvent {
  const _$SaveOperationEditEventImpl();

  @override
  String toString() {
    return 'OperationEditEvent.save()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveOperationEditEventImpl);
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
    required TResult Function(int sum) changeRecSum,
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
    TResult? Function(int sum)? changeRecSum,
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
    TResult Function(int sum)? changeRecSum,
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
    required TResult Function(_ChangeRecSumOperationEditEvent value)
        changeRecSum,
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
    TResult? Function(_ChangeRecSumOperationEditEvent value)? changeRecSum,
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
    TResult Function(_ChangeRecSumOperationEditEvent value)? changeRecSum,
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
  const factory _SaveOperationEditEvent() = _$SaveOperationEditEventImpl;
}

/// @nodoc
mixin _$OperationEditState {
  Operation? get operation => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  TimeOfDay get time => throw _privateConstructorUsedError;
  OperationType get operationType => throw _privateConstructorUsedError;
  Account? get account => throw _privateConstructorUsedError;
  Category? get category => throw _privateConstructorUsedError;
  Account? get recAccount => throw _privateConstructorUsedError;
  int get sum => throw _privateConstructorUsedError;
  int get recSum => throw _privateConstructorUsedError;
  bool get isSaved => throw _privateConstructorUsedError;

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
      {Operation? operation,
      DateTime date,
      TimeOfDay time,
      OperationType operationType,
      Account? account,
      Category? category,
      Account? recAccount,
      int sum,
      int recSum,
      bool isSaved});

  $OperationCopyWith<$Res>? get operation;
  $AccountCopyWith<$Res>? get account;
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
    Object? operation = freezed,
    Object? date = null,
    Object? time = null,
    Object? operationType = null,
    Object? account = freezed,
    Object? category = freezed,
    Object? recAccount = freezed,
    Object? sum = null,
    Object? recSum = null,
    Object? isSaved = null,
  }) {
    return _then(_value.copyWith(
      operation: freezed == operation
          ? _value.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as Operation?,
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
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account?,
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
      recSum: null == recSum
          ? _value.recSum
          : recSum // ignore: cast_nullable_to_non_nullable
              as int,
      isSaved: null == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OperationCopyWith<$Res>? get operation {
    if (_value.operation == null) {
      return null;
    }

    return $OperationCopyWith<$Res>(_value.operation!, (value) {
      return _then(_value.copyWith(operation: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AccountCopyWith<$Res>? get account {
    if (_value.account == null) {
      return null;
    }

    return $AccountCopyWith<$Res>(_value.account!, (value) {
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
abstract class _$$OperationEditStateImplCopyWith<$Res>
    implements $OperationEditStateCopyWith<$Res> {
  factory _$$OperationEditStateImplCopyWith(_$OperationEditStateImpl value,
          $Res Function(_$OperationEditStateImpl) then) =
      __$$OperationEditStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Operation? operation,
      DateTime date,
      TimeOfDay time,
      OperationType operationType,
      Account? account,
      Category? category,
      Account? recAccount,
      int sum,
      int recSum,
      bool isSaved});

  @override
  $OperationCopyWith<$Res>? get operation;
  @override
  $AccountCopyWith<$Res>? get account;
  @override
  $CategoryCopyWith<$Res>? get category;
  @override
  $AccountCopyWith<$Res>? get recAccount;
}

/// @nodoc
class __$$OperationEditStateImplCopyWithImpl<$Res>
    extends _$OperationEditStateCopyWithImpl<$Res, _$OperationEditStateImpl>
    implements _$$OperationEditStateImplCopyWith<$Res> {
  __$$OperationEditStateImplCopyWithImpl(_$OperationEditStateImpl _value,
      $Res Function(_$OperationEditStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operation = freezed,
    Object? date = null,
    Object? time = null,
    Object? operationType = null,
    Object? account = freezed,
    Object? category = freezed,
    Object? recAccount = freezed,
    Object? sum = null,
    Object? recSum = null,
    Object? isSaved = null,
  }) {
    return _then(_$OperationEditStateImpl(
      operation: freezed == operation
          ? _value.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as Operation?,
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
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account?,
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
      recSum: null == recSum
          ? _value.recSum
          : recSum // ignore: cast_nullable_to_non_nullable
              as int,
      isSaved: null == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$OperationEditStateImpl extends _OperationEditState {
  const _$OperationEditStateImpl(
      {this.operation,
      required this.date,
      required this.time,
      required this.operationType,
      this.account,
      this.category,
      this.recAccount,
      required this.sum,
      required this.recSum,
      required this.isSaved})
      : super._();

  @override
  final Operation? operation;
  @override
  final DateTime date;
  @override
  final TimeOfDay time;
  @override
  final OperationType operationType;
  @override
  final Account? account;
  @override
  final Category? category;
  @override
  final Account? recAccount;
  @override
  final int sum;
  @override
  final int recSum;
  @override
  final bool isSaved;

  @override
  String toString() {
    return 'OperationEditState(operation: $operation, date: $date, time: $time, operationType: $operationType, account: $account, category: $category, recAccount: $recAccount, sum: $sum, recSum: $recSum, isSaved: $isSaved)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OperationEditStateImpl &&
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
            (identical(other.recSum, recSum) || other.recSum == recSum) &&
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved));
  }

  @override
  int get hashCode => Object.hash(runtimeType, operation, date, time,
      operationType, account, category, recAccount, sum, recSum, isSaved);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OperationEditStateImplCopyWith<_$OperationEditStateImpl> get copyWith =>
      __$$OperationEditStateImplCopyWithImpl<_$OperationEditStateImpl>(
          this, _$identity);
}

abstract class _OperationEditState extends OperationEditState {
  const factory _OperationEditState(
      {final Operation? operation,
      required final DateTime date,
      required final TimeOfDay time,
      required final OperationType operationType,
      final Account? account,
      final Category? category,
      final Account? recAccount,
      required final int sum,
      required final int recSum,
      required final bool isSaved}) = _$OperationEditStateImpl;
  const _OperationEditState._() : super._();

  @override
  Operation? get operation;
  @override
  DateTime get date;
  @override
  TimeOfDay get time;
  @override
  OperationType get operationType;
  @override
  Account? get account;
  @override
  Category? get category;
  @override
  Account? get recAccount;
  @override
  int get sum;
  @override
  int get recSum;
  @override
  bool get isSaved;
  @override
  @JsonKey(ignore: true)
  _$$OperationEditStateImplCopyWith<_$OperationEditStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
