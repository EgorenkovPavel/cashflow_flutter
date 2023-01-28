// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_balance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountBalance {
  int get id => throw _privateConstructorUsedError;
  String get cloudId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get balance => throw _privateConstructorUsedError;
  bool get isDebt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountBalanceCopyWith<AccountBalance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountBalanceCopyWith<$Res> {
  factory $AccountBalanceCopyWith(
          AccountBalance value, $Res Function(AccountBalance) then) =
      _$AccountBalanceCopyWithImpl<$Res, AccountBalance>;
  @useResult
  $Res call({int id, String cloudId, String title, int balance, bool isDebt});
}

/// @nodoc
class _$AccountBalanceCopyWithImpl<$Res, $Val extends AccountBalance>
    implements $AccountBalanceCopyWith<$Res> {
  _$AccountBalanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cloudId = null,
    Object? title = null,
    Object? balance = null,
    Object? isDebt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cloudId: null == cloudId
          ? _value.cloudId
          : cloudId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
      isDebt: null == isDebt
          ? _value.isDebt
          : isDebt // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccountBalanceCopyWith<$Res>
    implements $AccountBalanceCopyWith<$Res> {
  factory _$$_AccountBalanceCopyWith(
          _$_AccountBalance value, $Res Function(_$_AccountBalance) then) =
      __$$_AccountBalanceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String cloudId, String title, int balance, bool isDebt});
}

/// @nodoc
class __$$_AccountBalanceCopyWithImpl<$Res>
    extends _$AccountBalanceCopyWithImpl<$Res, _$_AccountBalance>
    implements _$$_AccountBalanceCopyWith<$Res> {
  __$$_AccountBalanceCopyWithImpl(
      _$_AccountBalance _value, $Res Function(_$_AccountBalance) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cloudId = null,
    Object? title = null,
    Object? balance = null,
    Object? isDebt = null,
  }) {
    return _then(_$_AccountBalance(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cloudId: null == cloudId
          ? _value.cloudId
          : cloudId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
      isDebt: null == isDebt
          ? _value.isDebt
          : isDebt // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AccountBalance implements _AccountBalance {
  const _$_AccountBalance(
      {required this.id,
      required this.cloudId,
      required this.title,
      required this.balance,
      this.isDebt = false});

  @override
  final int id;
  @override
  final String cloudId;
  @override
  final String title;
  @override
  final int balance;
  @override
  @JsonKey()
  final bool isDebt;

  @override
  String toString() {
    return 'AccountBalance(id: $id, cloudId: $cloudId, title: $title, balance: $balance, isDebt: $isDebt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountBalance &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cloudId, cloudId) || other.cloudId == cloudId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.isDebt, isDebt) || other.isDebt == isDebt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, cloudId, title, balance, isDebt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountBalanceCopyWith<_$_AccountBalance> get copyWith =>
      __$$_AccountBalanceCopyWithImpl<_$_AccountBalance>(this, _$identity);
}

abstract class _AccountBalance implements AccountBalance {
  const factory _AccountBalance(
      {required final int id,
      required final String cloudId,
      required final String title,
      required final int balance,
      final bool isDebt}) = _$_AccountBalance;

  @override
  int get id;
  @override
  String get cloudId;
  @override
  String get title;
  @override
  int get balance;
  @override
  bool get isDebt;
  @override
  @JsonKey(ignore: true)
  _$$_AccountBalanceCopyWith<_$_AccountBalance> get copyWith =>
      throw _privateConstructorUsedError;
}
