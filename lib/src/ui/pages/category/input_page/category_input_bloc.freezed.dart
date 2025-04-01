// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_input_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CategoryInputEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CategoryType type, bool isGroup) initByType,
    required TResult Function(int categoryId) initById,
    required TResult Function(String title) changeTitle,
    required TResult Function(int budget) changeBudget,
    required TResult Function(BudgetType budgetType) changeBudgetType,
    required TResult Function(int? parentId) changeParent,
    required TResult Function() save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CategoryType type, bool isGroup)? initByType,
    TResult? Function(int categoryId)? initById,
    TResult? Function(String title)? changeTitle,
    TResult? Function(int budget)? changeBudget,
    TResult? Function(BudgetType budgetType)? changeBudgetType,
    TResult? Function(int? parentId)? changeParent,
    TResult? Function()? save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CategoryType type, bool isGroup)? initByType,
    TResult Function(int categoryId)? initById,
    TResult Function(String title)? changeTitle,
    TResult Function(int budget)? changeBudget,
    TResult Function(BudgetType budgetType)? changeBudgetType,
    TResult Function(int? parentId)? changeParent,
    TResult Function()? save,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitByTypeCategoryInputEvent value) initByType,
    required TResult Function(_InitByIdCategoryInputEvent value) initById,
    required TResult Function(_ChangeTitleCategoryInputEvent value) changeTitle,
    required TResult Function(_ChangeBudgetCategoryInputEvent value)
        changeBudget,
    required TResult Function(_ChangeBudgetTypeCategoryInputEvent value)
        changeBudgetType,
    required TResult Function(_ChangeParentCategoryInputEvent value)
        changeParent,
    required TResult Function(_SaveCategoryInputEvent value) save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitByTypeCategoryInputEvent value)? initByType,
    TResult? Function(_InitByIdCategoryInputEvent value)? initById,
    TResult? Function(_ChangeTitleCategoryInputEvent value)? changeTitle,
    TResult? Function(_ChangeBudgetCategoryInputEvent value)? changeBudget,
    TResult? Function(_ChangeBudgetTypeCategoryInputEvent value)?
        changeBudgetType,
    TResult? Function(_ChangeParentCategoryInputEvent value)? changeParent,
    TResult? Function(_SaveCategoryInputEvent value)? save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitByTypeCategoryInputEvent value)? initByType,
    TResult Function(_InitByIdCategoryInputEvent value)? initById,
    TResult Function(_ChangeTitleCategoryInputEvent value)? changeTitle,
    TResult Function(_ChangeBudgetCategoryInputEvent value)? changeBudget,
    TResult Function(_ChangeBudgetTypeCategoryInputEvent value)?
        changeBudgetType,
    TResult Function(_ChangeParentCategoryInputEvent value)? changeParent,
    TResult Function(_SaveCategoryInputEvent value)? save,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryInputEventCopyWith<$Res> {
  factory $CategoryInputEventCopyWith(
          CategoryInputEvent value, $Res Function(CategoryInputEvent) then) =
      _$CategoryInputEventCopyWithImpl<$Res, CategoryInputEvent>;
}

/// @nodoc
class _$CategoryInputEventCopyWithImpl<$Res, $Val extends CategoryInputEvent>
    implements $CategoryInputEventCopyWith<$Res> {
  _$CategoryInputEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryInputEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitByTypeCategoryInputEventImplCopyWith<$Res> {
  factory _$$InitByTypeCategoryInputEventImplCopyWith(
          _$InitByTypeCategoryInputEventImpl value,
          $Res Function(_$InitByTypeCategoryInputEventImpl) then) =
      __$$InitByTypeCategoryInputEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CategoryType type, bool isGroup});
}

/// @nodoc
class __$$InitByTypeCategoryInputEventImplCopyWithImpl<$Res>
    extends _$CategoryInputEventCopyWithImpl<$Res,
        _$InitByTypeCategoryInputEventImpl>
    implements _$$InitByTypeCategoryInputEventImplCopyWith<$Res> {
  __$$InitByTypeCategoryInputEventImplCopyWithImpl(
      _$InitByTypeCategoryInputEventImpl _value,
      $Res Function(_$InitByTypeCategoryInputEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? isGroup = null,
  }) {
    return _then(_$InitByTypeCategoryInputEventImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CategoryType,
      isGroup: null == isGroup
          ? _value.isGroup
          : isGroup // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InitByTypeCategoryInputEventImpl
    implements _InitByTypeCategoryInputEvent {
  const _$InitByTypeCategoryInputEventImpl(
      {required this.type, required this.isGroup});

  @override
  final CategoryType type;
  @override
  final bool isGroup;

  @override
  String toString() {
    return 'CategoryInputEvent.initByType(type: $type, isGroup: $isGroup)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitByTypeCategoryInputEventImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isGroup, isGroup) || other.isGroup == isGroup));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, isGroup);

  /// Create a copy of CategoryInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitByTypeCategoryInputEventImplCopyWith<
          _$InitByTypeCategoryInputEventImpl>
      get copyWith => __$$InitByTypeCategoryInputEventImplCopyWithImpl<
          _$InitByTypeCategoryInputEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CategoryType type, bool isGroup) initByType,
    required TResult Function(int categoryId) initById,
    required TResult Function(String title) changeTitle,
    required TResult Function(int budget) changeBudget,
    required TResult Function(BudgetType budgetType) changeBudgetType,
    required TResult Function(int? parentId) changeParent,
    required TResult Function() save,
  }) {
    return initByType(type, isGroup);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CategoryType type, bool isGroup)? initByType,
    TResult? Function(int categoryId)? initById,
    TResult? Function(String title)? changeTitle,
    TResult? Function(int budget)? changeBudget,
    TResult? Function(BudgetType budgetType)? changeBudgetType,
    TResult? Function(int? parentId)? changeParent,
    TResult? Function()? save,
  }) {
    return initByType?.call(type, isGroup);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CategoryType type, bool isGroup)? initByType,
    TResult Function(int categoryId)? initById,
    TResult Function(String title)? changeTitle,
    TResult Function(int budget)? changeBudget,
    TResult Function(BudgetType budgetType)? changeBudgetType,
    TResult Function(int? parentId)? changeParent,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (initByType != null) {
      return initByType(type, isGroup);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitByTypeCategoryInputEvent value) initByType,
    required TResult Function(_InitByIdCategoryInputEvent value) initById,
    required TResult Function(_ChangeTitleCategoryInputEvent value) changeTitle,
    required TResult Function(_ChangeBudgetCategoryInputEvent value)
        changeBudget,
    required TResult Function(_ChangeBudgetTypeCategoryInputEvent value)
        changeBudgetType,
    required TResult Function(_ChangeParentCategoryInputEvent value)
        changeParent,
    required TResult Function(_SaveCategoryInputEvent value) save,
  }) {
    return initByType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitByTypeCategoryInputEvent value)? initByType,
    TResult? Function(_InitByIdCategoryInputEvent value)? initById,
    TResult? Function(_ChangeTitleCategoryInputEvent value)? changeTitle,
    TResult? Function(_ChangeBudgetCategoryInputEvent value)? changeBudget,
    TResult? Function(_ChangeBudgetTypeCategoryInputEvent value)?
        changeBudgetType,
    TResult? Function(_ChangeParentCategoryInputEvent value)? changeParent,
    TResult? Function(_SaveCategoryInputEvent value)? save,
  }) {
    return initByType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitByTypeCategoryInputEvent value)? initByType,
    TResult Function(_InitByIdCategoryInputEvent value)? initById,
    TResult Function(_ChangeTitleCategoryInputEvent value)? changeTitle,
    TResult Function(_ChangeBudgetCategoryInputEvent value)? changeBudget,
    TResult Function(_ChangeBudgetTypeCategoryInputEvent value)?
        changeBudgetType,
    TResult Function(_ChangeParentCategoryInputEvent value)? changeParent,
    TResult Function(_SaveCategoryInputEvent value)? save,
    required TResult orElse(),
  }) {
    if (initByType != null) {
      return initByType(this);
    }
    return orElse();
  }
}

abstract class _InitByTypeCategoryInputEvent implements CategoryInputEvent {
  const factory _InitByTypeCategoryInputEvent(
      {required final CategoryType type,
      required final bool isGroup}) = _$InitByTypeCategoryInputEventImpl;

  CategoryType get type;
  bool get isGroup;

  /// Create a copy of CategoryInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitByTypeCategoryInputEventImplCopyWith<
          _$InitByTypeCategoryInputEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitByIdCategoryInputEventImplCopyWith<$Res> {
  factory _$$InitByIdCategoryInputEventImplCopyWith(
          _$InitByIdCategoryInputEventImpl value,
          $Res Function(_$InitByIdCategoryInputEventImpl) then) =
      __$$InitByIdCategoryInputEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int categoryId});
}

/// @nodoc
class __$$InitByIdCategoryInputEventImplCopyWithImpl<$Res>
    extends _$CategoryInputEventCopyWithImpl<$Res,
        _$InitByIdCategoryInputEventImpl>
    implements _$$InitByIdCategoryInputEventImplCopyWith<$Res> {
  __$$InitByIdCategoryInputEventImplCopyWithImpl(
      _$InitByIdCategoryInputEventImpl _value,
      $Res Function(_$InitByIdCategoryInputEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
  }) {
    return _then(_$InitByIdCategoryInputEventImpl(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$InitByIdCategoryInputEventImpl implements _InitByIdCategoryInputEvent {
  const _$InitByIdCategoryInputEventImpl({required this.categoryId});

  @override
  final int categoryId;

  @override
  String toString() {
    return 'CategoryInputEvent.initById(categoryId: $categoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitByIdCategoryInputEventImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryId);

  /// Create a copy of CategoryInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitByIdCategoryInputEventImplCopyWith<_$InitByIdCategoryInputEventImpl>
      get copyWith => __$$InitByIdCategoryInputEventImplCopyWithImpl<
          _$InitByIdCategoryInputEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CategoryType type, bool isGroup) initByType,
    required TResult Function(int categoryId) initById,
    required TResult Function(String title) changeTitle,
    required TResult Function(int budget) changeBudget,
    required TResult Function(BudgetType budgetType) changeBudgetType,
    required TResult Function(int? parentId) changeParent,
    required TResult Function() save,
  }) {
    return initById(categoryId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CategoryType type, bool isGroup)? initByType,
    TResult? Function(int categoryId)? initById,
    TResult? Function(String title)? changeTitle,
    TResult? Function(int budget)? changeBudget,
    TResult? Function(BudgetType budgetType)? changeBudgetType,
    TResult? Function(int? parentId)? changeParent,
    TResult? Function()? save,
  }) {
    return initById?.call(categoryId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CategoryType type, bool isGroup)? initByType,
    TResult Function(int categoryId)? initById,
    TResult Function(String title)? changeTitle,
    TResult Function(int budget)? changeBudget,
    TResult Function(BudgetType budgetType)? changeBudgetType,
    TResult Function(int? parentId)? changeParent,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (initById != null) {
      return initById(categoryId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitByTypeCategoryInputEvent value) initByType,
    required TResult Function(_InitByIdCategoryInputEvent value) initById,
    required TResult Function(_ChangeTitleCategoryInputEvent value) changeTitle,
    required TResult Function(_ChangeBudgetCategoryInputEvent value)
        changeBudget,
    required TResult Function(_ChangeBudgetTypeCategoryInputEvent value)
        changeBudgetType,
    required TResult Function(_ChangeParentCategoryInputEvent value)
        changeParent,
    required TResult Function(_SaveCategoryInputEvent value) save,
  }) {
    return initById(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitByTypeCategoryInputEvent value)? initByType,
    TResult? Function(_InitByIdCategoryInputEvent value)? initById,
    TResult? Function(_ChangeTitleCategoryInputEvent value)? changeTitle,
    TResult? Function(_ChangeBudgetCategoryInputEvent value)? changeBudget,
    TResult? Function(_ChangeBudgetTypeCategoryInputEvent value)?
        changeBudgetType,
    TResult? Function(_ChangeParentCategoryInputEvent value)? changeParent,
    TResult? Function(_SaveCategoryInputEvent value)? save,
  }) {
    return initById?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitByTypeCategoryInputEvent value)? initByType,
    TResult Function(_InitByIdCategoryInputEvent value)? initById,
    TResult Function(_ChangeTitleCategoryInputEvent value)? changeTitle,
    TResult Function(_ChangeBudgetCategoryInputEvent value)? changeBudget,
    TResult Function(_ChangeBudgetTypeCategoryInputEvent value)?
        changeBudgetType,
    TResult Function(_ChangeParentCategoryInputEvent value)? changeParent,
    TResult Function(_SaveCategoryInputEvent value)? save,
    required TResult orElse(),
  }) {
    if (initById != null) {
      return initById(this);
    }
    return orElse();
  }
}

abstract class _InitByIdCategoryInputEvent implements CategoryInputEvent {
  const factory _InitByIdCategoryInputEvent({required final int categoryId}) =
      _$InitByIdCategoryInputEventImpl;

  int get categoryId;

  /// Create a copy of CategoryInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitByIdCategoryInputEventImplCopyWith<_$InitByIdCategoryInputEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeTitleCategoryInputEventImplCopyWith<$Res> {
  factory _$$ChangeTitleCategoryInputEventImplCopyWith(
          _$ChangeTitleCategoryInputEventImpl value,
          $Res Function(_$ChangeTitleCategoryInputEventImpl) then) =
      __$$ChangeTitleCategoryInputEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String title});
}

/// @nodoc
class __$$ChangeTitleCategoryInputEventImplCopyWithImpl<$Res>
    extends _$CategoryInputEventCopyWithImpl<$Res,
        _$ChangeTitleCategoryInputEventImpl>
    implements _$$ChangeTitleCategoryInputEventImplCopyWith<$Res> {
  __$$ChangeTitleCategoryInputEventImplCopyWithImpl(
      _$ChangeTitleCategoryInputEventImpl _value,
      $Res Function(_$ChangeTitleCategoryInputEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
  }) {
    return _then(_$ChangeTitleCategoryInputEventImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangeTitleCategoryInputEventImpl
    implements _ChangeTitleCategoryInputEvent {
  const _$ChangeTitleCategoryInputEventImpl({required this.title});

  @override
  final String title;

  @override
  String toString() {
    return 'CategoryInputEvent.changeTitle(title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeTitleCategoryInputEventImpl &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title);

  /// Create a copy of CategoryInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeTitleCategoryInputEventImplCopyWith<
          _$ChangeTitleCategoryInputEventImpl>
      get copyWith => __$$ChangeTitleCategoryInputEventImplCopyWithImpl<
          _$ChangeTitleCategoryInputEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CategoryType type, bool isGroup) initByType,
    required TResult Function(int categoryId) initById,
    required TResult Function(String title) changeTitle,
    required TResult Function(int budget) changeBudget,
    required TResult Function(BudgetType budgetType) changeBudgetType,
    required TResult Function(int? parentId) changeParent,
    required TResult Function() save,
  }) {
    return changeTitle(title);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CategoryType type, bool isGroup)? initByType,
    TResult? Function(int categoryId)? initById,
    TResult? Function(String title)? changeTitle,
    TResult? Function(int budget)? changeBudget,
    TResult? Function(BudgetType budgetType)? changeBudgetType,
    TResult? Function(int? parentId)? changeParent,
    TResult? Function()? save,
  }) {
    return changeTitle?.call(title);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CategoryType type, bool isGroup)? initByType,
    TResult Function(int categoryId)? initById,
    TResult Function(String title)? changeTitle,
    TResult Function(int budget)? changeBudget,
    TResult Function(BudgetType budgetType)? changeBudgetType,
    TResult Function(int? parentId)? changeParent,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (changeTitle != null) {
      return changeTitle(title);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitByTypeCategoryInputEvent value) initByType,
    required TResult Function(_InitByIdCategoryInputEvent value) initById,
    required TResult Function(_ChangeTitleCategoryInputEvent value) changeTitle,
    required TResult Function(_ChangeBudgetCategoryInputEvent value)
        changeBudget,
    required TResult Function(_ChangeBudgetTypeCategoryInputEvent value)
        changeBudgetType,
    required TResult Function(_ChangeParentCategoryInputEvent value)
        changeParent,
    required TResult Function(_SaveCategoryInputEvent value) save,
  }) {
    return changeTitle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitByTypeCategoryInputEvent value)? initByType,
    TResult? Function(_InitByIdCategoryInputEvent value)? initById,
    TResult? Function(_ChangeTitleCategoryInputEvent value)? changeTitle,
    TResult? Function(_ChangeBudgetCategoryInputEvent value)? changeBudget,
    TResult? Function(_ChangeBudgetTypeCategoryInputEvent value)?
        changeBudgetType,
    TResult? Function(_ChangeParentCategoryInputEvent value)? changeParent,
    TResult? Function(_SaveCategoryInputEvent value)? save,
  }) {
    return changeTitle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitByTypeCategoryInputEvent value)? initByType,
    TResult Function(_InitByIdCategoryInputEvent value)? initById,
    TResult Function(_ChangeTitleCategoryInputEvent value)? changeTitle,
    TResult Function(_ChangeBudgetCategoryInputEvent value)? changeBudget,
    TResult Function(_ChangeBudgetTypeCategoryInputEvent value)?
        changeBudgetType,
    TResult Function(_ChangeParentCategoryInputEvent value)? changeParent,
    TResult Function(_SaveCategoryInputEvent value)? save,
    required TResult orElse(),
  }) {
    if (changeTitle != null) {
      return changeTitle(this);
    }
    return orElse();
  }
}

abstract class _ChangeTitleCategoryInputEvent implements CategoryInputEvent {
  const factory _ChangeTitleCategoryInputEvent({required final String title}) =
      _$ChangeTitleCategoryInputEventImpl;

  String get title;

  /// Create a copy of CategoryInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeTitleCategoryInputEventImplCopyWith<
          _$ChangeTitleCategoryInputEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeBudgetCategoryInputEventImplCopyWith<$Res> {
  factory _$$ChangeBudgetCategoryInputEventImplCopyWith(
          _$ChangeBudgetCategoryInputEventImpl value,
          $Res Function(_$ChangeBudgetCategoryInputEventImpl) then) =
      __$$ChangeBudgetCategoryInputEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int budget});
}

/// @nodoc
class __$$ChangeBudgetCategoryInputEventImplCopyWithImpl<$Res>
    extends _$CategoryInputEventCopyWithImpl<$Res,
        _$ChangeBudgetCategoryInputEventImpl>
    implements _$$ChangeBudgetCategoryInputEventImplCopyWith<$Res> {
  __$$ChangeBudgetCategoryInputEventImplCopyWithImpl(
      _$ChangeBudgetCategoryInputEventImpl _value,
      $Res Function(_$ChangeBudgetCategoryInputEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? budget = null,
  }) {
    return _then(_$ChangeBudgetCategoryInputEventImpl(
      budget: null == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ChangeBudgetCategoryInputEventImpl
    implements _ChangeBudgetCategoryInputEvent {
  const _$ChangeBudgetCategoryInputEventImpl({required this.budget});

  @override
  final int budget;

  @override
  String toString() {
    return 'CategoryInputEvent.changeBudget(budget: $budget)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeBudgetCategoryInputEventImpl &&
            (identical(other.budget, budget) || other.budget == budget));
  }

  @override
  int get hashCode => Object.hash(runtimeType, budget);

  /// Create a copy of CategoryInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeBudgetCategoryInputEventImplCopyWith<
          _$ChangeBudgetCategoryInputEventImpl>
      get copyWith => __$$ChangeBudgetCategoryInputEventImplCopyWithImpl<
          _$ChangeBudgetCategoryInputEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CategoryType type, bool isGroup) initByType,
    required TResult Function(int categoryId) initById,
    required TResult Function(String title) changeTitle,
    required TResult Function(int budget) changeBudget,
    required TResult Function(BudgetType budgetType) changeBudgetType,
    required TResult Function(int? parentId) changeParent,
    required TResult Function() save,
  }) {
    return changeBudget(budget);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CategoryType type, bool isGroup)? initByType,
    TResult? Function(int categoryId)? initById,
    TResult? Function(String title)? changeTitle,
    TResult? Function(int budget)? changeBudget,
    TResult? Function(BudgetType budgetType)? changeBudgetType,
    TResult? Function(int? parentId)? changeParent,
    TResult? Function()? save,
  }) {
    return changeBudget?.call(budget);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CategoryType type, bool isGroup)? initByType,
    TResult Function(int categoryId)? initById,
    TResult Function(String title)? changeTitle,
    TResult Function(int budget)? changeBudget,
    TResult Function(BudgetType budgetType)? changeBudgetType,
    TResult Function(int? parentId)? changeParent,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (changeBudget != null) {
      return changeBudget(budget);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitByTypeCategoryInputEvent value) initByType,
    required TResult Function(_InitByIdCategoryInputEvent value) initById,
    required TResult Function(_ChangeTitleCategoryInputEvent value) changeTitle,
    required TResult Function(_ChangeBudgetCategoryInputEvent value)
        changeBudget,
    required TResult Function(_ChangeBudgetTypeCategoryInputEvent value)
        changeBudgetType,
    required TResult Function(_ChangeParentCategoryInputEvent value)
        changeParent,
    required TResult Function(_SaveCategoryInputEvent value) save,
  }) {
    return changeBudget(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitByTypeCategoryInputEvent value)? initByType,
    TResult? Function(_InitByIdCategoryInputEvent value)? initById,
    TResult? Function(_ChangeTitleCategoryInputEvent value)? changeTitle,
    TResult? Function(_ChangeBudgetCategoryInputEvent value)? changeBudget,
    TResult? Function(_ChangeBudgetTypeCategoryInputEvent value)?
        changeBudgetType,
    TResult? Function(_ChangeParentCategoryInputEvent value)? changeParent,
    TResult? Function(_SaveCategoryInputEvent value)? save,
  }) {
    return changeBudget?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitByTypeCategoryInputEvent value)? initByType,
    TResult Function(_InitByIdCategoryInputEvent value)? initById,
    TResult Function(_ChangeTitleCategoryInputEvent value)? changeTitle,
    TResult Function(_ChangeBudgetCategoryInputEvent value)? changeBudget,
    TResult Function(_ChangeBudgetTypeCategoryInputEvent value)?
        changeBudgetType,
    TResult Function(_ChangeParentCategoryInputEvent value)? changeParent,
    TResult Function(_SaveCategoryInputEvent value)? save,
    required TResult orElse(),
  }) {
    if (changeBudget != null) {
      return changeBudget(this);
    }
    return orElse();
  }
}

abstract class _ChangeBudgetCategoryInputEvent implements CategoryInputEvent {
  const factory _ChangeBudgetCategoryInputEvent({required final int budget}) =
      _$ChangeBudgetCategoryInputEventImpl;

  int get budget;

  /// Create a copy of CategoryInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeBudgetCategoryInputEventImplCopyWith<
          _$ChangeBudgetCategoryInputEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeBudgetTypeCategoryInputEventImplCopyWith<$Res> {
  factory _$$ChangeBudgetTypeCategoryInputEventImplCopyWith(
          _$ChangeBudgetTypeCategoryInputEventImpl value,
          $Res Function(_$ChangeBudgetTypeCategoryInputEventImpl) then) =
      __$$ChangeBudgetTypeCategoryInputEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BudgetType budgetType});
}

/// @nodoc
class __$$ChangeBudgetTypeCategoryInputEventImplCopyWithImpl<$Res>
    extends _$CategoryInputEventCopyWithImpl<$Res,
        _$ChangeBudgetTypeCategoryInputEventImpl>
    implements _$$ChangeBudgetTypeCategoryInputEventImplCopyWith<$Res> {
  __$$ChangeBudgetTypeCategoryInputEventImplCopyWithImpl(
      _$ChangeBudgetTypeCategoryInputEventImpl _value,
      $Res Function(_$ChangeBudgetTypeCategoryInputEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? budgetType = null,
  }) {
    return _then(_$ChangeBudgetTypeCategoryInputEventImpl(
      budgetType: null == budgetType
          ? _value.budgetType
          : budgetType // ignore: cast_nullable_to_non_nullable
              as BudgetType,
    ));
  }
}

/// @nodoc

class _$ChangeBudgetTypeCategoryInputEventImpl
    implements _ChangeBudgetTypeCategoryInputEvent {
  const _$ChangeBudgetTypeCategoryInputEventImpl({required this.budgetType});

  @override
  final BudgetType budgetType;

  @override
  String toString() {
    return 'CategoryInputEvent.changeBudgetType(budgetType: $budgetType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeBudgetTypeCategoryInputEventImpl &&
            (identical(other.budgetType, budgetType) ||
                other.budgetType == budgetType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, budgetType);

  /// Create a copy of CategoryInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeBudgetTypeCategoryInputEventImplCopyWith<
          _$ChangeBudgetTypeCategoryInputEventImpl>
      get copyWith => __$$ChangeBudgetTypeCategoryInputEventImplCopyWithImpl<
          _$ChangeBudgetTypeCategoryInputEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CategoryType type, bool isGroup) initByType,
    required TResult Function(int categoryId) initById,
    required TResult Function(String title) changeTitle,
    required TResult Function(int budget) changeBudget,
    required TResult Function(BudgetType budgetType) changeBudgetType,
    required TResult Function(int? parentId) changeParent,
    required TResult Function() save,
  }) {
    return changeBudgetType(budgetType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CategoryType type, bool isGroup)? initByType,
    TResult? Function(int categoryId)? initById,
    TResult? Function(String title)? changeTitle,
    TResult? Function(int budget)? changeBudget,
    TResult? Function(BudgetType budgetType)? changeBudgetType,
    TResult? Function(int? parentId)? changeParent,
    TResult? Function()? save,
  }) {
    return changeBudgetType?.call(budgetType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CategoryType type, bool isGroup)? initByType,
    TResult Function(int categoryId)? initById,
    TResult Function(String title)? changeTitle,
    TResult Function(int budget)? changeBudget,
    TResult Function(BudgetType budgetType)? changeBudgetType,
    TResult Function(int? parentId)? changeParent,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (changeBudgetType != null) {
      return changeBudgetType(budgetType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitByTypeCategoryInputEvent value) initByType,
    required TResult Function(_InitByIdCategoryInputEvent value) initById,
    required TResult Function(_ChangeTitleCategoryInputEvent value) changeTitle,
    required TResult Function(_ChangeBudgetCategoryInputEvent value)
        changeBudget,
    required TResult Function(_ChangeBudgetTypeCategoryInputEvent value)
        changeBudgetType,
    required TResult Function(_ChangeParentCategoryInputEvent value)
        changeParent,
    required TResult Function(_SaveCategoryInputEvent value) save,
  }) {
    return changeBudgetType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitByTypeCategoryInputEvent value)? initByType,
    TResult? Function(_InitByIdCategoryInputEvent value)? initById,
    TResult? Function(_ChangeTitleCategoryInputEvent value)? changeTitle,
    TResult? Function(_ChangeBudgetCategoryInputEvent value)? changeBudget,
    TResult? Function(_ChangeBudgetTypeCategoryInputEvent value)?
        changeBudgetType,
    TResult? Function(_ChangeParentCategoryInputEvent value)? changeParent,
    TResult? Function(_SaveCategoryInputEvent value)? save,
  }) {
    return changeBudgetType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitByTypeCategoryInputEvent value)? initByType,
    TResult Function(_InitByIdCategoryInputEvent value)? initById,
    TResult Function(_ChangeTitleCategoryInputEvent value)? changeTitle,
    TResult Function(_ChangeBudgetCategoryInputEvent value)? changeBudget,
    TResult Function(_ChangeBudgetTypeCategoryInputEvent value)?
        changeBudgetType,
    TResult Function(_ChangeParentCategoryInputEvent value)? changeParent,
    TResult Function(_SaveCategoryInputEvent value)? save,
    required TResult orElse(),
  }) {
    if (changeBudgetType != null) {
      return changeBudgetType(this);
    }
    return orElse();
  }
}

abstract class _ChangeBudgetTypeCategoryInputEvent
    implements CategoryInputEvent {
  const factory _ChangeBudgetTypeCategoryInputEvent(
          {required final BudgetType budgetType}) =
      _$ChangeBudgetTypeCategoryInputEventImpl;

  BudgetType get budgetType;

  /// Create a copy of CategoryInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeBudgetTypeCategoryInputEventImplCopyWith<
          _$ChangeBudgetTypeCategoryInputEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeParentCategoryInputEventImplCopyWith<$Res> {
  factory _$$ChangeParentCategoryInputEventImplCopyWith(
          _$ChangeParentCategoryInputEventImpl value,
          $Res Function(_$ChangeParentCategoryInputEventImpl) then) =
      __$$ChangeParentCategoryInputEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? parentId});
}

/// @nodoc
class __$$ChangeParentCategoryInputEventImplCopyWithImpl<$Res>
    extends _$CategoryInputEventCopyWithImpl<$Res,
        _$ChangeParentCategoryInputEventImpl>
    implements _$$ChangeParentCategoryInputEventImplCopyWith<$Res> {
  __$$ChangeParentCategoryInputEventImplCopyWithImpl(
      _$ChangeParentCategoryInputEventImpl _value,
      $Res Function(_$ChangeParentCategoryInputEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parentId = freezed,
  }) {
    return _then(_$ChangeParentCategoryInputEventImpl(
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$ChangeParentCategoryInputEventImpl
    implements _ChangeParentCategoryInputEvent {
  const _$ChangeParentCategoryInputEventImpl({required this.parentId});

  @override
  final int? parentId;

  @override
  String toString() {
    return 'CategoryInputEvent.changeParent(parentId: $parentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeParentCategoryInputEventImpl &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, parentId);

  /// Create a copy of CategoryInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeParentCategoryInputEventImplCopyWith<
          _$ChangeParentCategoryInputEventImpl>
      get copyWith => __$$ChangeParentCategoryInputEventImplCopyWithImpl<
          _$ChangeParentCategoryInputEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CategoryType type, bool isGroup) initByType,
    required TResult Function(int categoryId) initById,
    required TResult Function(String title) changeTitle,
    required TResult Function(int budget) changeBudget,
    required TResult Function(BudgetType budgetType) changeBudgetType,
    required TResult Function(int? parentId) changeParent,
    required TResult Function() save,
  }) {
    return changeParent(parentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CategoryType type, bool isGroup)? initByType,
    TResult? Function(int categoryId)? initById,
    TResult? Function(String title)? changeTitle,
    TResult? Function(int budget)? changeBudget,
    TResult? Function(BudgetType budgetType)? changeBudgetType,
    TResult? Function(int? parentId)? changeParent,
    TResult? Function()? save,
  }) {
    return changeParent?.call(parentId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CategoryType type, bool isGroup)? initByType,
    TResult Function(int categoryId)? initById,
    TResult Function(String title)? changeTitle,
    TResult Function(int budget)? changeBudget,
    TResult Function(BudgetType budgetType)? changeBudgetType,
    TResult Function(int? parentId)? changeParent,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (changeParent != null) {
      return changeParent(parentId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitByTypeCategoryInputEvent value) initByType,
    required TResult Function(_InitByIdCategoryInputEvent value) initById,
    required TResult Function(_ChangeTitleCategoryInputEvent value) changeTitle,
    required TResult Function(_ChangeBudgetCategoryInputEvent value)
        changeBudget,
    required TResult Function(_ChangeBudgetTypeCategoryInputEvent value)
        changeBudgetType,
    required TResult Function(_ChangeParentCategoryInputEvent value)
        changeParent,
    required TResult Function(_SaveCategoryInputEvent value) save,
  }) {
    return changeParent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitByTypeCategoryInputEvent value)? initByType,
    TResult? Function(_InitByIdCategoryInputEvent value)? initById,
    TResult? Function(_ChangeTitleCategoryInputEvent value)? changeTitle,
    TResult? Function(_ChangeBudgetCategoryInputEvent value)? changeBudget,
    TResult? Function(_ChangeBudgetTypeCategoryInputEvent value)?
        changeBudgetType,
    TResult? Function(_ChangeParentCategoryInputEvent value)? changeParent,
    TResult? Function(_SaveCategoryInputEvent value)? save,
  }) {
    return changeParent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitByTypeCategoryInputEvent value)? initByType,
    TResult Function(_InitByIdCategoryInputEvent value)? initById,
    TResult Function(_ChangeTitleCategoryInputEvent value)? changeTitle,
    TResult Function(_ChangeBudgetCategoryInputEvent value)? changeBudget,
    TResult Function(_ChangeBudgetTypeCategoryInputEvent value)?
        changeBudgetType,
    TResult Function(_ChangeParentCategoryInputEvent value)? changeParent,
    TResult Function(_SaveCategoryInputEvent value)? save,
    required TResult orElse(),
  }) {
    if (changeParent != null) {
      return changeParent(this);
    }
    return orElse();
  }
}

abstract class _ChangeParentCategoryInputEvent implements CategoryInputEvent {
  const factory _ChangeParentCategoryInputEvent(
      {required final int? parentId}) = _$ChangeParentCategoryInputEventImpl;

  int? get parentId;

  /// Create a copy of CategoryInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeParentCategoryInputEventImplCopyWith<
          _$ChangeParentCategoryInputEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SaveCategoryInputEventImplCopyWith<$Res> {
  factory _$$SaveCategoryInputEventImplCopyWith(
          _$SaveCategoryInputEventImpl value,
          $Res Function(_$SaveCategoryInputEventImpl) then) =
      __$$SaveCategoryInputEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SaveCategoryInputEventImplCopyWithImpl<$Res>
    extends _$CategoryInputEventCopyWithImpl<$Res, _$SaveCategoryInputEventImpl>
    implements _$$SaveCategoryInputEventImplCopyWith<$Res> {
  __$$SaveCategoryInputEventImplCopyWithImpl(
      _$SaveCategoryInputEventImpl _value,
      $Res Function(_$SaveCategoryInputEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryInputEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SaveCategoryInputEventImpl implements _SaveCategoryInputEvent {
  const _$SaveCategoryInputEventImpl();

  @override
  String toString() {
    return 'CategoryInputEvent.save()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveCategoryInputEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CategoryType type, bool isGroup) initByType,
    required TResult Function(int categoryId) initById,
    required TResult Function(String title) changeTitle,
    required TResult Function(int budget) changeBudget,
    required TResult Function(BudgetType budgetType) changeBudgetType,
    required TResult Function(int? parentId) changeParent,
    required TResult Function() save,
  }) {
    return save();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CategoryType type, bool isGroup)? initByType,
    TResult? Function(int categoryId)? initById,
    TResult? Function(String title)? changeTitle,
    TResult? Function(int budget)? changeBudget,
    TResult? Function(BudgetType budgetType)? changeBudgetType,
    TResult? Function(int? parentId)? changeParent,
    TResult? Function()? save,
  }) {
    return save?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CategoryType type, bool isGroup)? initByType,
    TResult Function(int categoryId)? initById,
    TResult Function(String title)? changeTitle,
    TResult Function(int budget)? changeBudget,
    TResult Function(BudgetType budgetType)? changeBudgetType,
    TResult Function(int? parentId)? changeParent,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitByTypeCategoryInputEvent value) initByType,
    required TResult Function(_InitByIdCategoryInputEvent value) initById,
    required TResult Function(_ChangeTitleCategoryInputEvent value) changeTitle,
    required TResult Function(_ChangeBudgetCategoryInputEvent value)
        changeBudget,
    required TResult Function(_ChangeBudgetTypeCategoryInputEvent value)
        changeBudgetType,
    required TResult Function(_ChangeParentCategoryInputEvent value)
        changeParent,
    required TResult Function(_SaveCategoryInputEvent value) save,
  }) {
    return save(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitByTypeCategoryInputEvent value)? initByType,
    TResult? Function(_InitByIdCategoryInputEvent value)? initById,
    TResult? Function(_ChangeTitleCategoryInputEvent value)? changeTitle,
    TResult? Function(_ChangeBudgetCategoryInputEvent value)? changeBudget,
    TResult? Function(_ChangeBudgetTypeCategoryInputEvent value)?
        changeBudgetType,
    TResult? Function(_ChangeParentCategoryInputEvent value)? changeParent,
    TResult? Function(_SaveCategoryInputEvent value)? save,
  }) {
    return save?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitByTypeCategoryInputEvent value)? initByType,
    TResult Function(_InitByIdCategoryInputEvent value)? initById,
    TResult Function(_ChangeTitleCategoryInputEvent value)? changeTitle,
    TResult Function(_ChangeBudgetCategoryInputEvent value)? changeBudget,
    TResult Function(_ChangeBudgetTypeCategoryInputEvent value)?
        changeBudgetType,
    TResult Function(_ChangeParentCategoryInputEvent value)? changeParent,
    TResult Function(_SaveCategoryInputEvent value)? save,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save(this);
    }
    return orElse();
  }
}

abstract class _SaveCategoryInputEvent implements CategoryInputEvent {
  const factory _SaveCategoryInputEvent() = _$SaveCategoryInputEventImpl;
}

/// @nodoc
mixin _$CategoryInputState {
  Category? get category => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  bool get isSaved => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            InputCategoryItem? category,
            BudgetType budgetType,
            String title,
            int budget,
            int? parent,
            bool isSaved)
        inputItem,
    required TResult Function(
            OutputCategoryItem? category,
            BudgetType budgetType,
            String title,
            int budget,
            int? parent,
            bool isSaved)
        outputItem,
    required TResult Function(
            InputCategoryGroup? category, String title, bool isSaved)
        inputGroup,
    required TResult Function(
            OutputCategoryGroup? category, String title, bool isSaved)
        outputGroup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InputCategoryItem? category, BudgetType budgetType,
            String title, int budget, int? parent, bool isSaved)?
        inputItem,
    TResult? Function(OutputCategoryItem? category, BudgetType budgetType,
            String title, int budget, int? parent, bool isSaved)?
        outputItem,
    TResult? Function(InputCategoryGroup? category, String title, bool isSaved)?
        inputGroup,
    TResult? Function(
            OutputCategoryGroup? category, String title, bool isSaved)?
        outputGroup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InputCategoryItem? category, BudgetType budgetType,
            String title, int budget, int? parent, bool isSaved)?
        inputItem,
    TResult Function(OutputCategoryItem? category, BudgetType budgetType,
            String title, int budget, int? parent, bool isSaved)?
        outputItem,
    TResult Function(InputCategoryGroup? category, String title, bool isSaved)?
        inputGroup,
    TResult Function(OutputCategoryGroup? category, String title, bool isSaved)?
        outputGroup,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InputItemCategoryInputState value) inputItem,
    required TResult Function(_OutputItemCategoryInputState value) outputItem,
    required TResult Function(_InputGroupCategoryInputState value) inputGroup,
    required TResult Function(_OutputGroupCategoryInputState value) outputGroup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InputItemCategoryInputState value)? inputItem,
    TResult? Function(_OutputItemCategoryInputState value)? outputItem,
    TResult? Function(_InputGroupCategoryInputState value)? inputGroup,
    TResult? Function(_OutputGroupCategoryInputState value)? outputGroup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InputItemCategoryInputState value)? inputItem,
    TResult Function(_OutputItemCategoryInputState value)? outputItem,
    TResult Function(_InputGroupCategoryInputState value)? inputGroup,
    TResult Function(_OutputGroupCategoryInputState value)? outputGroup,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of CategoryInputState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryInputStateCopyWith<CategoryInputState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryInputStateCopyWith<$Res> {
  factory $CategoryInputStateCopyWith(
          CategoryInputState value, $Res Function(CategoryInputState) then) =
      _$CategoryInputStateCopyWithImpl<$Res, CategoryInputState>;
  @useResult
  $Res call({String title, bool isSaved});
}

/// @nodoc
class _$CategoryInputStateCopyWithImpl<$Res, $Val extends CategoryInputState>
    implements $CategoryInputStateCopyWith<$Res> {
  _$CategoryInputStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryInputState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? isSaved = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isSaved: null == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InputItemCategoryInputStateImplCopyWith<$Res>
    implements $CategoryInputStateCopyWith<$Res> {
  factory _$$InputItemCategoryInputStateImplCopyWith(
          _$InputItemCategoryInputStateImpl value,
          $Res Function(_$InputItemCategoryInputStateImpl) then) =
      __$$InputItemCategoryInputStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {InputCategoryItem? category,
      BudgetType budgetType,
      String title,
      int budget,
      int? parent,
      bool isSaved});
}

/// @nodoc
class __$$InputItemCategoryInputStateImplCopyWithImpl<$Res>
    extends _$CategoryInputStateCopyWithImpl<$Res,
        _$InputItemCategoryInputStateImpl>
    implements _$$InputItemCategoryInputStateImplCopyWith<$Res> {
  __$$InputItemCategoryInputStateImplCopyWithImpl(
      _$InputItemCategoryInputStateImpl _value,
      $Res Function(_$InputItemCategoryInputStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryInputState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
    Object? budgetType = null,
    Object? title = null,
    Object? budget = null,
    Object? parent = freezed,
    Object? isSaved = null,
  }) {
    return _then(_$InputItemCategoryInputStateImpl(
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as InputCategoryItem?,
      budgetType: null == budgetType
          ? _value.budgetType
          : budgetType // ignore: cast_nullable_to_non_nullable
              as BudgetType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      budget: null == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as int,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as int?,
      isSaved: null == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InputItemCategoryInputStateImpl extends _InputItemCategoryInputState {
  const _$InputItemCategoryInputStateImpl(
      {this.category,
      required this.budgetType,
      required this.title,
      required this.budget,
      required this.parent,
      required this.isSaved})
      : super._();

  @override
  final InputCategoryItem? category;
  @override
  final BudgetType budgetType;
  @override
  final String title;
  @override
  final int budget;
  @override
  final int? parent;
  @override
  final bool isSaved;

  @override
  String toString() {
    return 'CategoryInputState.inputItem(category: $category, budgetType: $budgetType, title: $title, budget: $budget, parent: $parent, isSaved: $isSaved)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InputItemCategoryInputStateImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.budgetType, budgetType) ||
                other.budgetType == budgetType) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.budget, budget) || other.budget == budget) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, category, budgetType, title, budget, parent, isSaved);

  /// Create a copy of CategoryInputState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InputItemCategoryInputStateImplCopyWith<_$InputItemCategoryInputStateImpl>
      get copyWith => __$$InputItemCategoryInputStateImplCopyWithImpl<
          _$InputItemCategoryInputStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            InputCategoryItem? category,
            BudgetType budgetType,
            String title,
            int budget,
            int? parent,
            bool isSaved)
        inputItem,
    required TResult Function(
            OutputCategoryItem? category,
            BudgetType budgetType,
            String title,
            int budget,
            int? parent,
            bool isSaved)
        outputItem,
    required TResult Function(
            InputCategoryGroup? category, String title, bool isSaved)
        inputGroup,
    required TResult Function(
            OutputCategoryGroup? category, String title, bool isSaved)
        outputGroup,
  }) {
    return inputItem(category, budgetType, title, budget, parent, isSaved);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InputCategoryItem? category, BudgetType budgetType,
            String title, int budget, int? parent, bool isSaved)?
        inputItem,
    TResult? Function(OutputCategoryItem? category, BudgetType budgetType,
            String title, int budget, int? parent, bool isSaved)?
        outputItem,
    TResult? Function(InputCategoryGroup? category, String title, bool isSaved)?
        inputGroup,
    TResult? Function(
            OutputCategoryGroup? category, String title, bool isSaved)?
        outputGroup,
  }) {
    return inputItem?.call(
        category, budgetType, title, budget, parent, isSaved);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InputCategoryItem? category, BudgetType budgetType,
            String title, int budget, int? parent, bool isSaved)?
        inputItem,
    TResult Function(OutputCategoryItem? category, BudgetType budgetType,
            String title, int budget, int? parent, bool isSaved)?
        outputItem,
    TResult Function(InputCategoryGroup? category, String title, bool isSaved)?
        inputGroup,
    TResult Function(OutputCategoryGroup? category, String title, bool isSaved)?
        outputGroup,
    required TResult orElse(),
  }) {
    if (inputItem != null) {
      return inputItem(category, budgetType, title, budget, parent, isSaved);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InputItemCategoryInputState value) inputItem,
    required TResult Function(_OutputItemCategoryInputState value) outputItem,
    required TResult Function(_InputGroupCategoryInputState value) inputGroup,
    required TResult Function(_OutputGroupCategoryInputState value) outputGroup,
  }) {
    return inputItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InputItemCategoryInputState value)? inputItem,
    TResult? Function(_OutputItemCategoryInputState value)? outputItem,
    TResult? Function(_InputGroupCategoryInputState value)? inputGroup,
    TResult? Function(_OutputGroupCategoryInputState value)? outputGroup,
  }) {
    return inputItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InputItemCategoryInputState value)? inputItem,
    TResult Function(_OutputItemCategoryInputState value)? outputItem,
    TResult Function(_InputGroupCategoryInputState value)? inputGroup,
    TResult Function(_OutputGroupCategoryInputState value)? outputGroup,
    required TResult orElse(),
  }) {
    if (inputItem != null) {
      return inputItem(this);
    }
    return orElse();
  }
}

abstract class _InputItemCategoryInputState extends CategoryInputState {
  const factory _InputItemCategoryInputState(
      {final InputCategoryItem? category,
      required final BudgetType budgetType,
      required final String title,
      required final int budget,
      required final int? parent,
      required final bool isSaved}) = _$InputItemCategoryInputStateImpl;
  const _InputItemCategoryInputState._() : super._();

  @override
  InputCategoryItem? get category;
  BudgetType get budgetType;
  @override
  String get title;
  int get budget;
  int? get parent;
  @override
  bool get isSaved;

  /// Create a copy of CategoryInputState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InputItemCategoryInputStateImplCopyWith<_$InputItemCategoryInputStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OutputItemCategoryInputStateImplCopyWith<$Res>
    implements $CategoryInputStateCopyWith<$Res> {
  factory _$$OutputItemCategoryInputStateImplCopyWith(
          _$OutputItemCategoryInputStateImpl value,
          $Res Function(_$OutputItemCategoryInputStateImpl) then) =
      __$$OutputItemCategoryInputStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {OutputCategoryItem? category,
      BudgetType budgetType,
      String title,
      int budget,
      int? parent,
      bool isSaved});
}

/// @nodoc
class __$$OutputItemCategoryInputStateImplCopyWithImpl<$Res>
    extends _$CategoryInputStateCopyWithImpl<$Res,
        _$OutputItemCategoryInputStateImpl>
    implements _$$OutputItemCategoryInputStateImplCopyWith<$Res> {
  __$$OutputItemCategoryInputStateImplCopyWithImpl(
      _$OutputItemCategoryInputStateImpl _value,
      $Res Function(_$OutputItemCategoryInputStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryInputState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
    Object? budgetType = null,
    Object? title = null,
    Object? budget = null,
    Object? parent = freezed,
    Object? isSaved = null,
  }) {
    return _then(_$OutputItemCategoryInputStateImpl(
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as OutputCategoryItem?,
      budgetType: null == budgetType
          ? _value.budgetType
          : budgetType // ignore: cast_nullable_to_non_nullable
              as BudgetType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      budget: null == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as int,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as int?,
      isSaved: null == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$OutputItemCategoryInputStateImpl extends _OutputItemCategoryInputState {
  const _$OutputItemCategoryInputStateImpl(
      {this.category,
      required this.budgetType,
      required this.title,
      required this.budget,
      required this.parent,
      required this.isSaved})
      : super._();

  @override
  final OutputCategoryItem? category;
  @override
  final BudgetType budgetType;
  @override
  final String title;
  @override
  final int budget;
  @override
  final int? parent;
  @override
  final bool isSaved;

  @override
  String toString() {
    return 'CategoryInputState.outputItem(category: $category, budgetType: $budgetType, title: $title, budget: $budget, parent: $parent, isSaved: $isSaved)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutputItemCategoryInputStateImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.budgetType, budgetType) ||
                other.budgetType == budgetType) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.budget, budget) || other.budget == budget) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, category, budgetType, title, budget, parent, isSaved);

  /// Create a copy of CategoryInputState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OutputItemCategoryInputStateImplCopyWith<
          _$OutputItemCategoryInputStateImpl>
      get copyWith => __$$OutputItemCategoryInputStateImplCopyWithImpl<
          _$OutputItemCategoryInputStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            InputCategoryItem? category,
            BudgetType budgetType,
            String title,
            int budget,
            int? parent,
            bool isSaved)
        inputItem,
    required TResult Function(
            OutputCategoryItem? category,
            BudgetType budgetType,
            String title,
            int budget,
            int? parent,
            bool isSaved)
        outputItem,
    required TResult Function(
            InputCategoryGroup? category, String title, bool isSaved)
        inputGroup,
    required TResult Function(
            OutputCategoryGroup? category, String title, bool isSaved)
        outputGroup,
  }) {
    return outputItem(category, budgetType, title, budget, parent, isSaved);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InputCategoryItem? category, BudgetType budgetType,
            String title, int budget, int? parent, bool isSaved)?
        inputItem,
    TResult? Function(OutputCategoryItem? category, BudgetType budgetType,
            String title, int budget, int? parent, bool isSaved)?
        outputItem,
    TResult? Function(InputCategoryGroup? category, String title, bool isSaved)?
        inputGroup,
    TResult? Function(
            OutputCategoryGroup? category, String title, bool isSaved)?
        outputGroup,
  }) {
    return outputItem?.call(
        category, budgetType, title, budget, parent, isSaved);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InputCategoryItem? category, BudgetType budgetType,
            String title, int budget, int? parent, bool isSaved)?
        inputItem,
    TResult Function(OutputCategoryItem? category, BudgetType budgetType,
            String title, int budget, int? parent, bool isSaved)?
        outputItem,
    TResult Function(InputCategoryGroup? category, String title, bool isSaved)?
        inputGroup,
    TResult Function(OutputCategoryGroup? category, String title, bool isSaved)?
        outputGroup,
    required TResult orElse(),
  }) {
    if (outputItem != null) {
      return outputItem(category, budgetType, title, budget, parent, isSaved);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InputItemCategoryInputState value) inputItem,
    required TResult Function(_OutputItemCategoryInputState value) outputItem,
    required TResult Function(_InputGroupCategoryInputState value) inputGroup,
    required TResult Function(_OutputGroupCategoryInputState value) outputGroup,
  }) {
    return outputItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InputItemCategoryInputState value)? inputItem,
    TResult? Function(_OutputItemCategoryInputState value)? outputItem,
    TResult? Function(_InputGroupCategoryInputState value)? inputGroup,
    TResult? Function(_OutputGroupCategoryInputState value)? outputGroup,
  }) {
    return outputItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InputItemCategoryInputState value)? inputItem,
    TResult Function(_OutputItemCategoryInputState value)? outputItem,
    TResult Function(_InputGroupCategoryInputState value)? inputGroup,
    TResult Function(_OutputGroupCategoryInputState value)? outputGroup,
    required TResult orElse(),
  }) {
    if (outputItem != null) {
      return outputItem(this);
    }
    return orElse();
  }
}

abstract class _OutputItemCategoryInputState extends CategoryInputState {
  const factory _OutputItemCategoryInputState(
      {final OutputCategoryItem? category,
      required final BudgetType budgetType,
      required final String title,
      required final int budget,
      required final int? parent,
      required final bool isSaved}) = _$OutputItemCategoryInputStateImpl;
  const _OutputItemCategoryInputState._() : super._();

  @override
  OutputCategoryItem? get category;
  BudgetType get budgetType;
  @override
  String get title;
  int get budget;
  int? get parent;
  @override
  bool get isSaved;

  /// Create a copy of CategoryInputState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OutputItemCategoryInputStateImplCopyWith<
          _$OutputItemCategoryInputStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InputGroupCategoryInputStateImplCopyWith<$Res>
    implements $CategoryInputStateCopyWith<$Res> {
  factory _$$InputGroupCategoryInputStateImplCopyWith(
          _$InputGroupCategoryInputStateImpl value,
          $Res Function(_$InputGroupCategoryInputStateImpl) then) =
      __$$InputGroupCategoryInputStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({InputCategoryGroup? category, String title, bool isSaved});
}

/// @nodoc
class __$$InputGroupCategoryInputStateImplCopyWithImpl<$Res>
    extends _$CategoryInputStateCopyWithImpl<$Res,
        _$InputGroupCategoryInputStateImpl>
    implements _$$InputGroupCategoryInputStateImplCopyWith<$Res> {
  __$$InputGroupCategoryInputStateImplCopyWithImpl(
      _$InputGroupCategoryInputStateImpl _value,
      $Res Function(_$InputGroupCategoryInputStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryInputState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
    Object? title = null,
    Object? isSaved = null,
  }) {
    return _then(_$InputGroupCategoryInputStateImpl(
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as InputCategoryGroup?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isSaved: null == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InputGroupCategoryInputStateImpl extends _InputGroupCategoryInputState {
  const _$InputGroupCategoryInputStateImpl(
      {this.category, required this.title, required this.isSaved})
      : super._();

  @override
  final InputCategoryGroup? category;
  @override
  final String title;
  @override
  final bool isSaved;

  @override
  String toString() {
    return 'CategoryInputState.inputGroup(category: $category, title: $title, isSaved: $isSaved)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InputGroupCategoryInputStateImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category, title, isSaved);

  /// Create a copy of CategoryInputState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InputGroupCategoryInputStateImplCopyWith<
          _$InputGroupCategoryInputStateImpl>
      get copyWith => __$$InputGroupCategoryInputStateImplCopyWithImpl<
          _$InputGroupCategoryInputStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            InputCategoryItem? category,
            BudgetType budgetType,
            String title,
            int budget,
            int? parent,
            bool isSaved)
        inputItem,
    required TResult Function(
            OutputCategoryItem? category,
            BudgetType budgetType,
            String title,
            int budget,
            int? parent,
            bool isSaved)
        outputItem,
    required TResult Function(
            InputCategoryGroup? category, String title, bool isSaved)
        inputGroup,
    required TResult Function(
            OutputCategoryGroup? category, String title, bool isSaved)
        outputGroup,
  }) {
    return inputGroup(category, title, isSaved);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InputCategoryItem? category, BudgetType budgetType,
            String title, int budget, int? parent, bool isSaved)?
        inputItem,
    TResult? Function(OutputCategoryItem? category, BudgetType budgetType,
            String title, int budget, int? parent, bool isSaved)?
        outputItem,
    TResult? Function(InputCategoryGroup? category, String title, bool isSaved)?
        inputGroup,
    TResult? Function(
            OutputCategoryGroup? category, String title, bool isSaved)?
        outputGroup,
  }) {
    return inputGroup?.call(category, title, isSaved);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InputCategoryItem? category, BudgetType budgetType,
            String title, int budget, int? parent, bool isSaved)?
        inputItem,
    TResult Function(OutputCategoryItem? category, BudgetType budgetType,
            String title, int budget, int? parent, bool isSaved)?
        outputItem,
    TResult Function(InputCategoryGroup? category, String title, bool isSaved)?
        inputGroup,
    TResult Function(OutputCategoryGroup? category, String title, bool isSaved)?
        outputGroup,
    required TResult orElse(),
  }) {
    if (inputGroup != null) {
      return inputGroup(category, title, isSaved);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InputItemCategoryInputState value) inputItem,
    required TResult Function(_OutputItemCategoryInputState value) outputItem,
    required TResult Function(_InputGroupCategoryInputState value) inputGroup,
    required TResult Function(_OutputGroupCategoryInputState value) outputGroup,
  }) {
    return inputGroup(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InputItemCategoryInputState value)? inputItem,
    TResult? Function(_OutputItemCategoryInputState value)? outputItem,
    TResult? Function(_InputGroupCategoryInputState value)? inputGroup,
    TResult? Function(_OutputGroupCategoryInputState value)? outputGroup,
  }) {
    return inputGroup?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InputItemCategoryInputState value)? inputItem,
    TResult Function(_OutputItemCategoryInputState value)? outputItem,
    TResult Function(_InputGroupCategoryInputState value)? inputGroup,
    TResult Function(_OutputGroupCategoryInputState value)? outputGroup,
    required TResult orElse(),
  }) {
    if (inputGroup != null) {
      return inputGroup(this);
    }
    return orElse();
  }
}

abstract class _InputGroupCategoryInputState extends CategoryInputState {
  const factory _InputGroupCategoryInputState(
      {final InputCategoryGroup? category,
      required final String title,
      required final bool isSaved}) = _$InputGroupCategoryInputStateImpl;
  const _InputGroupCategoryInputState._() : super._();

  @override
  InputCategoryGroup? get category;
  @override
  String get title;
  @override
  bool get isSaved;

  /// Create a copy of CategoryInputState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InputGroupCategoryInputStateImplCopyWith<
          _$InputGroupCategoryInputStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OutputGroupCategoryInputStateImplCopyWith<$Res>
    implements $CategoryInputStateCopyWith<$Res> {
  factory _$$OutputGroupCategoryInputStateImplCopyWith(
          _$OutputGroupCategoryInputStateImpl value,
          $Res Function(_$OutputGroupCategoryInputStateImpl) then) =
      __$$OutputGroupCategoryInputStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OutputCategoryGroup? category, String title, bool isSaved});
}

/// @nodoc
class __$$OutputGroupCategoryInputStateImplCopyWithImpl<$Res>
    extends _$CategoryInputStateCopyWithImpl<$Res,
        _$OutputGroupCategoryInputStateImpl>
    implements _$$OutputGroupCategoryInputStateImplCopyWith<$Res> {
  __$$OutputGroupCategoryInputStateImplCopyWithImpl(
      _$OutputGroupCategoryInputStateImpl _value,
      $Res Function(_$OutputGroupCategoryInputStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryInputState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
    Object? title = null,
    Object? isSaved = null,
  }) {
    return _then(_$OutputGroupCategoryInputStateImpl(
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as OutputCategoryGroup?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isSaved: null == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$OutputGroupCategoryInputStateImpl
    extends _OutputGroupCategoryInputState {
  const _$OutputGroupCategoryInputStateImpl(
      {this.category, required this.title, required this.isSaved})
      : super._();

  @override
  final OutputCategoryGroup? category;
  @override
  final String title;
  @override
  final bool isSaved;

  @override
  String toString() {
    return 'CategoryInputState.outputGroup(category: $category, title: $title, isSaved: $isSaved)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutputGroupCategoryInputStateImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category, title, isSaved);

  /// Create a copy of CategoryInputState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OutputGroupCategoryInputStateImplCopyWith<
          _$OutputGroupCategoryInputStateImpl>
      get copyWith => __$$OutputGroupCategoryInputStateImplCopyWithImpl<
          _$OutputGroupCategoryInputStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            InputCategoryItem? category,
            BudgetType budgetType,
            String title,
            int budget,
            int? parent,
            bool isSaved)
        inputItem,
    required TResult Function(
            OutputCategoryItem? category,
            BudgetType budgetType,
            String title,
            int budget,
            int? parent,
            bool isSaved)
        outputItem,
    required TResult Function(
            InputCategoryGroup? category, String title, bool isSaved)
        inputGroup,
    required TResult Function(
            OutputCategoryGroup? category, String title, bool isSaved)
        outputGroup,
  }) {
    return outputGroup(category, title, isSaved);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InputCategoryItem? category, BudgetType budgetType,
            String title, int budget, int? parent, bool isSaved)?
        inputItem,
    TResult? Function(OutputCategoryItem? category, BudgetType budgetType,
            String title, int budget, int? parent, bool isSaved)?
        outputItem,
    TResult? Function(InputCategoryGroup? category, String title, bool isSaved)?
        inputGroup,
    TResult? Function(
            OutputCategoryGroup? category, String title, bool isSaved)?
        outputGroup,
  }) {
    return outputGroup?.call(category, title, isSaved);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InputCategoryItem? category, BudgetType budgetType,
            String title, int budget, int? parent, bool isSaved)?
        inputItem,
    TResult Function(OutputCategoryItem? category, BudgetType budgetType,
            String title, int budget, int? parent, bool isSaved)?
        outputItem,
    TResult Function(InputCategoryGroup? category, String title, bool isSaved)?
        inputGroup,
    TResult Function(OutputCategoryGroup? category, String title, bool isSaved)?
        outputGroup,
    required TResult orElse(),
  }) {
    if (outputGroup != null) {
      return outputGroup(category, title, isSaved);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InputItemCategoryInputState value) inputItem,
    required TResult Function(_OutputItemCategoryInputState value) outputItem,
    required TResult Function(_InputGroupCategoryInputState value) inputGroup,
    required TResult Function(_OutputGroupCategoryInputState value) outputGroup,
  }) {
    return outputGroup(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InputItemCategoryInputState value)? inputItem,
    TResult? Function(_OutputItemCategoryInputState value)? outputItem,
    TResult? Function(_InputGroupCategoryInputState value)? inputGroup,
    TResult? Function(_OutputGroupCategoryInputState value)? outputGroup,
  }) {
    return outputGroup?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InputItemCategoryInputState value)? inputItem,
    TResult Function(_OutputItemCategoryInputState value)? outputItem,
    TResult Function(_InputGroupCategoryInputState value)? inputGroup,
    TResult Function(_OutputGroupCategoryInputState value)? outputGroup,
    required TResult orElse(),
  }) {
    if (outputGroup != null) {
      return outputGroup(this);
    }
    return orElse();
  }
}

abstract class _OutputGroupCategoryInputState extends CategoryInputState {
  const factory _OutputGroupCategoryInputState(
      {final OutputCategoryGroup? category,
      required final String title,
      required final bool isSaved}) = _$OutputGroupCategoryInputStateImpl;
  const _OutputGroupCategoryInputState._() : super._();

  @override
  OutputCategoryGroup? get category;
  @override
  String get title;
  @override
  bool get isSaved;

  /// Create a copy of CategoryInputState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OutputGroupCategoryInputStateImplCopyWith<
          _$OutputGroupCategoryInputStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
