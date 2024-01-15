// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'last_operations_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LastOperationsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(List<Operation> operations) changeOperations,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(List<Operation> operations)? changeOperations,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(List<Operation> operations)? changeOperations,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchLastOperationsEvent value) fetch,
    required TResult Function(_ChangeOperationsLastOperationsEvent value)
        changeOperations,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchLastOperationsEvent value)? fetch,
    TResult? Function(_ChangeOperationsLastOperationsEvent value)?
        changeOperations,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchLastOperationsEvent value)? fetch,
    TResult Function(_ChangeOperationsLastOperationsEvent value)?
        changeOperations,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LastOperationsEventCopyWith<$Res> {
  factory $LastOperationsEventCopyWith(
          LastOperationsEvent value, $Res Function(LastOperationsEvent) then) =
      _$LastOperationsEventCopyWithImpl<$Res, LastOperationsEvent>;
}

/// @nodoc
class _$LastOperationsEventCopyWithImpl<$Res, $Val extends LastOperationsEvent>
    implements $LastOperationsEventCopyWith<$Res> {
  _$LastOperationsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchLastOperationsEventImplCopyWith<$Res> {
  factory _$$FetchLastOperationsEventImplCopyWith(
          _$FetchLastOperationsEventImpl value,
          $Res Function(_$FetchLastOperationsEventImpl) then) =
      __$$FetchLastOperationsEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchLastOperationsEventImplCopyWithImpl<$Res>
    extends _$LastOperationsEventCopyWithImpl<$Res,
        _$FetchLastOperationsEventImpl>
    implements _$$FetchLastOperationsEventImplCopyWith<$Res> {
  __$$FetchLastOperationsEventImplCopyWithImpl(
      _$FetchLastOperationsEventImpl _value,
      $Res Function(_$FetchLastOperationsEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchLastOperationsEventImpl implements _FetchLastOperationsEvent {
  const _$FetchLastOperationsEventImpl();

  @override
  String toString() {
    return 'LastOperationsEvent.fetch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchLastOperationsEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(List<Operation> operations) changeOperations,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(List<Operation> operations)? changeOperations,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(List<Operation> operations)? changeOperations,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchLastOperationsEvent value) fetch,
    required TResult Function(_ChangeOperationsLastOperationsEvent value)
        changeOperations,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchLastOperationsEvent value)? fetch,
    TResult? Function(_ChangeOperationsLastOperationsEvent value)?
        changeOperations,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchLastOperationsEvent value)? fetch,
    TResult Function(_ChangeOperationsLastOperationsEvent value)?
        changeOperations,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _FetchLastOperationsEvent implements LastOperationsEvent {
  const factory _FetchLastOperationsEvent() = _$FetchLastOperationsEventImpl;
}

/// @nodoc
abstract class _$$ChangeOperationsLastOperationsEventImplCopyWith<$Res> {
  factory _$$ChangeOperationsLastOperationsEventImplCopyWith(
          _$ChangeOperationsLastOperationsEventImpl value,
          $Res Function(_$ChangeOperationsLastOperationsEventImpl) then) =
      __$$ChangeOperationsLastOperationsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Operation> operations});
}

/// @nodoc
class __$$ChangeOperationsLastOperationsEventImplCopyWithImpl<$Res>
    extends _$LastOperationsEventCopyWithImpl<$Res,
        _$ChangeOperationsLastOperationsEventImpl>
    implements _$$ChangeOperationsLastOperationsEventImplCopyWith<$Res> {
  __$$ChangeOperationsLastOperationsEventImplCopyWithImpl(
      _$ChangeOperationsLastOperationsEventImpl _value,
      $Res Function(_$ChangeOperationsLastOperationsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operations = null,
  }) {
    return _then(_$ChangeOperationsLastOperationsEventImpl(
      operations: null == operations
          ? _value._operations
          : operations // ignore: cast_nullable_to_non_nullable
              as List<Operation>,
    ));
  }
}

/// @nodoc

class _$ChangeOperationsLastOperationsEventImpl
    implements _ChangeOperationsLastOperationsEvent {
  const _$ChangeOperationsLastOperationsEventImpl(
      {required final List<Operation> operations})
      : _operations = operations;

  final List<Operation> _operations;
  @override
  List<Operation> get operations {
    if (_operations is EqualUnmodifiableListView) return _operations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_operations);
  }

  @override
  String toString() {
    return 'LastOperationsEvent.changeOperations(operations: $operations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeOperationsLastOperationsEventImpl &&
            const DeepCollectionEquality()
                .equals(other._operations, _operations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_operations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeOperationsLastOperationsEventImplCopyWith<
          _$ChangeOperationsLastOperationsEventImpl>
      get copyWith => __$$ChangeOperationsLastOperationsEventImplCopyWithImpl<
          _$ChangeOperationsLastOperationsEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(List<Operation> operations) changeOperations,
  }) {
    return changeOperations(operations);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(List<Operation> operations)? changeOperations,
  }) {
    return changeOperations?.call(operations);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(List<Operation> operations)? changeOperations,
    required TResult orElse(),
  }) {
    if (changeOperations != null) {
      return changeOperations(operations);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchLastOperationsEvent value) fetch,
    required TResult Function(_ChangeOperationsLastOperationsEvent value)
        changeOperations,
  }) {
    return changeOperations(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchLastOperationsEvent value)? fetch,
    TResult? Function(_ChangeOperationsLastOperationsEvent value)?
        changeOperations,
  }) {
    return changeOperations?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchLastOperationsEvent value)? fetch,
    TResult Function(_ChangeOperationsLastOperationsEvent value)?
        changeOperations,
    required TResult orElse(),
  }) {
    if (changeOperations != null) {
      return changeOperations(this);
    }
    return orElse();
  }
}

abstract class _ChangeOperationsLastOperationsEvent
    implements LastOperationsEvent {
  const factory _ChangeOperationsLastOperationsEvent(
          {required final List<Operation> operations}) =
      _$ChangeOperationsLastOperationsEventImpl;

  List<Operation> get operations;
  @JsonKey(ignore: true)
  _$$ChangeOperationsLastOperationsEventImplCopyWith<
          _$ChangeOperationsLastOperationsEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LastOperationsState {
  List<Operation> get operations => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LastOperationsStateCopyWith<LastOperationsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LastOperationsStateCopyWith<$Res> {
  factory $LastOperationsStateCopyWith(
          LastOperationsState value, $Res Function(LastOperationsState) then) =
      _$LastOperationsStateCopyWithImpl<$Res, LastOperationsState>;
  @useResult
  $Res call({List<Operation> operations});
}

/// @nodoc
class _$LastOperationsStateCopyWithImpl<$Res, $Val extends LastOperationsState>
    implements $LastOperationsStateCopyWith<$Res> {
  _$LastOperationsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operations = null,
  }) {
    return _then(_value.copyWith(
      operations: null == operations
          ? _value.operations
          : operations // ignore: cast_nullable_to_non_nullable
              as List<Operation>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LastOperationsStateImplCopyWith<$Res>
    implements $LastOperationsStateCopyWith<$Res> {
  factory _$$LastOperationsStateImplCopyWith(_$LastOperationsStateImpl value,
          $Res Function(_$LastOperationsStateImpl) then) =
      __$$LastOperationsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Operation> operations});
}

/// @nodoc
class __$$LastOperationsStateImplCopyWithImpl<$Res>
    extends _$LastOperationsStateCopyWithImpl<$Res, _$LastOperationsStateImpl>
    implements _$$LastOperationsStateImplCopyWith<$Res> {
  __$$LastOperationsStateImplCopyWithImpl(_$LastOperationsStateImpl _value,
      $Res Function(_$LastOperationsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operations = null,
  }) {
    return _then(_$LastOperationsStateImpl(
      operations: null == operations
          ? _value._operations
          : operations // ignore: cast_nullable_to_non_nullable
              as List<Operation>,
    ));
  }
}

/// @nodoc

class _$LastOperationsStateImpl implements _LastOperationsState {
  const _$LastOperationsStateImpl({required final List<Operation> operations})
      : _operations = operations;

  final List<Operation> _operations;
  @override
  List<Operation> get operations {
    if (_operations is EqualUnmodifiableListView) return _operations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_operations);
  }

  @override
  String toString() {
    return 'LastOperationsState(operations: $operations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LastOperationsStateImpl &&
            const DeepCollectionEquality()
                .equals(other._operations, _operations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_operations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LastOperationsStateImplCopyWith<_$LastOperationsStateImpl> get copyWith =>
      __$$LastOperationsStateImplCopyWithImpl<_$LastOperationsStateImpl>(
          this, _$identity);
}

abstract class _LastOperationsState implements LastOperationsState {
  const factory _LastOperationsState(
      {required final List<Operation> operations}) = _$LastOperationsStateImpl;

  @override
  List<Operation> get operations;
  @override
  @JsonKey(ignore: true)
  _$$LastOperationsStateImplCopyWith<_$LastOperationsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
