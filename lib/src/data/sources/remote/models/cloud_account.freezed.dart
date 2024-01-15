// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cloud_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CloudAccount {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  bool get isDebt => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  bool get deleted => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CloudAccountCopyWith<CloudAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CloudAccountCopyWith<$Res> {
  factory $CloudAccountCopyWith(
          CloudAccount value, $Res Function(CloudAccount) then) =
      _$CloudAccountCopyWithImpl<$Res, CloudAccount>;
  @useResult
  $Res call(
      {String id, String title, bool isDebt, String currency, bool deleted});
}

/// @nodoc
class _$CloudAccountCopyWithImpl<$Res, $Val extends CloudAccount>
    implements $CloudAccountCopyWith<$Res> {
  _$CloudAccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? isDebt = null,
    Object? currency = null,
    Object? deleted = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isDebt: null == isDebt
          ? _value.isDebt
          : isDebt // ignore: cast_nullable_to_non_nullable
              as bool,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CloudAccountImplCopyWith<$Res>
    implements $CloudAccountCopyWith<$Res> {
  factory _$$CloudAccountImplCopyWith(
          _$CloudAccountImpl value, $Res Function(_$CloudAccountImpl) then) =
      __$$CloudAccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String title, bool isDebt, String currency, bool deleted});
}

/// @nodoc
class __$$CloudAccountImplCopyWithImpl<$Res>
    extends _$CloudAccountCopyWithImpl<$Res, _$CloudAccountImpl>
    implements _$$CloudAccountImplCopyWith<$Res> {
  __$$CloudAccountImplCopyWithImpl(
      _$CloudAccountImpl _value, $Res Function(_$CloudAccountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? isDebt = null,
    Object? currency = null,
    Object? deleted = null,
  }) {
    return _then(_$CloudAccountImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isDebt: null == isDebt
          ? _value.isDebt
          : isDebt // ignore: cast_nullable_to_non_nullable
              as bool,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CloudAccountImpl implements _CloudAccount {
  const _$CloudAccountImpl(
      {required this.id,
      required this.title,
      required this.isDebt,
      required this.currency,
      required this.deleted});

  @override
  final String id;
  @override
  final String title;
  @override
  final bool isDebt;
  @override
  final String currency;
  @override
  final bool deleted;

  @override
  String toString() {
    return 'CloudAccount(id: $id, title: $title, isDebt: $isDebt, currency: $currency, deleted: $deleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CloudAccountImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isDebt, isDebt) || other.isDebt == isDebt) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.deleted, deleted) || other.deleted == deleted));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, isDebt, currency, deleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CloudAccountImplCopyWith<_$CloudAccountImpl> get copyWith =>
      __$$CloudAccountImplCopyWithImpl<_$CloudAccountImpl>(this, _$identity);
}

abstract class _CloudAccount implements CloudAccount {
  const factory _CloudAccount(
      {required final String id,
      required final String title,
      required final bool isDebt,
      required final String currency,
      required final bool deleted}) = _$CloudAccountImpl;

  @override
  String get id;
  @override
  String get title;
  @override
  bool get isDebt;
  @override
  String get currency;
  @override
  bool get deleted;
  @override
  @JsonKey(ignore: true)
  _$$CloudAccountImplCopyWith<_$CloudAccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
