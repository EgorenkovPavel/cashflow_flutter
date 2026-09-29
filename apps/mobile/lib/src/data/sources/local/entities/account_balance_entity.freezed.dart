// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_balance_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AccountBalanceEntity {

 int get accountId; Balance get balance;
/// Create a copy of AccountBalanceEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountBalanceEntityCopyWith<AccountBalanceEntity> get copyWith => _$AccountBalanceEntityCopyWithImpl<AccountBalanceEntity>(this as AccountBalanceEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AccountBalanceEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountBalanceEntity&&(identical(other.accountId, _this.accountId) || other.accountId == _this.accountId)&&(identical(other.balance, _this.balance) || other.balance == _this.balance));
}


@override
int get hashCode {
  final _this = this as AccountBalanceEntity;
  return Object.hash(runtimeType,_this.accountId,_this.balance);
}

@override
String toString() {
  final _this = this as AccountBalanceEntity;
  return 'AccountBalanceEntity(accountId: ${_this.accountId}, balance: ${_this.balance})';
}


}

/// @nodoc
abstract mixin class $AccountBalanceEntityCopyWith<$Res>  {
  factory $AccountBalanceEntityCopyWith(AccountBalanceEntity value, $Res Function(AccountBalanceEntity) _then) = _$AccountBalanceEntityCopyWithImpl;
@useResult
$Res call({
 int accountId, Balance balance
});


$BalanceCopyWith<$Res> get balance;

}
/// @nodoc
class _$AccountBalanceEntityCopyWithImpl<$Res>
    implements $AccountBalanceEntityCopyWith<$Res> {
  _$AccountBalanceEntityCopyWithImpl(this._self, this._then);

  final AccountBalanceEntity _self;
  final $Res Function(AccountBalanceEntity) _then;

/// Create a copy of AccountBalanceEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accountId = null,Object? balance = null,}) {
  return _then(AccountBalanceEntity(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as Balance,
  ));
}
/// Create a copy of AccountBalanceEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BalanceCopyWith<$Res> get balance {
  
  return $BalanceCopyWith<$Res>(_self.balance, (value) {
    return _then(_self.copyWith(balance: value));
  });
}
}


/// Adds pattern-matching-related methods to [AccountBalanceEntity].
extension AccountBalanceEntityPatterns on AccountBalanceEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountBalanceEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountBalanceEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountBalanceEntity value)  $default,){
final _that = this;
switch (_that) {
case _AccountBalanceEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountBalanceEntity value)?  $default,){
final _that = this;
switch (_that) {
case _AccountBalanceEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int accountId,  Balance balance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountBalanceEntity() when $default != null:
return $default(_that.accountId,_that.balance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int accountId,  Balance balance)  $default,) {final _that = this;
switch (_that) {
case _AccountBalanceEntity():
return $default(_that.accountId,_that.balance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int accountId,  Balance balance)?  $default,) {final _that = this;
switch (_that) {
case _AccountBalanceEntity() when $default != null:
return $default(_that.accountId,_that.balance);case _:
  return null;

}
}

}

/// @nodoc


class _AccountBalanceEntity implements AccountBalanceEntity {
  const _AccountBalanceEntity({required this.accountId, required this.balance});
  

@override final  int accountId;
@override final  Balance balance;

/// Create a copy of AccountBalanceEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountBalanceEntityCopyWith<_AccountBalanceEntity> get copyWith => __$AccountBalanceEntityCopyWithImpl<_AccountBalanceEntity>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountBalanceEntity&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.balance, balance) || other.balance == balance));
}


@override
int get hashCode {
    return Object.hash(runtimeType,accountId,balance);
}

@override
String toString() {
    return 'AccountBalanceEntity(accountId: $accountId, balance: $balance)';
}


}

/// @nodoc
abstract mixin class _$AccountBalanceEntityCopyWith<$Res> implements $AccountBalanceEntityCopyWith<$Res> {
  factory _$AccountBalanceEntityCopyWith(_AccountBalanceEntity value, $Res Function(_AccountBalanceEntity) _then) = __$AccountBalanceEntityCopyWithImpl;
@override @useResult
$Res call({
 int accountId, Balance balance
});


@override $BalanceCopyWith<$Res> get balance;

}
/// @nodoc
class __$AccountBalanceEntityCopyWithImpl<$Res>
    implements _$AccountBalanceEntityCopyWith<$Res> {
  __$AccountBalanceEntityCopyWithImpl(this._self, this._then);

  final _AccountBalanceEntity _self;
  final $Res Function(_AccountBalanceEntity) _then;

/// Create a copy of AccountBalanceEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accountId = null,Object? balance = null,}) {
  return _then(_AccountBalanceEntity(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as Balance,
  ));
}

/// Create a copy of AccountBalanceEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BalanceCopyWith<$Res> get balance {
  
  return $BalanceCopyWith<$Res>(_self.balance, (value) {
    return _then(_self.copyWith(balance: value));
  });
}
}

// dart format on
