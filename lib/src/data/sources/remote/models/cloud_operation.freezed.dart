// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cloud_operation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CloudOperation {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  int get operationType => throw _privateConstructorUsedError;
  String get account => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get recAccount => throw _privateConstructorUsedError;
  int get sum => throw _privateConstructorUsedError;
  int get recSum => throw _privateConstructorUsedError;
  bool get deleted => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CloudOperationCopyWith<CloudOperation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CloudOperationCopyWith<$Res> {
  factory $CloudOperationCopyWith(
          CloudOperation value, $Res Function(CloudOperation) then) =
      _$CloudOperationCopyWithImpl<$Res, CloudOperation>;
  @useResult
  $Res call(
      {String id,
      DateTime date,
      int operationType,
      String account,
      String? category,
      String? recAccount,
      int sum,
      int recSum,
      bool deleted});
}

/// @nodoc
class _$CloudOperationCopyWithImpl<$Res, $Val extends CloudOperation>
    implements $CloudOperationCopyWith<$Res> {
  _$CloudOperationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? operationType = null,
    Object? account = null,
    Object? category = freezed,
    Object? recAccount = freezed,
    Object? sum = null,
    Object? recSum = null,
    Object? deleted = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      operationType: null == operationType
          ? _value.operationType
          : operationType // ignore: cast_nullable_to_non_nullable
              as int,
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      recAccount: freezed == recAccount
          ? _value.recAccount
          : recAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      sum: null == sum
          ? _value.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as int,
      recSum: null == recSum
          ? _value.recSum
          : recSum // ignore: cast_nullable_to_non_nullable
              as int,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CloudOperationImplCopyWith<$Res>
    implements $CloudOperationCopyWith<$Res> {
  factory _$$CloudOperationImplCopyWith(_$CloudOperationImpl value,
          $Res Function(_$CloudOperationImpl) then) =
      __$$CloudOperationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime date,
      int operationType,
      String account,
      String? category,
      String? recAccount,
      int sum,
      int recSum,
      bool deleted});
}

/// @nodoc
class __$$CloudOperationImplCopyWithImpl<$Res>
    extends _$CloudOperationCopyWithImpl<$Res, _$CloudOperationImpl>
    implements _$$CloudOperationImplCopyWith<$Res> {
  __$$CloudOperationImplCopyWithImpl(
      _$CloudOperationImpl _value, $Res Function(_$CloudOperationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? operationType = null,
    Object? account = null,
    Object? category = freezed,
    Object? recAccount = freezed,
    Object? sum = null,
    Object? recSum = null,
    Object? deleted = null,
  }) {
    return _then(_$CloudOperationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      operationType: null == operationType
          ? _value.operationType
          : operationType // ignore: cast_nullable_to_non_nullable
              as int,
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      recAccount: freezed == recAccount
          ? _value.recAccount
          : recAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      sum: null == sum
          ? _value.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as int,
      recSum: null == recSum
          ? _value.recSum
          : recSum // ignore: cast_nullable_to_non_nullable
              as int,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CloudOperationImpl implements _CloudOperation {
  const _$CloudOperationImpl(
      {required this.id,
      required this.date,
      required this.operationType,
      required this.account,
      this.category,
      this.recAccount,
      required this.sum,
      required this.recSum,
      required this.deleted});

  @override
  final String id;
  @override
  final DateTime date;
  @override
  final int operationType;
  @override
  final String account;
  @override
  final String? category;
  @override
  final String? recAccount;
  @override
  final int sum;
  @override
  final int recSum;
  @override
  final bool deleted;

  @override
  String toString() {
    return 'CloudOperation(id: $id, date: $date, operationType: $operationType, account: $account, category: $category, recAccount: $recAccount, sum: $sum, recSum: $recSum, deleted: $deleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CloudOperationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.operationType, operationType) ||
                other.operationType == operationType) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.recAccount, recAccount) ||
                other.recAccount == recAccount) &&
            (identical(other.sum, sum) || other.sum == sum) &&
            (identical(other.recSum, recSum) || other.recSum == recSum) &&
            (identical(other.deleted, deleted) || other.deleted == deleted));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, date, operationType, account,
      category, recAccount, sum, recSum, deleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CloudOperationImplCopyWith<_$CloudOperationImpl> get copyWith =>
      __$$CloudOperationImplCopyWithImpl<_$CloudOperationImpl>(
          this, _$identity);
}

abstract class _CloudOperation implements CloudOperation {
  const factory _CloudOperation(
      {required final String id,
      required final DateTime date,
      required final int operationType,
      required final String account,
      final String? category,
      final String? recAccount,
      required final int sum,
      required final int recSum,
      required final bool deleted}) = _$CloudOperationImpl;

  @override
  String get id;
  @override
  DateTime get date;
  @override
  int get operationType;
  @override
  String get account;
  @override
  String? get category;
  @override
  String? get recAccount;
  @override
  int get sum;
  @override
  int get recSum;
  @override
  bool get deleted;
  @override
  @JsonKey(ignore: true)
  _$$CloudOperationImplCopyWith<_$CloudOperationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}