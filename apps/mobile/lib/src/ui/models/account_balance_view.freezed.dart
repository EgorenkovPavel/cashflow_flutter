// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_balance_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AccountBalanceView {

 int get accountId; int? get userId; String get accountTitle; String get userName; String get userPhoto; Balance get balance; bool get isDebt;
/// Create a copy of AccountBalanceView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountBalanceViewCopyWith<AccountBalanceView> get copyWith => _$AccountBalanceViewCopyWithImpl<AccountBalanceView>(this as AccountBalanceView, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountBalanceView&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.accountTitle, accountTitle) || other.accountTitle == accountTitle)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.userPhoto, userPhoto) || other.userPhoto == userPhoto)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.isDebt, isDebt) || other.isDebt == isDebt));
}


@override
int get hashCode => Object.hash(runtimeType,accountId,userId,accountTitle,userName,userPhoto,balance,isDebt);

@override
String toString() {
  return 'AccountBalanceView(accountId: $accountId, userId: $userId, accountTitle: $accountTitle, userName: $userName, userPhoto: $userPhoto, balance: $balance, isDebt: $isDebt)';
}


}

/// @nodoc
abstract mixin class $AccountBalanceViewCopyWith<$Res>  {
  factory $AccountBalanceViewCopyWith(AccountBalanceView value, $Res Function(AccountBalanceView) _then) = _$AccountBalanceViewCopyWithImpl;
@useResult
$Res call({
 int accountId, int? userId, String accountTitle, String userName, String userPhoto, Balance balance, bool isDebt
});


$BalanceCopyWith<$Res> get balance;

}
/// @nodoc
class _$AccountBalanceViewCopyWithImpl<$Res>
    implements $AccountBalanceViewCopyWith<$Res> {
  _$AccountBalanceViewCopyWithImpl(this._self, this._then);

  final AccountBalanceView _self;
  final $Res Function(AccountBalanceView) _then;

/// Create a copy of AccountBalanceView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accountId = null,Object? userId = freezed,Object? accountTitle = null,Object? userName = null,Object? userPhoto = null,Object? balance = null,Object? isDebt = null,}) {
  return _then(_self.copyWith(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,accountTitle: null == accountTitle ? _self.accountTitle : accountTitle // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,userPhoto: null == userPhoto ? _self.userPhoto : userPhoto // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as Balance,isDebt: null == isDebt ? _self.isDebt : isDebt // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of AccountBalanceView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BalanceCopyWith<$Res> get balance {
  
  return $BalanceCopyWith<$Res>(_self.balance, (value) {
    return _then(_self.copyWith(balance: value));
  });
}
}


/// Adds pattern-matching-related methods to [AccountBalanceView].
extension AccountBalanceViewPatterns on AccountBalanceView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountBalanceView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountBalanceView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountBalanceView value)  $default,){
final _that = this;
switch (_that) {
case _AccountBalanceView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountBalanceView value)?  $default,){
final _that = this;
switch (_that) {
case _AccountBalanceView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int accountId,  int? userId,  String accountTitle,  String userName,  String userPhoto,  Balance balance,  bool isDebt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountBalanceView() when $default != null:
return $default(_that.accountId,_that.userId,_that.accountTitle,_that.userName,_that.userPhoto,_that.balance,_that.isDebt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int accountId,  int? userId,  String accountTitle,  String userName,  String userPhoto,  Balance balance,  bool isDebt)  $default,) {final _that = this;
switch (_that) {
case _AccountBalanceView():
return $default(_that.accountId,_that.userId,_that.accountTitle,_that.userName,_that.userPhoto,_that.balance,_that.isDebt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int accountId,  int? userId,  String accountTitle,  String userName,  String userPhoto,  Balance balance,  bool isDebt)?  $default,) {final _that = this;
switch (_that) {
case _AccountBalanceView() when $default != null:
return $default(_that.accountId,_that.userId,_that.accountTitle,_that.userName,_that.userPhoto,_that.balance,_that.isDebt);case _:
  return null;

}
}

}

/// @nodoc


class _AccountBalanceView extends AccountBalanceView {
  const _AccountBalanceView({required this.accountId, required this.userId, required this.accountTitle, required this.userName, required this.userPhoto, required this.balance, required this.isDebt}): super._();
  

@override final  int accountId;
@override final  int? userId;
@override final  String accountTitle;
@override final  String userName;
@override final  String userPhoto;
@override final  Balance balance;
@override final  bool isDebt;

/// Create a copy of AccountBalanceView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountBalanceViewCopyWith<_AccountBalanceView> get copyWith => __$AccountBalanceViewCopyWithImpl<_AccountBalanceView>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountBalanceView&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.accountTitle, accountTitle) || other.accountTitle == accountTitle)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.userPhoto, userPhoto) || other.userPhoto == userPhoto)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.isDebt, isDebt) || other.isDebt == isDebt));
}


@override
int get hashCode => Object.hash(runtimeType,accountId,userId,accountTitle,userName,userPhoto,balance,isDebt);

@override
String toString() {
  return 'AccountBalanceView(accountId: $accountId, userId: $userId, accountTitle: $accountTitle, userName: $userName, userPhoto: $userPhoto, balance: $balance, isDebt: $isDebt)';
}


}

/// @nodoc
abstract mixin class _$AccountBalanceViewCopyWith<$Res> implements $AccountBalanceViewCopyWith<$Res> {
  factory _$AccountBalanceViewCopyWith(_AccountBalanceView value, $Res Function(_AccountBalanceView) _then) = __$AccountBalanceViewCopyWithImpl;
@override @useResult
$Res call({
 int accountId, int? userId, String accountTitle, String userName, String userPhoto, Balance balance, bool isDebt
});


@override $BalanceCopyWith<$Res> get balance;

}
/// @nodoc
class __$AccountBalanceViewCopyWithImpl<$Res>
    implements _$AccountBalanceViewCopyWith<$Res> {
  __$AccountBalanceViewCopyWithImpl(this._self, this._then);

  final _AccountBalanceView _self;
  final $Res Function(_AccountBalanceView) _then;

/// Create a copy of AccountBalanceView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accountId = null,Object? userId = freezed,Object? accountTitle = null,Object? userName = null,Object? userPhoto = null,Object? balance = null,Object? isDebt = null,}) {
  return _then(_AccountBalanceView(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,accountTitle: null == accountTitle ? _self.accountTitle : accountTitle // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,userPhoto: null == userPhoto ? _self.userPhoto : userPhoto // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as Balance,isDebt: null == isDebt ? _self.isDebt : isDebt // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of AccountBalanceView
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
