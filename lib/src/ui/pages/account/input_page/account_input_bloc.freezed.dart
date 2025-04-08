// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_input_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AccountInputEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int accountId) fetch,
    required TResult Function(bool isDebt) input,
    required TResult Function(String title) changeTitle,
    required TResult Function(User? user) changeUser,
    required TResult Function() save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int accountId)? fetch,
    TResult? Function(bool isDebt)? input,
    TResult? Function(String title)? changeTitle,
    TResult? Function(User? user)? changeUser,
    TResult? Function()? save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int accountId)? fetch,
    TResult Function(bool isDebt)? input,
    TResult Function(String title)? changeTitle,
    TResult Function(User? user)? changeUser,
    TResult Function()? save,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAccountInputEvent value) fetch,
    required TResult Function(_InputAccountInputEvent value) input,
    required TResult Function(_ChangeTitleAccountInputEvent value) changeTitle,
    required TResult Function(_ChangeUserAccountInputEvent value) changeUser,
    required TResult Function(_SaveAccountInputEvent value) save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAccountInputEvent value)? fetch,
    TResult? Function(_InputAccountInputEvent value)? input,
    TResult? Function(_ChangeTitleAccountInputEvent value)? changeTitle,
    TResult? Function(_ChangeUserAccountInputEvent value)? changeUser,
    TResult? Function(_SaveAccountInputEvent value)? save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAccountInputEvent value)? fetch,
    TResult Function(_InputAccountInputEvent value)? input,
    TResult Function(_ChangeTitleAccountInputEvent value)? changeTitle,
    TResult Function(_ChangeUserAccountInputEvent value)? changeUser,
    TResult Function(_SaveAccountInputEvent value)? save,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountInputEventCopyWith<$Res> {
  factory $AccountInputEventCopyWith(
          AccountInputEvent value, $Res Function(AccountInputEvent) then) =
      _$AccountInputEventCopyWithImpl<$Res, AccountInputEvent>;
}

/// @nodoc
class _$AccountInputEventCopyWithImpl<$Res, $Val extends AccountInputEvent>
    implements $AccountInputEventCopyWith<$Res> {
  _$AccountInputEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountInputEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchAccountInputEventImplCopyWith<$Res> {
  factory _$$FetchAccountInputEventImplCopyWith(
          _$FetchAccountInputEventImpl value,
          $Res Function(_$FetchAccountInputEventImpl) then) =
      __$$FetchAccountInputEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int accountId});
}

/// @nodoc
class __$$FetchAccountInputEventImplCopyWithImpl<$Res>
    extends _$AccountInputEventCopyWithImpl<$Res, _$FetchAccountInputEventImpl>
    implements _$$FetchAccountInputEventImplCopyWith<$Res> {
  __$$FetchAccountInputEventImplCopyWithImpl(
      _$FetchAccountInputEventImpl _value,
      $Res Function(_$FetchAccountInputEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = null,
  }) {
    return _then(_$FetchAccountInputEventImpl(
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FetchAccountInputEventImpl implements _FetchAccountInputEvent {
  const _$FetchAccountInputEventImpl({required this.accountId});

  @override
  final int accountId;

  @override
  String toString() {
    return 'AccountInputEvent.fetch(accountId: $accountId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchAccountInputEventImpl &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accountId);

  /// Create a copy of AccountInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchAccountInputEventImplCopyWith<_$FetchAccountInputEventImpl>
      get copyWith => __$$FetchAccountInputEventImplCopyWithImpl<
          _$FetchAccountInputEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int accountId) fetch,
    required TResult Function(bool isDebt) input,
    required TResult Function(String title) changeTitle,
    required TResult Function(User? user) changeUser,
    required TResult Function() save,
  }) {
    return fetch(accountId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int accountId)? fetch,
    TResult? Function(bool isDebt)? input,
    TResult? Function(String title)? changeTitle,
    TResult? Function(User? user)? changeUser,
    TResult? Function()? save,
  }) {
    return fetch?.call(accountId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int accountId)? fetch,
    TResult Function(bool isDebt)? input,
    TResult Function(String title)? changeTitle,
    TResult Function(User? user)? changeUser,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(accountId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAccountInputEvent value) fetch,
    required TResult Function(_InputAccountInputEvent value) input,
    required TResult Function(_ChangeTitleAccountInputEvent value) changeTitle,
    required TResult Function(_ChangeUserAccountInputEvent value) changeUser,
    required TResult Function(_SaveAccountInputEvent value) save,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAccountInputEvent value)? fetch,
    TResult? Function(_InputAccountInputEvent value)? input,
    TResult? Function(_ChangeTitleAccountInputEvent value)? changeTitle,
    TResult? Function(_ChangeUserAccountInputEvent value)? changeUser,
    TResult? Function(_SaveAccountInputEvent value)? save,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAccountInputEvent value)? fetch,
    TResult Function(_InputAccountInputEvent value)? input,
    TResult Function(_ChangeTitleAccountInputEvent value)? changeTitle,
    TResult Function(_ChangeUserAccountInputEvent value)? changeUser,
    TResult Function(_SaveAccountInputEvent value)? save,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _FetchAccountInputEvent implements AccountInputEvent {
  const factory _FetchAccountInputEvent({required final int accountId}) =
      _$FetchAccountInputEventImpl;

  int get accountId;

  /// Create a copy of AccountInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchAccountInputEventImplCopyWith<_$FetchAccountInputEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InputAccountInputEventImplCopyWith<$Res> {
  factory _$$InputAccountInputEventImplCopyWith(
          _$InputAccountInputEventImpl value,
          $Res Function(_$InputAccountInputEventImpl) then) =
      __$$InputAccountInputEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isDebt});
}

/// @nodoc
class __$$InputAccountInputEventImplCopyWithImpl<$Res>
    extends _$AccountInputEventCopyWithImpl<$Res, _$InputAccountInputEventImpl>
    implements _$$InputAccountInputEventImplCopyWith<$Res> {
  __$$InputAccountInputEventImplCopyWithImpl(
      _$InputAccountInputEventImpl _value,
      $Res Function(_$InputAccountInputEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDebt = null,
  }) {
    return _then(_$InputAccountInputEventImpl(
      isDebt: null == isDebt
          ? _value.isDebt
          : isDebt // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InputAccountInputEventImpl implements _InputAccountInputEvent {
  const _$InputAccountInputEventImpl({required this.isDebt});

  @override
  final bool isDebt;

  @override
  String toString() {
    return 'AccountInputEvent.input(isDebt: $isDebt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InputAccountInputEventImpl &&
            (identical(other.isDebt, isDebt) || other.isDebt == isDebt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isDebt);

  /// Create a copy of AccountInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InputAccountInputEventImplCopyWith<_$InputAccountInputEventImpl>
      get copyWith => __$$InputAccountInputEventImplCopyWithImpl<
          _$InputAccountInputEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int accountId) fetch,
    required TResult Function(bool isDebt) input,
    required TResult Function(String title) changeTitle,
    required TResult Function(User? user) changeUser,
    required TResult Function() save,
  }) {
    return input(isDebt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int accountId)? fetch,
    TResult? Function(bool isDebt)? input,
    TResult? Function(String title)? changeTitle,
    TResult? Function(User? user)? changeUser,
    TResult? Function()? save,
  }) {
    return input?.call(isDebt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int accountId)? fetch,
    TResult Function(bool isDebt)? input,
    TResult Function(String title)? changeTitle,
    TResult Function(User? user)? changeUser,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (input != null) {
      return input(isDebt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAccountInputEvent value) fetch,
    required TResult Function(_InputAccountInputEvent value) input,
    required TResult Function(_ChangeTitleAccountInputEvent value) changeTitle,
    required TResult Function(_ChangeUserAccountInputEvent value) changeUser,
    required TResult Function(_SaveAccountInputEvent value) save,
  }) {
    return input(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAccountInputEvent value)? fetch,
    TResult? Function(_InputAccountInputEvent value)? input,
    TResult? Function(_ChangeTitleAccountInputEvent value)? changeTitle,
    TResult? Function(_ChangeUserAccountInputEvent value)? changeUser,
    TResult? Function(_SaveAccountInputEvent value)? save,
  }) {
    return input?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAccountInputEvent value)? fetch,
    TResult Function(_InputAccountInputEvent value)? input,
    TResult Function(_ChangeTitleAccountInputEvent value)? changeTitle,
    TResult Function(_ChangeUserAccountInputEvent value)? changeUser,
    TResult Function(_SaveAccountInputEvent value)? save,
    required TResult orElse(),
  }) {
    if (input != null) {
      return input(this);
    }
    return orElse();
  }
}

abstract class _InputAccountInputEvent implements AccountInputEvent {
  const factory _InputAccountInputEvent({required final bool isDebt}) =
      _$InputAccountInputEventImpl;

  bool get isDebt;

  /// Create a copy of AccountInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InputAccountInputEventImplCopyWith<_$InputAccountInputEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeTitleAccountInputEventImplCopyWith<$Res> {
  factory _$$ChangeTitleAccountInputEventImplCopyWith(
          _$ChangeTitleAccountInputEventImpl value,
          $Res Function(_$ChangeTitleAccountInputEventImpl) then) =
      __$$ChangeTitleAccountInputEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String title});
}

/// @nodoc
class __$$ChangeTitleAccountInputEventImplCopyWithImpl<$Res>
    extends _$AccountInputEventCopyWithImpl<$Res,
        _$ChangeTitleAccountInputEventImpl>
    implements _$$ChangeTitleAccountInputEventImplCopyWith<$Res> {
  __$$ChangeTitleAccountInputEventImplCopyWithImpl(
      _$ChangeTitleAccountInputEventImpl _value,
      $Res Function(_$ChangeTitleAccountInputEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
  }) {
    return _then(_$ChangeTitleAccountInputEventImpl(
      null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangeTitleAccountInputEventImpl
    implements _ChangeTitleAccountInputEvent {
  const _$ChangeTitleAccountInputEventImpl(this.title);

  @override
  final String title;

  @override
  String toString() {
    return 'AccountInputEvent.changeTitle(title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeTitleAccountInputEventImpl &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title);

  /// Create a copy of AccountInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeTitleAccountInputEventImplCopyWith<
          _$ChangeTitleAccountInputEventImpl>
      get copyWith => __$$ChangeTitleAccountInputEventImplCopyWithImpl<
          _$ChangeTitleAccountInputEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int accountId) fetch,
    required TResult Function(bool isDebt) input,
    required TResult Function(String title) changeTitle,
    required TResult Function(User? user) changeUser,
    required TResult Function() save,
  }) {
    return changeTitle(title);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int accountId)? fetch,
    TResult? Function(bool isDebt)? input,
    TResult? Function(String title)? changeTitle,
    TResult? Function(User? user)? changeUser,
    TResult? Function()? save,
  }) {
    return changeTitle?.call(title);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int accountId)? fetch,
    TResult Function(bool isDebt)? input,
    TResult Function(String title)? changeTitle,
    TResult Function(User? user)? changeUser,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (changeTitle != null) {
      return changeTitle(title);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAccountInputEvent value) fetch,
    required TResult Function(_InputAccountInputEvent value) input,
    required TResult Function(_ChangeTitleAccountInputEvent value) changeTitle,
    required TResult Function(_ChangeUserAccountInputEvent value) changeUser,
    required TResult Function(_SaveAccountInputEvent value) save,
  }) {
    return changeTitle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAccountInputEvent value)? fetch,
    TResult? Function(_InputAccountInputEvent value)? input,
    TResult? Function(_ChangeTitleAccountInputEvent value)? changeTitle,
    TResult? Function(_ChangeUserAccountInputEvent value)? changeUser,
    TResult? Function(_SaveAccountInputEvent value)? save,
  }) {
    return changeTitle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAccountInputEvent value)? fetch,
    TResult Function(_InputAccountInputEvent value)? input,
    TResult Function(_ChangeTitleAccountInputEvent value)? changeTitle,
    TResult Function(_ChangeUserAccountInputEvent value)? changeUser,
    TResult Function(_SaveAccountInputEvent value)? save,
    required TResult orElse(),
  }) {
    if (changeTitle != null) {
      return changeTitle(this);
    }
    return orElse();
  }
}

abstract class _ChangeTitleAccountInputEvent implements AccountInputEvent {
  const factory _ChangeTitleAccountInputEvent(final String title) =
      _$ChangeTitleAccountInputEventImpl;

  String get title;

  /// Create a copy of AccountInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeTitleAccountInputEventImplCopyWith<
          _$ChangeTitleAccountInputEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeUserAccountInputEventImplCopyWith<$Res> {
  factory _$$ChangeUserAccountInputEventImplCopyWith(
          _$ChangeUserAccountInputEventImpl value,
          $Res Function(_$ChangeUserAccountInputEventImpl) then) =
      __$$ChangeUserAccountInputEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User? user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$ChangeUserAccountInputEventImplCopyWithImpl<$Res>
    extends _$AccountInputEventCopyWithImpl<$Res,
        _$ChangeUserAccountInputEventImpl>
    implements _$$ChangeUserAccountInputEventImplCopyWith<$Res> {
  __$$ChangeUserAccountInputEventImplCopyWithImpl(
      _$ChangeUserAccountInputEventImpl _value,
      $Res Function(_$ChangeUserAccountInputEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$ChangeUserAccountInputEventImpl(
      freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }

  /// Create a copy of AccountInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$ChangeUserAccountInputEventImpl
    implements _ChangeUserAccountInputEvent {
  const _$ChangeUserAccountInputEventImpl(this.user);

  @override
  final User? user;

  @override
  String toString() {
    return 'AccountInputEvent.changeUser(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeUserAccountInputEventImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of AccountInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeUserAccountInputEventImplCopyWith<_$ChangeUserAccountInputEventImpl>
      get copyWith => __$$ChangeUserAccountInputEventImplCopyWithImpl<
          _$ChangeUserAccountInputEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int accountId) fetch,
    required TResult Function(bool isDebt) input,
    required TResult Function(String title) changeTitle,
    required TResult Function(User? user) changeUser,
    required TResult Function() save,
  }) {
    return changeUser(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int accountId)? fetch,
    TResult? Function(bool isDebt)? input,
    TResult? Function(String title)? changeTitle,
    TResult? Function(User? user)? changeUser,
    TResult? Function()? save,
  }) {
    return changeUser?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int accountId)? fetch,
    TResult Function(bool isDebt)? input,
    TResult Function(String title)? changeTitle,
    TResult Function(User? user)? changeUser,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (changeUser != null) {
      return changeUser(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAccountInputEvent value) fetch,
    required TResult Function(_InputAccountInputEvent value) input,
    required TResult Function(_ChangeTitleAccountInputEvent value) changeTitle,
    required TResult Function(_ChangeUserAccountInputEvent value) changeUser,
    required TResult Function(_SaveAccountInputEvent value) save,
  }) {
    return changeUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAccountInputEvent value)? fetch,
    TResult? Function(_InputAccountInputEvent value)? input,
    TResult? Function(_ChangeTitleAccountInputEvent value)? changeTitle,
    TResult? Function(_ChangeUserAccountInputEvent value)? changeUser,
    TResult? Function(_SaveAccountInputEvent value)? save,
  }) {
    return changeUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAccountInputEvent value)? fetch,
    TResult Function(_InputAccountInputEvent value)? input,
    TResult Function(_ChangeTitleAccountInputEvent value)? changeTitle,
    TResult Function(_ChangeUserAccountInputEvent value)? changeUser,
    TResult Function(_SaveAccountInputEvent value)? save,
    required TResult orElse(),
  }) {
    if (changeUser != null) {
      return changeUser(this);
    }
    return orElse();
  }
}

abstract class _ChangeUserAccountInputEvent implements AccountInputEvent {
  const factory _ChangeUserAccountInputEvent(final User? user) =
      _$ChangeUserAccountInputEventImpl;

  User? get user;

  /// Create a copy of AccountInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeUserAccountInputEventImplCopyWith<_$ChangeUserAccountInputEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SaveAccountInputEventImplCopyWith<$Res> {
  factory _$$SaveAccountInputEventImplCopyWith(
          _$SaveAccountInputEventImpl value,
          $Res Function(_$SaveAccountInputEventImpl) then) =
      __$$SaveAccountInputEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SaveAccountInputEventImplCopyWithImpl<$Res>
    extends _$AccountInputEventCopyWithImpl<$Res, _$SaveAccountInputEventImpl>
    implements _$$SaveAccountInputEventImplCopyWith<$Res> {
  __$$SaveAccountInputEventImplCopyWithImpl(_$SaveAccountInputEventImpl _value,
      $Res Function(_$SaveAccountInputEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountInputEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SaveAccountInputEventImpl implements _SaveAccountInputEvent {
  const _$SaveAccountInputEventImpl();

  @override
  String toString() {
    return 'AccountInputEvent.save()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveAccountInputEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int accountId) fetch,
    required TResult Function(bool isDebt) input,
    required TResult Function(String title) changeTitle,
    required TResult Function(User? user) changeUser,
    required TResult Function() save,
  }) {
    return save();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int accountId)? fetch,
    TResult? Function(bool isDebt)? input,
    TResult? Function(String title)? changeTitle,
    TResult? Function(User? user)? changeUser,
    TResult? Function()? save,
  }) {
    return save?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int accountId)? fetch,
    TResult Function(bool isDebt)? input,
    TResult Function(String title)? changeTitle,
    TResult Function(User? user)? changeUser,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAccountInputEvent value) fetch,
    required TResult Function(_InputAccountInputEvent value) input,
    required TResult Function(_ChangeTitleAccountInputEvent value) changeTitle,
    required TResult Function(_ChangeUserAccountInputEvent value) changeUser,
    required TResult Function(_SaveAccountInputEvent value) save,
  }) {
    return save(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAccountInputEvent value)? fetch,
    TResult? Function(_InputAccountInputEvent value)? input,
    TResult? Function(_ChangeTitleAccountInputEvent value)? changeTitle,
    TResult? Function(_ChangeUserAccountInputEvent value)? changeUser,
    TResult? Function(_SaveAccountInputEvent value)? save,
  }) {
    return save?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAccountInputEvent value)? fetch,
    TResult Function(_InputAccountInputEvent value)? input,
    TResult Function(_ChangeTitleAccountInputEvent value)? changeTitle,
    TResult Function(_ChangeUserAccountInputEvent value)? changeUser,
    TResult Function(_SaveAccountInputEvent value)? save,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save(this);
    }
    return orElse();
  }
}

abstract class _SaveAccountInputEvent implements AccountInputEvent {
  const factory _SaveAccountInputEvent() = _$SaveAccountInputEventImpl;
}

/// @nodoc
mixin _$AccountInputState {
  String get title => throw _privateConstructorUsedError;
  bool get isDebt => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  List<User> get users => throw _privateConstructorUsedError;
  BaseAccount? get account => throw _privateConstructorUsedError;
  bool get isSaved => throw _privateConstructorUsedError;

  /// Create a copy of AccountInputState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountInputStateCopyWith<AccountInputState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountInputStateCopyWith<$Res> {
  factory $AccountInputStateCopyWith(
          AccountInputState value, $Res Function(AccountInputState) then) =
      _$AccountInputStateCopyWithImpl<$Res, AccountInputState>;
  @useResult
  $Res call(
      {String title,
      bool isDebt,
      int? userId,
      List<User> users,
      BaseAccount? account,
      bool isSaved});
}

/// @nodoc
class _$AccountInputStateCopyWithImpl<$Res, $Val extends AccountInputState>
    implements $AccountInputStateCopyWith<$Res> {
  _$AccountInputStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountInputState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? isDebt = null,
    Object? userId = freezed,
    Object? users = null,
    Object? account = freezed,
    Object? isSaved = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isDebt: null == isDebt
          ? _value.isDebt
          : isDebt // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as BaseAccount?,
      isSaved: null == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountInputStateImplCopyWith<$Res>
    implements $AccountInputStateCopyWith<$Res> {
  factory _$$AccountInputStateImplCopyWith(_$AccountInputStateImpl value,
          $Res Function(_$AccountInputStateImpl) then) =
      __$$AccountInputStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      bool isDebt,
      int? userId,
      List<User> users,
      BaseAccount? account,
      bool isSaved});
}

/// @nodoc
class __$$AccountInputStateImplCopyWithImpl<$Res>
    extends _$AccountInputStateCopyWithImpl<$Res, _$AccountInputStateImpl>
    implements _$$AccountInputStateImplCopyWith<$Res> {
  __$$AccountInputStateImplCopyWithImpl(_$AccountInputStateImpl _value,
      $Res Function(_$AccountInputStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountInputState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? isDebt = null,
    Object? userId = freezed,
    Object? users = null,
    Object? account = freezed,
    Object? isSaved = null,
  }) {
    return _then(_$AccountInputStateImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isDebt: null == isDebt
          ? _value.isDebt
          : isDebt // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as BaseAccount?,
      isSaved: null == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AccountInputStateImpl implements _AccountInputState {
  const _$AccountInputStateImpl(
      {required this.title,
      required this.isDebt,
      required this.userId,
      required final List<User> users,
      this.account,
      required this.isSaved})
      : _users = users;

  @override
  final String title;
  @override
  final bool isDebt;
  @override
  final int? userId;
  final List<User> _users;
  @override
  List<User> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  final BaseAccount? account;
  @override
  final bool isSaved;

  @override
  String toString() {
    return 'AccountInputState(title: $title, isDebt: $isDebt, userId: $userId, users: $users, account: $account, isSaved: $isSaved)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountInputStateImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isDebt, isDebt) || other.isDebt == isDebt) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, isDebt, userId,
      const DeepCollectionEquality().hash(_users), account, isSaved);

  /// Create a copy of AccountInputState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountInputStateImplCopyWith<_$AccountInputStateImpl> get copyWith =>
      __$$AccountInputStateImplCopyWithImpl<_$AccountInputStateImpl>(
          this, _$identity);
}

abstract class _AccountInputState implements AccountInputState {
  const factory _AccountInputState(
      {required final String title,
      required final bool isDebt,
      required final int? userId,
      required final List<User> users,
      final BaseAccount? account,
      required final bool isSaved}) = _$AccountInputStateImpl;

  @override
  String get title;
  @override
  bool get isDebt;
  @override
  int? get userId;
  @override
  List<User> get users;
  @override
  BaseAccount? get account;
  @override
  bool get isSaved;

  /// Create a copy of AccountInputState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountInputStateImplCopyWith<_$AccountInputStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
