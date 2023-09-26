// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_balance_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountBalanceEvent {
  List<AccountBalance> get accounts => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<AccountBalance> accounts) changeBalance,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<AccountBalance> accounts)? changeBalance,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<AccountBalance> accounts)? changeBalance,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeBalanceAccountBalanceEvent value)
        changeBalance,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeBalanceAccountBalanceEvent value)? changeBalance,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeBalanceAccountBalanceEvent value)? changeBalance,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountBalanceEventCopyWith<AccountBalanceEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountBalanceEventCopyWith<$Res> {
  factory $AccountBalanceEventCopyWith(
          AccountBalanceEvent value, $Res Function(AccountBalanceEvent) then) =
      _$AccountBalanceEventCopyWithImpl<$Res, AccountBalanceEvent>;
  @useResult
  $Res call({List<AccountBalance> accounts});
}

/// @nodoc
class _$AccountBalanceEventCopyWithImpl<$Res, $Val extends AccountBalanceEvent>
    implements $AccountBalanceEventCopyWith<$Res> {
  _$AccountBalanceEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accounts = null,
  }) {
    return _then(_value.copyWith(
      accounts: null == accounts
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<AccountBalance>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChangeBalanceAccountBalanceEventCopyWith<$Res>
    implements $AccountBalanceEventCopyWith<$Res> {
  factory _$$_ChangeBalanceAccountBalanceEventCopyWith(
          _$_ChangeBalanceAccountBalanceEvent value,
          $Res Function(_$_ChangeBalanceAccountBalanceEvent) then) =
      __$$_ChangeBalanceAccountBalanceEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AccountBalance> accounts});
}

/// @nodoc
class __$$_ChangeBalanceAccountBalanceEventCopyWithImpl<$Res>
    extends _$AccountBalanceEventCopyWithImpl<$Res,
        _$_ChangeBalanceAccountBalanceEvent>
    implements _$$_ChangeBalanceAccountBalanceEventCopyWith<$Res> {
  __$$_ChangeBalanceAccountBalanceEventCopyWithImpl(
      _$_ChangeBalanceAccountBalanceEvent _value,
      $Res Function(_$_ChangeBalanceAccountBalanceEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accounts = null,
  }) {
    return _then(_$_ChangeBalanceAccountBalanceEvent(
      accounts: null == accounts
          ? _value._accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<AccountBalance>,
    ));
  }
}

/// @nodoc

class _$_ChangeBalanceAccountBalanceEvent
    implements _ChangeBalanceAccountBalanceEvent {
  const _$_ChangeBalanceAccountBalanceEvent(
      {required final List<AccountBalance> accounts})
      : _accounts = accounts;

  final List<AccountBalance> _accounts;
  @override
  List<AccountBalance> get accounts {
    if (_accounts is EqualUnmodifiableListView) return _accounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accounts);
  }

  @override
  String toString() {
    return 'AccountBalanceEvent.changeBalance(accounts: $accounts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeBalanceAccountBalanceEvent &&
            const DeepCollectionEquality().equals(other._accounts, _accounts));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_accounts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeBalanceAccountBalanceEventCopyWith<
          _$_ChangeBalanceAccountBalanceEvent>
      get copyWith => __$$_ChangeBalanceAccountBalanceEventCopyWithImpl<
          _$_ChangeBalanceAccountBalanceEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<AccountBalance> accounts) changeBalance,
  }) {
    return changeBalance(accounts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<AccountBalance> accounts)? changeBalance,
  }) {
    return changeBalance?.call(accounts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<AccountBalance> accounts)? changeBalance,
    required TResult orElse(),
  }) {
    if (changeBalance != null) {
      return changeBalance(accounts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeBalanceAccountBalanceEvent value)
        changeBalance,
  }) {
    return changeBalance(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeBalanceAccountBalanceEvent value)? changeBalance,
  }) {
    return changeBalance?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeBalanceAccountBalanceEvent value)? changeBalance,
    required TResult orElse(),
  }) {
    if (changeBalance != null) {
      return changeBalance(this);
    }
    return orElse();
  }
}

abstract class _ChangeBalanceAccountBalanceEvent
    implements AccountBalanceEvent {
  const factory _ChangeBalanceAccountBalanceEvent(
          {required final List<AccountBalance> accounts}) =
      _$_ChangeBalanceAccountBalanceEvent;

  @override
  List<AccountBalance> get accounts;
  @override
  @JsonKey(ignore: true)
  _$$_ChangeBalanceAccountBalanceEventCopyWith<
          _$_ChangeBalanceAccountBalanceEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AccountBalanceState {
  List<AccountBalance> get accounts => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountBalanceStateCopyWith<AccountBalanceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountBalanceStateCopyWith<$Res> {
  factory $AccountBalanceStateCopyWith(
          AccountBalanceState value, $Res Function(AccountBalanceState) then) =
      _$AccountBalanceStateCopyWithImpl<$Res, AccountBalanceState>;
  @useResult
  $Res call({List<AccountBalance> accounts});
}

/// @nodoc
class _$AccountBalanceStateCopyWithImpl<$Res, $Val extends AccountBalanceState>
    implements $AccountBalanceStateCopyWith<$Res> {
  _$AccountBalanceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accounts = null,
  }) {
    return _then(_value.copyWith(
      accounts: null == accounts
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<AccountBalance>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccountBalanceStateCopyWith<$Res>
    implements $AccountBalanceStateCopyWith<$Res> {
  factory _$$_AccountBalanceStateCopyWith(_$_AccountBalanceState value,
          $Res Function(_$_AccountBalanceState) then) =
      __$$_AccountBalanceStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AccountBalance> accounts});
}

/// @nodoc
class __$$_AccountBalanceStateCopyWithImpl<$Res>
    extends _$AccountBalanceStateCopyWithImpl<$Res, _$_AccountBalanceState>
    implements _$$_AccountBalanceStateCopyWith<$Res> {
  __$$_AccountBalanceStateCopyWithImpl(_$_AccountBalanceState _value,
      $Res Function(_$_AccountBalanceState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accounts = null,
  }) {
    return _then(_$_AccountBalanceState(
      accounts: null == accounts
          ? _value._accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<AccountBalance>,
    ));
  }
}

/// @nodoc

class _$_AccountBalanceState implements _AccountBalanceState {
  const _$_AccountBalanceState({required final List<AccountBalance> accounts})
      : _accounts = accounts;

  final List<AccountBalance> _accounts;
  @override
  List<AccountBalance> get accounts {
    if (_accounts is EqualUnmodifiableListView) return _accounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accounts);
  }

  @override
  String toString() {
    return 'AccountBalanceState(accounts: $accounts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountBalanceState &&
            const DeepCollectionEquality().equals(other._accounts, _accounts));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_accounts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountBalanceStateCopyWith<_$_AccountBalanceState> get copyWith =>
      __$$_AccountBalanceStateCopyWithImpl<_$_AccountBalanceState>(
          this, _$identity);
}

abstract class _AccountBalanceState implements AccountBalanceState {
  const factory _AccountBalanceState(
      {required final List<AccountBalance> accounts}) = _$_AccountBalanceState;

  @override
  List<AccountBalance> get accounts;
  @override
  @JsonKey(ignore: true)
  _$$_AccountBalanceStateCopyWith<_$_AccountBalanceState> get copyWith =>
      throw _privateConstructorUsedError;
}
