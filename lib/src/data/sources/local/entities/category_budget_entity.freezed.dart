// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_budget_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CategoryBudgetEntity {
  CategoryDB get category => throw _privateConstructorUsedError;
  int get budget => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryBudgetEntityCopyWith<CategoryBudgetEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryBudgetEntityCopyWith<$Res> {
  factory $CategoryBudgetEntityCopyWith(CategoryBudgetEntity value,
          $Res Function(CategoryBudgetEntity) then) =
      _$CategoryBudgetEntityCopyWithImpl<$Res, CategoryBudgetEntity>;
  @useResult
  $Res call({CategoryDB category, int budget});
}

/// @nodoc
class _$CategoryBudgetEntityCopyWithImpl<$Res,
        $Val extends CategoryBudgetEntity>
    implements $CategoryBudgetEntityCopyWith<$Res> {
  _$CategoryBudgetEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? budget = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryDB,
      budget: null == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoryBudgetEntityCopyWith<$Res>
    implements $CategoryBudgetEntityCopyWith<$Res> {
  factory _$$_CategoryBudgetEntityCopyWith(_$_CategoryBudgetEntity value,
          $Res Function(_$_CategoryBudgetEntity) then) =
      __$$_CategoryBudgetEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CategoryDB category, int budget});
}

/// @nodoc
class __$$_CategoryBudgetEntityCopyWithImpl<$Res>
    extends _$CategoryBudgetEntityCopyWithImpl<$Res, _$_CategoryBudgetEntity>
    implements _$$_CategoryBudgetEntityCopyWith<$Res> {
  __$$_CategoryBudgetEntityCopyWithImpl(_$_CategoryBudgetEntity _value,
      $Res Function(_$_CategoryBudgetEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? budget = null,
  }) {
    return _then(_$_CategoryBudgetEntity(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryDB,
      budget: null == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_CategoryBudgetEntity implements _CategoryBudgetEntity {
  const _$_CategoryBudgetEntity({required this.category, required this.budget});

  @override
  final CategoryDB category;
  @override
  final int budget;

  @override
  String toString() {
    return 'CategoryBudgetEntity(category: $category, budget: $budget)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryBudgetEntity &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.budget, budget) || other.budget == budget));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category, budget);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryBudgetEntityCopyWith<_$_CategoryBudgetEntity> get copyWith =>
      __$$_CategoryBudgetEntityCopyWithImpl<_$_CategoryBudgetEntity>(
          this, _$identity);
}

abstract class _CategoryBudgetEntity implements CategoryBudgetEntity {
  const factory _CategoryBudgetEntity(
      {required final CategoryDB category,
      required final int budget}) = _$_CategoryBudgetEntity;

  @override
  CategoryDB get category;
  @override
  int get budget;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryBudgetEntityCopyWith<_$_CategoryBudgetEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
