// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency_rate_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CurrencyRateEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurrencyRateEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CurrencyRateEvent()';
}


}

/// @nodoc
class $CurrencyRateEventCopyWith<$Res>  {
$CurrencyRateEventCopyWith(CurrencyRateEvent _, $Res Function(CurrencyRateEvent) __);
}


/// Adds pattern-matching-related methods to [CurrencyRateEvent].
extension CurrencyRateEventPatterns on CurrencyRateEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchCurrencyRateEvent value)?  fetch,TResult Function( _ChangeCurrencyRateEvent value)?  change,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchCurrencyRateEvent() when fetch != null:
return fetch(_that);case _ChangeCurrencyRateEvent() when change != null:
return change(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchCurrencyRateEvent value)  fetch,required TResult Function( _ChangeCurrencyRateEvent value)  change,}){
final _that = this;
switch (_that) {
case _FetchCurrencyRateEvent():
return fetch(_that);case _ChangeCurrencyRateEvent():
return change(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchCurrencyRateEvent value)?  fetch,TResult? Function( _ChangeCurrencyRateEvent value)?  change,}){
final _that = this;
switch (_that) {
case _FetchCurrencyRateEvent() when fetch != null:
return fetch(_that);case _ChangeCurrencyRateEvent() when change != null:
return change(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetch,TResult Function( double usd,  double eur)?  change,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchCurrencyRateEvent() when fetch != null:
return fetch();case _ChangeCurrencyRateEvent() when change != null:
return change(_that.usd,_that.eur);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetch,required TResult Function( double usd,  double eur)  change,}) {final _that = this;
switch (_that) {
case _FetchCurrencyRateEvent():
return fetch();case _ChangeCurrencyRateEvent():
return change(_that.usd,_that.eur);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetch,TResult? Function( double usd,  double eur)?  change,}) {final _that = this;
switch (_that) {
case _FetchCurrencyRateEvent() when fetch != null:
return fetch();case _ChangeCurrencyRateEvent() when change != null:
return change(_that.usd,_that.eur);case _:
  return null;

}
}

}

/// @nodoc


class _FetchCurrencyRateEvent implements CurrencyRateEvent {
  const _FetchCurrencyRateEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchCurrencyRateEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CurrencyRateEvent.fetch()';
}


}




/// @nodoc


class _ChangeCurrencyRateEvent implements CurrencyRateEvent {
  const _ChangeCurrencyRateEvent({required this.usd, required this.eur});
  

 final  double usd;
 final  double eur;

/// Create a copy of CurrencyRateEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeCurrencyRateEventCopyWith<_ChangeCurrencyRateEvent> get copyWith => __$ChangeCurrencyRateEventCopyWithImpl<_ChangeCurrencyRateEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeCurrencyRateEvent&&(identical(other.usd, usd) || other.usd == usd)&&(identical(other.eur, eur) || other.eur == eur));
}


@override
int get hashCode => Object.hash(runtimeType,usd,eur);

@override
String toString() {
  return 'CurrencyRateEvent.change(usd: $usd, eur: $eur)';
}


}

/// @nodoc
abstract mixin class _$ChangeCurrencyRateEventCopyWith<$Res> implements $CurrencyRateEventCopyWith<$Res> {
  factory _$ChangeCurrencyRateEventCopyWith(_ChangeCurrencyRateEvent value, $Res Function(_ChangeCurrencyRateEvent) _then) = __$ChangeCurrencyRateEventCopyWithImpl;
@useResult
$Res call({
 double usd, double eur
});




}
/// @nodoc
class __$ChangeCurrencyRateEventCopyWithImpl<$Res>
    implements _$ChangeCurrencyRateEventCopyWith<$Res> {
  __$ChangeCurrencyRateEventCopyWithImpl(this._self, this._then);

  final _ChangeCurrencyRateEvent _self;
  final $Res Function(_ChangeCurrencyRateEvent) _then;

/// Create a copy of CurrencyRateEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? usd = null,Object? eur = null,}) {
  return _then(_ChangeCurrencyRateEvent(
usd: null == usd ? _self.usd : usd // ignore: cast_nullable_to_non_nullable
as double,eur: null == eur ? _self.eur : eur // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$CurrencyRateState {

 double get usd; double get eur;
/// Create a copy of CurrencyRateState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrencyRateStateCopyWith<CurrencyRateState> get copyWith => _$CurrencyRateStateCopyWithImpl<CurrencyRateState>(this as CurrencyRateState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurrencyRateState&&(identical(other.usd, usd) || other.usd == usd)&&(identical(other.eur, eur) || other.eur == eur));
}


@override
int get hashCode => Object.hash(runtimeType,usd,eur);

@override
String toString() {
  return 'CurrencyRateState(usd: $usd, eur: $eur)';
}


}

/// @nodoc
abstract mixin class $CurrencyRateStateCopyWith<$Res>  {
  factory $CurrencyRateStateCopyWith(CurrencyRateState value, $Res Function(CurrencyRateState) _then) = _$CurrencyRateStateCopyWithImpl;
@useResult
$Res call({
 double usd, double eur
});




}
/// @nodoc
class _$CurrencyRateStateCopyWithImpl<$Res>
    implements $CurrencyRateStateCopyWith<$Res> {
  _$CurrencyRateStateCopyWithImpl(this._self, this._then);

  final CurrencyRateState _self;
  final $Res Function(CurrencyRateState) _then;

/// Create a copy of CurrencyRateState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? usd = null,Object? eur = null,}) {
  return _then(_self.copyWith(
usd: null == usd ? _self.usd : usd // ignore: cast_nullable_to_non_nullable
as double,eur: null == eur ? _self.eur : eur // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CurrencyRateState].
extension CurrencyRateStatePatterns on CurrencyRateState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CurrencyRateState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CurrencyRateState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CurrencyRateState value)  $default,){
final _that = this;
switch (_that) {
case _CurrencyRateState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CurrencyRateState value)?  $default,){
final _that = this;
switch (_that) {
case _CurrencyRateState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double usd,  double eur)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CurrencyRateState() when $default != null:
return $default(_that.usd,_that.eur);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double usd,  double eur)  $default,) {final _that = this;
switch (_that) {
case _CurrencyRateState():
return $default(_that.usd,_that.eur);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double usd,  double eur)?  $default,) {final _that = this;
switch (_that) {
case _CurrencyRateState() when $default != null:
return $default(_that.usd,_that.eur);case _:
  return null;

}
}

}

/// @nodoc


class _CurrencyRateState extends CurrencyRateState {
  const _CurrencyRateState({required this.usd, required this.eur}): super._();
  

@override final  double usd;
@override final  double eur;

/// Create a copy of CurrencyRateState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CurrencyRateStateCopyWith<_CurrencyRateState> get copyWith => __$CurrencyRateStateCopyWithImpl<_CurrencyRateState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurrencyRateState&&(identical(other.usd, usd) || other.usd == usd)&&(identical(other.eur, eur) || other.eur == eur));
}


@override
int get hashCode => Object.hash(runtimeType,usd,eur);

@override
String toString() {
  return 'CurrencyRateState(usd: $usd, eur: $eur)';
}


}

/// @nodoc
abstract mixin class _$CurrencyRateStateCopyWith<$Res> implements $CurrencyRateStateCopyWith<$Res> {
  factory _$CurrencyRateStateCopyWith(_CurrencyRateState value, $Res Function(_CurrencyRateState) _then) = __$CurrencyRateStateCopyWithImpl;
@override @useResult
$Res call({
 double usd, double eur
});




}
/// @nodoc
class __$CurrencyRateStateCopyWithImpl<$Res>
    implements _$CurrencyRateStateCopyWith<$Res> {
  __$CurrencyRateStateCopyWithImpl(this._self, this._then);

  final _CurrencyRateState _self;
  final $Res Function(_CurrencyRateState) _then;

/// Create a copy of CurrencyRateState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? usd = null,Object? eur = null,}) {
  return _then(_CurrencyRateState(
usd: null == usd ? _self.usd : usd // ignore: cast_nullable_to_non_nullable
as double,eur: null == eur ? _self.eur : eur // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
