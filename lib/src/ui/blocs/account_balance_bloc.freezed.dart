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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AccountBalanceEvent {
  List<BaseAccountBalanceListItem> get accounts =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<BaseAccountBalanceListItem> accounts)
        changeBalance,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<BaseAccountBalanceListItem> accounts)? changeBalance,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<BaseAccountBalanceListItem> accounts)? changeBalance,
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

  /// Create a copy of AccountBalanceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountBalanceEventCopyWith<AccountBalanceEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountBalanceEventCopyWith<$Res> {
  factory $AccountBalanceEventCopyWith(
          AccountBalanceEvent value, $Res Function(AccountBalanceEvent) then) =
      _$AccountBalanceEventCopyWithImpl<$Res, AccountBalanceEvent>;
  @useResult
  $Res call({List<BaseAccountBalanceListItem> accounts});
}

/// @nodoc
class _$AccountBalanceEventCopyWithImpl<$Res, $Val extends AccountBalanceEvent>
    implements $AccountBalanceEventCopyWith<$Res> {
  _$AccountBalanceEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountBalanceEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accounts = null,
  }) {
    return _then(_value.copyWith(
      accounts: null == accounts
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<BaseAccountBalanceListItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChangeBalanceAccountBalanceEventImplCopyWith<$Res>
    implements $AccountBalanceEventCopyWith<$Res> {
  factory _$$ChangeBalanceAccountBalanceEventImplCopyWith(
          _$ChangeBalanceAccountBalanceEventImpl value,
          $Res Function(_$ChangeBalanceAccountBalanceEventImpl) then) =
      __$$ChangeBalanceAccountBalanceEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<BaseAccountBalanceListItem> accounts});
}

/// @nodoc
class __$$ChangeBalanceAccountBalanceEventImplCopyWithImpl<$Res>
    extends _$AccountBalanceEventCopyWithImpl<$Res,
        _$ChangeBalanceAccountBalanceEventImpl>
    implements _$$ChangeBalanceAccountBalanceEventImplCopyWith<$Res> {
  __$$ChangeBalanceAccountBalanceEventImplCopyWithImpl(
      _$ChangeBalanceAccountBalanceEventImpl _value,
      $Res Function(_$ChangeBalanceAccountBalanceEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountBalanceEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accounts = null,
  }) {
    return _then(_$ChangeBalanceAccountBalanceEventImpl(
      accounts: null == accounts
          ? _value._accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<BaseAccountBalanceListItem>,
    ));
  }
}

/// @nodoc

class _$ChangeBalanceAccountBalanceEventImpl
    implements _ChangeBalanceAccountBalanceEvent {
  const _$ChangeBalanceAccountBalanceEventImpl(
      {required final List<BaseAccountBalanceListItem> accounts})
      : _accounts = accounts;

  final List<BaseAccountBalanceListItem> _accounts;
  @override
  List<BaseAccountBalanceListItem> get accounts {
    if (_accounts is EqualUnmodifiableListView) return _accounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accounts);
  }

  @override
  String toString() {
    return 'AccountBalanceEvent.changeBalance(accounts: $accounts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeBalanceAccountBalanceEventImpl &&
            const DeepCollectionEquality().equals(other._accounts, _accounts));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_accounts));

  /// Create a copy of AccountBalanceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeBalanceAccountBalanceEventImplCopyWith<
          _$ChangeBalanceAccountBalanceEventImpl>
      get copyWith => __$$ChangeBalanceAccountBalanceEventImplCopyWithImpl<
          _$ChangeBalanceAccountBalanceEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<BaseAccountBalanceListItem> accounts)
        changeBalance,
  }) {
    return changeBalance(accounts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<BaseAccountBalanceListItem> accounts)? changeBalance,
  }) {
    return changeBalance?.call(accounts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<BaseAccountBalanceListItem> accounts)? changeBalance,
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
          {required final List<BaseAccountBalanceListItem> accounts}) =
      _$ChangeBalanceAccountBalanceEventImpl;

  @override
  List<BaseAccountBalanceListItem> get accounts;

  /// Create a copy of AccountBalanceEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeBalanceAccountBalanceEventImplCopyWith<
          _$ChangeBalanceAccountBalanceEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AccountBalanceState {
  List<BaseAccountBalanceListItem> get balances =>
      throw _privateConstructorUsedError;

  /// Create a copy of AccountBalanceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountBalanceStateCopyWith<AccountBalanceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountBalanceStateCopyWith<$Res> {
  factory $AccountBalanceStateCopyWith(
          AccountBalanceState value, $Res Function(AccountBalanceState) then) =
      _$AccountBalanceStateCopyWithImpl<$Res, AccountBalanceState>;
  @useResult
  $Res call({List<BaseAccountBalanceListItem> balances});
}

/// @nodoc
class _$AccountBalanceStateCopyWithImpl<$Res, $Val extends AccountBalanceState>
    implements $AccountBalanceStateCopyWith<$Res> {
  _$AccountBalanceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountBalanceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balances = null,
  }) {
    return _then(_value.copyWith(
      balances: null == balances
          ? _value.balances
          : balances // ignore: cast_nullable_to_non_nullable
              as List<BaseAccountBalanceListItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountBalanceStateImplCopyWith<$Res>
    implements $AccountBalanceStateCopyWith<$Res> {
  factory _$$AccountBalanceStateImplCopyWith(_$AccountBalanceStateImpl value,
          $Res Function(_$AccountBalanceStateImpl) then) =
      __$$AccountBalanceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<BaseAccountBalanceListItem> balances});
}

/// @nodoc
class __$$AccountBalanceStateImplCopyWithImpl<$Res>
    extends _$AccountBalanceStateCopyWithImpl<$Res, _$AccountBalanceStateImpl>
    implements _$$AccountBalanceStateImplCopyWith<$Res> {
  __$$AccountBalanceStateImplCopyWithImpl(_$AccountBalanceStateImpl _value,
      $Res Function(_$AccountBalanceStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountBalanceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balances = null,
  }) {
    return _then(_$AccountBalanceStateImpl(
      balances: null == balances
          ? _value._balances
          : balances // ignore: cast_nullable_to_non_nullable
              as List<BaseAccountBalanceListItem>,
    ));
  }
}

/// @nodoc

class _$AccountBalanceStateImpl extends _AccountBalanceState {
  const _$AccountBalanceStateImpl(
      {required final List<BaseAccountBalanceListItem> balances})
      : _balances = balances,
        super._();

  final List<BaseAccountBalanceListItem> _balances;
  @override
  List<BaseAccountBalanceListItem> get balances {
    if (_balances is EqualUnmodifiableListView) return _balances;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_balances);
  }

  @override
  String toString() {
    return 'AccountBalanceState(balances: $balances)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountBalanceStateImpl &&
            const DeepCollectionEquality().equals(other._balances, _balances));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_balances));

  /// Create a copy of AccountBalanceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountBalanceStateImplCopyWith<_$AccountBalanceStateImpl> get copyWith =>
      __$$AccountBalanceStateImplCopyWithImpl<_$AccountBalanceStateImpl>(
          this, _$identity);
}

abstract class _AccountBalanceState extends AccountBalanceState {
  const factory _AccountBalanceState(
          {required final List<BaseAccountBalanceListItem> balances}) =
      _$AccountBalanceStateImpl;
  const _AccountBalanceState._() : super._();

  @override
  List<BaseAccountBalanceListItem> get balances;

  /// Create a copy of AccountBalanceState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountBalanceStateImplCopyWith<_$AccountBalanceStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
