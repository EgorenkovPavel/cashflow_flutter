// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountDetailEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int accountId) fetch,
    required TResult Function(String title) titleChanged,
    required TResult Function(List<Operation> operations) operationsChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int accountId)? fetch,
    TResult? Function(String title)? titleChanged,
    TResult? Function(List<Operation> operations)? operationsChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int accountId)? fetch,
    TResult Function(String title)? titleChanged,
    TResult Function(List<Operation> operations)? operationsChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAccountDetailEvent value) fetch,
    required TResult Function(_TitleChangedAccountDetailEvent value)
        titleChanged,
    required TResult Function(_OperationsChangedAccountDetailEvent value)
        operationsChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAccountDetailEvent value)? fetch,
    TResult? Function(_TitleChangedAccountDetailEvent value)? titleChanged,
    TResult? Function(_OperationsChangedAccountDetailEvent value)?
        operationsChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAccountDetailEvent value)? fetch,
    TResult Function(_TitleChangedAccountDetailEvent value)? titleChanged,
    TResult Function(_OperationsChangedAccountDetailEvent value)?
        operationsChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountDetailEventCopyWith<$Res> {
  factory $AccountDetailEventCopyWith(
          AccountDetailEvent value, $Res Function(AccountDetailEvent) then) =
      _$AccountDetailEventCopyWithImpl<$Res, AccountDetailEvent>;
}

/// @nodoc
class _$AccountDetailEventCopyWithImpl<$Res, $Val extends AccountDetailEvent>
    implements $AccountDetailEventCopyWith<$Res> {
  _$AccountDetailEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_FetchAccountDetailEventCopyWith<$Res> {
  factory _$$_FetchAccountDetailEventCopyWith(_$_FetchAccountDetailEvent value,
          $Res Function(_$_FetchAccountDetailEvent) then) =
      __$$_FetchAccountDetailEventCopyWithImpl<$Res>;
  @useResult
  $Res call({int accountId});
}

/// @nodoc
class __$$_FetchAccountDetailEventCopyWithImpl<$Res>
    extends _$AccountDetailEventCopyWithImpl<$Res, _$_FetchAccountDetailEvent>
    implements _$$_FetchAccountDetailEventCopyWith<$Res> {
  __$$_FetchAccountDetailEventCopyWithImpl(_$_FetchAccountDetailEvent _value,
      $Res Function(_$_FetchAccountDetailEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = null,
  }) {
    return _then(_$_FetchAccountDetailEvent(
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_FetchAccountDetailEvent implements _FetchAccountDetailEvent {
  const _$_FetchAccountDetailEvent({required this.accountId});

  @override
  final int accountId;

  @override
  String toString() {
    return 'AccountDetailEvent.fetch(accountId: $accountId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchAccountDetailEvent &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accountId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchAccountDetailEventCopyWith<_$_FetchAccountDetailEvent>
      get copyWith =>
          __$$_FetchAccountDetailEventCopyWithImpl<_$_FetchAccountDetailEvent>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int accountId) fetch,
    required TResult Function(String title) titleChanged,
    required TResult Function(List<Operation> operations) operationsChanged,
  }) {
    return fetch(accountId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int accountId)? fetch,
    TResult? Function(String title)? titleChanged,
    TResult? Function(List<Operation> operations)? operationsChanged,
  }) {
    return fetch?.call(accountId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int accountId)? fetch,
    TResult Function(String title)? titleChanged,
    TResult Function(List<Operation> operations)? operationsChanged,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(accountId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAccountDetailEvent value) fetch,
    required TResult Function(_TitleChangedAccountDetailEvent value)
        titleChanged,
    required TResult Function(_OperationsChangedAccountDetailEvent value)
        operationsChanged,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAccountDetailEvent value)? fetch,
    TResult? Function(_TitleChangedAccountDetailEvent value)? titleChanged,
    TResult? Function(_OperationsChangedAccountDetailEvent value)?
        operationsChanged,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAccountDetailEvent value)? fetch,
    TResult Function(_TitleChangedAccountDetailEvent value)? titleChanged,
    TResult Function(_OperationsChangedAccountDetailEvent value)?
        operationsChanged,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _FetchAccountDetailEvent implements AccountDetailEvent {
  const factory _FetchAccountDetailEvent({required final int accountId}) =
      _$_FetchAccountDetailEvent;

  int get accountId;
  @JsonKey(ignore: true)
  _$$_FetchAccountDetailEventCopyWith<_$_FetchAccountDetailEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_TitleChangedAccountDetailEventCopyWith<$Res> {
  factory _$$_TitleChangedAccountDetailEventCopyWith(
          _$_TitleChangedAccountDetailEvent value,
          $Res Function(_$_TitleChangedAccountDetailEvent) then) =
      __$$_TitleChangedAccountDetailEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String title});
}

/// @nodoc
class __$$_TitleChangedAccountDetailEventCopyWithImpl<$Res>
    extends _$AccountDetailEventCopyWithImpl<$Res,
        _$_TitleChangedAccountDetailEvent>
    implements _$$_TitleChangedAccountDetailEventCopyWith<$Res> {
  __$$_TitleChangedAccountDetailEventCopyWithImpl(
      _$_TitleChangedAccountDetailEvent _value,
      $Res Function(_$_TitleChangedAccountDetailEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
  }) {
    return _then(_$_TitleChangedAccountDetailEvent(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TitleChangedAccountDetailEvent
    implements _TitleChangedAccountDetailEvent {
  const _$_TitleChangedAccountDetailEvent({required this.title});

  @override
  final String title;

  @override
  String toString() {
    return 'AccountDetailEvent.titleChanged(title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TitleChangedAccountDetailEvent &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TitleChangedAccountDetailEventCopyWith<_$_TitleChangedAccountDetailEvent>
      get copyWith => __$$_TitleChangedAccountDetailEventCopyWithImpl<
          _$_TitleChangedAccountDetailEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int accountId) fetch,
    required TResult Function(String title) titleChanged,
    required TResult Function(List<Operation> operations) operationsChanged,
  }) {
    return titleChanged(title);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int accountId)? fetch,
    TResult? Function(String title)? titleChanged,
    TResult? Function(List<Operation> operations)? operationsChanged,
  }) {
    return titleChanged?.call(title);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int accountId)? fetch,
    TResult Function(String title)? titleChanged,
    TResult Function(List<Operation> operations)? operationsChanged,
    required TResult orElse(),
  }) {
    if (titleChanged != null) {
      return titleChanged(title);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAccountDetailEvent value) fetch,
    required TResult Function(_TitleChangedAccountDetailEvent value)
        titleChanged,
    required TResult Function(_OperationsChangedAccountDetailEvent value)
        operationsChanged,
  }) {
    return titleChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAccountDetailEvent value)? fetch,
    TResult? Function(_TitleChangedAccountDetailEvent value)? titleChanged,
    TResult? Function(_OperationsChangedAccountDetailEvent value)?
        operationsChanged,
  }) {
    return titleChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAccountDetailEvent value)? fetch,
    TResult Function(_TitleChangedAccountDetailEvent value)? titleChanged,
    TResult Function(_OperationsChangedAccountDetailEvent value)?
        operationsChanged,
    required TResult orElse(),
  }) {
    if (titleChanged != null) {
      return titleChanged(this);
    }
    return orElse();
  }
}

abstract class _TitleChangedAccountDetailEvent implements AccountDetailEvent {
  const factory _TitleChangedAccountDetailEvent({required final String title}) =
      _$_TitleChangedAccountDetailEvent;

  String get title;
  @JsonKey(ignore: true)
  _$$_TitleChangedAccountDetailEventCopyWith<_$_TitleChangedAccountDetailEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_OperationsChangedAccountDetailEventCopyWith<$Res> {
  factory _$$_OperationsChangedAccountDetailEventCopyWith(
          _$_OperationsChangedAccountDetailEvent value,
          $Res Function(_$_OperationsChangedAccountDetailEvent) then) =
      __$$_OperationsChangedAccountDetailEventCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Operation> operations});
}

/// @nodoc
class __$$_OperationsChangedAccountDetailEventCopyWithImpl<$Res>
    extends _$AccountDetailEventCopyWithImpl<$Res,
        _$_OperationsChangedAccountDetailEvent>
    implements _$$_OperationsChangedAccountDetailEventCopyWith<$Res> {
  __$$_OperationsChangedAccountDetailEventCopyWithImpl(
      _$_OperationsChangedAccountDetailEvent _value,
      $Res Function(_$_OperationsChangedAccountDetailEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operations = null,
  }) {
    return _then(_$_OperationsChangedAccountDetailEvent(
      operations: null == operations
          ? _value._operations
          : operations // ignore: cast_nullable_to_non_nullable
              as List<Operation>,
    ));
  }
}

/// @nodoc

class _$_OperationsChangedAccountDetailEvent
    implements _OperationsChangedAccountDetailEvent {
  const _$_OperationsChangedAccountDetailEvent(
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
    return 'AccountDetailEvent.operationsChanged(operations: $operations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OperationsChangedAccountDetailEvent &&
            const DeepCollectionEquality()
                .equals(other._operations, _operations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_operations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OperationsChangedAccountDetailEventCopyWith<
          _$_OperationsChangedAccountDetailEvent>
      get copyWith => __$$_OperationsChangedAccountDetailEventCopyWithImpl<
          _$_OperationsChangedAccountDetailEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int accountId) fetch,
    required TResult Function(String title) titleChanged,
    required TResult Function(List<Operation> operations) operationsChanged,
  }) {
    return operationsChanged(operations);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int accountId)? fetch,
    TResult? Function(String title)? titleChanged,
    TResult? Function(List<Operation> operations)? operationsChanged,
  }) {
    return operationsChanged?.call(operations);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int accountId)? fetch,
    TResult Function(String title)? titleChanged,
    TResult Function(List<Operation> operations)? operationsChanged,
    required TResult orElse(),
  }) {
    if (operationsChanged != null) {
      return operationsChanged(operations);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAccountDetailEvent value) fetch,
    required TResult Function(_TitleChangedAccountDetailEvent value)
        titleChanged,
    required TResult Function(_OperationsChangedAccountDetailEvent value)
        operationsChanged,
  }) {
    return operationsChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAccountDetailEvent value)? fetch,
    TResult? Function(_TitleChangedAccountDetailEvent value)? titleChanged,
    TResult? Function(_OperationsChangedAccountDetailEvent value)?
        operationsChanged,
  }) {
    return operationsChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAccountDetailEvent value)? fetch,
    TResult Function(_TitleChangedAccountDetailEvent value)? titleChanged,
    TResult Function(_OperationsChangedAccountDetailEvent value)?
        operationsChanged,
    required TResult orElse(),
  }) {
    if (operationsChanged != null) {
      return operationsChanged(this);
    }
    return orElse();
  }
}

abstract class _OperationsChangedAccountDetailEvent
    implements AccountDetailEvent {
  const factory _OperationsChangedAccountDetailEvent(
          {required final List<Operation> operations}) =
      _$_OperationsChangedAccountDetailEvent;

  List<Operation> get operations;
  @JsonKey(ignore: true)
  _$$_OperationsChangedAccountDetailEventCopyWith<
          _$_OperationsChangedAccountDetailEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AccountDetailState {
  String get title => throw _privateConstructorUsedError;
  List<Operation> get operations => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountDetailStateCopyWith<AccountDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountDetailStateCopyWith<$Res> {
  factory $AccountDetailStateCopyWith(
          AccountDetailState value, $Res Function(AccountDetailState) then) =
      _$AccountDetailStateCopyWithImpl<$Res, AccountDetailState>;
  @useResult
  $Res call({String title, List<Operation> operations});
}

/// @nodoc
class _$AccountDetailStateCopyWithImpl<$Res, $Val extends AccountDetailState>
    implements $AccountDetailStateCopyWith<$Res> {
  _$AccountDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? operations = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      operations: null == operations
          ? _value.operations
          : operations // ignore: cast_nullable_to_non_nullable
              as List<Operation>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccountDetailStateCopyWith<$Res>
    implements $AccountDetailStateCopyWith<$Res> {
  factory _$$_AccountDetailStateCopyWith(_$_AccountDetailState value,
          $Res Function(_$_AccountDetailState) then) =
      __$$_AccountDetailStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, List<Operation> operations});
}

/// @nodoc
class __$$_AccountDetailStateCopyWithImpl<$Res>
    extends _$AccountDetailStateCopyWithImpl<$Res, _$_AccountDetailState>
    implements _$$_AccountDetailStateCopyWith<$Res> {
  __$$_AccountDetailStateCopyWithImpl(
      _$_AccountDetailState _value, $Res Function(_$_AccountDetailState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? operations = null,
  }) {
    return _then(_$_AccountDetailState(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      operations: null == operations
          ? _value._operations
          : operations // ignore: cast_nullable_to_non_nullable
              as List<Operation>,
    ));
  }
}

/// @nodoc

class _$_AccountDetailState implements _AccountDetailState {
  const _$_AccountDetailState(
      {required this.title, required final List<Operation> operations})
      : _operations = operations;

  @override
  final String title;
  final List<Operation> _operations;
  @override
  List<Operation> get operations {
    if (_operations is EqualUnmodifiableListView) return _operations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_operations);
  }

  @override
  String toString() {
    return 'AccountDetailState(title: $title, operations: $operations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountDetailState &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other._operations, _operations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, title, const DeepCollectionEquality().hash(_operations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountDetailStateCopyWith<_$_AccountDetailState> get copyWith =>
      __$$_AccountDetailStateCopyWithImpl<_$_AccountDetailState>(
          this, _$identity);
}

abstract class _AccountDetailState implements AccountDetailState {
  const factory _AccountDetailState(
      {required final String title,
      required final List<Operation> operations}) = _$_AccountDetailState;

  @override
  String get title;
  @override
  List<Operation> get operations;
  @override
  @JsonKey(ignore: true)
  _$$_AccountDetailStateCopyWith<_$_AccountDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
