// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'balance_on_date_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BalanceOnDate {
  DateTime get date => throw _privateConstructorUsedError;
  int get sum => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BalanceOnDateCopyWith<BalanceOnDate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BalanceOnDateCopyWith<$Res> {
  factory $BalanceOnDateCopyWith(
          BalanceOnDate value, $Res Function(BalanceOnDate) then) =
      _$BalanceOnDateCopyWithImpl<$Res, BalanceOnDate>;
  @useResult
  $Res call({DateTime date, int sum});
}

/// @nodoc
class _$BalanceOnDateCopyWithImpl<$Res, $Val extends BalanceOnDate>
    implements $BalanceOnDateCopyWith<$Res> {
  _$BalanceOnDateCopyWithImpl(this._value, this._then);

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
abstract class _$$BalanceOnDateImplCopyWith<$Res>
    implements $BalanceOnDateCopyWith<$Res> {
  factory _$$BalanceOnDateImplCopyWith(
          _$BalanceOnDateImpl value, $Res Function(_$BalanceOnDateImpl) then) =
      __$$BalanceOnDateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, int sum});
}

/// @nodoc
class __$$BalanceOnDateImplCopyWithImpl<$Res>
    extends _$BalanceOnDateCopyWithImpl<$Res, _$BalanceOnDateImpl>
    implements _$$BalanceOnDateImplCopyWith<$Res> {
  __$$BalanceOnDateImplCopyWithImpl(
      _$BalanceOnDateImpl _value, $Res Function(_$BalanceOnDateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? sum = null,
  }) {
    return _then(_$BalanceOnDateImpl(
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

class _$BalanceOnDateImpl implements _BalanceOnDate {
  const _$BalanceOnDateImpl({required this.date, required this.sum});

  @override
  final DateTime date;
  @override
  final int sum;

  @override
  String toString() {
    return 'BalanceOnDate(date: $date, sum: $sum)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BalanceOnDateImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.sum, sum) || other.sum == sum));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date, sum);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BalanceOnDateImplCopyWith<_$BalanceOnDateImpl> get copyWith =>
      __$$BalanceOnDateImplCopyWithImpl<_$BalanceOnDateImpl>(this, _$identity);
}

abstract class _BalanceOnDate implements BalanceOnDate {
  const factory _BalanceOnDate(
      {required final DateTime date,
      required final int sum}) = _$BalanceOnDateImpl;

  @override
  DateTime get date;
  @override
  int get sum;
  @override
  @JsonKey(ignore: true)
  _$$BalanceOnDateImplCopyWith<_$BalanceOnDateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}