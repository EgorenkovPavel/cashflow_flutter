// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cloud_operation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CloudOperation {

 String get id; DateTime get date; int get operationType; String get account; String? get category; String? get recAccount; int get sum; int? get recSum; bool get deleted; String get currencySent; String get currencyReceived;
/// Create a copy of CloudOperation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloudOperationCopyWith<CloudOperation> get copyWith => _$CloudOperationCopyWithImpl<CloudOperation>(this as CloudOperation, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloudOperation&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.operationType, operationType) || other.operationType == operationType)&&(identical(other.account, account) || other.account == account)&&(identical(other.category, category) || other.category == category)&&(identical(other.recAccount, recAccount) || other.recAccount == recAccount)&&(identical(other.sum, sum) || other.sum == sum)&&(identical(other.recSum, recSum) || other.recSum == recSum)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.currencySent, currencySent) || other.currencySent == currencySent)&&(identical(other.currencyReceived, currencyReceived) || other.currencyReceived == currencyReceived));
}


@override
int get hashCode => Object.hash(runtimeType,id,date,operationType,account,category,recAccount,sum,recSum,deleted,currencySent,currencyReceived);

@override
String toString() {
  return 'CloudOperation(id: $id, date: $date, operationType: $operationType, account: $account, category: $category, recAccount: $recAccount, sum: $sum, recSum: $recSum, deleted: $deleted, currencySent: $currencySent, currencyReceived: $currencyReceived)';
}


}

/// @nodoc
abstract mixin class $CloudOperationCopyWith<$Res>  {
  factory $CloudOperationCopyWith(CloudOperation value, $Res Function(CloudOperation) _then) = _$CloudOperationCopyWithImpl;
@useResult
$Res call({
 String id, DateTime date, int operationType, String account, String? category, String? recAccount, int sum, int? recSum, bool deleted, String currencySent, String currencyReceived
});




}
/// @nodoc
class _$CloudOperationCopyWithImpl<$Res>
    implements $CloudOperationCopyWith<$Res> {
  _$CloudOperationCopyWithImpl(this._self, this._then);

  final CloudOperation _self;
  final $Res Function(CloudOperation) _then;

/// Create a copy of CloudOperation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? date = null,Object? operationType = null,Object? account = null,Object? category = freezed,Object? recAccount = freezed,Object? sum = null,Object? recSum = freezed,Object? deleted = null,Object? currencySent = null,Object? currencyReceived = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,operationType: null == operationType ? _self.operationType : operationType // ignore: cast_nullable_to_non_nullable
as int,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,recAccount: freezed == recAccount ? _self.recAccount : recAccount // ignore: cast_nullable_to_non_nullable
as String?,sum: null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as int,recSum: freezed == recSum ? _self.recSum : recSum // ignore: cast_nullable_to_non_nullable
as int?,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,currencySent: null == currencySent ? _self.currencySent : currencySent // ignore: cast_nullable_to_non_nullable
as String,currencyReceived: null == currencyReceived ? _self.currencyReceived : currencyReceived // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CloudOperation].
extension CloudOperationPatterns on CloudOperation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CloudOperation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CloudOperation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CloudOperation value)  $default,){
final _that = this;
switch (_that) {
case _CloudOperation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CloudOperation value)?  $default,){
final _that = this;
switch (_that) {
case _CloudOperation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime date,  int operationType,  String account,  String? category,  String? recAccount,  int sum,  int? recSum,  bool deleted,  String currencySent,  String currencyReceived)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CloudOperation() when $default != null:
return $default(_that.id,_that.date,_that.operationType,_that.account,_that.category,_that.recAccount,_that.sum,_that.recSum,_that.deleted,_that.currencySent,_that.currencyReceived);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime date,  int operationType,  String account,  String? category,  String? recAccount,  int sum,  int? recSum,  bool deleted,  String currencySent,  String currencyReceived)  $default,) {final _that = this;
switch (_that) {
case _CloudOperation():
return $default(_that.id,_that.date,_that.operationType,_that.account,_that.category,_that.recAccount,_that.sum,_that.recSum,_that.deleted,_that.currencySent,_that.currencyReceived);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime date,  int operationType,  String account,  String? category,  String? recAccount,  int sum,  int? recSum,  bool deleted,  String currencySent,  String currencyReceived)?  $default,) {final _that = this;
switch (_that) {
case _CloudOperation() when $default != null:
return $default(_that.id,_that.date,_that.operationType,_that.account,_that.category,_that.recAccount,_that.sum,_that.recSum,_that.deleted,_that.currencySent,_that.currencyReceived);case _:
  return null;

}
}

}

/// @nodoc


class _CloudOperation implements CloudOperation {
  const _CloudOperation({required this.id, required this.date, required this.operationType, required this.account, this.category, this.recAccount, required this.sum, this.recSum, required this.deleted, required this.currencySent, required this.currencyReceived});
  

@override final  String id;
@override final  DateTime date;
@override final  int operationType;
@override final  String account;
@override final  String? category;
@override final  String? recAccount;
@override final  int sum;
@override final  int? recSum;
@override final  bool deleted;
@override final  String currencySent;
@override final  String currencyReceived;

/// Create a copy of CloudOperation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CloudOperationCopyWith<_CloudOperation> get copyWith => __$CloudOperationCopyWithImpl<_CloudOperation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloudOperation&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.operationType, operationType) || other.operationType == operationType)&&(identical(other.account, account) || other.account == account)&&(identical(other.category, category) || other.category == category)&&(identical(other.recAccount, recAccount) || other.recAccount == recAccount)&&(identical(other.sum, sum) || other.sum == sum)&&(identical(other.recSum, recSum) || other.recSum == recSum)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.currencySent, currencySent) || other.currencySent == currencySent)&&(identical(other.currencyReceived, currencyReceived) || other.currencyReceived == currencyReceived));
}


@override
int get hashCode => Object.hash(runtimeType,id,date,operationType,account,category,recAccount,sum,recSum,deleted,currencySent,currencyReceived);

@override
String toString() {
  return 'CloudOperation(id: $id, date: $date, operationType: $operationType, account: $account, category: $category, recAccount: $recAccount, sum: $sum, recSum: $recSum, deleted: $deleted, currencySent: $currencySent, currencyReceived: $currencyReceived)';
}


}

/// @nodoc
abstract mixin class _$CloudOperationCopyWith<$Res> implements $CloudOperationCopyWith<$Res> {
  factory _$CloudOperationCopyWith(_CloudOperation value, $Res Function(_CloudOperation) _then) = __$CloudOperationCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime date, int operationType, String account, String? category, String? recAccount, int sum, int? recSum, bool deleted, String currencySent, String currencyReceived
});




}
/// @nodoc
class __$CloudOperationCopyWithImpl<$Res>
    implements _$CloudOperationCopyWith<$Res> {
  __$CloudOperationCopyWithImpl(this._self, this._then);

  final _CloudOperation _self;
  final $Res Function(_CloudOperation) _then;

/// Create a copy of CloudOperation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? date = null,Object? operationType = null,Object? account = null,Object? category = freezed,Object? recAccount = freezed,Object? sum = null,Object? recSum = freezed,Object? deleted = null,Object? currencySent = null,Object? currencyReceived = null,}) {
  return _then(_CloudOperation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,operationType: null == operationType ? _self.operationType : operationType // ignore: cast_nullable_to_non_nullable
as int,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,recAccount: freezed == recAccount ? _self.recAccount : recAccount // ignore: cast_nullable_to_non_nullable
as String?,sum: null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as int,recSum: freezed == recSum ? _self.recSum : recSum // ignore: cast_nullable_to_non_nullable
as int?,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,currencySent: null == currencySent ? _self.currencySent : currencySent // ignore: cast_nullable_to_non_nullable
as String,currencyReceived: null == currencyReceived ? _self.currencyReceived : currencyReceived // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
