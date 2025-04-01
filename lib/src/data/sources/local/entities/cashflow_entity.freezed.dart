// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cashflow_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CashflowEntity {
  int get categoryId => throw _privateConstructorUsedError;
  Sum get sum => throw _privateConstructorUsedError;

  /// Create a copy of CashflowEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CashflowEntityCopyWith<CashflowEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CashflowEntityCopyWith<$Res> {
  factory $CashflowEntityCopyWith(
          CashflowEntity value, $Res Function(CashflowEntity) then) =
      _$CashflowEntityCopyWithImpl<$Res, CashflowEntity>;
  @useResult
  $Res call({int categoryId, Sum sum});
}

/// @nodoc
class _$CashflowEntityCopyWithImpl<$Res, $Val extends CashflowEntity>
    implements $CashflowEntityCopyWith<$Res> {
  _$CashflowEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CashflowEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? sum = null,
  }) {
    return _then(_value.copyWith(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      sum: null == sum
          ? _value.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as Sum,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CashflowEntityImplCopyWith<$Res>
    implements $CashflowEntityCopyWith<$Res> {
  factory _$$CashflowEntityImplCopyWith(_$CashflowEntityImpl value,
          $Res Function(_$CashflowEntityImpl) then) =
      __$$CashflowEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int categoryId, Sum sum});
}

/// @nodoc
class __$$CashflowEntityImplCopyWithImpl<$Res>
    extends _$CashflowEntityCopyWithImpl<$Res, _$CashflowEntityImpl>
    implements _$$CashflowEntityImplCopyWith<$Res> {
  __$$CashflowEntityImplCopyWithImpl(
      _$CashflowEntityImpl _value, $Res Function(_$CashflowEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of CashflowEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? sum = null,
  }) {
    return _then(_$CashflowEntityImpl(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      sum: null == sum
          ? _value.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as Sum,
    ));
  }
}

/// @nodoc

class _$CashflowEntityImpl implements _CashflowEntity {
  const _$CashflowEntityImpl({required this.categoryId, required this.sum});

  @override
  final int categoryId;
  @override
  final Sum sum;

  @override
  String toString() {
    return 'CashflowEntity(categoryId: $categoryId, sum: $sum)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CashflowEntityImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.sum, sum) || other.sum == sum));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryId, sum);

  /// Create a copy of CashflowEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CashflowEntityImplCopyWith<_$CashflowEntityImpl> get copyWith =>
      __$$CashflowEntityImplCopyWithImpl<_$CashflowEntityImpl>(
          this, _$identity);
}

abstract class _CashflowEntity implements CashflowEntity {
  const factory _CashflowEntity(
      {required final int categoryId,
      required final Sum sum}) = _$CashflowEntityImpl;

  @override
  int get categoryId;
  @override
  Sum get sum;

  /// Create a copy of CashflowEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CashflowEntityImplCopyWith<_$CashflowEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
