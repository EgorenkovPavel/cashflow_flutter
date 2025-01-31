// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_cashflow.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CategoryCashflow {
  Category get category => throw _privateConstructorUsedError;
  int get monthCashflow => throw _privateConstructorUsedError;
  int get yearCashflow => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryCashflowCopyWith<CategoryCashflow> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCashflowCopyWith<$Res> {
  factory $CategoryCashflowCopyWith(
          CategoryCashflow value, $Res Function(CategoryCashflow) then) =
      _$CategoryCashflowCopyWithImpl<$Res, CategoryCashflow>;
  @useResult
  $Res call({Category category, int monthCashflow, int yearCashflow});

  $CategoryCopyWith<$Res> get category;
}

/// @nodoc
class _$CategoryCashflowCopyWithImpl<$Res, $Val extends CategoryCashflow>
    implements $CategoryCashflowCopyWith<$Res> {
  _$CategoryCashflowCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? monthCashflow = null,
    Object? yearCashflow = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      monthCashflow: null == monthCashflow
          ? _value.monthCashflow
          : monthCashflow // ignore: cast_nullable_to_non_nullable
              as int,
      yearCashflow: null == yearCashflow
          ? _value.yearCashflow
          : yearCashflow // ignore: cast_nullable_to_non_nullable
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
abstract class _$$CategoryCashflowImplCopyWith<$Res>
    implements $CategoryCashflowCopyWith<$Res> {
  factory _$$CategoryCashflowImplCopyWith(_$CategoryCashflowImpl value,
          $Res Function(_$CategoryCashflowImpl) then) =
      __$$CategoryCashflowImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Category category, int monthCashflow, int yearCashflow});

  @override
  $CategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$$CategoryCashflowImplCopyWithImpl<$Res>
    extends _$CategoryCashflowCopyWithImpl<$Res, _$CategoryCashflowImpl>
    implements _$$CategoryCashflowImplCopyWith<$Res> {
  __$$CategoryCashflowImplCopyWithImpl(_$CategoryCashflowImpl _value,
      $Res Function(_$CategoryCashflowImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? monthCashflow = null,
    Object? yearCashflow = null,
  }) {
    return _then(_$CategoryCashflowImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      monthCashflow: null == monthCashflow
          ? _value.monthCashflow
          : monthCashflow // ignore: cast_nullable_to_non_nullable
              as int,
      yearCashflow: null == yearCashflow
          ? _value.yearCashflow
          : yearCashflow // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CategoryCashflowImpl implements _CategoryCashflow {
  const _$CategoryCashflowImpl(
      {required this.category,
      required this.monthCashflow,
      required this.yearCashflow});

  @override
  final Category category;
  @override
  final int monthCashflow;
  @override
  final int yearCashflow;

  @override
  String toString() {
    return 'CategoryCashflow(category: $category, monthCashflow: $monthCashflow, yearCashflow: $yearCashflow)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryCashflowImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.monthCashflow, monthCashflow) ||
                other.monthCashflow == monthCashflow) &&
            (identical(other.yearCashflow, yearCashflow) ||
                other.yearCashflow == yearCashflow));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, category, monthCashflow, yearCashflow);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryCashflowImplCopyWith<_$CategoryCashflowImpl> get copyWith =>
      __$$CategoryCashflowImplCopyWithImpl<_$CategoryCashflowImpl>(
          this, _$identity);
}

abstract class _CategoryCashflow implements CategoryCashflow {
  const factory _CategoryCashflow(
      {required final Category category,
      required final int monthCashflow,
      required final int yearCashflow}) = _$CategoryCashflowImpl;

  @override
  Category get category;
  @override
  int get monthCashflow;
  @override
  int get yearCashflow;
  @override
  @JsonKey(ignore: true)
  _$$CategoryCashflowImplCopyWith<_$CategoryCashflowImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
