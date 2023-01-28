// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'operation_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OperationDbEntity {
  OperationDB get operation => throw _privateConstructorUsedError;
  AccountDB get account => throw _privateConstructorUsedError;
  CategoryDB? get category => throw _privateConstructorUsedError;
  AccountDB? get recAccount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OperationDbEntityCopyWith<OperationDbEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OperationDbEntityCopyWith<$Res> {
  factory $OperationDbEntityCopyWith(
          OperationDbEntity value, $Res Function(OperationDbEntity) then) =
      _$OperationDbEntityCopyWithImpl<$Res, OperationDbEntity>;
  @useResult
  $Res call(
      {OperationDB operation,
      AccountDB account,
      CategoryDB? category,
      AccountDB? recAccount});
}

/// @nodoc
class _$OperationDbEntityCopyWithImpl<$Res, $Val extends OperationDbEntity>
    implements $OperationDbEntityCopyWith<$Res> {
  _$OperationDbEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operation = freezed,
    Object? account = freezed,
    Object? category = freezed,
    Object? recAccount = freezed,
  }) {
    return _then(_value.copyWith(
      operation: freezed == operation
          ? _value.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as OperationDB,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as AccountDB,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryDB?,
      recAccount: freezed == recAccount
          ? _value.recAccount
          : recAccount // ignore: cast_nullable_to_non_nullable
              as AccountDB?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OperationDbEntityCopyWith<$Res>
    implements $OperationDbEntityCopyWith<$Res> {
  factory _$$_OperationDbEntityCopyWith(_$_OperationDbEntity value,
          $Res Function(_$_OperationDbEntity) then) =
      __$$_OperationDbEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {OperationDB operation,
      AccountDB account,
      CategoryDB? category,
      AccountDB? recAccount});
}

/// @nodoc
class __$$_OperationDbEntityCopyWithImpl<$Res>
    extends _$OperationDbEntityCopyWithImpl<$Res, _$_OperationDbEntity>
    implements _$$_OperationDbEntityCopyWith<$Res> {
  __$$_OperationDbEntityCopyWithImpl(
      _$_OperationDbEntity _value, $Res Function(_$_OperationDbEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operation = freezed,
    Object? account = freezed,
    Object? category = freezed,
    Object? recAccount = freezed,
  }) {
    return _then(_$_OperationDbEntity(
      operation: freezed == operation
          ? _value.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as OperationDB,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as AccountDB,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryDB?,
      recAccount: freezed == recAccount
          ? _value.recAccount
          : recAccount // ignore: cast_nullable_to_non_nullable
              as AccountDB?,
    ));
  }
}

/// @nodoc

class _$_OperationDbEntity extends _OperationDbEntity {
  const _$_OperationDbEntity(
      {required this.operation,
      required this.account,
      this.category,
      this.recAccount})
      : super._();

  @override
  final OperationDB operation;
  @override
  final AccountDB account;
  @override
  final CategoryDB? category;
  @override
  final AccountDB? recAccount;

  @override
  String toString() {
    return 'OperationDbEntity(operation: $operation, account: $account, category: $category, recAccount: $recAccount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OperationDbEntity &&
            const DeepCollectionEquality().equals(other.operation, operation) &&
            const DeepCollectionEquality().equals(other.account, account) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality()
                .equals(other.recAccount, recAccount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(operation),
      const DeepCollectionEquality().hash(account),
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(recAccount));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OperationDbEntityCopyWith<_$_OperationDbEntity> get copyWith =>
      __$$_OperationDbEntityCopyWithImpl<_$_OperationDbEntity>(
          this, _$identity);
}

abstract class _OperationDbEntity extends OperationDbEntity {
  const factory _OperationDbEntity(
      {required final OperationDB operation,
      required final AccountDB account,
      final CategoryDB? category,
      final AccountDB? recAccount}) = _$_OperationDbEntity;
  const _OperationDbEntity._() : super._();

  @override
  OperationDB get operation;
  @override
  AccountDB get account;
  @override
  CategoryDB? get category;
  @override
  AccountDB? get recAccount;
  @override
  @JsonKey(ignore: true)
  _$$_OperationDbEntityCopyWith<_$_OperationDbEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
