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
  $Res call({String id, String title, bool isDebt, bool deleted});
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
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CloudAccountCopyWith<$Res>
    implements $CloudAccountCopyWith<$Res> {
  factory _$$_CloudAccountCopyWith(
          _$_CloudAccount value, $Res Function(_$_CloudAccount) then) =
      __$$_CloudAccountCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, bool isDebt, bool deleted});
}

/// @nodoc
class __$$_CloudAccountCopyWithImpl<$Res>
    extends _$CloudAccountCopyWithImpl<$Res, _$_CloudAccount>
    implements _$$_CloudAccountCopyWith<$Res> {
  __$$_CloudAccountCopyWithImpl(
      _$_CloudAccount _value, $Res Function(_$_CloudAccount) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? isDebt = null,
    Object? deleted = null,
  }) {
    return _then(_$_CloudAccount(
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
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_CloudAccount implements _CloudAccount {
  const _$_CloudAccount(
      {required this.id,
      required this.title,
      required this.isDebt,
      required this.deleted});

  @override
  final String id;
  @override
  final String title;
  @override
  final bool isDebt;
  @override
  final bool deleted;

  @override
  String toString() {
    return 'CloudAccount(id: $id, title: $title, isDebt: $isDebt, deleted: $deleted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CloudAccount &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isDebt, isDebt) || other.isDebt == isDebt) &&
            (identical(other.deleted, deleted) || other.deleted == deleted));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, isDebt, deleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CloudAccountCopyWith<_$_CloudAccount> get copyWith =>
      __$$_CloudAccountCopyWithImpl<_$_CloudAccount>(this, _$identity);
}

abstract class _CloudAccount implements CloudAccount {
  const factory _CloudAccount(
      {required final String id,
      required final String title,
      required final bool isDebt,
      required final bool deleted}) = _$_CloudAccount;

  @override
  String get id;
  @override
  String get title;
  @override
  bool get isDebt;
  @override
  bool get deleted;
  @override
  @JsonKey(ignore: true)
  _$$_CloudAccountCopyWith<_$_CloudAccount> get copyWith =>
      throw _privateConstructorUsedError;
}
