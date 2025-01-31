// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_month_cashflow.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CategoryMonthCashflow {
  Category get category => throw _privateConstructorUsedError;
  int get month => throw _privateConstructorUsedError;
  int get cashflow => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryMonthCashflowCopyWith<CategoryMonthCashflow> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryMonthCashflowCopyWith<$Res> {
  factory $CategoryMonthCashflowCopyWith(CategoryMonthCashflow value,
          $Res Function(CategoryMonthCashflow) then) =
      _$CategoryMonthCashflowCopyWithImpl<$Res, CategoryMonthCashflow>;
  @useResult
  $Res call({Category category, int month, int cashflow});

  $CategoryCopyWith<$Res> get category;
}

/// @nodoc
class _$CategoryMonthCashflowCopyWithImpl<$Res,
        $Val extends CategoryMonthCashflow>
    implements $CategoryMonthCashflowCopyWith<$Res> {
  _$CategoryMonthCashflowCopyWithImpl(this._value, this._then);

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
              as Category,
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

  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res> get category {
    return $CategoryCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CategoryMonthCashflowImplCopyWith<$Res>
    implements $CategoryMonthCashflowCopyWith<$Res> {
  factory _$$CategoryMonthCashflowImplCopyWith(
          _$CategoryMonthCashflowImpl value,
          $Res Function(_$CategoryMonthCashflowImpl) then) =
      __$$CategoryMonthCashflowImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Category category, int month, int cashflow});

  @override
  $CategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$$CategoryMonthCashflowImplCopyWithImpl<$Res>
    extends _$CategoryMonthCashflowCopyWithImpl<$Res,
        _$CategoryMonthCashflowImpl>
    implements _$$CategoryMonthCashflowImplCopyWith<$Res> {
  __$$CategoryMonthCashflowImplCopyWithImpl(_$CategoryMonthCashflowImpl _value,
      $Res Function(_$CategoryMonthCashflowImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? month = null,
    Object? cashflow = null,
  }) {
    return _then(_$CategoryMonthCashflowImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
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

class _$CategoryMonthCashflowImpl implements _CategoryMonthCashflow {
  const _$CategoryMonthCashflowImpl(
      {required this.category, required this.month, required this.cashflow});

  @override
  final Category category;
  @override
  final int month;
  @override
  final int cashflow;

  @override
  String toString() {
    return 'CategoryMonthCashflow(category: $category, month: $month, cashflow: $cashflow)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryMonthCashflowImpl &&
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
  _$$CategoryMonthCashflowImplCopyWith<_$CategoryMonthCashflowImpl>
      get copyWith => __$$CategoryMonthCashflowImplCopyWithImpl<
          _$CategoryMonthCashflowImpl>(this, _$identity);
}

abstract class _CategoryMonthCashflow implements CategoryMonthCashflow {
  const factory _CategoryMonthCashflow(
      {required final Category category,
      required final int month,
      required final int cashflow}) = _$CategoryMonthCashflowImpl;

  @override
  Category get category;
  @override
  int get month;
  @override
  int get cashflow;
  @override
  @JsonKey(ignore: true)
  _$$CategoryMonthCashflowImplCopyWith<_$CategoryMonthCashflowImpl>
      get copyWith => throw _privateConstructorUsedError;
}
