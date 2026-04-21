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
CategoryResponse _$CategoryResponseFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'group':
          return CategoryGroupResponse.fromJson(
            json
          );
                case 'item':
          return CategoryItemResponse.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'CategoryResponse',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$CategoryResponse {

@UuidValueConverter() UuidValue get id; CategoryType get type; String get title;
/// Create a copy of CategoryResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryResponseCopyWith<CategoryResponse> get copyWith => _$CategoryResponseCopyWithImpl<CategoryResponse>(this as CategoryResponse, _$identity);

  /// Serializes this CategoryResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,title);

@override
String toString() {
  return 'CategoryResponse(id: $id, type: $type, title: $title)';
}


}

/// @nodoc
abstract mixin class $CategoryResponseCopyWith<$Res>  {
  factory $CategoryResponseCopyWith(CategoryResponse value, $Res Function(CategoryResponse) _then) = _$CategoryResponseCopyWithImpl;
@useResult
$Res call({
@UuidValueConverter() UuidValue id, CategoryType type, String title
});




}
/// @nodoc
class _$CategoryResponseCopyWithImpl<$Res>
    implements $CategoryResponseCopyWith<$Res> {
  _$CategoryResponseCopyWithImpl(this._self, this._then);

  final CategoryResponse _self;
  final $Res Function(CategoryResponse) _then;

/// Create a copy of CategoryResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? title = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UuidValue,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CategoryType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryResponse].
extension CategoryResponsePatterns on CategoryResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CategoryGroupResponse value)?  group,TResult Function( CategoryItemResponse value)?  item,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CategoryGroupResponse() when group != null:
return group(_that);case CategoryItemResponse() when item != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CategoryGroupResponse value)  group,required TResult Function( CategoryItemResponse value)  item,}){
final _that = this;
switch (_that) {
case CategoryGroupResponse():
return group(_that);case CategoryItemResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CategoryGroupResponse value)?  group,TResult? Function( CategoryItemResponse value)?  item,}){
final _that = this;
switch (_that) {
case CategoryGroupResponse() when group != null:
return group(_that);case CategoryItemResponse() when item != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function(@UuidValueConverter()  UuidValue id,  CategoryType type,  String title)?  group,TResult Function(@UuidValueConverter()  UuidValue id,  CategoryType type,  String title,  int budget,  BudgetType budgetType, @UuidValueConverter()  UuidValue? parentId)?  item,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CategoryGroupResponse() when group != null:
return group(_that.id,_that.type,_that.title);case CategoryItemResponse() when item != null:
return item(_that.id,_that.type,_that.title,_that.budget,_that.budgetType,_that.parentId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function(@UuidValueConverter()  UuidValue id,  CategoryType type,  String title)  group,required TResult Function(@UuidValueConverter()  UuidValue id,  CategoryType type,  String title,  int budget,  BudgetType budgetType, @UuidValueConverter()  UuidValue? parentId)  item,}) {final _that = this;
switch (_that) {
case CategoryGroupResponse():
return group(_that.id,_that.type,_that.title);case CategoryItemResponse():
return item(_that.id,_that.type,_that.title,_that.budget,_that.budgetType,_that.parentId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function(@UuidValueConverter()  UuidValue id,  CategoryType type,  String title)?  group,TResult? Function(@UuidValueConverter()  UuidValue id,  CategoryType type,  String title,  int budget,  BudgetType budgetType, @UuidValueConverter()  UuidValue? parentId)?  item,}) {final _that = this;
switch (_that) {
case CategoryGroupResponse() when group != null:
return group(_that.id,_that.type,_that.title);case CategoryItemResponse() when item != null:
return item(_that.id,_that.type,_that.title,_that.budget,_that.budgetType,_that.parentId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class CategoryGroupResponse extends CategoryResponse {
  const CategoryGroupResponse({@UuidValueConverter() required this.id, required this.type, required this.title, final  String? $type}): $type = $type ?? 'group',super._();
  factory CategoryGroupResponse.fromJson(Map<String, dynamic> json) => _$CategoryGroupResponseFromJson(json);

@override@UuidValueConverter() final  UuidValue id;
@override final  CategoryType type;
@override final  String title;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of CategoryResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryGroupResponseCopyWith<CategoryGroupResponse> get copyWith => _$CategoryGroupResponseCopyWithImpl<CategoryGroupResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryGroupResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryGroupResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,title);

@override
String toString() {
  return 'CategoryResponse.group(id: $id, type: $type, title: $title)';
}


}

/// @nodoc
abstract mixin class $CategoryGroupResponseCopyWith<$Res> implements $CategoryResponseCopyWith<$Res> {
  factory $CategoryGroupResponseCopyWith(CategoryGroupResponse value, $Res Function(CategoryGroupResponse) _then) = _$CategoryGroupResponseCopyWithImpl;
@override @useResult
$Res call({
@UuidValueConverter() UuidValue id, CategoryType type, String title
});




}
/// @nodoc
class _$CategoryGroupResponseCopyWithImpl<$Res>
    implements $CategoryGroupResponseCopyWith<$Res> {
  _$CategoryGroupResponseCopyWithImpl(this._self, this._then);

  final CategoryGroupResponse _self;
  final $Res Function(CategoryGroupResponse) _then;

/// Create a copy of CategoryResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? title = null,}) {
  return _then(CategoryGroupResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UuidValue,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CategoryType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class CategoryItemResponse extends CategoryResponse {
  const CategoryItemResponse({@UuidValueConverter() required this.id, required this.type, required this.title, required this.budget, required this.budgetType, @UuidValueConverter() required this.parentId, final  String? $type}): $type = $type ?? 'item',super._();
  factory CategoryItemResponse.fromJson(Map<String, dynamic> json) => _$CategoryItemResponseFromJson(json);

@override@UuidValueConverter() final  UuidValue id;
@override final  CategoryType type;
@override final  String title;
 final  int budget;
 final  BudgetType budgetType;
@UuidValueConverter() final  UuidValue? parentId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of CategoryResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryItemResponseCopyWith<CategoryItemResponse> get copyWith => _$CategoryItemResponseCopyWithImpl<CategoryItemResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryItemResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryItemResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.budgetType, budgetType) || other.budgetType == budgetType)&&(identical(other.parentId, parentId) || other.parentId == parentId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,title,budget,budgetType,parentId);

@override
String toString() {
  return 'CategoryResponse.item(id: $id, type: $type, title: $title, budget: $budget, budgetType: $budgetType, parentId: $parentId)';
}


}

/// @nodoc
abstract mixin class $CategoryItemResponseCopyWith<$Res> implements $CategoryResponseCopyWith<$Res> {
  factory $CategoryItemResponseCopyWith(CategoryItemResponse value, $Res Function(CategoryItemResponse) _then) = _$CategoryItemResponseCopyWithImpl;
@override @useResult
$Res call({
@UuidValueConverter() UuidValue id, CategoryType type, String title, int budget, BudgetType budgetType,@UuidValueConverter() UuidValue? parentId
});




}
/// @nodoc
class _$CategoryItemResponseCopyWithImpl<$Res>
    implements $CategoryItemResponseCopyWith<$Res> {
  _$CategoryItemResponseCopyWithImpl(this._self, this._then);

  final CategoryItemResponse _self;
  final $Res Function(CategoryItemResponse) _then;

/// Create a copy of CategoryResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? title = null,Object? budget = null,Object? budgetType = null,Object? parentId = freezed,}) {
  return _then(CategoryItemResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UuidValue,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CategoryType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as int,budgetType: null == budgetType ? _self.budgetType : budgetType // ignore: cast_nullable_to_non_nullable
as BudgetType,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as UuidValue?,
  ));
}


}

CreateCategoryRequest _$CreateCategoryRequestFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'item':
          return ItemCreateCategoryRequest.fromJson(
            json
          );
                case 'group':
          return GroupCreateCategoryRequest.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'CreateCategoryRequest',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$CreateCategoryRequest {

 CategoryType get type; String get title;
/// Create a copy of CreateCategoryRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateCategoryRequestCopyWith<CreateCategoryRequest> get copyWith => _$CreateCategoryRequestCopyWithImpl<CreateCategoryRequest>(this as CreateCategoryRequest, _$identity);

  /// Serializes this CreateCategoryRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateCategoryRequest&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,title);

@override
String toString() {
  return 'CreateCategoryRequest(type: $type, title: $title)';
}


}

/// @nodoc
abstract mixin class $CreateCategoryRequestCopyWith<$Res>  {
  factory $CreateCategoryRequestCopyWith(CreateCategoryRequest value, $Res Function(CreateCategoryRequest) _then) = _$CreateCategoryRequestCopyWithImpl;
@useResult
$Res call({
 CategoryType type, String title
});




}
/// @nodoc
class _$CreateCategoryRequestCopyWithImpl<$Res>
    implements $CreateCategoryRequestCopyWith<$Res> {
  _$CreateCategoryRequestCopyWithImpl(this._self, this._then);

  final CreateCategoryRequest _self;
  final $Res Function(CreateCategoryRequest) _then;

/// Create a copy of CreateCategoryRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? title = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CategoryType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateCategoryRequest].
extension CreateCategoryRequestPatterns on CreateCategoryRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ItemCreateCategoryRequest value)?  item,TResult Function( GroupCreateCategoryRequest value)?  group,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ItemCreateCategoryRequest() when item != null:
return item(_that);case GroupCreateCategoryRequest() when group != null:
return group(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ItemCreateCategoryRequest value)  item,required TResult Function( GroupCreateCategoryRequest value)  group,}){
final _that = this;
switch (_that) {
case ItemCreateCategoryRequest():
return item(_that);case GroupCreateCategoryRequest():
return group(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ItemCreateCategoryRequest value)?  item,TResult? Function( GroupCreateCategoryRequest value)?  group,}){
final _that = this;
switch (_that) {
case ItemCreateCategoryRequest() when item != null:
return item(_that);case GroupCreateCategoryRequest() when group != null:
return group(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( CategoryType type,  String title,  int budget,  BudgetType budgetType, @UuidValueConverter()  UuidValue? parentId)?  item,TResult Function( CategoryType type,  String title)?  group,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ItemCreateCategoryRequest() when item != null:
return item(_that.type,_that.title,_that.budget,_that.budgetType,_that.parentId);case GroupCreateCategoryRequest() when group != null:
return group(_that.type,_that.title);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( CategoryType type,  String title,  int budget,  BudgetType budgetType, @UuidValueConverter()  UuidValue? parentId)  item,required TResult Function( CategoryType type,  String title)  group,}) {final _that = this;
switch (_that) {
case ItemCreateCategoryRequest():
return item(_that.type,_that.title,_that.budget,_that.budgetType,_that.parentId);case GroupCreateCategoryRequest():
return group(_that.type,_that.title);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( CategoryType type,  String title,  int budget,  BudgetType budgetType, @UuidValueConverter()  UuidValue? parentId)?  item,TResult? Function( CategoryType type,  String title)?  group,}) {final _that = this;
switch (_that) {
case ItemCreateCategoryRequest() when item != null:
return item(_that.type,_that.title,_that.budget,_that.budgetType,_that.parentId);case GroupCreateCategoryRequest() when group != null:
return group(_that.type,_that.title);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class ItemCreateCategoryRequest implements CreateCategoryRequest {
  const ItemCreateCategoryRequest({required this.type, required this.title, required this.budget, required this.budgetType, @UuidValueConverter() required this.parentId, final  String? $type}): $type = $type ?? 'item';
  factory ItemCreateCategoryRequest.fromJson(Map<String, dynamic> json) => _$ItemCreateCategoryRequestFromJson(json);

@override final  CategoryType type;
@override final  String title;
 final  int budget;
 final  BudgetType budgetType;
@UuidValueConverter() final  UuidValue? parentId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of CreateCategoryRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemCreateCategoryRequestCopyWith<ItemCreateCategoryRequest> get copyWith => _$ItemCreateCategoryRequestCopyWithImpl<ItemCreateCategoryRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ItemCreateCategoryRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemCreateCategoryRequest&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.budgetType, budgetType) || other.budgetType == budgetType)&&(identical(other.parentId, parentId) || other.parentId == parentId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,title,budget,budgetType,parentId);

@override
String toString() {
  return 'CreateCategoryRequest.item(type: $type, title: $title, budget: $budget, budgetType: $budgetType, parentId: $parentId)';
}


}

/// @nodoc
abstract mixin class $ItemCreateCategoryRequestCopyWith<$Res> implements $CreateCategoryRequestCopyWith<$Res> {
  factory $ItemCreateCategoryRequestCopyWith(ItemCreateCategoryRequest value, $Res Function(ItemCreateCategoryRequest) _then) = _$ItemCreateCategoryRequestCopyWithImpl;
@override @useResult
$Res call({
 CategoryType type, String title, int budget, BudgetType budgetType,@UuidValueConverter() UuidValue? parentId
});




}
/// @nodoc
class _$ItemCreateCategoryRequestCopyWithImpl<$Res>
    implements $ItemCreateCategoryRequestCopyWith<$Res> {
  _$ItemCreateCategoryRequestCopyWithImpl(this._self, this._then);

  final ItemCreateCategoryRequest _self;
  final $Res Function(ItemCreateCategoryRequest) _then;

/// Create a copy of CreateCategoryRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? title = null,Object? budget = null,Object? budgetType = null,Object? parentId = freezed,}) {
  return _then(ItemCreateCategoryRequest(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CategoryType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as int,budgetType: null == budgetType ? _self.budgetType : budgetType // ignore: cast_nullable_to_non_nullable
as BudgetType,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as UuidValue?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class GroupCreateCategoryRequest implements CreateCategoryRequest {
  const GroupCreateCategoryRequest({required this.type, required this.title, final  String? $type}): $type = $type ?? 'group';
  factory GroupCreateCategoryRequest.fromJson(Map<String, dynamic> json) => _$GroupCreateCategoryRequestFromJson(json);

@override final  CategoryType type;
@override final  String title;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of CreateCategoryRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroupCreateCategoryRequestCopyWith<GroupCreateCategoryRequest> get copyWith => _$GroupCreateCategoryRequestCopyWithImpl<GroupCreateCategoryRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GroupCreateCategoryRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroupCreateCategoryRequest&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,title);

@override
String toString() {
  return 'CreateCategoryRequest.group(type: $type, title: $title)';
}


}

/// @nodoc
abstract mixin class $GroupCreateCategoryRequestCopyWith<$Res> implements $CreateCategoryRequestCopyWith<$Res> {
  factory $GroupCreateCategoryRequestCopyWith(GroupCreateCategoryRequest value, $Res Function(GroupCreateCategoryRequest) _then) = _$GroupCreateCategoryRequestCopyWithImpl;
@override @useResult
$Res call({
 CategoryType type, String title
});




}
/// @nodoc
class _$GroupCreateCategoryRequestCopyWithImpl<$Res>
    implements $GroupCreateCategoryRequestCopyWith<$Res> {
  _$GroupCreateCategoryRequestCopyWithImpl(this._self, this._then);

  final GroupCreateCategoryRequest _self;
  final $Res Function(GroupCreateCategoryRequest) _then;

/// Create a copy of CreateCategoryRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? title = null,}) {
  return _then(GroupCreateCategoryRequest(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CategoryType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

UpdateCategoryRequest _$UpdateCategoryRequestFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'item':
          return ItemUpdateCategoryRequest.fromJson(
            json
          );
                case 'group':
          return GroupUpdateCategoryRequest.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'UpdateCategoryRequest',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$UpdateCategoryRequest {

@UuidValueConverter() UuidValue get id; String get title;
/// Create a copy of UpdateCategoryRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateCategoryRequestCopyWith<UpdateCategoryRequest> get copyWith => _$UpdateCategoryRequestCopyWithImpl<UpdateCategoryRequest>(this as UpdateCategoryRequest, _$identity);

  /// Serializes this UpdateCategoryRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateCategoryRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title);

@override
String toString() {
  return 'UpdateCategoryRequest(id: $id, title: $title)';
}


}

/// @nodoc
abstract mixin class $UpdateCategoryRequestCopyWith<$Res>  {
  factory $UpdateCategoryRequestCopyWith(UpdateCategoryRequest value, $Res Function(UpdateCategoryRequest) _then) = _$UpdateCategoryRequestCopyWithImpl;
@useResult
$Res call({
@UuidValueConverter() UuidValue id, String title
});




}
/// @nodoc
class _$UpdateCategoryRequestCopyWithImpl<$Res>
    implements $UpdateCategoryRequestCopyWith<$Res> {
  _$UpdateCategoryRequestCopyWithImpl(this._self, this._then);

  final UpdateCategoryRequest _self;
  final $Res Function(UpdateCategoryRequest) _then;

/// Create a copy of UpdateCategoryRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UuidValue,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateCategoryRequest].
extension UpdateCategoryRequestPatterns on UpdateCategoryRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ItemUpdateCategoryRequest value)?  item,TResult Function( GroupUpdateCategoryRequest value)?  group,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ItemUpdateCategoryRequest() when item != null:
return item(_that);case GroupUpdateCategoryRequest() when group != null:
return group(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ItemUpdateCategoryRequest value)  item,required TResult Function( GroupUpdateCategoryRequest value)  group,}){
final _that = this;
switch (_that) {
case ItemUpdateCategoryRequest():
return item(_that);case GroupUpdateCategoryRequest():
return group(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ItemUpdateCategoryRequest value)?  item,TResult? Function( GroupUpdateCategoryRequest value)?  group,}){
final _that = this;
switch (_that) {
case ItemUpdateCategoryRequest() when item != null:
return item(_that);case GroupUpdateCategoryRequest() when group != null:
return group(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function(@UuidValueConverter()  UuidValue id,  String title,  int budget,  BudgetType budgetType, @UuidValueConverter()  UuidValue? parentId)?  item,TResult Function(@UuidValueConverter()  UuidValue id,  String title)?  group,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ItemUpdateCategoryRequest() when item != null:
return item(_that.id,_that.title,_that.budget,_that.budgetType,_that.parentId);case GroupUpdateCategoryRequest() when group != null:
return group(_that.id,_that.title);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function(@UuidValueConverter()  UuidValue id,  String title,  int budget,  BudgetType budgetType, @UuidValueConverter()  UuidValue? parentId)  item,required TResult Function(@UuidValueConverter()  UuidValue id,  String title)  group,}) {final _that = this;
switch (_that) {
case ItemUpdateCategoryRequest():
return item(_that.id,_that.title,_that.budget,_that.budgetType,_that.parentId);case GroupUpdateCategoryRequest():
return group(_that.id,_that.title);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function(@UuidValueConverter()  UuidValue id,  String title,  int budget,  BudgetType budgetType, @UuidValueConverter()  UuidValue? parentId)?  item,TResult? Function(@UuidValueConverter()  UuidValue id,  String title)?  group,}) {final _that = this;
switch (_that) {
case ItemUpdateCategoryRequest() when item != null:
return item(_that.id,_that.title,_that.budget,_that.budgetType,_that.parentId);case GroupUpdateCategoryRequest() when group != null:
return group(_that.id,_that.title);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class ItemUpdateCategoryRequest implements UpdateCategoryRequest {
  const ItemUpdateCategoryRequest({@UuidValueConverter() required this.id, required this.title, required this.budget, required this.budgetType, @UuidValueConverter() required this.parentId, final  String? $type}): $type = $type ?? 'item';
  factory ItemUpdateCategoryRequest.fromJson(Map<String, dynamic> json) => _$ItemUpdateCategoryRequestFromJson(json);

@override@UuidValueConverter() final  UuidValue id;
@override final  String title;
 final  int budget;
 final  BudgetType budgetType;
@UuidValueConverter() final  UuidValue? parentId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of UpdateCategoryRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemUpdateCategoryRequestCopyWith<ItemUpdateCategoryRequest> get copyWith => _$ItemUpdateCategoryRequestCopyWithImpl<ItemUpdateCategoryRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ItemUpdateCategoryRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemUpdateCategoryRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.budgetType, budgetType) || other.budgetType == budgetType)&&(identical(other.parentId, parentId) || other.parentId == parentId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,budget,budgetType,parentId);

@override
String toString() {
  return 'UpdateCategoryRequest.item(id: $id, title: $title, budget: $budget, budgetType: $budgetType, parentId: $parentId)';
}


}

/// @nodoc
abstract mixin class $ItemUpdateCategoryRequestCopyWith<$Res> implements $UpdateCategoryRequestCopyWith<$Res> {
  factory $ItemUpdateCategoryRequestCopyWith(ItemUpdateCategoryRequest value, $Res Function(ItemUpdateCategoryRequest) _then) = _$ItemUpdateCategoryRequestCopyWithImpl;
@override @useResult
$Res call({
@UuidValueConverter() UuidValue id, String title, int budget, BudgetType budgetType,@UuidValueConverter() UuidValue? parentId
});




}
/// @nodoc
class _$ItemUpdateCategoryRequestCopyWithImpl<$Res>
    implements $ItemUpdateCategoryRequestCopyWith<$Res> {
  _$ItemUpdateCategoryRequestCopyWithImpl(this._self, this._then);

  final ItemUpdateCategoryRequest _self;
  final $Res Function(ItemUpdateCategoryRequest) _then;

/// Create a copy of UpdateCategoryRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? budget = null,Object? budgetType = null,Object? parentId = freezed,}) {
  return _then(ItemUpdateCategoryRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UuidValue,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as int,budgetType: null == budgetType ? _self.budgetType : budgetType // ignore: cast_nullable_to_non_nullable
as BudgetType,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as UuidValue?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class GroupUpdateCategoryRequest implements UpdateCategoryRequest {
  const GroupUpdateCategoryRequest({@UuidValueConverter() required this.id, required this.title, final  String? $type}): $type = $type ?? 'group';
  factory GroupUpdateCategoryRequest.fromJson(Map<String, dynamic> json) => _$GroupUpdateCategoryRequestFromJson(json);

@override@UuidValueConverter() final  UuidValue id;
@override final  String title;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of UpdateCategoryRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroupUpdateCategoryRequestCopyWith<GroupUpdateCategoryRequest> get copyWith => _$GroupUpdateCategoryRequestCopyWithImpl<GroupUpdateCategoryRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GroupUpdateCategoryRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroupUpdateCategoryRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title);

@override
String toString() {
  return 'UpdateCategoryRequest.group(id: $id, title: $title)';
}


}

/// @nodoc
abstract mixin class $GroupUpdateCategoryRequestCopyWith<$Res> implements $UpdateCategoryRequestCopyWith<$Res> {
  factory $GroupUpdateCategoryRequestCopyWith(GroupUpdateCategoryRequest value, $Res Function(GroupUpdateCategoryRequest) _then) = _$GroupUpdateCategoryRequestCopyWithImpl;
@override @useResult
$Res call({
@UuidValueConverter() UuidValue id, String title
});




}
/// @nodoc
class _$GroupUpdateCategoryRequestCopyWithImpl<$Res>
    implements $GroupUpdateCategoryRequestCopyWith<$Res> {
  _$GroupUpdateCategoryRequestCopyWithImpl(this._self, this._then);

  final GroupUpdateCategoryRequest _self;
  final $Res Function(GroupUpdateCategoryRequest) _then;

/// Create a copy of UpdateCategoryRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,}) {
  return _then(GroupUpdateCategoryRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UuidValue,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
