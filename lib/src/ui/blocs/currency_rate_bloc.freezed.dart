// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency_rate_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CurrencyRateEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(double usd, double eur) change,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(double usd, double eur)? change,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(double usd, double eur)? change,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchCurrencyRateEvent value) fetch,
    required TResult Function(_ChangeCurrencyRateEvent value) change,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchCurrencyRateEvent value)? fetch,
    TResult? Function(_ChangeCurrencyRateEvent value)? change,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchCurrencyRateEvent value)? fetch,
    TResult Function(_ChangeCurrencyRateEvent value)? change,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyRateEventCopyWith<$Res> {
  factory $CurrencyRateEventCopyWith(
          CurrencyRateEvent value, $Res Function(CurrencyRateEvent) then) =
      _$CurrencyRateEventCopyWithImpl<$Res, CurrencyRateEvent>;
}

/// @nodoc
class _$CurrencyRateEventCopyWithImpl<$Res, $Val extends CurrencyRateEvent>
    implements $CurrencyRateEventCopyWith<$Res> {
  _$CurrencyRateEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrencyRateEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchCurrencyRateEventImplCopyWith<$Res> {
  factory _$$FetchCurrencyRateEventImplCopyWith(
          _$FetchCurrencyRateEventImpl value,
          $Res Function(_$FetchCurrencyRateEventImpl) then) =
      __$$FetchCurrencyRateEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchCurrencyRateEventImplCopyWithImpl<$Res>
    extends _$CurrencyRateEventCopyWithImpl<$Res, _$FetchCurrencyRateEventImpl>
    implements _$$FetchCurrencyRateEventImplCopyWith<$Res> {
  __$$FetchCurrencyRateEventImplCopyWithImpl(
      _$FetchCurrencyRateEventImpl _value,
      $Res Function(_$FetchCurrencyRateEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurrencyRateEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchCurrencyRateEventImpl implements _FetchCurrencyRateEvent {
  const _$FetchCurrencyRateEventImpl();

  @override
  String toString() {
    return 'CurrencyRateEvent.fetch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchCurrencyRateEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(double usd, double eur) change,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(double usd, double eur)? change,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(double usd, double eur)? change,
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
    required TResult Function(_FetchCurrencyRateEvent value) fetch,
    required TResult Function(_ChangeCurrencyRateEvent value) change,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchCurrencyRateEvent value)? fetch,
    TResult? Function(_ChangeCurrencyRateEvent value)? change,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchCurrencyRateEvent value)? fetch,
    TResult Function(_ChangeCurrencyRateEvent value)? change,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _FetchCurrencyRateEvent implements CurrencyRateEvent {
  const factory _FetchCurrencyRateEvent() = _$FetchCurrencyRateEventImpl;
}

/// @nodoc
abstract class _$$ChangeCurrencyRateEventImplCopyWith<$Res> {
  factory _$$ChangeCurrencyRateEventImplCopyWith(
          _$ChangeCurrencyRateEventImpl value,
          $Res Function(_$ChangeCurrencyRateEventImpl) then) =
      __$$ChangeCurrencyRateEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double usd, double eur});
}

/// @nodoc
class __$$ChangeCurrencyRateEventImplCopyWithImpl<$Res>
    extends _$CurrencyRateEventCopyWithImpl<$Res, _$ChangeCurrencyRateEventImpl>
    implements _$$ChangeCurrencyRateEventImplCopyWith<$Res> {
  __$$ChangeCurrencyRateEventImplCopyWithImpl(
      _$ChangeCurrencyRateEventImpl _value,
      $Res Function(_$ChangeCurrencyRateEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurrencyRateEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usd = null,
    Object? eur = null,
  }) {
    return _then(_$ChangeCurrencyRateEventImpl(
      usd: null == usd
          ? _value.usd
          : usd // ignore: cast_nullable_to_non_nullable
              as double,
      eur: null == eur
          ? _value.eur
          : eur // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$ChangeCurrencyRateEventImpl implements _ChangeCurrencyRateEvent {
  const _$ChangeCurrencyRateEventImpl({required this.usd, required this.eur});

  @override
  final double usd;
  @override
  final double eur;

  @override
  String toString() {
    return 'CurrencyRateEvent.change(usd: $usd, eur: $eur)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeCurrencyRateEventImpl &&
            (identical(other.usd, usd) || other.usd == usd) &&
            (identical(other.eur, eur) || other.eur == eur));
  }

  @override
  int get hashCode => Object.hash(runtimeType, usd, eur);

  /// Create a copy of CurrencyRateEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeCurrencyRateEventImplCopyWith<_$ChangeCurrencyRateEventImpl>
      get copyWith => __$$ChangeCurrencyRateEventImplCopyWithImpl<
          _$ChangeCurrencyRateEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(double usd, double eur) change,
  }) {
    return change(usd, eur);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(double usd, double eur)? change,
  }) {
    return change?.call(usd, eur);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(double usd, double eur)? change,
    required TResult orElse(),
  }) {
    if (change != null) {
      return change(usd, eur);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchCurrencyRateEvent value) fetch,
    required TResult Function(_ChangeCurrencyRateEvent value) change,
  }) {
    return change(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchCurrencyRateEvent value)? fetch,
    TResult? Function(_ChangeCurrencyRateEvent value)? change,
  }) {
    return change?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchCurrencyRateEvent value)? fetch,
    TResult Function(_ChangeCurrencyRateEvent value)? change,
    required TResult orElse(),
  }) {
    if (change != null) {
      return change(this);
    }
    return orElse();
  }
}

abstract class _ChangeCurrencyRateEvent implements CurrencyRateEvent {
  const factory _ChangeCurrencyRateEvent(
      {required final double usd,
      required final double eur}) = _$ChangeCurrencyRateEventImpl;

  double get usd;
  double get eur;

  /// Create a copy of CurrencyRateEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeCurrencyRateEventImplCopyWith<_$ChangeCurrencyRateEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CurrencyRateState {
  double get usd => throw _privateConstructorUsedError;
  double get eur => throw _privateConstructorUsedError;

  /// Create a copy of CurrencyRateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrencyRateStateCopyWith<CurrencyRateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyRateStateCopyWith<$Res> {
  factory $CurrencyRateStateCopyWith(
          CurrencyRateState value, $Res Function(CurrencyRateState) then) =
      _$CurrencyRateStateCopyWithImpl<$Res, CurrencyRateState>;
  @useResult
  $Res call({double usd, double eur});
}

/// @nodoc
class _$CurrencyRateStateCopyWithImpl<$Res, $Val extends CurrencyRateState>
    implements $CurrencyRateStateCopyWith<$Res> {
  _$CurrencyRateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrencyRateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usd = null,
    Object? eur = null,
  }) {
    return _then(_value.copyWith(
      usd: null == usd
          ? _value.usd
          : usd // ignore: cast_nullable_to_non_nullable
              as double,
      eur: null == eur
          ? _value.eur
          : eur // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrencyRateStateImplCopyWith<$Res>
    implements $CurrencyRateStateCopyWith<$Res> {
  factory _$$CurrencyRateStateImplCopyWith(_$CurrencyRateStateImpl value,
          $Res Function(_$CurrencyRateStateImpl) then) =
      __$$CurrencyRateStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double usd, double eur});
}

/// @nodoc
class __$$CurrencyRateStateImplCopyWithImpl<$Res>
    extends _$CurrencyRateStateCopyWithImpl<$Res, _$CurrencyRateStateImpl>
    implements _$$CurrencyRateStateImplCopyWith<$Res> {
  __$$CurrencyRateStateImplCopyWithImpl(_$CurrencyRateStateImpl _value,
      $Res Function(_$CurrencyRateStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurrencyRateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usd = null,
    Object? eur = null,
  }) {
    return _then(_$CurrencyRateStateImpl(
      usd: null == usd
          ? _value.usd
          : usd // ignore: cast_nullable_to_non_nullable
              as double,
      eur: null == eur
          ? _value.eur
          : eur // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$CurrencyRateStateImpl extends _CurrencyRateState {
  const _$CurrencyRateStateImpl({required this.usd, required this.eur})
      : super._();

  @override
  final double usd;
  @override
  final double eur;

  @override
  String toString() {
    return 'CurrencyRateState(usd: $usd, eur: $eur)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrencyRateStateImpl &&
            (identical(other.usd, usd) || other.usd == usd) &&
            (identical(other.eur, eur) || other.eur == eur));
  }

  @override
  int get hashCode => Object.hash(runtimeType, usd, eur);

  /// Create a copy of CurrencyRateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrencyRateStateImplCopyWith<_$CurrencyRateStateImpl> get copyWith =>
      __$$CurrencyRateStateImplCopyWithImpl<_$CurrencyRateStateImpl>(
          this, _$identity);
}

abstract class _CurrencyRateState extends CurrencyRateState {
  const factory _CurrencyRateState(
      {required final double usd,
      required final double eur}) = _$CurrencyRateStateImpl;
  const _CurrencyRateState._() : super._();

  @override
  double get usd;
  @override
  double get eur;

  /// Create a copy of CurrencyRateState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrencyRateStateImplCopyWith<_$CurrencyRateStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
