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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CloudAccount {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  bool get isDebt => throw _privateConstructorUsedError;
  bool get deleted => throw _privateConstructorUsedError;
  String get user => throw _privateConstructorUsedError;

  /// Create a copy of CloudAccount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CloudAccountCopyWith<CloudAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CloudAccountCopyWith<$Res> {
  factory $CloudAccountCopyWith(
          CloudAccount value, $Res Function(CloudAccount) then) =
      _$CloudAccountCopyWithImpl<$Res, CloudAccount>;
  @useResult
  $Res call({String id, String title, bool isDebt, bool deleted, String user});
}

/// @nodoc
class _$CloudAccountCopyWithImpl<$Res, $Val extends CloudAccount>
    implements $CloudAccountCopyWith<$Res> {
  _$CloudAccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CloudAccount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? isDebt = null,
    Object? deleted = null,
    Object? user = null,
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
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
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
  $Res call({String id, String title, bool isDebt, bool deleted, String user});
}

/// @nodoc
class __$$CloudAccountImplCopyWithImpl<$Res>
    extends _$CloudAccountCopyWithImpl<$Res, _$CloudAccountImpl>
    implements _$$CloudAccountImplCopyWith<$Res> {
  __$$CloudAccountImplCopyWithImpl(
      _$CloudAccountImpl _value, $Res Function(_$CloudAccountImpl) _then)
      : super(_value, _then);

  /// Create a copy of CloudAccount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? isDebt = null,
    Object? deleted = null,
    Object? user = null,
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
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CloudAccountImpl implements _CloudAccount {
  const _$CloudAccountImpl(
      {required this.id,
      required this.title,
      required this.isDebt,
      required this.deleted,
      required this.user});

  @override
  final String id;
  @override
  final String title;
  @override
  final bool isDebt;
  @override
  final bool deleted;
  @override
  final String user;

  @override
  String toString() {
    return 'CloudAccount(id: $id, title: $title, isDebt: $isDebt, deleted: $deleted, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CloudAccountImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isDebt, isDebt) || other.isDebt == isDebt) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, isDebt, deleted, user);

  /// Create a copy of CloudAccount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      required final bool deleted,
      required final String user}) = _$CloudAccountImpl;

  @override
  String get id;
  @override
  String get title;
  @override
  bool get isDebt;
  @override
  bool get deleted;
  @override
  String get user;

  /// Create a copy of CloudAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CloudAccountImplCopyWith<_$CloudAccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
