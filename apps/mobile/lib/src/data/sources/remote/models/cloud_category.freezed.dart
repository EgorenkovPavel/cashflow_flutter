// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cloud_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CloudCategory {

 String get id; String get title; int get operationType; int get budgetType; int get budget; bool get isGroup; String get parent;
/// Create a copy of CloudCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloudCategoryCopyWith<CloudCategory> get copyWith => _$CloudCategoryCopyWithImpl<CloudCategory>(this as CloudCategory, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloudCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.operationType, operationType) || other.operationType == operationType)&&(identical(other.budgetType, budgetType) || other.budgetType == budgetType)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.isGroup, isGroup) || other.isGroup == isGroup)&&(identical(other.parent, parent) || other.parent == parent));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,operationType,budgetType,budget,isGroup,parent);

@override
String toString() {
  return 'CloudCategory(id: $id, title: $title, operationType: $operationType, budgetType: $budgetType, budget: $budget, isGroup: $isGroup, parent: $parent)';
}


}

/// @nodoc
abstract mixin class $CloudCategoryCopyWith<$Res>  {
  factory $CloudCategoryCopyWith(CloudCategory value, $Res Function(CloudCategory) _then) = _$CloudCategoryCopyWithImpl;
@useResult
$Res call({
 String id, String title, int operationType, int budgetType, int budget, bool isGroup, String parent
});




}
/// @nodoc
class _$CloudCategoryCopyWithImpl<$Res>
    implements $CloudCategoryCopyWith<$Res> {
  _$CloudCategoryCopyWithImpl(this._self, this._then);

  final CloudCategory _self;
  final $Res Function(CloudCategory) _then;

/// Create a copy of CloudCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? operationType = null,Object? budgetType = null,Object? budget = null,Object? isGroup = null,Object? parent = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,operationType: null == operationType ? _self.operationType : operationType // ignore: cast_nullable_to_non_nullable
as int,budgetType: null == budgetType ? _self.budgetType : budgetType // ignore: cast_nullable_to_non_nullable
as int,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as int,isGroup: null == isGroup ? _self.isGroup : isGroup // ignore: cast_nullable_to_non_nullable
as bool,parent: null == parent ? _self.parent : parent // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CloudCategory].
extension CloudCategoryPatterns on CloudCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CloudCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CloudCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CloudCategory value)  $default,){
final _that = this;
switch (_that) {
case _CloudCategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CloudCategory value)?  $default,){
final _that = this;
switch (_that) {
case _CloudCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  int operationType,  int budgetType,  int budget,  bool isGroup,  String parent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CloudCategory() when $default != null:
return $default(_that.id,_that.title,_that.operationType,_that.budgetType,_that.budget,_that.isGroup,_that.parent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  int operationType,  int budgetType,  int budget,  bool isGroup,  String parent)  $default,) {final _that = this;
switch (_that) {
case _CloudCategory():
return $default(_that.id,_that.title,_that.operationType,_that.budgetType,_that.budget,_that.isGroup,_that.parent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  int operationType,  int budgetType,  int budget,  bool isGroup,  String parent)?  $default,) {final _that = this;
switch (_that) {
case _CloudCategory() when $default != null:
return $default(_that.id,_that.title,_that.operationType,_that.budgetType,_that.budget,_that.isGroup,_that.parent);case _:
  return null;

}
}

}

/// @nodoc


class _CloudCategory implements CloudCategory {
  const _CloudCategory({required this.id, required this.title, required this.operationType, required this.budgetType, required this.budget, required this.isGroup, required this.parent});
  

@override final  String id;
@override final  String title;
@override final  int operationType;
@override final  int budgetType;
@override final  int budget;
@override final  bool isGroup;
@override final  String parent;

/// Create a copy of CloudCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CloudCategoryCopyWith<_CloudCategory> get copyWith => __$CloudCategoryCopyWithImpl<_CloudCategory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloudCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.operationType, operationType) || other.operationType == operationType)&&(identical(other.budgetType, budgetType) || other.budgetType == budgetType)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.isGroup, isGroup) || other.isGroup == isGroup)&&(identical(other.parent, parent) || other.parent == parent));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,operationType,budgetType,budget,isGroup,parent);

@override
String toString() {
  return 'CloudCategory(id: $id, title: $title, operationType: $operationType, budgetType: $budgetType, budget: $budget, isGroup: $isGroup, parent: $parent)';
}


}

/// @nodoc
abstract mixin class _$CloudCategoryCopyWith<$Res> implements $CloudCategoryCopyWith<$Res> {
  factory _$CloudCategoryCopyWith(_CloudCategory value, $Res Function(_CloudCategory) _then) = __$CloudCategoryCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, int operationType, int budgetType, int budget, bool isGroup, String parent
});




}
/// @nodoc
class __$CloudCategoryCopyWithImpl<$Res>
    implements _$CloudCategoryCopyWith<$Res> {
  __$CloudCategoryCopyWithImpl(this._self, this._then);

  final _CloudCategory _self;
  final $Res Function(_CloudCategory) _then;

/// Create a copy of CloudCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? operationType = null,Object? budgetType = null,Object? budget = null,Object? isGroup = null,Object? parent = null,}) {
  return _then(_CloudCategory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,operationType: null == operationType ? _self.operationType : operationType // ignore: cast_nullable_to_non_nullable
as int,budgetType: null == budgetType ? _self.budgetType : budgetType // ignore: cast_nullable_to_non_nullable
as int,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as int,isGroup: null == isGroup ? _self.isGroup : isGroup // ignore: cast_nullable_to_non_nullable
as bool,parent: null == parent ? _self.parent : parent // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
