// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_balance_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AccountBalanceEvent {

 List<AccountBalanceView> get accounts;
/// Create a copy of AccountBalanceEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountBalanceEventCopyWith<AccountBalanceEvent> get copyWith => _$AccountBalanceEventCopyWithImpl<AccountBalanceEvent>(this as AccountBalanceEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountBalanceEvent&&const DeepCollectionEquality().equals(other.accounts, accounts));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(accounts));

@override
String toString() {
  return 'AccountBalanceEvent(accounts: $accounts)';
}


}

/// @nodoc
abstract mixin class $AccountBalanceEventCopyWith<$Res>  {
  factory $AccountBalanceEventCopyWith(AccountBalanceEvent value, $Res Function(AccountBalanceEvent) _then) = _$AccountBalanceEventCopyWithImpl;
@useResult
$Res call({
 List<AccountBalanceView> accounts
});




}
/// @nodoc
class _$AccountBalanceEventCopyWithImpl<$Res>
    implements $AccountBalanceEventCopyWith<$Res> {
  _$AccountBalanceEventCopyWithImpl(this._self, this._then);

  final AccountBalanceEvent _self;
  final $Res Function(AccountBalanceEvent) _then;

/// Create a copy of AccountBalanceEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accounts = null,}) {
  return _then(_self.copyWith(
accounts: null == accounts ? _self.accounts : accounts // ignore: cast_nullable_to_non_nullable
as List<AccountBalanceView>,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountBalanceEvent].
extension AccountBalanceEventPatterns on AccountBalanceEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ChangeBalanceAccountBalanceEvent value)?  changeBalance,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChangeBalanceAccountBalanceEvent() when changeBalance != null:
return changeBalance(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ChangeBalanceAccountBalanceEvent value)  changeBalance,}){
final _that = this;
switch (_that) {
case _ChangeBalanceAccountBalanceEvent():
return changeBalance(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ChangeBalanceAccountBalanceEvent value)?  changeBalance,}){
final _that = this;
switch (_that) {
case _ChangeBalanceAccountBalanceEvent() when changeBalance != null:
return changeBalance(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<AccountBalanceView> accounts)?  changeBalance,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChangeBalanceAccountBalanceEvent() when changeBalance != null:
return changeBalance(_that.accounts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<AccountBalanceView> accounts)  changeBalance,}) {final _that = this;
switch (_that) {
case _ChangeBalanceAccountBalanceEvent():
return changeBalance(_that.accounts);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<AccountBalanceView> accounts)?  changeBalance,}) {final _that = this;
switch (_that) {
case _ChangeBalanceAccountBalanceEvent() when changeBalance != null:
return changeBalance(_that.accounts);case _:
  return null;

}
}

}

/// @nodoc


class _ChangeBalanceAccountBalanceEvent implements AccountBalanceEvent {
  const _ChangeBalanceAccountBalanceEvent({required final  List<AccountBalanceView> accounts}): _accounts = accounts;
  

 final  List<AccountBalanceView> _accounts;
@override List<AccountBalanceView> get accounts {
  if (_accounts is EqualUnmodifiableListView) return _accounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_accounts);
}


/// Create a copy of AccountBalanceEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeBalanceAccountBalanceEventCopyWith<_ChangeBalanceAccountBalanceEvent> get copyWith => __$ChangeBalanceAccountBalanceEventCopyWithImpl<_ChangeBalanceAccountBalanceEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeBalanceAccountBalanceEvent&&const DeepCollectionEquality().equals(other._accounts, _accounts));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_accounts));

@override
String toString() {
  return 'AccountBalanceEvent.changeBalance(accounts: $accounts)';
}


}

/// @nodoc
abstract mixin class _$ChangeBalanceAccountBalanceEventCopyWith<$Res> implements $AccountBalanceEventCopyWith<$Res> {
  factory _$ChangeBalanceAccountBalanceEventCopyWith(_ChangeBalanceAccountBalanceEvent value, $Res Function(_ChangeBalanceAccountBalanceEvent) _then) = __$ChangeBalanceAccountBalanceEventCopyWithImpl;
@override @useResult
$Res call({
 List<AccountBalanceView> accounts
});




}
/// @nodoc
class __$ChangeBalanceAccountBalanceEventCopyWithImpl<$Res>
    implements _$ChangeBalanceAccountBalanceEventCopyWith<$Res> {
  __$ChangeBalanceAccountBalanceEventCopyWithImpl(this._self, this._then);

  final _ChangeBalanceAccountBalanceEvent _self;
  final $Res Function(_ChangeBalanceAccountBalanceEvent) _then;

/// Create a copy of AccountBalanceEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accounts = null,}) {
  return _then(_ChangeBalanceAccountBalanceEvent(
accounts: null == accounts ? _self._accounts : accounts // ignore: cast_nullable_to_non_nullable
as List<AccountBalanceView>,
  ));
}


}

/// @nodoc
mixin _$AccountBalanceState {

 List<AccountBalanceView> get balances;
/// Create a copy of AccountBalanceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountBalanceStateCopyWith<AccountBalanceState> get copyWith => _$AccountBalanceStateCopyWithImpl<AccountBalanceState>(this as AccountBalanceState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountBalanceState&&const DeepCollectionEquality().equals(other.balances, balances));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(balances));

@override
String toString() {
  return 'AccountBalanceState(balances: $balances)';
}


}

/// @nodoc
abstract mixin class $AccountBalanceStateCopyWith<$Res>  {
  factory $AccountBalanceStateCopyWith(AccountBalanceState value, $Res Function(AccountBalanceState) _then) = _$AccountBalanceStateCopyWithImpl;
@useResult
$Res call({
 List<AccountBalanceView> balances
});




}
/// @nodoc
class _$AccountBalanceStateCopyWithImpl<$Res>
    implements $AccountBalanceStateCopyWith<$Res> {
  _$AccountBalanceStateCopyWithImpl(this._self, this._then);

  final AccountBalanceState _self;
  final $Res Function(AccountBalanceState) _then;

/// Create a copy of AccountBalanceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? balances = null,}) {
  return _then(_self.copyWith(
balances: null == balances ? _self.balances : balances // ignore: cast_nullable_to_non_nullable
as List<AccountBalanceView>,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountBalanceState].
extension AccountBalanceStatePatterns on AccountBalanceState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountBalanceState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountBalanceState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountBalanceState value)  $default,){
final _that = this;
switch (_that) {
case _AccountBalanceState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountBalanceState value)?  $default,){
final _that = this;
switch (_that) {
case _AccountBalanceState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AccountBalanceView> balances)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountBalanceState() when $default != null:
return $default(_that.balances);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AccountBalanceView> balances)  $default,) {final _that = this;
switch (_that) {
case _AccountBalanceState():
return $default(_that.balances);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AccountBalanceView> balances)?  $default,) {final _that = this;
switch (_that) {
case _AccountBalanceState() when $default != null:
return $default(_that.balances);case _:
  return null;

}
}

}

/// @nodoc


class _AccountBalanceState extends AccountBalanceState {
  const _AccountBalanceState({required final  List<AccountBalanceView> balances}): _balances = balances,super._();
  

 final  List<AccountBalanceView> _balances;
@override List<AccountBalanceView> get balances {
  if (_balances is EqualUnmodifiableListView) return _balances;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_balances);
}


/// Create a copy of AccountBalanceState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountBalanceStateCopyWith<_AccountBalanceState> get copyWith => __$AccountBalanceStateCopyWithImpl<_AccountBalanceState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountBalanceState&&const DeepCollectionEquality().equals(other._balances, _balances));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_balances));

@override
String toString() {
  return 'AccountBalanceState(balances: $balances)';
}


}

/// @nodoc
abstract mixin class _$AccountBalanceStateCopyWith<$Res> implements $AccountBalanceStateCopyWith<$Res> {
  factory _$AccountBalanceStateCopyWith(_AccountBalanceState value, $Res Function(_AccountBalanceState) _then) = __$AccountBalanceStateCopyWithImpl;
@override @useResult
$Res call({
 List<AccountBalanceView> balances
});




}
/// @nodoc
class __$AccountBalanceStateCopyWithImpl<$Res>
    implements _$AccountBalanceStateCopyWith<$Res> {
  __$AccountBalanceStateCopyWithImpl(this._self, this._then);

  final _AccountBalanceState _self;
  final $Res Function(_AccountBalanceState) _then;

/// Create a copy of AccountBalanceState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? balances = null,}) {
  return _then(_AccountBalanceState(
balances: null == balances ? _self._balances : balances // ignore: cast_nullable_to_non_nullable
as List<AccountBalanceView>,
  ));
}


}

// dart format on
