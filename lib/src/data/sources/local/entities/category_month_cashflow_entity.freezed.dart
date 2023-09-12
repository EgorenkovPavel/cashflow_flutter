// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_month_cashflow_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CategoryMonthCashflowEntity {
  CategoryDB get category => throw _privateConstructorUsedError;
  int get month => throw _privateConstructorUsedError;
  int get cashflow => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryMonthCashflowEntityCopyWith<CategoryMonthCashflowEntity>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryMonthCashflowEntityCopyWith<$Res> {
  factory $CategoryMonthCashflowEntityCopyWith(
          CategoryMonthCashflowEntity value,
          $Res Function(CategoryMonthCashflowEntity) then) =
      _$CategoryMonthCashflowEntityCopyWithImpl<$Res,
          CategoryMonthCashflowEntity>;
  @useResult
  $Res call({CategoryDB category, int month, int cashflow});
}

/// @nodoc
class _$CategoryMonthCashflowEntityCopyWithImpl<$Res,
        $Val extends CategoryMonthCashflowEntity>
    implements $CategoryMonthCashflowEntityCopyWith<$Res> {
  _$CategoryMonthCashflowEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? month = null,
    Object? cashflow = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryDB,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      cashflow: null == cashflow
          ? _value.cashflow
          : cashflow // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoryMonthCashflowEntityCopyWith<$Res>
    implements $CategoryMonthCashflowEntityCopyWith<$Res> {
  factory _$$_CategoryMonthCashflowEntityCopyWith(
          _$_CategoryMonthCashflowEntity value,
          $Res Function(_$_CategoryMonthCashflowEntity) then) =
      __$$_CategoryMonthCashflowEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CategoryDB category, int month, int cashflow});
}

/// @nodoc
class __$$_CategoryMonthCashflowEntityCopyWithImpl<$Res>
    extends _$CategoryMonthCashflowEntityCopyWithImpl<$Res,
        _$_CategoryMonthCashflowEntity>
    implements _$$_CategoryMonthCashflowEntityCopyWith<$Res> {
  __$$_CategoryMonthCashflowEntityCopyWithImpl(
      _$_CategoryMonthCashflowEntity _value,
      $Res Function(_$_CategoryMonthCashflowEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? month = null,
    Object? cashflow = null,
  }) {
    return _then(_$_CategoryMonthCashflowEntity(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryDB,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      cashflow: null == cashflow
          ? _value.cashflow
          : cashflow // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_CategoryMonthCashflowEntity implements _CategoryMonthCashflowEntity {
  const _$_CategoryMonthCashflowEntity(
      {required this.category, required this.month, required this.cashflow});

  @override
  final CategoryDB category;
  @override
  final int month;
  @override
  final int cashflow;

  @override
  String toString() {
    return 'CategoryMonthCashflowEntity(category: $category, month: $month, cashflow: $cashflow)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryMonthCashflowEntity &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.cashflow, cashflow) ||
                other.cashflow == cashflow));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category, month, cashflow);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryMonthCashflowEntityCopyWith<_$_CategoryMonthCashflowEntity>
      get copyWith => __$$_CategoryMonthCashflowEntityCopyWithImpl<
          _$_CategoryMonthCashflowEntity>(this, _$identity);
}

abstract class _CategoryMonthCashflowEntity
    implements CategoryMonthCashflowEntity {
  const factory _CategoryMonthCashflowEntity(
      {required final CategoryDB category,
      required final int month,
      required final int cashflow}) = _$_CategoryMonthCashflowEntity;

  @override
  CategoryDB get category;
  @override
  int get month;
  @override
  int get cashflow;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryMonthCashflowEntityCopyWith<_$_CategoryMonthCashflowEntity>
      get copyWith => throw _privateConstructorUsedError;
}
