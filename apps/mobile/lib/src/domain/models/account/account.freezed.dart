// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BaseAccount {

 int get id; String get cloudId; String get title; int? get userId;
/// Create a copy of BaseAccount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BaseAccountCopyWith<BaseAccount> get copyWith => _$BaseAccountCopyWithImpl<BaseAccount>(this as BaseAccount, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BaseAccount&&(identical(other.id, id) || other.id == id)&&(identical(other.cloudId, cloudId) || other.cloudId == cloudId)&&(identical(other.title, title) || other.title == title)&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,id,cloudId,title,userId);

@override
String toString() {
  return 'BaseAccount(id: $id, cloudId: $cloudId, title: $title, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $BaseAccountCopyWith<$Res>  {
  factory $BaseAccountCopyWith(BaseAccount value, $Res Function(BaseAccount) _then) = _$BaseAccountCopyWithImpl;
@useResult
$Res call({
 int id, String cloudId, String title, int? userId
});




}
/// @nodoc
class _$BaseAccountCopyWithImpl<$Res>
    implements $BaseAccountCopyWith<$Res> {
  _$BaseAccountCopyWithImpl(this._self, this._then);

  final BaseAccount _self;
  final $Res Function(BaseAccount) _then;

/// Create a copy of BaseAccount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? cloudId = null,Object? title = null,Object? userId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,cloudId: null == cloudId ? _self.cloudId : cloudId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [BaseAccount].
extension BaseAccountPatterns on BaseAccount {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Account value)?  account,TResult Function( Debt value)?  debt,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Account() when account != null:
return account(_that);case Debt() when debt != null:
return debt(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Account value)  account,required TResult Function( Debt value)  debt,}){
final _that = this;
switch (_that) {
case Account():
return account(_that);case Debt():
return debt(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Account value)?  account,TResult? Function( Debt value)?  debt,}){
final _that = this;
switch (_that) {
case Account() when account != null:
return account(_that);case Debt() when debt != null:
return debt(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int id,  String cloudId,  String title,  int? userId)?  account,TResult Function( int id,  String cloudId,  String title,  int? userId)?  debt,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Account() when account != null:
return account(_that.id,_that.cloudId,_that.title,_that.userId);case Debt() when debt != null:
return debt(_that.id,_that.cloudId,_that.title,_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int id,  String cloudId,  String title,  int? userId)  account,required TResult Function( int id,  String cloudId,  String title,  int? userId)  debt,}) {final _that = this;
switch (_that) {
case Account():
return account(_that.id,_that.cloudId,_that.title,_that.userId);case Debt():
return debt(_that.id,_that.cloudId,_that.title,_that.userId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int id,  String cloudId,  String title,  int? userId)?  account,TResult? Function( int id,  String cloudId,  String title,  int? userId)?  debt,}) {final _that = this;
switch (_that) {
case Account() when account != null:
return account(_that.id,_that.cloudId,_that.title,_that.userId);case Debt() when debt != null:
return debt(_that.id,_that.cloudId,_that.title,_that.userId);case _:
  return null;

}
}

}

/// @nodoc


class Account extends BaseAccount {
  const Account({this.id = 0, this.cloudId = '', required this.title, required this.userId}): super._();
  

@override@JsonKey() final  int id;
@override@JsonKey() final  String cloudId;
@override final  String title;
@override final  int? userId;

/// Create a copy of BaseAccount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountCopyWith<Account> get copyWith => _$AccountCopyWithImpl<Account>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Account&&(identical(other.id, id) || other.id == id)&&(identical(other.cloudId, cloudId) || other.cloudId == cloudId)&&(identical(other.title, title) || other.title == title)&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,id,cloudId,title,userId);

@override
String toString() {
  return 'BaseAccount.account(id: $id, cloudId: $cloudId, title: $title, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $AccountCopyWith<$Res> implements $BaseAccountCopyWith<$Res> {
  factory $AccountCopyWith(Account value, $Res Function(Account) _then) = _$AccountCopyWithImpl;
@override @useResult
$Res call({
 int id, String cloudId, String title, int? userId
});




}
/// @nodoc
class _$AccountCopyWithImpl<$Res>
    implements $AccountCopyWith<$Res> {
  _$AccountCopyWithImpl(this._self, this._then);

  final Account _self;
  final $Res Function(Account) _then;

/// Create a copy of BaseAccount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? cloudId = null,Object? title = null,Object? userId = freezed,}) {
  return _then(Account(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,cloudId: null == cloudId ? _self.cloudId : cloudId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class Debt extends BaseAccount {
  const Debt({this.id = 0, this.cloudId = '', required this.title, required this.userId}): super._();
  

@override@JsonKey() final  int id;
@override@JsonKey() final  String cloudId;
@override final  String title;
@override final  int? userId;

/// Create a copy of BaseAccount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DebtCopyWith<Debt> get copyWith => _$DebtCopyWithImpl<Debt>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Debt&&(identical(other.id, id) || other.id == id)&&(identical(other.cloudId, cloudId) || other.cloudId == cloudId)&&(identical(other.title, title) || other.title == title)&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,id,cloudId,title,userId);

@override
String toString() {
  return 'BaseAccount.debt(id: $id, cloudId: $cloudId, title: $title, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $DebtCopyWith<$Res> implements $BaseAccountCopyWith<$Res> {
  factory $DebtCopyWith(Debt value, $Res Function(Debt) _then) = _$DebtCopyWithImpl;
@override @useResult
$Res call({
 int id, String cloudId, String title, int? userId
});




}
/// @nodoc
class _$DebtCopyWithImpl<$Res>
    implements $DebtCopyWith<$Res> {
  _$DebtCopyWithImpl(this._self, this._then);

  final Debt _self;
  final $Res Function(Debt) _then;

/// Create a copy of BaseAccount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? cloudId = null,Object? title = null,Object? userId = freezed,}) {
  return _then(Debt(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,cloudId: null == cloudId ? _self.cloudId : cloudId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
