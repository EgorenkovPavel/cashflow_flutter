// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_cashflow_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CategoryCashflowEntity {
  CategoryDB get category => throw _privateConstructorUsedError;
  int get monthCashflow => throw _privateConstructorUsedError;
  int get yearCashflow => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryCashflowEntityCopyWith<CategoryCashflowEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCashflowEntityCopyWith<$Res> {
  factory $CategoryCashflowEntityCopyWith(CategoryCashflowEntity value,
          $Res Function(CategoryCashflowEntity) then) =
      _$CategoryCashflowEntityCopyWithImpl<$Res, CategoryCashflowEntity>;
  @useResult
  $Res call({CategoryDB category, int monthCashflow, int yearCashflow});
}

/// @nodoc
class _$CategoryCashflowEntityCopyWithImpl<$Res,
        $Val extends CategoryCashflowEntity>
    implements $CategoryCashflowEntityCopyWith<$Res> {
  _$CategoryCashflowEntityCopyWithImpl(this._value, this._then);

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
              as CategoryDB,
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
}

/// @nodoc
abstract class _$$CategoryCashflowEntityImplCopyWith<$Res>
    implements $CategoryCashflowEntityCopyWith<$Res> {
  factory _$$CategoryCashflowEntityImplCopyWith(
          _$CategoryCashflowEntityImpl value,
          $Res Function(_$CategoryCashflowEntityImpl) then) =
      __$$CategoryCashflowEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CategoryDB category, int monthCashflow, int yearCashflow});
}

/// @nodoc
class __$$CategoryCashflowEntityImplCopyWithImpl<$Res>
    extends _$CategoryCashflowEntityCopyWithImpl<$Res,
        _$CategoryCashflowEntityImpl>
    implements _$$CategoryCashflowEntityImplCopyWith<$Res> {
  __$$CategoryCashflowEntityImplCopyWithImpl(
      _$CategoryCashflowEntityImpl _value,
      $Res Function(_$CategoryCashflowEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? monthCashflow = null,
    Object? yearCashflow = null,
  }) {
    return _then(_$CategoryCashflowEntityImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryDB,
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

class _$CategoryCashflowEntityImpl implements _CategoryCashflowEntity {
  const _$CategoryCashflowEntityImpl(
      {required this.category,
      required this.monthCashflow,
      required this.yearCashflow});

  @override
  final CategoryDB category;
  @override
  final int monthCashflow;
  @override
  final int yearCashflow;

  @override
  String toString() {
    return 'CategoryCashflowEntity(category: $category, monthCashflow: $monthCashflow, yearCashflow: $yearCashflow)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryCashflowEntityImpl &&
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
  _$$CategoryCashflowEntityImplCopyWith<_$CategoryCashflowEntityImpl>
      get copyWith => __$$CategoryCashflowEntityImplCopyWithImpl<
          _$CategoryCashflowEntityImpl>(this, _$identity);
}

abstract class _CategoryCashflowEntity implements CategoryCashflowEntity {
  const factory _CategoryCashflowEntity(
      {required final CategoryDB category,
      required final int monthCashflow,
      required final int yearCashflow}) = _$CategoryCashflowEntityImpl;

  @override
  CategoryDB get category;
  @override
  int get monthCashflow;
  @override
  int get yearCashflow;
  @override
  @JsonKey(ignore: true)
  _$$CategoryCashflowEntityImplCopyWith<_$CategoryCashflowEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
