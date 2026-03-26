// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'operation_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OperationDbEntity {

 OperationDB get operation; AccountDB get account; CategoryDB? get category; AccountDB? get recAccount;
/// Create a copy of OperationDbEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OperationDbEntityCopyWith<OperationDbEntity> get copyWith => _$OperationDbEntityCopyWithImpl<OperationDbEntity>(this as OperationDbEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OperationDbEntity&&(identical(other.operation, operation) || other.operation == operation)&&(identical(other.account, account) || other.account == account)&&(identical(other.category, category) || other.category == category)&&(identical(other.recAccount, recAccount) || other.recAccount == recAccount));
}


@override
int get hashCode => Object.hash(runtimeType,operation,account,category,recAccount);

@override
String toString() {
  return 'OperationDbEntity(operation: $operation, account: $account, category: $category, recAccount: $recAccount)';
}


}

/// @nodoc
abstract mixin class $OperationDbEntityCopyWith<$Res>  {
  factory $OperationDbEntityCopyWith(OperationDbEntity value, $Res Function(OperationDbEntity) _then) = _$OperationDbEntityCopyWithImpl;
@useResult
$Res call({
 OperationDB operation, AccountDB account, CategoryDB? category, AccountDB? recAccount
});




}
/// @nodoc
class _$OperationDbEntityCopyWithImpl<$Res>
    implements $OperationDbEntityCopyWith<$Res> {
  _$OperationDbEntityCopyWithImpl(this._self, this._then);

  final OperationDbEntity _self;
  final $Res Function(OperationDbEntity) _then;

/// Create a copy of OperationDbEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? operation = null,Object? account = null,Object? category = freezed,Object? recAccount = freezed,}) {
  return _then(_self.copyWith(
operation: null == operation ? _self.operation : operation // ignore: cast_nullable_to_non_nullable
as OperationDB,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as AccountDB,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryDB?,recAccount: freezed == recAccount ? _self.recAccount : recAccount // ignore: cast_nullable_to_non_nullable
as AccountDB?,
  ));
}

}


/// Adds pattern-matching-related methods to [OperationDbEntity].
extension OperationDbEntityPatterns on OperationDbEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OperationDbEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OperationDbEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OperationDbEntity value)  $default,){
final _that = this;
switch (_that) {
case _OperationDbEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OperationDbEntity value)?  $default,){
final _that = this;
switch (_that) {
case _OperationDbEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( OperationDB operation,  AccountDB account,  CategoryDB? category,  AccountDB? recAccount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OperationDbEntity() when $default != null:
return $default(_that.operation,_that.account,_that.category,_that.recAccount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( OperationDB operation,  AccountDB account,  CategoryDB? category,  AccountDB? recAccount)  $default,) {final _that = this;
switch (_that) {
case _OperationDbEntity():
return $default(_that.operation,_that.account,_that.category,_that.recAccount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( OperationDB operation,  AccountDB account,  CategoryDB? category,  AccountDB? recAccount)?  $default,) {final _that = this;
switch (_that) {
case _OperationDbEntity() when $default != null:
return $default(_that.operation,_that.account,_that.category,_that.recAccount);case _:
  return null;

}
}

}

/// @nodoc


class _OperationDbEntity extends OperationDbEntity {
  const _OperationDbEntity({required this.operation, required this.account, this.category, this.recAccount}): super._();
  

@override final  OperationDB operation;
@override final  AccountDB account;
@override final  CategoryDB? category;
@override final  AccountDB? recAccount;

/// Create a copy of OperationDbEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OperationDbEntityCopyWith<_OperationDbEntity> get copyWith => __$OperationDbEntityCopyWithImpl<_OperationDbEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OperationDbEntity&&(identical(other.operation, operation) || other.operation == operation)&&(identical(other.account, account) || other.account == account)&&(identical(other.category, category) || other.category == category)&&(identical(other.recAccount, recAccount) || other.recAccount == recAccount));
}


@override
int get hashCode => Object.hash(runtimeType,operation,account,category,recAccount);

@override
String toString() {
  return 'OperationDbEntity(operation: $operation, account: $account, category: $category, recAccount: $recAccount)';
}


}

/// @nodoc
abstract mixin class _$OperationDbEntityCopyWith<$Res> implements $OperationDbEntityCopyWith<$Res> {
  factory _$OperationDbEntityCopyWith(_OperationDbEntity value, $Res Function(_OperationDbEntity) _then) = __$OperationDbEntityCopyWithImpl;
@override @useResult
$Res call({
 OperationDB operation, AccountDB account, CategoryDB? category, AccountDB? recAccount
});




}
/// @nodoc
class __$OperationDbEntityCopyWithImpl<$Res>
    implements _$OperationDbEntityCopyWith<$Res> {
  __$OperationDbEntityCopyWithImpl(this._self, this._then);

  final _OperationDbEntity _self;
  final $Res Function(_OperationDbEntity) _then;

/// Create a copy of OperationDbEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? operation = null,Object? account = null,Object? category = freezed,Object? recAccount = freezed,}) {
  return _then(_OperationDbEntity(
operation: null == operation ? _self.operation : operation // ignore: cast_nullable_to_non_nullable
as OperationDB,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as AccountDB,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryDB?,recAccount: freezed == recAccount ? _self.recAccount : recAccount // ignore: cast_nullable_to_non_nullable
as AccountDB?,
  ));
}


}

// dart format on
