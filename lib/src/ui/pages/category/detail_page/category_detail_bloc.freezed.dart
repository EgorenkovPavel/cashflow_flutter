// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CategoryDetailEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int categoryId) fetch,
    required TResult Function(Category category) changeCategory,
    required TResult Function(List<Operation> operations) changeOperations,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int categoryId)? fetch,
    TResult? Function(Category category)? changeCategory,
    TResult? Function(List<Operation> operations)? changeOperations,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int categoryId)? fetch,
    TResult Function(Category category)? changeCategory,
    TResult Function(List<Operation> operations)? changeOperations,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchCategoryDetailEvent value) fetch,
    required TResult Function(_ChangeCategoryCategoryDetailEvent value)
        changeCategory,
    required TResult Function(_ChangeOperationsCategoryDetailEvent value)
        changeOperations,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchCategoryDetailEvent value)? fetch,
    TResult? Function(_ChangeCategoryCategoryDetailEvent value)? changeCategory,
    TResult? Function(_ChangeOperationsCategoryDetailEvent value)?
        changeOperations,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchCategoryDetailEvent value)? fetch,
    TResult Function(_ChangeCategoryCategoryDetailEvent value)? changeCategory,
    TResult Function(_ChangeOperationsCategoryDetailEvent value)?
        changeOperations,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryDetailEventCopyWith<$Res> {
  factory $CategoryDetailEventCopyWith(
          CategoryDetailEvent value, $Res Function(CategoryDetailEvent) then) =
      _$CategoryDetailEventCopyWithImpl<$Res, CategoryDetailEvent>;
}

/// @nodoc
class _$CategoryDetailEventCopyWithImpl<$Res, $Val extends CategoryDetailEvent>
    implements $CategoryDetailEventCopyWith<$Res> {
  _$CategoryDetailEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchCategoryDetailEventImplCopyWith<$Res> {
  factory _$$FetchCategoryDetailEventImplCopyWith(
          _$FetchCategoryDetailEventImpl value,
          $Res Function(_$FetchCategoryDetailEventImpl) then) =
      __$$FetchCategoryDetailEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int categoryId});
}

/// @nodoc
class __$$FetchCategoryDetailEventImplCopyWithImpl<$Res>
    extends _$CategoryDetailEventCopyWithImpl<$Res,
        _$FetchCategoryDetailEventImpl>
    implements _$$FetchCategoryDetailEventImplCopyWith<$Res> {
  __$$FetchCategoryDetailEventImplCopyWithImpl(
      _$FetchCategoryDetailEventImpl _value,
      $Res Function(_$FetchCategoryDetailEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
  }) {
    return _then(_$FetchCategoryDetailEventImpl(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FetchCategoryDetailEventImpl implements _FetchCategoryDetailEvent {
  const _$FetchCategoryDetailEventImpl({required this.categoryId});

  @override
  final int categoryId;

  @override
  String toString() {
    return 'CategoryDetailEvent.fetch(categoryId: $categoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchCategoryDetailEventImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchCategoryDetailEventImplCopyWith<_$FetchCategoryDetailEventImpl>
      get copyWith => __$$FetchCategoryDetailEventImplCopyWithImpl<
          _$FetchCategoryDetailEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int categoryId) fetch,
    required TResult Function(Category category) changeCategory,
    required TResult Function(List<Operation> operations) changeOperations,
  }) {
    return fetch(categoryId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int categoryId)? fetch,
    TResult? Function(Category category)? changeCategory,
    TResult? Function(List<Operation> operations)? changeOperations,
  }) {
    return fetch?.call(categoryId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int categoryId)? fetch,
    TResult Function(Category category)? changeCategory,
    TResult Function(List<Operation> operations)? changeOperations,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(categoryId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchCategoryDetailEvent value) fetch,
    required TResult Function(_ChangeCategoryCategoryDetailEvent value)
        changeCategory,
    required TResult Function(_ChangeOperationsCategoryDetailEvent value)
        changeOperations,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchCategoryDetailEvent value)? fetch,
    TResult? Function(_ChangeCategoryCategoryDetailEvent value)? changeCategory,
    TResult? Function(_ChangeOperationsCategoryDetailEvent value)?
        changeOperations,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchCategoryDetailEvent value)? fetch,
    TResult Function(_ChangeCategoryCategoryDetailEvent value)? changeCategory,
    TResult Function(_ChangeOperationsCategoryDetailEvent value)?
        changeOperations,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _FetchCategoryDetailEvent implements CategoryDetailEvent {
  const factory _FetchCategoryDetailEvent({required final int categoryId}) =
      _$FetchCategoryDetailEventImpl;

  int get categoryId;
  @JsonKey(ignore: true)
  _$$FetchCategoryDetailEventImplCopyWith<_$FetchCategoryDetailEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeCategoryCategoryDetailEventImplCopyWith<$Res> {
  factory _$$ChangeCategoryCategoryDetailEventImplCopyWith(
          _$ChangeCategoryCategoryDetailEventImpl value,
          $Res Function(_$ChangeCategoryCategoryDetailEventImpl) then) =
      __$$ChangeCategoryCategoryDetailEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Category category});

  $CategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$$ChangeCategoryCategoryDetailEventImplCopyWithImpl<$Res>
    extends _$CategoryDetailEventCopyWithImpl<$Res,
        _$ChangeCategoryCategoryDetailEventImpl>
    implements _$$ChangeCategoryCategoryDetailEventImplCopyWith<$Res> {
  __$$ChangeCategoryCategoryDetailEventImplCopyWithImpl(
      _$ChangeCategoryCategoryDetailEventImpl _value,
      $Res Function(_$ChangeCategoryCategoryDetailEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
  }) {
    return _then(_$ChangeCategoryCategoryDetailEventImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res> get category {
    return $CategoryCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value));
    });
  }
}

/// @nodoc

class _$ChangeCategoryCategoryDetailEventImpl
    implements _ChangeCategoryCategoryDetailEvent {
  const _$ChangeCategoryCategoryDetailEventImpl({required this.category});

  @override
  final Category category;

  @override
  String toString() {
    return 'CategoryDetailEvent.changeCategory(category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeCategoryCategoryDetailEventImpl &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeCategoryCategoryDetailEventImplCopyWith<
          _$ChangeCategoryCategoryDetailEventImpl>
      get copyWith => __$$ChangeCategoryCategoryDetailEventImplCopyWithImpl<
          _$ChangeCategoryCategoryDetailEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int categoryId) fetch,
    required TResult Function(Category category) changeCategory,
    required TResult Function(List<Operation> operations) changeOperations,
  }) {
    return changeCategory(category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int categoryId)? fetch,
    TResult? Function(Category category)? changeCategory,
    TResult? Function(List<Operation> operations)? changeOperations,
  }) {
    return changeCategory?.call(category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int categoryId)? fetch,
    TResult Function(Category category)? changeCategory,
    TResult Function(List<Operation> operations)? changeOperations,
    required TResult orElse(),
  }) {
    if (changeCategory != null) {
      return changeCategory(category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchCategoryDetailEvent value) fetch,
    required TResult Function(_ChangeCategoryCategoryDetailEvent value)
        changeCategory,
    required TResult Function(_ChangeOperationsCategoryDetailEvent value)
        changeOperations,
  }) {
    return changeCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchCategoryDetailEvent value)? fetch,
    TResult? Function(_ChangeCategoryCategoryDetailEvent value)? changeCategory,
    TResult? Function(_ChangeOperationsCategoryDetailEvent value)?
        changeOperations,
  }) {
    return changeCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchCategoryDetailEvent value)? fetch,
    TResult Function(_ChangeCategoryCategoryDetailEvent value)? changeCategory,
    TResult Function(_ChangeOperationsCategoryDetailEvent value)?
        changeOperations,
    required TResult orElse(),
  }) {
    if (changeCategory != null) {
      return changeCategory(this);
    }
    return orElse();
  }
}

abstract class _ChangeCategoryCategoryDetailEvent
    implements CategoryDetailEvent {
  const factory _ChangeCategoryCategoryDetailEvent(
          {required final Category category}) =
      _$ChangeCategoryCategoryDetailEventImpl;

  Category get category;
  @JsonKey(ignore: true)
  _$$ChangeCategoryCategoryDetailEventImplCopyWith<
          _$ChangeCategoryCategoryDetailEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeOperationsCategoryDetailEventImplCopyWith<$Res> {
  factory _$$ChangeOperationsCategoryDetailEventImplCopyWith(
          _$ChangeOperationsCategoryDetailEventImpl value,
          $Res Function(_$ChangeOperationsCategoryDetailEventImpl) then) =
      __$$ChangeOperationsCategoryDetailEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Operation> operations});
}

/// @nodoc
class __$$ChangeOperationsCategoryDetailEventImplCopyWithImpl<$Res>
    extends _$CategoryDetailEventCopyWithImpl<$Res,
        _$ChangeOperationsCategoryDetailEventImpl>
    implements _$$ChangeOperationsCategoryDetailEventImplCopyWith<$Res> {
  __$$ChangeOperationsCategoryDetailEventImplCopyWithImpl(
      _$ChangeOperationsCategoryDetailEventImpl _value,
      $Res Function(_$ChangeOperationsCategoryDetailEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operations = null,
  }) {
    return _then(_$ChangeOperationsCategoryDetailEventImpl(
      operations: null == operations
          ? _value._operations
          : operations // ignore: cast_nullable_to_non_nullable
              as List<Operation>,
    ));
  }
}

/// @nodoc

class _$ChangeOperationsCategoryDetailEventImpl
    implements _ChangeOperationsCategoryDetailEvent {
  const _$ChangeOperationsCategoryDetailEventImpl(
      {required final List<Operation> operations})
      : _operations = operations;

  final List<Operation> _operations;
  @override
  List<Operation> get operations {
    if (_operations is EqualUnmodifiableListView) return _operations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_operations);
  }

  @override
  String toString() {
    return 'CategoryDetailEvent.changeOperations(operations: $operations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeOperationsCategoryDetailEventImpl &&
            const DeepCollectionEquality()
                .equals(other._operations, _operations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_operations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeOperationsCategoryDetailEventImplCopyWith<
          _$ChangeOperationsCategoryDetailEventImpl>
      get copyWith => __$$ChangeOperationsCategoryDetailEventImplCopyWithImpl<
          _$ChangeOperationsCategoryDetailEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int categoryId) fetch,
    required TResult Function(Category category) changeCategory,
    required TResult Function(List<Operation> operations) changeOperations,
  }) {
    return changeOperations(operations);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int categoryId)? fetch,
    TResult? Function(Category category)? changeCategory,
    TResult? Function(List<Operation> operations)? changeOperations,
  }) {
    return changeOperations?.call(operations);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int categoryId)? fetch,
    TResult Function(Category category)? changeCategory,
    TResult Function(List<Operation> operations)? changeOperations,
    required TResult orElse(),
  }) {
    if (changeOperations != null) {
      return changeOperations(operations);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchCategoryDetailEvent value) fetch,
    required TResult Function(_ChangeCategoryCategoryDetailEvent value)
        changeCategory,
    required TResult Function(_ChangeOperationsCategoryDetailEvent value)
        changeOperations,
  }) {
    return changeOperations(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchCategoryDetailEvent value)? fetch,
    TResult? Function(_ChangeCategoryCategoryDetailEvent value)? changeCategory,
    TResult? Function(_ChangeOperationsCategoryDetailEvent value)?
        changeOperations,
  }) {
    return changeOperations?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchCategoryDetailEvent value)? fetch,
    TResult Function(_ChangeCategoryCategoryDetailEvent value)? changeCategory,
    TResult Function(_ChangeOperationsCategoryDetailEvent value)?
        changeOperations,
    required TResult orElse(),
  }) {
    if (changeOperations != null) {
      return changeOperations(this);
    }
    return orElse();
  }
}

abstract class _ChangeOperationsCategoryDetailEvent
    implements CategoryDetailEvent {
  const factory _ChangeOperationsCategoryDetailEvent(
          {required final List<Operation> operations}) =
      _$ChangeOperationsCategoryDetailEventImpl;

  List<Operation> get operations;
  @JsonKey(ignore: true)
  _$$ChangeOperationsCategoryDetailEventImplCopyWith<
          _$ChangeOperationsCategoryDetailEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CategoryDetailState {
  BudgetType get budgetType => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get budget => throw _privateConstructorUsedError;
  List<Operation> get operations => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryDetailStateCopyWith<CategoryDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryDetailStateCopyWith<$Res> {
  factory $CategoryDetailStateCopyWith(
          CategoryDetailState value, $Res Function(CategoryDetailState) then) =
      _$CategoryDetailStateCopyWithImpl<$Res, CategoryDetailState>;
  @useResult
  $Res call(
      {BudgetType budgetType,
      String title,
      int budget,
      List<Operation> operations});
}

/// @nodoc
class _$CategoryDetailStateCopyWithImpl<$Res, $Val extends CategoryDetailState>
    implements $CategoryDetailStateCopyWith<$Res> {
  _$CategoryDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? budgetType = null,
    Object? title = null,
    Object? budget = null,
    Object? operations = null,
  }) {
    return _then(_value.copyWith(
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
      operations: null == operations
          ? _value.operations
          : operations // ignore: cast_nullable_to_non_nullable
              as List<Operation>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryDetailStateImplCopyWith<$Res>
    implements $CategoryDetailStateCopyWith<$Res> {
  factory _$$CategoryDetailStateImplCopyWith(_$CategoryDetailStateImpl value,
          $Res Function(_$CategoryDetailStateImpl) then) =
      __$$CategoryDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BudgetType budgetType,
      String title,
      int budget,
      List<Operation> operations});
}

/// @nodoc
class __$$CategoryDetailStateImplCopyWithImpl<$Res>
    extends _$CategoryDetailStateCopyWithImpl<$Res, _$CategoryDetailStateImpl>
    implements _$$CategoryDetailStateImplCopyWith<$Res> {
  __$$CategoryDetailStateImplCopyWithImpl(_$CategoryDetailStateImpl _value,
      $Res Function(_$CategoryDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? budgetType = null,
    Object? title = null,
    Object? budget = null,
    Object? operations = null,
  }) {
    return _then(_$CategoryDetailStateImpl(
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
      operations: null == operations
          ? _value._operations
          : operations // ignore: cast_nullable_to_non_nullable
              as List<Operation>,
    ));
  }
}

/// @nodoc

class _$CategoryDetailStateImpl implements _CategoryDetailState {
  const _$CategoryDetailStateImpl(
      {required this.budgetType,
      required this.title,
      required this.budget,
      required final List<Operation> operations})
      : _operations = operations;

  @override
  final BudgetType budgetType;
  @override
  final String title;
  @override
  final int budget;
  final List<Operation> _operations;
  @override
  List<Operation> get operations {
    if (_operations is EqualUnmodifiableListView) return _operations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_operations);
  }

  @override
  String toString() {
    return 'CategoryDetailState(budgetType: $budgetType, title: $title, budget: $budget, operations: $operations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryDetailStateImpl &&
            (identical(other.budgetType, budgetType) ||
                other.budgetType == budgetType) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.budget, budget) || other.budget == budget) &&
            const DeepCollectionEquality()
                .equals(other._operations, _operations));
  }

  @override
  int get hashCode => Object.hash(runtimeType, budgetType, title, budget,
      const DeepCollectionEquality().hash(_operations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryDetailStateImplCopyWith<_$CategoryDetailStateImpl> get copyWith =>
      __$$CategoryDetailStateImplCopyWithImpl<_$CategoryDetailStateImpl>(
          this, _$identity);
}

abstract class _CategoryDetailState implements CategoryDetailState {
  const factory _CategoryDetailState(
      {required final BudgetType budgetType,
      required final String title,
      required final int budget,
      required final List<Operation> operations}) = _$CategoryDetailStateImpl;

  @override
  BudgetType get budgetType;
  @override
  String get title;
  @override
  int get budget;
  @override
  List<Operation> get operations;
  @override
  @JsonKey(ignore: true)
  _$$CategoryDetailStateImplCopyWith<_$CategoryDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
