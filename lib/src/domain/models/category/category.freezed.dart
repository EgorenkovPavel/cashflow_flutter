// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Category {

 int get id; String get cloudId; CategoryType get type; String get title;
/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryCopyWith<Category> get copyWith => _$CategoryCopyWithImpl<Category>(this as Category, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Category&&(identical(other.id, id) || other.id == id)&&(identical(other.cloudId, cloudId) || other.cloudId == cloudId)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title));
}


@override
int get hashCode => Object.hash(runtimeType,id,cloudId,type,title);

@override
String toString() {
  return 'Category(id: $id, cloudId: $cloudId, type: $type, title: $title)';
}


}

/// @nodoc
abstract mixin class $CategoryCopyWith<$Res>  {
  factory $CategoryCopyWith(Category value, $Res Function(Category) _then) = _$CategoryCopyWithImpl;
@useResult
$Res call({
 int id, String cloudId, CategoryType type, String title
});




}
/// @nodoc
class _$CategoryCopyWithImpl<$Res>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._self, this._then);

  final Category _self;
  final $Res Function(Category) _then;

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? cloudId = null,Object? type = null,Object? title = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,cloudId: null == cloudId ? _self.cloudId : cloudId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CategoryType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Category].
extension CategoryPatterns on Category {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CategoryGroup value)?  group,TResult Function( CategoryItem value)?  item,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CategoryGroup() when group != null:
return group(_that);case CategoryItem() when item != null:
return item(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CategoryGroup value)  group,required TResult Function( CategoryItem value)  item,}){
final _that = this;
switch (_that) {
case CategoryGroup():
return group(_that);case CategoryItem():
return item(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CategoryGroup value)?  group,TResult? Function( CategoryItem value)?  item,}){
final _that = this;
switch (_that) {
case CategoryGroup() when group != null:
return group(_that);case CategoryItem() when item != null:
return item(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int id,  String cloudId,  CategoryType type,  String title)?  group,TResult Function( int id,  String cloudId,  CategoryType type,  String title,  int budget,  BudgetType budgetType,  int? parentId)?  item,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CategoryGroup() when group != null:
return group(_that.id,_that.cloudId,_that.type,_that.title);case CategoryItem() when item != null:
return item(_that.id,_that.cloudId,_that.type,_that.title,_that.budget,_that.budgetType,_that.parentId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int id,  String cloudId,  CategoryType type,  String title)  group,required TResult Function( int id,  String cloudId,  CategoryType type,  String title,  int budget,  BudgetType budgetType,  int? parentId)  item,}) {final _that = this;
switch (_that) {
case CategoryGroup():
return group(_that.id,_that.cloudId,_that.type,_that.title);case CategoryItem():
return item(_that.id,_that.cloudId,_that.type,_that.title,_that.budget,_that.budgetType,_that.parentId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int id,  String cloudId,  CategoryType type,  String title)?  group,TResult? Function( int id,  String cloudId,  CategoryType type,  String title,  int budget,  BudgetType budgetType,  int? parentId)?  item,}) {final _that = this;
switch (_that) {
case CategoryGroup() when group != null:
return group(_that.id,_that.cloudId,_that.type,_that.title);case CategoryItem() when item != null:
return item(_that.id,_that.cloudId,_that.type,_that.title,_that.budget,_that.budgetType,_that.parentId);case _:
  return null;

}
}

}

/// @nodoc


class CategoryGroup extends Category {
  const CategoryGroup({this.id = 0, this.cloudId = '', required this.type, required this.title}): super._();
  

@override@JsonKey() final  int id;
@override@JsonKey() final  String cloudId;
@override final  CategoryType type;
@override final  String title;

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryGroupCopyWith<CategoryGroup> get copyWith => _$CategoryGroupCopyWithImpl<CategoryGroup>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryGroup&&(identical(other.id, id) || other.id == id)&&(identical(other.cloudId, cloudId) || other.cloudId == cloudId)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title));
}


@override
int get hashCode => Object.hash(runtimeType,id,cloudId,type,title);

@override
String toString() {
  return 'Category.group(id: $id, cloudId: $cloudId, type: $type, title: $title)';
}


}

/// @nodoc
abstract mixin class $CategoryGroupCopyWith<$Res> implements $CategoryCopyWith<$Res> {
  factory $CategoryGroupCopyWith(CategoryGroup value, $Res Function(CategoryGroup) _then) = _$CategoryGroupCopyWithImpl;
@override @useResult
$Res call({
 int id, String cloudId, CategoryType type, String title
});




}
/// @nodoc
class _$CategoryGroupCopyWithImpl<$Res>
    implements $CategoryGroupCopyWith<$Res> {
  _$CategoryGroupCopyWithImpl(this._self, this._then);

  final CategoryGroup _self;
  final $Res Function(CategoryGroup) _then;

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? cloudId = null,Object? type = null,Object? title = null,}) {
  return _then(CategoryGroup(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,cloudId: null == cloudId ? _self.cloudId : cloudId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CategoryType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CategoryItem extends Category {
  const CategoryItem({this.id = 0, this.cloudId = '', required this.type, required this.title, required this.budget, required this.budgetType, required this.parentId}): super._();
  

@override@JsonKey() final  int id;
@override@JsonKey() final  String cloudId;
@override final  CategoryType type;
@override final  String title;
 final  int budget;
 final  BudgetType budgetType;
 final  int? parentId;

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryItemCopyWith<CategoryItem> get copyWith => _$CategoryItemCopyWithImpl<CategoryItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.cloudId, cloudId) || other.cloudId == cloudId)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.budgetType, budgetType) || other.budgetType == budgetType)&&(identical(other.parentId, parentId) || other.parentId == parentId));
}


@override
int get hashCode => Object.hash(runtimeType,id,cloudId,type,title,budget,budgetType,parentId);

@override
String toString() {
  return 'Category.item(id: $id, cloudId: $cloudId, type: $type, title: $title, budget: $budget, budgetType: $budgetType, parentId: $parentId)';
}


}

/// @nodoc
abstract mixin class $CategoryItemCopyWith<$Res> implements $CategoryCopyWith<$Res> {
  factory $CategoryItemCopyWith(CategoryItem value, $Res Function(CategoryItem) _then) = _$CategoryItemCopyWithImpl;
@override @useResult
$Res call({
 int id, String cloudId, CategoryType type, String title, int budget, BudgetType budgetType, int? parentId
});




}
/// @nodoc
class _$CategoryItemCopyWithImpl<$Res>
    implements $CategoryItemCopyWith<$Res> {
  _$CategoryItemCopyWithImpl(this._self, this._then);

  final CategoryItem _self;
  final $Res Function(CategoryItem) _then;

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? cloudId = null,Object? type = null,Object? title = null,Object? budget = null,Object? budgetType = null,Object? parentId = freezed,}) {
  return _then(CategoryItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,cloudId: null == cloudId ? _self.cloudId : cloudId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CategoryType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as int,budgetType: null == budgetType ? _self.budgetType : budgetType // ignore: cast_nullable_to_non_nullable
as BudgetType,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
