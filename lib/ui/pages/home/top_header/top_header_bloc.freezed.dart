// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_header_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TopHeaderEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(List<AccountBalance> accounts) changeBalance,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(List<AccountBalance> accounts)? changeBalance,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(List<AccountBalance> accounts)? changeBalance,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchTopHeaderEvent value) fetch,
    required TResult Function(_ChangeBalanceTopHeaderEvent value) changeBalance,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchTopHeaderEvent value)? fetch,
    TResult? Function(_ChangeBalanceTopHeaderEvent value)? changeBalance,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchTopHeaderEvent value)? fetch,
    TResult Function(_ChangeBalanceTopHeaderEvent value)? changeBalance,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopHeaderEventCopyWith<$Res> {
  factory $TopHeaderEventCopyWith(
          TopHeaderEvent value, $Res Function(TopHeaderEvent) then) =
      _$TopHeaderEventCopyWithImpl<$Res, TopHeaderEvent>;
}

/// @nodoc
class _$TopHeaderEventCopyWithImpl<$Res, $Val extends TopHeaderEvent>
    implements $TopHeaderEventCopyWith<$Res> {
  _$TopHeaderEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_FetchTopHeaderEventCopyWith<$Res> {
  factory _$$_FetchTopHeaderEventCopyWith(_$_FetchTopHeaderEvent value,
          $Res Function(_$_FetchTopHeaderEvent) then) =
      __$$_FetchTopHeaderEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FetchTopHeaderEventCopyWithImpl<$Res>
    extends _$TopHeaderEventCopyWithImpl<$Res, _$_FetchTopHeaderEvent>
    implements _$$_FetchTopHeaderEventCopyWith<$Res> {
  __$$_FetchTopHeaderEventCopyWithImpl(_$_FetchTopHeaderEvent _value,
      $Res Function(_$_FetchTopHeaderEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_FetchTopHeaderEvent implements _FetchTopHeaderEvent {
  const _$_FetchTopHeaderEvent();

  @override
  String toString() {
    return 'TopHeaderEvent.fetch()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_FetchTopHeaderEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(List<AccountBalance> accounts) changeBalance,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(List<AccountBalance> accounts)? changeBalance,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(List<AccountBalance> accounts)? changeBalance,
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
    required TResult Function(_FetchTopHeaderEvent value) fetch,
    required TResult Function(_ChangeBalanceTopHeaderEvent value) changeBalance,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchTopHeaderEvent value)? fetch,
    TResult? Function(_ChangeBalanceTopHeaderEvent value)? changeBalance,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchTopHeaderEvent value)? fetch,
    TResult Function(_ChangeBalanceTopHeaderEvent value)? changeBalance,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _FetchTopHeaderEvent implements TopHeaderEvent {
  const factory _FetchTopHeaderEvent() = _$_FetchTopHeaderEvent;
}

/// @nodoc
abstract class _$$_ChangeBalanceTopHeaderEventCopyWith<$Res> {
  factory _$$_ChangeBalanceTopHeaderEventCopyWith(
          _$_ChangeBalanceTopHeaderEvent value,
          $Res Function(_$_ChangeBalanceTopHeaderEvent) then) =
      __$$_ChangeBalanceTopHeaderEventCopyWithImpl<$Res>;
  @useResult
  $Res call({List<AccountBalance> accounts});
}

/// @nodoc
class __$$_ChangeBalanceTopHeaderEventCopyWithImpl<$Res>
    extends _$TopHeaderEventCopyWithImpl<$Res, _$_ChangeBalanceTopHeaderEvent>
    implements _$$_ChangeBalanceTopHeaderEventCopyWith<$Res> {
  __$$_ChangeBalanceTopHeaderEventCopyWithImpl(
      _$_ChangeBalanceTopHeaderEvent _value,
      $Res Function(_$_ChangeBalanceTopHeaderEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accounts = null,
  }) {
    return _then(_$_ChangeBalanceTopHeaderEvent(
      accounts: null == accounts
          ? _value._accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<AccountBalance>,
    ));
  }
}

/// @nodoc

class _$_ChangeBalanceTopHeaderEvent implements _ChangeBalanceTopHeaderEvent {
  const _$_ChangeBalanceTopHeaderEvent(
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
    return 'TopHeaderEvent.changeBalance(accounts: $accounts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeBalanceTopHeaderEvent &&
            const DeepCollectionEquality().equals(other._accounts, _accounts));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_accounts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeBalanceTopHeaderEventCopyWith<_$_ChangeBalanceTopHeaderEvent>
      get copyWith => __$$_ChangeBalanceTopHeaderEventCopyWithImpl<
          _$_ChangeBalanceTopHeaderEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(List<AccountBalance> accounts) changeBalance,
  }) {
    return changeBalance(accounts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(List<AccountBalance> accounts)? changeBalance,
  }) {
    return changeBalance?.call(accounts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
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
    required TResult Function(_FetchTopHeaderEvent value) fetch,
    required TResult Function(_ChangeBalanceTopHeaderEvent value) changeBalance,
  }) {
    return changeBalance(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchTopHeaderEvent value)? fetch,
    TResult? Function(_ChangeBalanceTopHeaderEvent value)? changeBalance,
  }) {
    return changeBalance?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchTopHeaderEvent value)? fetch,
    TResult Function(_ChangeBalanceTopHeaderEvent value)? changeBalance,
    required TResult orElse(),
  }) {
    if (changeBalance != null) {
      return changeBalance(this);
    }
    return orElse();
  }
}

abstract class _ChangeBalanceTopHeaderEvent implements TopHeaderEvent {
  const factory _ChangeBalanceTopHeaderEvent(
          {required final List<AccountBalance> accounts}) =
      _$_ChangeBalanceTopHeaderEvent;

  List<AccountBalance> get accounts;
  @JsonKey(ignore: true)
  _$$_ChangeBalanceTopHeaderEventCopyWith<_$_ChangeBalanceTopHeaderEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TopHeaderState {
  int get totalBalance => throw _privateConstructorUsedError;
  List<AccountBalance> get accounts => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TopHeaderStateCopyWith<TopHeaderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopHeaderStateCopyWith<$Res> {
  factory $TopHeaderStateCopyWith(
          TopHeaderState value, $Res Function(TopHeaderState) then) =
      _$TopHeaderStateCopyWithImpl<$Res, TopHeaderState>;
  @useResult
  $Res call({int totalBalance, List<AccountBalance> accounts});
}

/// @nodoc
class _$TopHeaderStateCopyWithImpl<$Res, $Val extends TopHeaderState>
    implements $TopHeaderStateCopyWith<$Res> {
  _$TopHeaderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBalance = null,
    Object? accounts = null,
  }) {
    return _then(_value.copyWith(
      totalBalance: null == totalBalance
          ? _value.totalBalance
          : totalBalance // ignore: cast_nullable_to_non_nullable
              as int,
      accounts: null == accounts
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<AccountBalance>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TopHeaderStateCopyWith<$Res>
    implements $TopHeaderStateCopyWith<$Res> {
  factory _$$_TopHeaderStateCopyWith(
          _$_TopHeaderState value, $Res Function(_$_TopHeaderState) then) =
      __$$_TopHeaderStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int totalBalance, List<AccountBalance> accounts});
}

/// @nodoc
class __$$_TopHeaderStateCopyWithImpl<$Res>
    extends _$TopHeaderStateCopyWithImpl<$Res, _$_TopHeaderState>
    implements _$$_TopHeaderStateCopyWith<$Res> {
  __$$_TopHeaderStateCopyWithImpl(
      _$_TopHeaderState _value, $Res Function(_$_TopHeaderState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBalance = null,
    Object? accounts = null,
  }) {
    return _then(_$_TopHeaderState(
      totalBalance: null == totalBalance
          ? _value.totalBalance
          : totalBalance // ignore: cast_nullable_to_non_nullable
              as int,
      accounts: null == accounts
          ? _value._accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<AccountBalance>,
    ));
  }
}

/// @nodoc

class _$_TopHeaderState implements _TopHeaderState {
  const _$_TopHeaderState(
      {required this.totalBalance,
      required final List<AccountBalance> accounts})
      : _accounts = accounts;

  @override
  final int totalBalance;
  final List<AccountBalance> _accounts;
  @override
  List<AccountBalance> get accounts {
    if (_accounts is EqualUnmodifiableListView) return _accounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accounts);
  }

  @override
  String toString() {
    return 'TopHeaderState(totalBalance: $totalBalance, accounts: $accounts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TopHeaderState &&
            (identical(other.totalBalance, totalBalance) ||
                other.totalBalance == totalBalance) &&
            const DeepCollectionEquality().equals(other._accounts, _accounts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, totalBalance,
      const DeepCollectionEquality().hash(_accounts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TopHeaderStateCopyWith<_$_TopHeaderState> get copyWith =>
      __$$_TopHeaderStateCopyWithImpl<_$_TopHeaderState>(this, _$identity);
}

abstract class _TopHeaderState implements TopHeaderState {
  const factory _TopHeaderState(
      {required final int totalBalance,
      required final List<AccountBalance> accounts}) = _$_TopHeaderState;

  @override
  int get totalBalance;
  @override
  List<AccountBalance> get accounts;
  @override
  @JsonKey(ignore: true)
  _$$_TopHeaderStateCopyWith<_$_TopHeaderState> get copyWith =>
      throw _privateConstructorUsedError;
}
