// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_balance_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountBalanceEntity {
  AccountDB get account => throw _privateConstructorUsedError;
  int get sum => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountBalanceEntityCopyWith<AccountBalanceEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountBalanceEntityCopyWith<$Res> {
  factory $AccountBalanceEntityCopyWith(AccountBalanceEntity value,
          $Res Function(AccountBalanceEntity) then) =
      _$AccountBalanceEntityCopyWithImpl<$Res, AccountBalanceEntity>;
  @useResult
  $Res call({AccountDB account, int sum});
}

/// @nodoc
class _$AccountBalanceEntityCopyWithImpl<$Res,
        $Val extends AccountBalanceEntity>
    implements $AccountBalanceEntityCopyWith<$Res> {
  _$AccountBalanceEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
    Object? sum = null,
  }) {
    return _then(_value.copyWith(
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as AccountDB,
      sum: null == sum
          ? _value.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountBalanceEntityImplCopyWith<$Res>
    implements $AccountBalanceEntityCopyWith<$Res> {
  factory _$$AccountBalanceEntityImplCopyWith(_$AccountBalanceEntityImpl value,
          $Res Function(_$AccountBalanceEntityImpl) then) =
      __$$AccountBalanceEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AccountDB account, int sum});
}

/// @nodoc
class __$$AccountBalanceEntityImplCopyWithImpl<$Res>
    extends _$AccountBalanceEntityCopyWithImpl<$Res, _$AccountBalanceEntityImpl>
    implements _$$AccountBalanceEntityImplCopyWith<$Res> {
  __$$AccountBalanceEntityImplCopyWithImpl(_$AccountBalanceEntityImpl _value,
      $Res Function(_$AccountBalanceEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
    Object? sum = null,
  }) {
    return _then(_$AccountBalanceEntityImpl(
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as AccountDB,
      sum: null == sum
          ? _value.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AccountBalanceEntityImpl implements _AccountBalanceEntity {
  const _$AccountBalanceEntityImpl({required this.account, required this.sum});

  @override
  final AccountDB account;
  @override
  final int sum;

  @override
  String toString() {
    return 'AccountBalanceEntity(account: $account, sum: $sum)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountBalanceEntityImpl &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.sum, sum) || other.sum == sum));
  }

  @override
  int get hashCode => Object.hash(runtimeType, account, sum);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountBalanceEntityImplCopyWith<_$AccountBalanceEntityImpl>
      get copyWith =>
          __$$AccountBalanceEntityImplCopyWithImpl<_$AccountBalanceEntityImpl>(
              this, _$identity);
}

abstract class _AccountBalanceEntity implements AccountBalanceEntity {
  const factory _AccountBalanceEntity(
      {required final AccountDB account,
      required final int sum}) = _$AccountBalanceEntityImpl;

  @override
  AccountDB get account;
  @override
  int get sum;
  @override
  @JsonKey(ignore: true)
  _$$AccountBalanceEntityImplCopyWith<_$AccountBalanceEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}