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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CategoryInputEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OperationType operationType) initByType,
    required TResult Function(int categoryId) initById,
    required TResult Function(String title) changeTitle,
    required TResult Function(int budget) changeBudget,
    required TResult Function(BudgetType budgetType) changeBudgetType,
    required TResult Function() save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OperationType operationType)? initByType,
    TResult? Function(int categoryId)? initById,
    TResult? Function(String title)? changeTitle,
    TResult? Function(int budget)? changeBudget,
    TResult? Function(BudgetType budgetType)? changeBudgetType,
    TResult? Function()? save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OperationType operationType)? initByType,
    TResult Function(int categoryId)? initById,
    TResult Function(String title)? changeTitle,
    TResult Function(int budget)? changeBudget,
    TResult Function(BudgetType budgetType)? changeBudgetType,
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
}

/// @nodoc
abstract class _$$_InitByTypeCategoryInputEventCopyWith<$Res> {
  factory _$$_InitByTypeCategoryInputEventCopyWith(
          _$_InitByTypeCategoryInputEvent value,
          $Res Function(_$_InitByTypeCategoryInputEvent) then) =
      __$$_InitByTypeCategoryInputEventCopyWithImpl<$Res>;
  @useResult
  $Res call({OperationType operationType});
}

/// @nodoc
class __$$_InitByTypeCategoryInputEventCopyWithImpl<$Res>
    extends _$CategoryInputEventCopyWithImpl<$Res,
        _$_InitByTypeCategoryInputEvent>
    implements _$$_InitByTypeCategoryInputEventCopyWith<$Res> {
  __$$_InitByTypeCategoryInputEventCopyWithImpl(
      _$_InitByTypeCategoryInputEvent _value,
      $Res Function(_$_InitByTypeCategoryInputEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operationType = null,
  }) {
    return _then(_$_InitByTypeCategoryInputEvent(
      operationType: null == operationType
          ? _value.operationType
          : operationType // ignore: cast_nullable_to_non_nullable
              as OperationType,
    ));
  }
}

/// @nodoc

class _$_InitByTypeCategoryInputEvent implements _InitByTypeCategoryInputEvent {
  const _$_InitByTypeCategoryInputEvent({required this.operationType});

  @override
  final OperationType operationType;

  @override
  String toString() {
    return 'CategoryInputEvent.initByType(operationType: $operationType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InitByTypeCategoryInputEvent &&
            (identical(other.operationType, operationType) ||
                other.operationType == operationType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, operationType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitByTypeCategoryInputEventCopyWith<_$_InitByTypeCategoryInputEvent>
      get copyWith => __$$_InitByTypeCategoryInputEventCopyWithImpl<
          _$_InitByTypeCategoryInputEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OperationType operationType) initByType,
    required TResult Function(int categoryId) initById,
    required TResult Function(String title) changeTitle,
    required TResult Function(int budget) changeBudget,
    required TResult Function(BudgetType budgetType) changeBudgetType,
    required TResult Function() save,
  }) {
    return initByType(operationType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OperationType operationType)? initByType,
    TResult? Function(int categoryId)? initById,
    TResult? Function(String title)? changeTitle,
    TResult? Function(int budget)? changeBudget,
    TResult? Function(BudgetType budgetType)? changeBudgetType,
    TResult? Function()? save,
  }) {
    return initByType?.call(operationType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OperationType operationType)? initByType,
    TResult Function(int categoryId)? initById,
    TResult Function(String title)? changeTitle,
    TResult Function(int budget)? changeBudget,
    TResult Function(BudgetType budgetType)? changeBudgetType,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (initByType != null) {
      return initByType(operationType);
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
          {required final OperationType operationType}) =
      _$_InitByTypeCategoryInputEvent;

  OperationType get operationType;
  @JsonKey(ignore: true)
  _$$_InitByTypeCategoryInputEventCopyWith<_$_InitByTypeCategoryInputEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_InitByIdCategoryInputEventCopyWith<$Res> {
  factory _$$_InitByIdCategoryInputEventCopyWith(
          _$_InitByIdCategoryInputEvent value,
          $Res Function(_$_InitByIdCategoryInputEvent) then) =
      __$$_InitByIdCategoryInputEventCopyWithImpl<$Res>;
  @useResult
  $Res call({int categoryId});
}

/// @nodoc
class __$$_InitByIdCategoryInputEventCopyWithImpl<$Res>
    extends _$CategoryInputEventCopyWithImpl<$Res,
        _$_InitByIdCategoryInputEvent>
    implements _$$_InitByIdCategoryInputEventCopyWith<$Res> {
  __$$_InitByIdCategoryInputEventCopyWithImpl(
      _$_InitByIdCategoryInputEvent _value,
      $Res Function(_$_InitByIdCategoryInputEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
  }) {
    return _then(_$_InitByIdCategoryInputEvent(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_InitByIdCategoryInputEvent implements _InitByIdCategoryInputEvent {
  const _$_InitByIdCategoryInputEvent({required this.categoryId});

  @override
  final int categoryId;

  @override
  String toString() {
    return 'CategoryInputEvent.initById(categoryId: $categoryId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InitByIdCategoryInputEvent &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitByIdCategoryInputEventCopyWith<_$_InitByIdCategoryInputEvent>
      get copyWith => __$$_InitByIdCategoryInputEventCopyWithImpl<
          _$_InitByIdCategoryInputEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OperationType operationType) initByType,
    required TResult Function(int categoryId) initById,
    required TResult Function(String title) changeTitle,
    required TResult Function(int budget) changeBudget,
    required TResult Function(BudgetType budgetType) changeBudgetType,
    required TResult Function() save,
  }) {
    return initById(categoryId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OperationType operationType)? initByType,
    TResult? Function(int categoryId)? initById,
    TResult? Function(String title)? changeTitle,
    TResult? Function(int budget)? changeBudget,
    TResult? Function(BudgetType budgetType)? changeBudgetType,
    TResult? Function()? save,
  }) {
    return initById?.call(categoryId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OperationType operationType)? initByType,
    TResult Function(int categoryId)? initById,
    TResult Function(String title)? changeTitle,
    TResult Function(int budget)? changeBudget,
    TResult Function(BudgetType budgetType)? changeBudgetType,
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
      _$_InitByIdCategoryInputEvent;

  int get categoryId;
  @JsonKey(ignore: true)
  _$$_InitByIdCategoryInputEventCopyWith<_$_InitByIdCategoryInputEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeTitleCategoryInputEventCopyWith<$Res> {
  factory _$$_ChangeTitleCategoryInputEventCopyWith(
          _$_ChangeTitleCategoryInputEvent value,
          $Res Function(_$_ChangeTitleCategoryInputEvent) then) =
      __$$_ChangeTitleCategoryInputEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String title});
}

/// @nodoc
class __$$_ChangeTitleCategoryInputEventCopyWithImpl<$Res>
    extends _$CategoryInputEventCopyWithImpl<$Res,
        _$_ChangeTitleCategoryInputEvent>
    implements _$$_ChangeTitleCategoryInputEventCopyWith<$Res> {
  __$$_ChangeTitleCategoryInputEventCopyWithImpl(
      _$_ChangeTitleCategoryInputEvent _value,
      $Res Function(_$_ChangeTitleCategoryInputEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
  }) {
    return _then(_$_ChangeTitleCategoryInputEvent(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ChangeTitleCategoryInputEvent
    implements _ChangeTitleCategoryInputEvent {
  const _$_ChangeTitleCategoryInputEvent({required this.title});

  @override
  final String title;

  @override
  String toString() {
    return 'CategoryInputEvent.changeTitle(title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeTitleCategoryInputEvent &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeTitleCategoryInputEventCopyWith<_$_ChangeTitleCategoryInputEvent>
      get copyWith => __$$_ChangeTitleCategoryInputEventCopyWithImpl<
          _$_ChangeTitleCategoryInputEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OperationType operationType) initByType,
    required TResult Function(int categoryId) initById,
    required TResult Function(String title) changeTitle,
    required TResult Function(int budget) changeBudget,
    required TResult Function(BudgetType budgetType) changeBudgetType,
    required TResult Function() save,
  }) {
    return changeTitle(title);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OperationType operationType)? initByType,
    TResult? Function(int categoryId)? initById,
    TResult? Function(String title)? changeTitle,
    TResult? Function(int budget)? changeBudget,
    TResult? Function(BudgetType budgetType)? changeBudgetType,
    TResult? Function()? save,
  }) {
    return changeTitle?.call(title);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OperationType operationType)? initByType,
    TResult Function(int categoryId)? initById,
    TResult Function(String title)? changeTitle,
    TResult Function(int budget)? changeBudget,
    TResult Function(BudgetType budgetType)? changeBudgetType,
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
      _$_ChangeTitleCategoryInputEvent;

  String get title;
  @JsonKey(ignore: true)
  _$$_ChangeTitleCategoryInputEventCopyWith<_$_ChangeTitleCategoryInputEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeBudgetCategoryInputEventCopyWith<$Res> {
  factory _$$_ChangeBudgetCategoryInputEventCopyWith(
          _$_ChangeBudgetCategoryInputEvent value,
          $Res Function(_$_ChangeBudgetCategoryInputEvent) then) =
      __$$_ChangeBudgetCategoryInputEventCopyWithImpl<$Res>;
  @useResult
  $Res call({int budget});
}

/// @nodoc
class __$$_ChangeBudgetCategoryInputEventCopyWithImpl<$Res>
    extends _$CategoryInputEventCopyWithImpl<$Res,
        _$_ChangeBudgetCategoryInputEvent>
    implements _$$_ChangeBudgetCategoryInputEventCopyWith<$Res> {
  __$$_ChangeBudgetCategoryInputEventCopyWithImpl(
      _$_ChangeBudgetCategoryInputEvent _value,
      $Res Function(_$_ChangeBudgetCategoryInputEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? budget = null,
  }) {
    return _then(_$_ChangeBudgetCategoryInputEvent(
      budget: null == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ChangeBudgetCategoryInputEvent
    implements _ChangeBudgetCategoryInputEvent {
  const _$_ChangeBudgetCategoryInputEvent({required this.budget});

  @override
  final int budget;

  @override
  String toString() {
    return 'CategoryInputEvent.changeBudget(budget: $budget)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeBudgetCategoryInputEvent &&
            (identical(other.budget, budget) || other.budget == budget));
  }

  @override
  int get hashCode => Object.hash(runtimeType, budget);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeBudgetCategoryInputEventCopyWith<_$_ChangeBudgetCategoryInputEvent>
      get copyWith => __$$_ChangeBudgetCategoryInputEventCopyWithImpl<
          _$_ChangeBudgetCategoryInputEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OperationType operationType) initByType,
    required TResult Function(int categoryId) initById,
    required TResult Function(String title) changeTitle,
    required TResult Function(int budget) changeBudget,
    required TResult Function(BudgetType budgetType) changeBudgetType,
    required TResult Function() save,
  }) {
    return changeBudget(budget);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OperationType operationType)? initByType,
    TResult? Function(int categoryId)? initById,
    TResult? Function(String title)? changeTitle,
    TResult? Function(int budget)? changeBudget,
    TResult? Function(BudgetType budgetType)? changeBudgetType,
    TResult? Function()? save,
  }) {
    return changeBudget?.call(budget);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OperationType operationType)? initByType,
    TResult Function(int categoryId)? initById,
    TResult Function(String title)? changeTitle,
    TResult Function(int budget)? changeBudget,
    TResult Function(BudgetType budgetType)? changeBudgetType,
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
      _$_ChangeBudgetCategoryInputEvent;

  int get budget;
  @JsonKey(ignore: true)
  _$$_ChangeBudgetCategoryInputEventCopyWith<_$_ChangeBudgetCategoryInputEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeBudgetTypeCategoryInputEventCopyWith<$Res> {
  factory _$$_ChangeBudgetTypeCategoryInputEventCopyWith(
          _$_ChangeBudgetTypeCategoryInputEvent value,
          $Res Function(_$_ChangeBudgetTypeCategoryInputEvent) then) =
      __$$_ChangeBudgetTypeCategoryInputEventCopyWithImpl<$Res>;
  @useResult
  $Res call({BudgetType budgetType});
}

/// @nodoc
class __$$_ChangeBudgetTypeCategoryInputEventCopyWithImpl<$Res>
    extends _$CategoryInputEventCopyWithImpl<$Res,
        _$_ChangeBudgetTypeCategoryInputEvent>
    implements _$$_ChangeBudgetTypeCategoryInputEventCopyWith<$Res> {
  __$$_ChangeBudgetTypeCategoryInputEventCopyWithImpl(
      _$_ChangeBudgetTypeCategoryInputEvent _value,
      $Res Function(_$_ChangeBudgetTypeCategoryInputEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? budgetType = null,
  }) {
    return _then(_$_ChangeBudgetTypeCategoryInputEvent(
      budgetType: null == budgetType
          ? _value.budgetType
          : budgetType // ignore: cast_nullable_to_non_nullable
              as BudgetType,
    ));
  }
}

/// @nodoc

class _$_ChangeBudgetTypeCategoryInputEvent
    implements _ChangeBudgetTypeCategoryInputEvent {
  const _$_ChangeBudgetTypeCategoryInputEvent({required this.budgetType});

  @override
  final BudgetType budgetType;

  @override
  String toString() {
    return 'CategoryInputEvent.changeBudgetType(budgetType: $budgetType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeBudgetTypeCategoryInputEvent &&
            (identical(other.budgetType, budgetType) ||
                other.budgetType == budgetType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, budgetType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeBudgetTypeCategoryInputEventCopyWith<
          _$_ChangeBudgetTypeCategoryInputEvent>
      get copyWith => __$$_ChangeBudgetTypeCategoryInputEventCopyWithImpl<
          _$_ChangeBudgetTypeCategoryInputEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OperationType operationType) initByType,
    required TResult Function(int categoryId) initById,
    required TResult Function(String title) changeTitle,
    required TResult Function(int budget) changeBudget,
    required TResult Function(BudgetType budgetType) changeBudgetType,
    required TResult Function() save,
  }) {
    return changeBudgetType(budgetType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OperationType operationType)? initByType,
    TResult? Function(int categoryId)? initById,
    TResult? Function(String title)? changeTitle,
    TResult? Function(int budget)? changeBudget,
    TResult? Function(BudgetType budgetType)? changeBudgetType,
    TResult? Function()? save,
  }) {
    return changeBudgetType?.call(budgetType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OperationType operationType)? initByType,
    TResult Function(int categoryId)? initById,
    TResult Function(String title)? changeTitle,
    TResult Function(int budget)? changeBudget,
    TResult Function(BudgetType budgetType)? changeBudgetType,
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
      _$_ChangeBudgetTypeCategoryInputEvent;

  BudgetType get budgetType;
  @JsonKey(ignore: true)
  _$$_ChangeBudgetTypeCategoryInputEventCopyWith<
          _$_ChangeBudgetTypeCategoryInputEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SaveCategoryInputEventCopyWith<$Res> {
  factory _$$_SaveCategoryInputEventCopyWith(_$_SaveCategoryInputEvent value,
          $Res Function(_$_SaveCategoryInputEvent) then) =
      __$$_SaveCategoryInputEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SaveCategoryInputEventCopyWithImpl<$Res>
    extends _$CategoryInputEventCopyWithImpl<$Res, _$_SaveCategoryInputEvent>
    implements _$$_SaveCategoryInputEventCopyWith<$Res> {
  __$$_SaveCategoryInputEventCopyWithImpl(_$_SaveCategoryInputEvent _value,
      $Res Function(_$_SaveCategoryInputEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SaveCategoryInputEvent implements _SaveCategoryInputEvent {
  const _$_SaveCategoryInputEvent();

  @override
  String toString() {
    return 'CategoryInputEvent.save()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SaveCategoryInputEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OperationType operationType) initByType,
    required TResult Function(int categoryId) initById,
    required TResult Function(String title) changeTitle,
    required TResult Function(int budget) changeBudget,
    required TResult Function(BudgetType budgetType) changeBudgetType,
    required TResult Function() save,
  }) {
    return save();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OperationType operationType)? initByType,
    TResult? Function(int categoryId)? initById,
    TResult? Function(String title)? changeTitle,
    TResult? Function(int budget)? changeBudget,
    TResult? Function(BudgetType budgetType)? changeBudgetType,
    TResult? Function()? save,
  }) {
    return save?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OperationType operationType)? initByType,
    TResult Function(int categoryId)? initById,
    TResult Function(String title)? changeTitle,
    TResult Function(int budget)? changeBudget,
    TResult Function(BudgetType budgetType)? changeBudgetType,
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
  const factory _SaveCategoryInputEvent() = _$_SaveCategoryInputEvent;
}

/// @nodoc
mixin _$CategoryInputState {
  OperationType get operationType => throw _privateConstructorUsedError;
  BudgetType get budgetType => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get budget => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Category? category, OperationType operationType,
            BudgetType budgetType, String title, int budget)
        main,
    required TResult Function(
            Category fetchedCategory,
            OperationType operationType,
            BudgetType budgetType,
            String title,
            int budget)
        fetched,
    required TResult Function(
            Category savedCategory,
            OperationType operationType,
            BudgetType budgetType,
            String title,
            int budget)
        saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Category? category, OperationType operationType,
            BudgetType budgetType, String title, int budget)?
        main,
    TResult? Function(Category fetchedCategory, OperationType operationType,
            BudgetType budgetType, String title, int budget)?
        fetched,
    TResult? Function(Category savedCategory, OperationType operationType,
            BudgetType budgetType, String title, int budget)?
        saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Category? category, OperationType operationType,
            BudgetType budgetType, String title, int budget)?
        main,
    TResult Function(Category fetchedCategory, OperationType operationType,
            BudgetType budgetType, String title, int budget)?
        fetched,
    TResult Function(Category savedCategory, OperationType operationType,
            BudgetType budgetType, String title, int budget)?
        saved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MainCategoryInputState value) main,
    required TResult Function(_FetchedCategoryInputState value) fetched,
    required TResult Function(_SavedCategoryInputState value) saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MainCategoryInputState value)? main,
    TResult? Function(_FetchedCategoryInputState value)? fetched,
    TResult? Function(_SavedCategoryInputState value)? saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MainCategoryInputState value)? main,
    TResult Function(_FetchedCategoryInputState value)? fetched,
    TResult Function(_SavedCategoryInputState value)? saved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryInputStateCopyWith<CategoryInputState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryInputStateCopyWith<$Res> {
  factory $CategoryInputStateCopyWith(
          CategoryInputState value, $Res Function(CategoryInputState) then) =
      _$CategoryInputStateCopyWithImpl<$Res, CategoryInputState>;
  @useResult
  $Res call(
      {OperationType operationType,
      BudgetType budgetType,
      String title,
      int budget});
}

/// @nodoc
class _$CategoryInputStateCopyWithImpl<$Res, $Val extends CategoryInputState>
    implements $CategoryInputStateCopyWith<$Res> {
  _$CategoryInputStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operationType = null,
    Object? budgetType = null,
    Object? title = null,
    Object? budget = null,
  }) {
    return _then(_value.copyWith(
      operationType: null == operationType
          ? _value.operationType
          : operationType // ignore: cast_nullable_to_non_nullable
              as OperationType,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MainCategoryInputStateCopyWith<$Res>
    implements $CategoryInputStateCopyWith<$Res> {
  factory _$$_MainCategoryInputStateCopyWith(_$_MainCategoryInputState value,
          $Res Function(_$_MainCategoryInputState) then) =
      __$$_MainCategoryInputStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Category? category,
      OperationType operationType,
      BudgetType budgetType,
      String title,
      int budget});
}

/// @nodoc
class __$$_MainCategoryInputStateCopyWithImpl<$Res>
    extends _$CategoryInputStateCopyWithImpl<$Res, _$_MainCategoryInputState>
    implements _$$_MainCategoryInputStateCopyWith<$Res> {
  __$$_MainCategoryInputStateCopyWithImpl(_$_MainCategoryInputState _value,
      $Res Function(_$_MainCategoryInputState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
    Object? operationType = null,
    Object? budgetType = null,
    Object? title = null,
    Object? budget = null,
  }) {
    return _then(_$_MainCategoryInputState(
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      operationType: null == operationType
          ? _value.operationType
          : operationType // ignore: cast_nullable_to_non_nullable
              as OperationType,
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
    ));
  }
}

/// @nodoc

class _$_MainCategoryInputState extends _MainCategoryInputState {
  const _$_MainCategoryInputState(
      {this.category,
      required this.operationType,
      required this.budgetType,
      required this.title,
      required this.budget})
      : super._();

  @override
  final Category? category;
  @override
  final OperationType operationType;
  @override
  final BudgetType budgetType;
  @override
  final String title;
  @override
  final int budget;

  @override
  String toString() {
    return 'CategoryInputState.main(category: $category, operationType: $operationType, budgetType: $budgetType, title: $title, budget: $budget)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MainCategoryInputState &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.operationType, operationType) ||
                other.operationType == operationType) &&
            (identical(other.budgetType, budgetType) ||
                other.budgetType == budgetType) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.budget, budget) || other.budget == budget));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, category, operationType, budgetType, title, budget);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MainCategoryInputStateCopyWith<_$_MainCategoryInputState> get copyWith =>
      __$$_MainCategoryInputStateCopyWithImpl<_$_MainCategoryInputState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Category? category, OperationType operationType,
            BudgetType budgetType, String title, int budget)
        main,
    required TResult Function(
            Category fetchedCategory,
            OperationType operationType,
            BudgetType budgetType,
            String title,
            int budget)
        fetched,
    required TResult Function(
            Category savedCategory,
            OperationType operationType,
            BudgetType budgetType,
            String title,
            int budget)
        saved,
  }) {
    return main(category, operationType, budgetType, title, budget);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Category? category, OperationType operationType,
            BudgetType budgetType, String title, int budget)?
        main,
    TResult? Function(Category fetchedCategory, OperationType operationType,
            BudgetType budgetType, String title, int budget)?
        fetched,
    TResult? Function(Category savedCategory, OperationType operationType,
            BudgetType budgetType, String title, int budget)?
        saved,
  }) {
    return main?.call(category, operationType, budgetType, title, budget);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Category? category, OperationType operationType,
            BudgetType budgetType, String title, int budget)?
        main,
    TResult Function(Category fetchedCategory, OperationType operationType,
            BudgetType budgetType, String title, int budget)?
        fetched,
    TResult Function(Category savedCategory, OperationType operationType,
            BudgetType budgetType, String title, int budget)?
        saved,
    required TResult orElse(),
  }) {
    if (main != null) {
      return main(category, operationType, budgetType, title, budget);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MainCategoryInputState value) main,
    required TResult Function(_FetchedCategoryInputState value) fetched,
    required TResult Function(_SavedCategoryInputState value) saved,
  }) {
    return main(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MainCategoryInputState value)? main,
    TResult? Function(_FetchedCategoryInputState value)? fetched,
    TResult? Function(_SavedCategoryInputState value)? saved,
  }) {
    return main?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MainCategoryInputState value)? main,
    TResult Function(_FetchedCategoryInputState value)? fetched,
    TResult Function(_SavedCategoryInputState value)? saved,
    required TResult orElse(),
  }) {
    if (main != null) {
      return main(this);
    }
    return orElse();
  }
}

abstract class _MainCategoryInputState extends CategoryInputState {
  const factory _MainCategoryInputState(
      {final Category? category,
      required final OperationType operationType,
      required final BudgetType budgetType,
      required final String title,
      required final int budget}) = _$_MainCategoryInputState;
  const _MainCategoryInputState._() : super._();

  Category? get category;
  @override
  OperationType get operationType;
  @override
  BudgetType get budgetType;
  @override
  String get title;
  @override
  int get budget;
  @override
  @JsonKey(ignore: true)
  _$$_MainCategoryInputStateCopyWith<_$_MainCategoryInputState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchedCategoryInputStateCopyWith<$Res>
    implements $CategoryInputStateCopyWith<$Res> {
  factory _$$_FetchedCategoryInputStateCopyWith(
          _$_FetchedCategoryInputState value,
          $Res Function(_$_FetchedCategoryInputState) then) =
      __$$_FetchedCategoryInputStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Category fetchedCategory,
      OperationType operationType,
      BudgetType budgetType,
      String title,
      int budget});
}

/// @nodoc
class __$$_FetchedCategoryInputStateCopyWithImpl<$Res>
    extends _$CategoryInputStateCopyWithImpl<$Res, _$_FetchedCategoryInputState>
    implements _$$_FetchedCategoryInputStateCopyWith<$Res> {
  __$$_FetchedCategoryInputStateCopyWithImpl(
      _$_FetchedCategoryInputState _value,
      $Res Function(_$_FetchedCategoryInputState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fetchedCategory = null,
    Object? operationType = null,
    Object? budgetType = null,
    Object? title = null,
    Object? budget = null,
  }) {
    return _then(_$_FetchedCategoryInputState(
      fetchedCategory: null == fetchedCategory
          ? _value.fetchedCategory
          : fetchedCategory // ignore: cast_nullable_to_non_nullable
              as Category,
      operationType: null == operationType
          ? _value.operationType
          : operationType // ignore: cast_nullable_to_non_nullable
              as OperationType,
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
    ));
  }
}

/// @nodoc

class _$_FetchedCategoryInputState extends _FetchedCategoryInputState {
  const _$_FetchedCategoryInputState(
      {required this.fetchedCategory,
      required this.operationType,
      required this.budgetType,
      required this.title,
      required this.budget})
      : super._();

  @override
  final Category fetchedCategory;
  @override
  final OperationType operationType;
  @override
  final BudgetType budgetType;
  @override
  final String title;
  @override
  final int budget;

  @override
  String toString() {
    return 'CategoryInputState.fetched(fetchedCategory: $fetchedCategory, operationType: $operationType, budgetType: $budgetType, title: $title, budget: $budget)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchedCategoryInputState &&
            (identical(other.fetchedCategory, fetchedCategory) ||
                other.fetchedCategory == fetchedCategory) &&
            (identical(other.operationType, operationType) ||
                other.operationType == operationType) &&
            (identical(other.budgetType, budgetType) ||
                other.budgetType == budgetType) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.budget, budget) || other.budget == budget));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, fetchedCategory, operationType, budgetType, title, budget);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchedCategoryInputStateCopyWith<_$_FetchedCategoryInputState>
      get copyWith => __$$_FetchedCategoryInputStateCopyWithImpl<
          _$_FetchedCategoryInputState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Category? category, OperationType operationType,
            BudgetType budgetType, String title, int budget)
        main,
    required TResult Function(
            Category fetchedCategory,
            OperationType operationType,
            BudgetType budgetType,
            String title,
            int budget)
        fetched,
    required TResult Function(
            Category savedCategory,
            OperationType operationType,
            BudgetType budgetType,
            String title,
            int budget)
        saved,
  }) {
    return fetched(fetchedCategory, operationType, budgetType, title, budget);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Category? category, OperationType operationType,
            BudgetType budgetType, String title, int budget)?
        main,
    TResult? Function(Category fetchedCategory, OperationType operationType,
            BudgetType budgetType, String title, int budget)?
        fetched,
    TResult? Function(Category savedCategory, OperationType operationType,
            BudgetType budgetType, String title, int budget)?
        saved,
  }) {
    return fetched?.call(
        fetchedCategory, operationType, budgetType, title, budget);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Category? category, OperationType operationType,
            BudgetType budgetType, String title, int budget)?
        main,
    TResult Function(Category fetchedCategory, OperationType operationType,
            BudgetType budgetType, String title, int budget)?
        fetched,
    TResult Function(Category savedCategory, OperationType operationType,
            BudgetType budgetType, String title, int budget)?
        saved,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(fetchedCategory, operationType, budgetType, title, budget);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MainCategoryInputState value) main,
    required TResult Function(_FetchedCategoryInputState value) fetched,
    required TResult Function(_SavedCategoryInputState value) saved,
  }) {
    return fetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MainCategoryInputState value)? main,
    TResult? Function(_FetchedCategoryInputState value)? fetched,
    TResult? Function(_SavedCategoryInputState value)? saved,
  }) {
    return fetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MainCategoryInputState value)? main,
    TResult Function(_FetchedCategoryInputState value)? fetched,
    TResult Function(_SavedCategoryInputState value)? saved,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(this);
    }
    return orElse();
  }
}

abstract class _FetchedCategoryInputState extends CategoryInputState {
  const factory _FetchedCategoryInputState(
      {required final Category fetchedCategory,
      required final OperationType operationType,
      required final BudgetType budgetType,
      required final String title,
      required final int budget}) = _$_FetchedCategoryInputState;
  const _FetchedCategoryInputState._() : super._();

  Category get fetchedCategory;
  @override
  OperationType get operationType;
  @override
  BudgetType get budgetType;
  @override
  String get title;
  @override
  int get budget;
  @override
  @JsonKey(ignore: true)
  _$$_FetchedCategoryInputStateCopyWith<_$_FetchedCategoryInputState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SavedCategoryInputStateCopyWith<$Res>
    implements $CategoryInputStateCopyWith<$Res> {
  factory _$$_SavedCategoryInputStateCopyWith(_$_SavedCategoryInputState value,
          $Res Function(_$_SavedCategoryInputState) then) =
      __$$_SavedCategoryInputStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Category savedCategory,
      OperationType operationType,
      BudgetType budgetType,
      String title,
      int budget});
}

/// @nodoc
class __$$_SavedCategoryInputStateCopyWithImpl<$Res>
    extends _$CategoryInputStateCopyWithImpl<$Res, _$_SavedCategoryInputState>
    implements _$$_SavedCategoryInputStateCopyWith<$Res> {
  __$$_SavedCategoryInputStateCopyWithImpl(_$_SavedCategoryInputState _value,
      $Res Function(_$_SavedCategoryInputState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? savedCategory = null,
    Object? operationType = null,
    Object? budgetType = null,
    Object? title = null,
    Object? budget = null,
  }) {
    return _then(_$_SavedCategoryInputState(
      savedCategory: null == savedCategory
          ? _value.savedCategory
          : savedCategory // ignore: cast_nullable_to_non_nullable
              as Category,
      operationType: null == operationType
          ? _value.operationType
          : operationType // ignore: cast_nullable_to_non_nullable
              as OperationType,
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
    ));
  }
}

/// @nodoc

class _$_SavedCategoryInputState extends _SavedCategoryInputState {
  const _$_SavedCategoryInputState(
      {required this.savedCategory,
      required this.operationType,
      required this.budgetType,
      required this.title,
      required this.budget})
      : super._();

  @override
  final Category savedCategory;
  @override
  final OperationType operationType;
  @override
  final BudgetType budgetType;
  @override
  final String title;
  @override
  final int budget;

  @override
  String toString() {
    return 'CategoryInputState.saved(savedCategory: $savedCategory, operationType: $operationType, budgetType: $budgetType, title: $title, budget: $budget)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SavedCategoryInputState &&
            (identical(other.savedCategory, savedCategory) ||
                other.savedCategory == savedCategory) &&
            (identical(other.operationType, operationType) ||
                other.operationType == operationType) &&
            (identical(other.budgetType, budgetType) ||
                other.budgetType == budgetType) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.budget, budget) || other.budget == budget));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, savedCategory, operationType, budgetType, title, budget);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SavedCategoryInputStateCopyWith<_$_SavedCategoryInputState>
      get copyWith =>
          __$$_SavedCategoryInputStateCopyWithImpl<_$_SavedCategoryInputState>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Category? category, OperationType operationType,
            BudgetType budgetType, String title, int budget)
        main,
    required TResult Function(
            Category fetchedCategory,
            OperationType operationType,
            BudgetType budgetType,
            String title,
            int budget)
        fetched,
    required TResult Function(
            Category savedCategory,
            OperationType operationType,
            BudgetType budgetType,
            String title,
            int budget)
        saved,
  }) {
    return saved(savedCategory, operationType, budgetType, title, budget);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Category? category, OperationType operationType,
            BudgetType budgetType, String title, int budget)?
        main,
    TResult? Function(Category fetchedCategory, OperationType operationType,
            BudgetType budgetType, String title, int budget)?
        fetched,
    TResult? Function(Category savedCategory, OperationType operationType,
            BudgetType budgetType, String title, int budget)?
        saved,
  }) {
    return saved?.call(savedCategory, operationType, budgetType, title, budget);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Category? category, OperationType operationType,
            BudgetType budgetType, String title, int budget)?
        main,
    TResult Function(Category fetchedCategory, OperationType operationType,
            BudgetType budgetType, String title, int budget)?
        fetched,
    TResult Function(Category savedCategory, OperationType operationType,
            BudgetType budgetType, String title, int budget)?
        saved,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(savedCategory, operationType, budgetType, title, budget);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MainCategoryInputState value) main,
    required TResult Function(_FetchedCategoryInputState value) fetched,
    required TResult Function(_SavedCategoryInputState value) saved,
  }) {
    return saved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MainCategoryInputState value)? main,
    TResult? Function(_FetchedCategoryInputState value)? fetched,
    TResult? Function(_SavedCategoryInputState value)? saved,
  }) {
    return saved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MainCategoryInputState value)? main,
    TResult Function(_FetchedCategoryInputState value)? fetched,
    TResult Function(_SavedCategoryInputState value)? saved,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(this);
    }
    return orElse();
  }
}

abstract class _SavedCategoryInputState extends CategoryInputState {
  const factory _SavedCategoryInputState(
      {required final Category savedCategory,
      required final OperationType operationType,
      required final BudgetType budgetType,
      required final String title,
      required final int budget}) = _$_SavedCategoryInputState;
  const _SavedCategoryInputState._() : super._();

  Category get savedCategory;
  @override
  OperationType get operationType;
  @override
  BudgetType get budgetType;
  @override
  String get title;
  @override
  int get budget;
  @override
  @JsonKey(ignore: true)
  _$$_SavedCategoryInputStateCopyWith<_$_SavedCategoryInputState>
      get copyWith => throw _privateConstructorUsedError;
}
