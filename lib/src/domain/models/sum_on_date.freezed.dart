// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sum_on_date.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SumOnDate {
  DateTime get date => throw _privateConstructorUsedError;
  int get sum => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SumOnDateCopyWith<SumOnDate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SumOnDateCopyWith<$Res> {
  factory $SumOnDateCopyWith(SumOnDate value, $Res Function(SumOnDate) then) =
      _$SumOnDateCopyWithImpl<$Res, SumOnDate>;
  @useResult
  $Res call({DateTime date, int sum});
}

/// @nodoc
class _$SumOnDateCopyWithImpl<$Res, $Val extends SumOnDate>
    implements $SumOnDateCopyWith<$Res> {
  _$SumOnDateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? sum = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sum: null == sum
          ? _value.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SumOnDateImplCopyWith<$Res>
    implements $SumOnDateCopyWith<$Res> {
  factory _$$SumOnDateImplCopyWith(
          _$SumOnDateImpl value, $Res Function(_$SumOnDateImpl) then) =
      __$$SumOnDateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, int sum});
}

/// @nodoc
class __$$SumOnDateImplCopyWithImpl<$Res>
    extends _$SumOnDateCopyWithImpl<$Res, _$SumOnDateImpl>
    implements _$$SumOnDateImplCopyWith<$Res> {
  __$$SumOnDateImplCopyWithImpl(
      _$SumOnDateImpl _value, $Res Function(_$SumOnDateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? sum = null,
  }) {
    return _then(_$SumOnDateImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sum: null == sum
          ? _value.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SumOnDateImpl implements _SumOnDate {
  const _$SumOnDateImpl({required this.date, required this.sum});

  @override
  final DateTime date;
  @override
  final int sum;

  @override
  String toString() {
    return 'SumOnDate(date: $date, sum: $sum)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SumOnDateImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.sum, sum) || other.sum == sum));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date, sum);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SumOnDateImplCopyWith<_$SumOnDateImpl> get copyWith =>
      __$$SumOnDateImplCopyWithImpl<_$SumOnDateImpl>(this, _$identity);
}

abstract class _SumOnDate implements SumOnDate {
  const factory _SumOnDate(
      {required final DateTime date, required final int sum}) = _$SumOnDateImpl;

  @override
  DateTime get date;
  @override
  int get sum;
  @override
  @JsonKey(ignore: true)
  _$$SumOnDateImplCopyWith<_$SumOnDateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
