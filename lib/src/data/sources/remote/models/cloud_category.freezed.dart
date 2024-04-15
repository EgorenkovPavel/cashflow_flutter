// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cloud_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CloudCategory {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get operationType => throw _privateConstructorUsedError;
  int get budgetType => throw _privateConstructorUsedError;
  int get budget => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  bool get deleted => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CloudCategoryCopyWith<CloudCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CloudCategoryCopyWith<$Res> {
  factory $CloudCategoryCopyWith(
          CloudCategory value, $Res Function(CloudCategory) then) =
      _$CloudCategoryCopyWithImpl<$Res, CloudCategory>;
  @useResult
  $Res call(
      {String id,
      String title,
      int operationType,
      int budgetType,
      int budget,
      String currency,
      bool deleted});
}

/// @nodoc
class _$CloudCategoryCopyWithImpl<$Res, $Val extends CloudCategory>
    implements $CloudCategoryCopyWith<$Res> {
  _$CloudCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? operationType = null,
    Object? budgetType = null,
    Object? budget = null,
    Object? currency = null,
    Object? deleted = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      operationType: null == operationType
          ? _value.operationType
          : operationType // ignore: cast_nullable_to_non_nullable
              as int,
      budgetType: null == budgetType
          ? _value.budgetType
          : budgetType // ignore: cast_nullable_to_non_nullable
              as int,
      budget: null == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CloudCategoryImplCopyWith<$Res>
    implements $CloudCategoryCopyWith<$Res> {
  factory _$$CloudCategoryImplCopyWith(
          _$CloudCategoryImpl value, $Res Function(_$CloudCategoryImpl) then) =
      __$$CloudCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      int operationType,
      int budgetType,
      int budget,
      String currency,
      bool deleted});
}

/// @nodoc
class __$$CloudCategoryImplCopyWithImpl<$Res>
    extends _$CloudCategoryCopyWithImpl<$Res, _$CloudCategoryImpl>
    implements _$$CloudCategoryImplCopyWith<$Res> {
  __$$CloudCategoryImplCopyWithImpl(
      _$CloudCategoryImpl _value, $Res Function(_$CloudCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? operationType = null,
    Object? budgetType = null,
    Object? budget = null,
    Object? currency = null,
    Object? deleted = null,
  }) {
    return _then(_$CloudCategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      operationType: null == operationType
          ? _value.operationType
          : operationType // ignore: cast_nullable_to_non_nullable
              as int,
      budgetType: null == budgetType
          ? _value.budgetType
          : budgetType // ignore: cast_nullable_to_non_nullable
              as int,
      budget: null == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CloudCategoryImpl implements _CloudCategory {
  const _$CloudCategoryImpl(
      {required this.id,
      required this.title,
      required this.operationType,
      required this.budgetType,
      required this.budget,
      required this.currency,
      required this.deleted});

  @override
  final String id;
  @override
  final String title;
  @override
  final int operationType;
  @override
  final int budgetType;
  @override
  final int budget;
  @override
  final String currency;
  @override
  final bool deleted;

  @override
  String toString() {
    return 'CloudCategory(id: $id, title: $title, operationType: $operationType, budgetType: $budgetType, budget: $budget, currency: $currency, deleted: $deleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CloudCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.operationType, operationType) ||
                other.operationType == operationType) &&
            (identical(other.budgetType, budgetType) ||
                other.budgetType == budgetType) &&
            (identical(other.budget, budget) || other.budget == budget) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.deleted, deleted) || other.deleted == deleted));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, operationType,
      budgetType, budget, currency, deleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CloudCategoryImplCopyWith<_$CloudCategoryImpl> get copyWith =>
      __$$CloudCategoryImplCopyWithImpl<_$CloudCategoryImpl>(this, _$identity);
}

abstract class _CloudCategory implements CloudCategory {
  const factory _CloudCategory(
      {required final String id,
      required final String title,
      required final int operationType,
      required final int budgetType,
      required final int budget,
      required final String currency,
      required final bool deleted}) = _$CloudCategoryImpl;

  @override
  String get id;
  @override
  String get title;
  @override
  int get operationType;
  @override
  int get budgetType;
  @override
  int get budget;
  @override
  String get currency;
  @override
  bool get deleted;
  @override
  @JsonKey(ignore: true)
  _$$CloudCategoryImplCopyWith<_$CloudCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
