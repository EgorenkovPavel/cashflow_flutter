// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'operation_list_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OperationListFilter {

 DateTimeRange<DateTime>? get period; Set<int> get accountIds; Set<int> get categoryIds;
/// Create a copy of OperationListFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OperationListFilterCopyWith<OperationListFilter> get copyWith => _$OperationListFilterCopyWithImpl<OperationListFilter>(this as OperationListFilter, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as OperationListFilter;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OperationListFilter&&(identical(other.period, _this.period) || other.period == _this.period)&&const DeepCollectionEquality().equals(other.accountIds, _this.accountIds)&&const DeepCollectionEquality().equals(other.categoryIds, _this.categoryIds));
}


@override
int get hashCode {
  final _this = this as OperationListFilter;
  return Object.hash(runtimeType,_this.period,const DeepCollectionEquality().hash(_this.accountIds),const DeepCollectionEquality().hash(_this.categoryIds));
}

@override
String toString() {
  final _this = this as OperationListFilter;
  return 'OperationListFilter(period: ${_this.period}, accountIds: ${_this.accountIds}, categoryIds: ${_this.categoryIds})';
}


}

/// @nodoc
abstract mixin class $OperationListFilterCopyWith<$Res>  {
  factory $OperationListFilterCopyWith(OperationListFilter value, $Res Function(OperationListFilter) _then) = _$OperationListFilterCopyWithImpl;
@useResult
$Res call({
 DateTimeRange<DateTime>? period, Set<int> accountIds, Set<int> categoryIds
});




}
/// @nodoc
class _$OperationListFilterCopyWithImpl<$Res>
    implements $OperationListFilterCopyWith<$Res> {
  _$OperationListFilterCopyWithImpl(this._self, this._then);

  final OperationListFilter _self;
  final $Res Function(OperationListFilter) _then;

/// Create a copy of OperationListFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? period = freezed,Object? accountIds = null,Object? categoryIds = null,}) {
  return _then(OperationListFilter(
period: freezed == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as DateTimeRange<DateTime>?,accountIds: null == accountIds ? _self.accountIds : accountIds // ignore: cast_nullable_to_non_nullable
as Set<int>,categoryIds: null == categoryIds ? _self.categoryIds : categoryIds // ignore: cast_nullable_to_non_nullable
as Set<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [OperationListFilter].
extension OperationListFilterPatterns on OperationListFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OperationListFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OperationListFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OperationListFilter value)  $default,){
final _that = this;
switch (_that) {
case _OperationListFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OperationListFilter value)?  $default,){
final _that = this;
switch (_that) {
case _OperationListFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTimeRange<DateTime>? period,  Set<int> accountIds,  Set<int> categoryIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OperationListFilter() when $default != null:
return $default(_that.period,_that.accountIds,_that.categoryIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTimeRange<DateTime>? period,  Set<int> accountIds,  Set<int> categoryIds)  $default,) {final _that = this;
switch (_that) {
case _OperationListFilter():
return $default(_that.period,_that.accountIds,_that.categoryIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTimeRange<DateTime>? period,  Set<int> accountIds,  Set<int> categoryIds)?  $default,) {final _that = this;
switch (_that) {
case _OperationListFilter() when $default != null:
return $default(_that.period,_that.accountIds,_that.categoryIds);case _:
  return null;

}
}

}

/// @nodoc


class _OperationListFilter implements OperationListFilter {
  const _OperationListFilter({this.period,  Set<int> accountIds = const {},  Set<int> categoryIds = const {}}): _accountIds = accountIds,_categoryIds = categoryIds;
  

@override final  DateTimeRange<DateTime>? period;
 final  Set<int> _accountIds;
@override@JsonKey() Set<int> get accountIds {
  if (_accountIds is EqualUnmodifiableSetView) return _accountIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_accountIds);
}

 final  Set<int> _categoryIds;
@override@JsonKey() Set<int> get categoryIds {
  if (_categoryIds is EqualUnmodifiableSetView) return _categoryIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_categoryIds);
}


/// Create a copy of OperationListFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OperationListFilterCopyWith<_OperationListFilter> get copyWith => __$OperationListFilterCopyWithImpl<_OperationListFilter>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OperationListFilter&&(identical(other.period, period) || other.period == period)&&const DeepCollectionEquality().equals(other.accountIds, _accountIds)&&const DeepCollectionEquality().equals(other.categoryIds, _categoryIds));
}


@override
int get hashCode {
    return Object.hash(runtimeType,period,const DeepCollectionEquality().hash(_accountIds),const DeepCollectionEquality().hash(_categoryIds));
}

@override
String toString() {
    return 'OperationListFilter(period: $period, accountIds: $accountIds, categoryIds: $categoryIds)';
}


}

/// @nodoc
abstract mixin class _$OperationListFilterCopyWith<$Res> implements $OperationListFilterCopyWith<$Res> {
  factory _$OperationListFilterCopyWith(_OperationListFilter value, $Res Function(_OperationListFilter) _then) = __$OperationListFilterCopyWithImpl;
@override @useResult
$Res call({
 DateTimeRange<DateTime>? period, Set<int> accountIds, Set<int> categoryIds
});




}
/// @nodoc
class __$OperationListFilterCopyWithImpl<$Res>
    implements _$OperationListFilterCopyWith<$Res> {
  __$OperationListFilterCopyWithImpl(this._self, this._then);

  final _OperationListFilter _self;
  final $Res Function(_OperationListFilter) _then;

/// Create a copy of OperationListFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? period = freezed,Object? accountIds = null,Object? categoryIds = null,}) {
  return _then(_OperationListFilter(
period: freezed == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as DateTimeRange<DateTime>?,accountIds: null == accountIds ? _self._accountIds : accountIds // ignore: cast_nullable_to_non_nullable
as Set<int>,categoryIds: null == categoryIds ? _self._categoryIds : categoryIds // ignore: cast_nullable_to_non_nullable
as Set<int>,
  ));
}


}

// dart format on
