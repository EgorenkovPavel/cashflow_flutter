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
    required TResult Function(Currency currency) changeCurrency,
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
    TResult? Function(Currency currency)? changeCurrency,
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
    TResult Function(Currency currency)? changeCurrency,
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
    required TResult Function(_ChangeCurrencyCategoryInputEvent value)
        changeCurrency,
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
    TResult? Function(_ChangeCurrencyCategoryInputEvent value)? changeCurrency,
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
    TResult Function(_ChangeCurrencyCategoryInputEvent value)? changeCurrency,
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
abstract class _$$InitByTypeCategoryInputEventImplCopyWith<$Res> {
  factory _$$InitByTypeCategoryInputEventImplCopyWith(
          _$InitByTypeCategoryInputEventImpl value,
          $Res Function(_$InitByTypeCategoryInputEventImpl) then) =
      __$$InitByTypeCategoryInputEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({OperationType operationType});
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operationType = null,
  }) {
    return _then(_$InitByTypeCategoryInputEventImpl(
      operationType: null == operationType
          ? _value.operationType
          : operationType // ignore: cast_nullable_to_non_nullable
              as OperationType,
    ));
  }
}

/// @nodoc

class _$InitByTypeCategoryInputEventImpl
    implements _InitByTypeCategoryInputEvent {
  const _$InitByTypeCategoryInputEventImpl({required this.operationType});

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
            other is _$InitByTypeCategoryInputEventImpl &&
            (identical(other.operationType, operationType) ||
                other.operationType == operationType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, operationType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitByTypeCategoryInputEventImplCopyWith<
          _$InitByTypeCategoryInputEventImpl>
      get copyWith => __$$InitByTypeCategoryInputEventImplCopyWithImpl<
          _$InitByTypeCategoryInputEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OperationType operationType) initByType,
    required TResult Function(int categoryId) initById,
    required TResult Function(String title) changeTitle,
    required TResult Function(int budget) changeBudget,
    required TResult Function(BudgetType budgetType) changeBudgetType,
    required TResult Function(Currency currency) changeCurrency,
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
    TResult? Function(Currency currency)? changeCurrency,
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
    TResult Function(Currency currency)? changeCurrency,
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
    required TResult Function(_ChangeCurrencyCategoryInputEvent value)
        changeCurrency,
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
    TResult? Function(_ChangeCurrencyCategoryInputEvent value)? changeCurrency,
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
    TResult Function(_ChangeCurrencyCategoryInputEvent value)? changeCurrency,
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
      _$InitByTypeCategoryInputEventImpl;

  OperationType get operationType;
  @JsonKey(ignore: true)
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitByIdCategoryInputEventImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitByIdCategoryInputEventImplCopyWith<_$InitByIdCategoryInputEventImpl>
      get copyWith => __$$InitByIdCategoryInputEventImplCopyWithImpl<
          _$InitByIdCategoryInputEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OperationType operationType) initByType,
    required TResult Function(int categoryId) initById,
    required TResult Function(String title) changeTitle,
    required TResult Function(int budget) changeBudget,
    required TResult Function(BudgetType budgetType) changeBudgetType,
    required TResult Function(Currency currency) changeCurrency,
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
    TResult? Function(Currency currency)? changeCurrency,
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
    TResult Function(Currency currency)? changeCurrency,
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
    required TResult Function(_ChangeCurrencyCategoryInputEvent value)
        changeCurrency,
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
    TResult? Function(_ChangeCurrencyCategoryInputEvent value)? changeCurrency,
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
    TResult Function(_ChangeCurrencyCategoryInputEvent value)? changeCurrency,
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
  @JsonKey(ignore: true)
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeTitleCategoryInputEventImpl &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeTitleCategoryInputEventImplCopyWith<
          _$ChangeTitleCategoryInputEventImpl>
      get copyWith => __$$ChangeTitleCategoryInputEventImplCopyWithImpl<
          _$ChangeTitleCategoryInputEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OperationType operationType) initByType,
    required TResult Function(int categoryId) initById,
    required TResult Function(String title) changeTitle,
    required TResult Function(int budget) changeBudget,
    required TResult Function(BudgetType budgetType) changeBudgetType,
    required TResult Function(Currency currency) changeCurrency,
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
    TResult? Function(Currency currency)? changeCurrency,
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
    TResult Function(Currency currency)? changeCurrency,
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
    required TResult Function(_ChangeCurrencyCategoryInputEvent value)
        changeCurrency,
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
    TResult? Function(_ChangeCurrencyCategoryInputEvent value)? changeCurrency,
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
    TResult Function(_ChangeCurrencyCategoryInputEvent value)? changeCurrency,
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
  @JsonKey(ignore: true)
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeBudgetCategoryInputEventImpl &&
            (identical(other.budget, budget) || other.budget == budget));
  }

  @override
  int get hashCode => Object.hash(runtimeType, budget);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeBudgetCategoryInputEventImplCopyWith<
          _$ChangeBudgetCategoryInputEventImpl>
      get copyWith => __$$ChangeBudgetCategoryInputEventImplCopyWithImpl<
          _$ChangeBudgetCategoryInputEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OperationType operationType) initByType,
    required TResult Function(int categoryId) initById,
    required TResult Function(String title) changeTitle,
    required TResult Function(int budget) changeBudget,
    required TResult Function(BudgetType budgetType) changeBudgetType,
    required TResult Function(Currency currency) changeCurrency,
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
    TResult? Function(Currency currency)? changeCurrency,
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
    TResult Function(Currency currency)? changeCurrency,
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
    required TResult Function(_ChangeCurrencyCategoryInputEvent value)
        changeCurrency,
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
    TResult? Function(_ChangeCurrencyCategoryInputEvent value)? changeCurrency,
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
    TResult Function(_ChangeCurrencyCategoryInputEvent value)? changeCurrency,
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
  @JsonKey(ignore: true)
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeBudgetTypeCategoryInputEventImpl &&
            (identical(other.budgetType, budgetType) ||
                other.budgetType == budgetType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, budgetType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeBudgetTypeCategoryInputEventImplCopyWith<
          _$ChangeBudgetTypeCategoryInputEventImpl>
      get copyWith => __$$ChangeBudgetTypeCategoryInputEventImplCopyWithImpl<
          _$ChangeBudgetTypeCategoryInputEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OperationType operationType) initByType,
    required TResult Function(int categoryId) initById,
    required TResult Function(String title) changeTitle,
    required TResult Function(int budget) changeBudget,
    required TResult Function(BudgetType budgetType) changeBudgetType,
    required TResult Function(Currency currency) changeCurrency,
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
    TResult? Function(Currency currency)? changeCurrency,
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
    TResult Function(Currency currency)? changeCurrency,
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
    required TResult Function(_ChangeCurrencyCategoryInputEvent value)
        changeCurrency,
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
    TResult? Function(_ChangeCurrencyCategoryInputEvent value)? changeCurrency,
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
    TResult Function(_ChangeCurrencyCategoryInputEvent value)? changeCurrency,
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
  @JsonKey(ignore: true)
  _$$ChangeBudgetTypeCategoryInputEventImplCopyWith<
          _$ChangeBudgetTypeCategoryInputEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeCurrencyCategoryInputEventImplCopyWith<$Res> {
  factory _$$ChangeCurrencyCategoryInputEventImplCopyWith(
          _$ChangeCurrencyCategoryInputEventImpl value,
          $Res Function(_$ChangeCurrencyCategoryInputEventImpl) then) =
      __$$ChangeCurrencyCategoryInputEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Currency currency});
}

/// @nodoc
class __$$ChangeCurrencyCategoryInputEventImplCopyWithImpl<$Res>
    extends _$CategoryInputEventCopyWithImpl<$Res,
        _$ChangeCurrencyCategoryInputEventImpl>
    implements _$$ChangeCurrencyCategoryInputEventImplCopyWith<$Res> {
  __$$ChangeCurrencyCategoryInputEventImplCopyWithImpl(
      _$ChangeCurrencyCategoryInputEventImpl _value,
      $Res Function(_$ChangeCurrencyCategoryInputEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = null,
  }) {
    return _then(_$ChangeCurrencyCategoryInputEventImpl(
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
    ));
  }
}

/// @nodoc

class _$ChangeCurrencyCategoryInputEventImpl
    implements _ChangeCurrencyCategoryInputEvent {
  const _$ChangeCurrencyCategoryInputEventImpl({required this.currency});

  @override
  final Currency currency;

  @override
  String toString() {
    return 'CategoryInputEvent.changeCurrency(currency: $currency)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeCurrencyCategoryInputEventImpl &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currency);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeCurrencyCategoryInputEventImplCopyWith<
          _$ChangeCurrencyCategoryInputEventImpl>
      get copyWith => __$$ChangeCurrencyCategoryInputEventImplCopyWithImpl<
          _$ChangeCurrencyCategoryInputEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OperationType operationType) initByType,
    required TResult Function(int categoryId) initById,
    required TResult Function(String title) changeTitle,
    required TResult Function(int budget) changeBudget,
    required TResult Function(BudgetType budgetType) changeBudgetType,
    required TResult Function(Currency currency) changeCurrency,
    required TResult Function() save,
  }) {
    return changeCurrency(currency);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OperationType operationType)? initByType,
    TResult? Function(int categoryId)? initById,
    TResult? Function(String title)? changeTitle,
    TResult? Function(int budget)? changeBudget,
    TResult? Function(BudgetType budgetType)? changeBudgetType,
    TResult? Function(Currency currency)? changeCurrency,
    TResult? Function()? save,
  }) {
    return changeCurrency?.call(currency);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OperationType operationType)? initByType,
    TResult Function(int categoryId)? initById,
    TResult Function(String title)? changeTitle,
    TResult Function(int budget)? changeBudget,
    TResult Function(BudgetType budgetType)? changeBudgetType,
    TResult Function(Currency currency)? changeCurrency,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (changeCurrency != null) {
      return changeCurrency(currency);
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
    required TResult Function(_ChangeCurrencyCategoryInputEvent value)
        changeCurrency,
    required TResult Function(_SaveCategoryInputEvent value) save,
  }) {
    return changeCurrency(this);
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
    TResult? Function(_ChangeCurrencyCategoryInputEvent value)? changeCurrency,
    TResult? Function(_SaveCategoryInputEvent value)? save,
  }) {
    return changeCurrency?.call(this);
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
    TResult Function(_ChangeCurrencyCategoryInputEvent value)? changeCurrency,
    TResult Function(_SaveCategoryInputEvent value)? save,
    required TResult orElse(),
  }) {
    if (changeCurrency != null) {
      return changeCurrency(this);
    }
    return orElse();
  }
}

abstract class _ChangeCurrencyCategoryInputEvent implements CategoryInputEvent {
  const factory _ChangeCurrencyCategoryInputEvent(
          {required final Currency currency}) =
      _$ChangeCurrencyCategoryInputEventImpl;

  Currency get currency;
  @JsonKey(ignore: true)
  _$$ChangeCurrencyCategoryInputEventImplCopyWith<
          _$ChangeCurrencyCategoryInputEventImpl>
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
}

/// @nodoc

class _$SaveCategoryInputEventImpl implements _SaveCategoryInputEvent {
  const _$SaveCategoryInputEventImpl();

  @override
  String toString() {
    return 'CategoryInputEvent.save()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveCategoryInputEventImpl);
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
    required TResult Function(Currency currency) changeCurrency,
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
    TResult? Function(Currency currency)? changeCurrency,
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
    TResult Function(Currency currency)? changeCurrency,
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
    required TResult Function(_ChangeCurrencyCategoryInputEvent value)
        changeCurrency,
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
    TResult? Function(_ChangeCurrencyCategoryInputEvent value)? changeCurrency,
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
    TResult Function(_ChangeCurrencyCategoryInputEvent value)? changeCurrency,
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
  OperationType get operationType => throw _privateConstructorUsedError;
  BudgetType get budgetType => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get budget => throw _privateConstructorUsedError;
  Currency get currency => throw _privateConstructorUsedError;
  bool get isSaved => throw _privateConstructorUsedError;

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
      {Category? category,
      OperationType operationType,
      BudgetType budgetType,
      String title,
      int budget,
      Currency currency,
      bool isSaved});

  $CategoryCopyWith<$Res>? get category;
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
    Object? category = freezed,
    Object? operationType = null,
    Object? budgetType = null,
    Object? title = null,
    Object? budget = null,
    Object? currency = null,
    Object? isSaved = null,
  }) {
    return _then(_value.copyWith(
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
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      isSaved: null == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CategoryInputStateImplCopyWith<$Res>
    implements $CategoryInputStateCopyWith<$Res> {
  factory _$$CategoryInputStateImplCopyWith(_$CategoryInputStateImpl value,
          $Res Function(_$CategoryInputStateImpl) then) =
      __$$CategoryInputStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Category? category,
      OperationType operationType,
      BudgetType budgetType,
      String title,
      int budget,
      Currency currency,
      bool isSaved});

  @override
  $CategoryCopyWith<$Res>? get category;
}

/// @nodoc
class __$$CategoryInputStateImplCopyWithImpl<$Res>
    extends _$CategoryInputStateCopyWithImpl<$Res, _$CategoryInputStateImpl>
    implements _$$CategoryInputStateImplCopyWith<$Res> {
  __$$CategoryInputStateImplCopyWithImpl(_$CategoryInputStateImpl _value,
      $Res Function(_$CategoryInputStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
    Object? operationType = null,
    Object? budgetType = null,
    Object? title = null,
    Object? budget = null,
    Object? currency = null,
    Object? isSaved = null,
  }) {
    return _then(_$CategoryInputStateImpl(
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
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      isSaved: null == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CategoryInputStateImpl implements _CategoryInputState {
  const _$CategoryInputStateImpl(
      {this.category,
      required this.operationType,
      required this.budgetType,
      required this.title,
      required this.budget,
      required this.currency,
      required this.isSaved});

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
  final Currency currency;
  @override
  final bool isSaved;

  @override
  String toString() {
    return 'CategoryInputState(category: $category, operationType: $operationType, budgetType: $budgetType, title: $title, budget: $budget, currency: $currency, isSaved: $isSaved)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryInputStateImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.operationType, operationType) ||
                other.operationType == operationType) &&
            (identical(other.budgetType, budgetType) ||
                other.budgetType == budgetType) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.budget, budget) || other.budget == budget) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category, operationType,
      budgetType, title, budget, currency, isSaved);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryInputStateImplCopyWith<_$CategoryInputStateImpl> get copyWith =>
      __$$CategoryInputStateImplCopyWithImpl<_$CategoryInputStateImpl>(
          this, _$identity);
}

abstract class _CategoryInputState implements CategoryInputState {
  const factory _CategoryInputState(
      {final Category? category,
      required final OperationType operationType,
      required final BudgetType budgetType,
      required final String title,
      required final int budget,
      required final Currency currency,
      required final bool isSaved}) = _$CategoryInputStateImpl;

  @override
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
  Currency get currency;
  @override
  bool get isSaved;
  @override
  @JsonKey(ignore: true)
  _$$CategoryInputStateImplCopyWith<_$CategoryInputStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
