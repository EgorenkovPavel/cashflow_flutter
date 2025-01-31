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
abstract class _$$ChangeBalanceAccountBalanceEventImplCopyWith<$Res>
    implements $AccountBalanceEventCopyWith<$Res> {
  factory _$$ChangeBalanceAccountBalanceEventImplCopyWith(
          _$ChangeBalanceAccountBalanceEventImpl value,
          $Res Function(_$ChangeBalanceAccountBalanceEventImpl) then) =
      __$$ChangeBalanceAccountBalanceEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AccountBalance> accounts});
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accounts = null,
  }) {
    return _then(_$ChangeBalanceAccountBalanceEventImpl(
      accounts: null == accounts
          ? _value._accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<AccountBalance>,
    ));
  }
}

/// @nodoc

class _$ChangeBalanceAccountBalanceEventImpl
    implements _ChangeBalanceAccountBalanceEvent {
  const _$ChangeBalanceAccountBalanceEventImpl(
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeBalanceAccountBalanceEventImpl &&
            const DeepCollectionEquality().equals(other._accounts, _accounts));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_accounts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeBalanceAccountBalanceEventImplCopyWith<
          _$ChangeBalanceAccountBalanceEventImpl>
      get copyWith => __$$ChangeBalanceAccountBalanceEventImplCopyWithImpl<
          _$ChangeBalanceAccountBalanceEventImpl>(this, _$identity);

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
      _$ChangeBalanceAccountBalanceEventImpl;

  @override
  List<AccountBalance> get accounts;
  @override
  @JsonKey(ignore: true)
  _$$ChangeBalanceAccountBalanceEventImplCopyWith<
          _$ChangeBalanceAccountBalanceEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AccountBalanceState {
  List<AccountBalance> get balances => throw _privateConstructorUsedError;
  Map<Currency, int> get totals => throw _privateConstructorUsedError;

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
  $Res call({List<AccountBalance> balances, Map<Currency, int> totals});
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
    Object? balances = null,
    Object? totals = null,
  }) {
    return _then(_value.copyWith(
      balances: null == balances
          ? _value.balances
          : balances // ignore: cast_nullable_to_non_nullable
              as List<AccountBalance>,
      totals: null == totals
          ? _value.totals
          : totals // ignore: cast_nullable_to_non_nullable
              as Map<Currency, int>,
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
  $Res call({List<AccountBalance> balances, Map<Currency, int> totals});
}

/// @nodoc
class __$$AccountBalanceStateImplCopyWithImpl<$Res>
    extends _$AccountBalanceStateCopyWithImpl<$Res, _$AccountBalanceStateImpl>
    implements _$$AccountBalanceStateImplCopyWith<$Res> {
  __$$AccountBalanceStateImplCopyWithImpl(_$AccountBalanceStateImpl _value,
      $Res Function(_$AccountBalanceStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balances = null,
    Object? totals = null,
  }) {
    return _then(_$AccountBalanceStateImpl(
      balances: null == balances
          ? _value._balances
          : balances // ignore: cast_nullable_to_non_nullable
              as List<AccountBalance>,
      totals: null == totals
          ? _value._totals
          : totals // ignore: cast_nullable_to_non_nullable
              as Map<Currency, int>,
    ));
  }
}

/// @nodoc

class _$AccountBalanceStateImpl extends _AccountBalanceState {
  const _$AccountBalanceStateImpl(
      {required final List<AccountBalance> balances,
      required final Map<Currency, int> totals})
      : _balances = balances,
        _totals = totals,
        super._();

  final List<AccountBalance> _balances;
  @override
  List<AccountBalance> get balances {
    if (_balances is EqualUnmodifiableListView) return _balances;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_balances);
  }

  final Map<Currency, int> _totals;
  @override
  Map<Currency, int> get totals {
    if (_totals is EqualUnmodifiableMapView) return _totals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_totals);
  }

  @override
  String toString() {
    return 'AccountBalanceState(balances: $balances, totals: $totals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountBalanceStateImpl &&
            const DeepCollectionEquality().equals(other._balances, _balances) &&
            const DeepCollectionEquality().equals(other._totals, _totals));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_balances),
      const DeepCollectionEquality().hash(_totals));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountBalanceStateImplCopyWith<_$AccountBalanceStateImpl> get copyWith =>
      __$$AccountBalanceStateImplCopyWithImpl<_$AccountBalanceStateImpl>(
          this, _$identity);
}

abstract class _AccountBalanceState extends AccountBalanceState {
  const factory _AccountBalanceState(
      {required final List<AccountBalance> balances,
      required final Map<Currency, int> totals}) = _$AccountBalanceStateImpl;
  const _AccountBalanceState._() : super._();

  @override
  List<AccountBalance> get balances;
  @override
  Map<Currency, int> get totals;
  @override
  @JsonKey(ignore: true)
  _$$AccountBalanceStateImplCopyWith<_$AccountBalanceStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
