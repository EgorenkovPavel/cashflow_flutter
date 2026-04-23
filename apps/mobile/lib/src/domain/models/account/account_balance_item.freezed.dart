// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_balance_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AccountBalanceItem {

 BaseAccount get account; User? get user; Balance get balance;
/// Create a copy of AccountBalanceItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountBalanceItemCopyWith<AccountBalanceItem> get copyWith => _$AccountBalanceItemCopyWithImpl<AccountBalanceItem>(this as AccountBalanceItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountBalanceItem&&(identical(other.account, account) || other.account == account)&&(identical(other.user, user) || other.user == user)&&(identical(other.balance, balance) || other.balance == balance));
}


@override
int get hashCode => Object.hash(runtimeType,account,user,balance);

@override
String toString() {
  return 'AccountBalanceItem(account: $account, user: $user, balance: $balance)';
}


}

/// @nodoc
abstract mixin class $AccountBalanceItemCopyWith<$Res>  {
  factory $AccountBalanceItemCopyWith(AccountBalanceItem value, $Res Function(AccountBalanceItem) _then) = _$AccountBalanceItemCopyWithImpl;
@useResult
$Res call({
 BaseAccount account, User? user, Balance balance
});


$BaseAccountCopyWith<$Res> get account;$UserCopyWith<$Res>? get user;$BalanceCopyWith<$Res> get balance;

}
/// @nodoc
class _$AccountBalanceItemCopyWithImpl<$Res>
    implements $AccountBalanceItemCopyWith<$Res> {
  _$AccountBalanceItemCopyWithImpl(this._self, this._then);

  final AccountBalanceItem _self;
  final $Res Function(AccountBalanceItem) _then;

/// Create a copy of AccountBalanceItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? account = null,Object? user = freezed,Object? balance = null,}) {
  return _then(_self.copyWith(
account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as BaseAccount,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as Balance,
  ));
}
/// Create a copy of AccountBalanceItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BaseAccountCopyWith<$Res> get account {
  
  return $BaseAccountCopyWith<$Res>(_self.account, (value) {
    return _then(_self.copyWith(account: value));
  });
}/// Create a copy of AccountBalanceItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of AccountBalanceItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BalanceCopyWith<$Res> get balance {
  
  return $BalanceCopyWith<$Res>(_self.balance, (value) {
    return _then(_self.copyWith(balance: value));
  });
}
}


/// Adds pattern-matching-related methods to [AccountBalanceItem].
extension AccountBalanceItemPatterns on AccountBalanceItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountBalanceItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountBalanceItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountBalanceItem value)  $default,){
final _that = this;
switch (_that) {
case _AccountBalanceItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountBalanceItem value)?  $default,){
final _that = this;
switch (_that) {
case _AccountBalanceItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BaseAccount account,  User? user,  Balance balance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountBalanceItem() when $default != null:
return $default(_that.account,_that.user,_that.balance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BaseAccount account,  User? user,  Balance balance)  $default,) {final _that = this;
switch (_that) {
case _AccountBalanceItem():
return $default(_that.account,_that.user,_that.balance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BaseAccount account,  User? user,  Balance balance)?  $default,) {final _that = this;
switch (_that) {
case _AccountBalanceItem() when $default != null:
return $default(_that.account,_that.user,_that.balance);case _:
  return null;

}
}

}

/// @nodoc


class _AccountBalanceItem implements AccountBalanceItem {
  const _AccountBalanceItem({required this.account, required this.user, required this.balance});
  

@override final  BaseAccount account;
@override final  User? user;
@override final  Balance balance;

/// Create a copy of AccountBalanceItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountBalanceItemCopyWith<_AccountBalanceItem> get copyWith => __$AccountBalanceItemCopyWithImpl<_AccountBalanceItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountBalanceItem&&(identical(other.account, account) || other.account == account)&&(identical(other.user, user) || other.user == user)&&(identical(other.balance, balance) || other.balance == balance));
}


@override
int get hashCode => Object.hash(runtimeType,account,user,balance);

@override
String toString() {
  return 'AccountBalanceItem(account: $account, user: $user, balance: $balance)';
}


}

/// @nodoc
abstract mixin class _$AccountBalanceItemCopyWith<$Res> implements $AccountBalanceItemCopyWith<$Res> {
  factory _$AccountBalanceItemCopyWith(_AccountBalanceItem value, $Res Function(_AccountBalanceItem) _then) = __$AccountBalanceItemCopyWithImpl;
@override @useResult
$Res call({
 BaseAccount account, User? user, Balance balance
});


@override $BaseAccountCopyWith<$Res> get account;@override $UserCopyWith<$Res>? get user;@override $BalanceCopyWith<$Res> get balance;

}
/// @nodoc
class __$AccountBalanceItemCopyWithImpl<$Res>
    implements _$AccountBalanceItemCopyWith<$Res> {
  __$AccountBalanceItemCopyWithImpl(this._self, this._then);

  final _AccountBalanceItem _self;
  final $Res Function(_AccountBalanceItem) _then;

/// Create a copy of AccountBalanceItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? account = null,Object? user = freezed,Object? balance = null,}) {
  return _then(_AccountBalanceItem(
account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as BaseAccount,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as Balance,
  ));
}

/// Create a copy of AccountBalanceItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BaseAccountCopyWith<$Res> get account {
  
  return $BaseAccountCopyWith<$Res>(_self.account, (value) {
    return _then(_self.copyWith(account: value));
  });
}/// Create a copy of AccountBalanceItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of AccountBalanceItem
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
