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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountInputEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int accountId) fetch,
    required TResult Function(String title) changeTitle,
    required TResult Function(bool isDebt) changeIsDebt,
    required TResult Function(Currency currency) changeCurrency,
    required TResult Function() save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int accountId)? fetch,
    TResult? Function(String title)? changeTitle,
    TResult? Function(bool isDebt)? changeIsDebt,
    TResult? Function(Currency currency)? changeCurrency,
    TResult? Function()? save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int accountId)? fetch,
    TResult Function(String title)? changeTitle,
    TResult Function(bool isDebt)? changeIsDebt,
    TResult Function(Currency currency)? changeCurrency,
    TResult Function()? save,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAccountInputEvent value) fetch,
    required TResult Function(_ChangeTitleAccountInputEvent value) changeTitle,
    required TResult Function(_ChangeIsDebtAccountInputEvent value)
        changeIsDebt,
    required TResult Function(_ChangeCurrencyAccoutnInputEvent value)
        changeCurrency,
    required TResult Function(_SaveAccountInputEvent value) save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAccountInputEvent value)? fetch,
    TResult? Function(_ChangeTitleAccountInputEvent value)? changeTitle,
    TResult? Function(_ChangeIsDebtAccountInputEvent value)? changeIsDebt,
    TResult? Function(_ChangeCurrencyAccoutnInputEvent value)? changeCurrency,
    TResult? Function(_SaveAccountInputEvent value)? save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAccountInputEvent value)? fetch,
    TResult Function(_ChangeTitleAccountInputEvent value)? changeTitle,
    TResult Function(_ChangeIsDebtAccountInputEvent value)? changeIsDebt,
    TResult Function(_ChangeCurrencyAccoutnInputEvent value)? changeCurrency,
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchAccountInputEventImpl &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accountId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchAccountInputEventImplCopyWith<_$FetchAccountInputEventImpl>
      get copyWith => __$$FetchAccountInputEventImplCopyWithImpl<
          _$FetchAccountInputEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int accountId) fetch,
    required TResult Function(String title) changeTitle,
    required TResult Function(bool isDebt) changeIsDebt,
    required TResult Function(Currency currency) changeCurrency,
    required TResult Function() save,
  }) {
    return fetch(accountId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int accountId)? fetch,
    TResult? Function(String title)? changeTitle,
    TResult? Function(bool isDebt)? changeIsDebt,
    TResult? Function(Currency currency)? changeCurrency,
    TResult? Function()? save,
  }) {
    return fetch?.call(accountId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int accountId)? fetch,
    TResult Function(String title)? changeTitle,
    TResult Function(bool isDebt)? changeIsDebt,
    TResult Function(Currency currency)? changeCurrency,
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
    required TResult Function(_ChangeTitleAccountInputEvent value) changeTitle,
    required TResult Function(_ChangeIsDebtAccountInputEvent value)
        changeIsDebt,
    required TResult Function(_ChangeCurrencyAccoutnInputEvent value)
        changeCurrency,
    required TResult Function(_SaveAccountInputEvent value) save,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAccountInputEvent value)? fetch,
    TResult? Function(_ChangeTitleAccountInputEvent value)? changeTitle,
    TResult? Function(_ChangeIsDebtAccountInputEvent value)? changeIsDebt,
    TResult? Function(_ChangeCurrencyAccoutnInputEvent value)? changeCurrency,
    TResult? Function(_SaveAccountInputEvent value)? save,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAccountInputEvent value)? fetch,
    TResult Function(_ChangeTitleAccountInputEvent value)? changeTitle,
    TResult Function(_ChangeIsDebtAccountInputEvent value)? changeIsDebt,
    TResult Function(_ChangeCurrencyAccoutnInputEvent value)? changeCurrency,
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
  @JsonKey(ignore: true)
  _$$FetchAccountInputEventImplCopyWith<_$FetchAccountInputEventImpl>
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
  }) {
    return _then(_$ChangeTitleAccountInputEventImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangeTitleAccountInputEventImpl
    implements _ChangeTitleAccountInputEvent {
  const _$ChangeTitleAccountInputEventImpl({required this.title});

  @override
  final String title;

  @override
  String toString() {
    return 'AccountInputEvent.changeTitle(title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeTitleAccountInputEventImpl &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title);

  @JsonKey(ignore: true)
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
    required TResult Function(String title) changeTitle,
    required TResult Function(bool isDebt) changeIsDebt,
    required TResult Function(Currency currency) changeCurrency,
    required TResult Function() save,
  }) {
    return changeTitle(title);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int accountId)? fetch,
    TResult? Function(String title)? changeTitle,
    TResult? Function(bool isDebt)? changeIsDebt,
    TResult? Function(Currency currency)? changeCurrency,
    TResult? Function()? save,
  }) {
    return changeTitle?.call(title);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int accountId)? fetch,
    TResult Function(String title)? changeTitle,
    TResult Function(bool isDebt)? changeIsDebt,
    TResult Function(Currency currency)? changeCurrency,
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
    required TResult Function(_ChangeTitleAccountInputEvent value) changeTitle,
    required TResult Function(_ChangeIsDebtAccountInputEvent value)
        changeIsDebt,
    required TResult Function(_ChangeCurrencyAccoutnInputEvent value)
        changeCurrency,
    required TResult Function(_SaveAccountInputEvent value) save,
  }) {
    return changeTitle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAccountInputEvent value)? fetch,
    TResult? Function(_ChangeTitleAccountInputEvent value)? changeTitle,
    TResult? Function(_ChangeIsDebtAccountInputEvent value)? changeIsDebt,
    TResult? Function(_ChangeCurrencyAccoutnInputEvent value)? changeCurrency,
    TResult? Function(_SaveAccountInputEvent value)? save,
  }) {
    return changeTitle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAccountInputEvent value)? fetch,
    TResult Function(_ChangeTitleAccountInputEvent value)? changeTitle,
    TResult Function(_ChangeIsDebtAccountInputEvent value)? changeIsDebt,
    TResult Function(_ChangeCurrencyAccoutnInputEvent value)? changeCurrency,
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
  const factory _ChangeTitleAccountInputEvent({required final String title}) =
      _$ChangeTitleAccountInputEventImpl;

  String get title;
  @JsonKey(ignore: true)
  _$$ChangeTitleAccountInputEventImplCopyWith<
          _$ChangeTitleAccountInputEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeIsDebtAccountInputEventImplCopyWith<$Res> {
  factory _$$ChangeIsDebtAccountInputEventImplCopyWith(
          _$ChangeIsDebtAccountInputEventImpl value,
          $Res Function(_$ChangeIsDebtAccountInputEventImpl) then) =
      __$$ChangeIsDebtAccountInputEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isDebt});
}

/// @nodoc
class __$$ChangeIsDebtAccountInputEventImplCopyWithImpl<$Res>
    extends _$AccountInputEventCopyWithImpl<$Res,
        _$ChangeIsDebtAccountInputEventImpl>
    implements _$$ChangeIsDebtAccountInputEventImplCopyWith<$Res> {
  __$$ChangeIsDebtAccountInputEventImplCopyWithImpl(
      _$ChangeIsDebtAccountInputEventImpl _value,
      $Res Function(_$ChangeIsDebtAccountInputEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDebt = null,
  }) {
    return _then(_$ChangeIsDebtAccountInputEventImpl(
      isDebt: null == isDebt
          ? _value.isDebt
          : isDebt // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ChangeIsDebtAccountInputEventImpl
    implements _ChangeIsDebtAccountInputEvent {
  const _$ChangeIsDebtAccountInputEventImpl({required this.isDebt});

  @override
  final bool isDebt;

  @override
  String toString() {
    return 'AccountInputEvent.changeIsDebt(isDebt: $isDebt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeIsDebtAccountInputEventImpl &&
            (identical(other.isDebt, isDebt) || other.isDebt == isDebt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isDebt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeIsDebtAccountInputEventImplCopyWith<
          _$ChangeIsDebtAccountInputEventImpl>
      get copyWith => __$$ChangeIsDebtAccountInputEventImplCopyWithImpl<
          _$ChangeIsDebtAccountInputEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int accountId) fetch,
    required TResult Function(String title) changeTitle,
    required TResult Function(bool isDebt) changeIsDebt,
    required TResult Function(Currency currency) changeCurrency,
    required TResult Function() save,
  }) {
    return changeIsDebt(isDebt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int accountId)? fetch,
    TResult? Function(String title)? changeTitle,
    TResult? Function(bool isDebt)? changeIsDebt,
    TResult? Function(Currency currency)? changeCurrency,
    TResult? Function()? save,
  }) {
    return changeIsDebt?.call(isDebt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int accountId)? fetch,
    TResult Function(String title)? changeTitle,
    TResult Function(bool isDebt)? changeIsDebt,
    TResult Function(Currency currency)? changeCurrency,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (changeIsDebt != null) {
      return changeIsDebt(isDebt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAccountInputEvent value) fetch,
    required TResult Function(_ChangeTitleAccountInputEvent value) changeTitle,
    required TResult Function(_ChangeIsDebtAccountInputEvent value)
        changeIsDebt,
    required TResult Function(_ChangeCurrencyAccoutnInputEvent value)
        changeCurrency,
    required TResult Function(_SaveAccountInputEvent value) save,
  }) {
    return changeIsDebt(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAccountInputEvent value)? fetch,
    TResult? Function(_ChangeTitleAccountInputEvent value)? changeTitle,
    TResult? Function(_ChangeIsDebtAccountInputEvent value)? changeIsDebt,
    TResult? Function(_ChangeCurrencyAccoutnInputEvent value)? changeCurrency,
    TResult? Function(_SaveAccountInputEvent value)? save,
  }) {
    return changeIsDebt?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAccountInputEvent value)? fetch,
    TResult Function(_ChangeTitleAccountInputEvent value)? changeTitle,
    TResult Function(_ChangeIsDebtAccountInputEvent value)? changeIsDebt,
    TResult Function(_ChangeCurrencyAccoutnInputEvent value)? changeCurrency,
    TResult Function(_SaveAccountInputEvent value)? save,
    required TResult orElse(),
  }) {
    if (changeIsDebt != null) {
      return changeIsDebt(this);
    }
    return orElse();
  }
}

abstract class _ChangeIsDebtAccountInputEvent implements AccountInputEvent {
  const factory _ChangeIsDebtAccountInputEvent({required final bool isDebt}) =
      _$ChangeIsDebtAccountInputEventImpl;

  bool get isDebt;
  @JsonKey(ignore: true)
  _$$ChangeIsDebtAccountInputEventImplCopyWith<
          _$ChangeIsDebtAccountInputEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeCurrencyAccoutnInputEventImplCopyWith<$Res> {
  factory _$$ChangeCurrencyAccoutnInputEventImplCopyWith(
          _$ChangeCurrencyAccoutnInputEventImpl value,
          $Res Function(_$ChangeCurrencyAccoutnInputEventImpl) then) =
      __$$ChangeCurrencyAccoutnInputEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Currency currency});
}

/// @nodoc
class __$$ChangeCurrencyAccoutnInputEventImplCopyWithImpl<$Res>
    extends _$AccountInputEventCopyWithImpl<$Res,
        _$ChangeCurrencyAccoutnInputEventImpl>
    implements _$$ChangeCurrencyAccoutnInputEventImplCopyWith<$Res> {
  __$$ChangeCurrencyAccoutnInputEventImplCopyWithImpl(
      _$ChangeCurrencyAccoutnInputEventImpl _value,
      $Res Function(_$ChangeCurrencyAccoutnInputEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = null,
  }) {
    return _then(_$ChangeCurrencyAccoutnInputEventImpl(
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
    ));
  }
}

/// @nodoc

class _$ChangeCurrencyAccoutnInputEventImpl
    implements _ChangeCurrencyAccoutnInputEvent {
  const _$ChangeCurrencyAccoutnInputEventImpl({required this.currency});

  @override
  final Currency currency;

  @override
  String toString() {
    return 'AccountInputEvent.changeCurrency(currency: $currency)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeCurrencyAccoutnInputEventImpl &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currency);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeCurrencyAccoutnInputEventImplCopyWith<
          _$ChangeCurrencyAccoutnInputEventImpl>
      get copyWith => __$$ChangeCurrencyAccoutnInputEventImplCopyWithImpl<
          _$ChangeCurrencyAccoutnInputEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int accountId) fetch,
    required TResult Function(String title) changeTitle,
    required TResult Function(bool isDebt) changeIsDebt,
    required TResult Function(Currency currency) changeCurrency,
    required TResult Function() save,
  }) {
    return changeCurrency(currency);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int accountId)? fetch,
    TResult? Function(String title)? changeTitle,
    TResult? Function(bool isDebt)? changeIsDebt,
    TResult? Function(Currency currency)? changeCurrency,
    TResult? Function()? save,
  }) {
    return changeCurrency?.call(currency);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int accountId)? fetch,
    TResult Function(String title)? changeTitle,
    TResult Function(bool isDebt)? changeIsDebt,
    TResult Function(Currency currency)? changeCurrency,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (changeCurrency != null) {
      return changeCurrency(currency);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAccountInputEvent value) fetch,
    required TResult Function(_ChangeTitleAccountInputEvent value) changeTitle,
    required TResult Function(_ChangeIsDebtAccountInputEvent value)
        changeIsDebt,
    required TResult Function(_ChangeCurrencyAccoutnInputEvent value)
        changeCurrency,
    required TResult Function(_SaveAccountInputEvent value) save,
  }) {
    return changeCurrency(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAccountInputEvent value)? fetch,
    TResult? Function(_ChangeTitleAccountInputEvent value)? changeTitle,
    TResult? Function(_ChangeIsDebtAccountInputEvent value)? changeIsDebt,
    TResult? Function(_ChangeCurrencyAccoutnInputEvent value)? changeCurrency,
    TResult? Function(_SaveAccountInputEvent value)? save,
  }) {
    return changeCurrency?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAccountInputEvent value)? fetch,
    TResult Function(_ChangeTitleAccountInputEvent value)? changeTitle,
    TResult Function(_ChangeIsDebtAccountInputEvent value)? changeIsDebt,
    TResult Function(_ChangeCurrencyAccoutnInputEvent value)? changeCurrency,
    TResult Function(_SaveAccountInputEvent value)? save,
    required TResult orElse(),
  }) {
    if (changeCurrency != null) {
      return changeCurrency(this);
    }
    return orElse();
  }
}

abstract class _ChangeCurrencyAccoutnInputEvent implements AccountInputEvent {
  const factory _ChangeCurrencyAccoutnInputEvent(
          {required final Currency currency}) =
      _$ChangeCurrencyAccoutnInputEventImpl;

  Currency get currency;
  @JsonKey(ignore: true)
  _$$ChangeCurrencyAccoutnInputEventImplCopyWith<
          _$ChangeCurrencyAccoutnInputEventImpl>
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
}

/// @nodoc

class _$SaveAccountInputEventImpl implements _SaveAccountInputEvent {
  const _$SaveAccountInputEventImpl();

  @override
  String toString() {
    return 'AccountInputEvent.save()';
  }

  @override
  bool operator ==(dynamic other) {
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
    required TResult Function(String title) changeTitle,
    required TResult Function(bool isDebt) changeIsDebt,
    required TResult Function(Currency currency) changeCurrency,
    required TResult Function() save,
  }) {
    return save();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int accountId)? fetch,
    TResult? Function(String title)? changeTitle,
    TResult? Function(bool isDebt)? changeIsDebt,
    TResult? Function(Currency currency)? changeCurrency,
    TResult? Function()? save,
  }) {
    return save?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int accountId)? fetch,
    TResult Function(String title)? changeTitle,
    TResult Function(bool isDebt)? changeIsDebt,
    TResult Function(Currency currency)? changeCurrency,
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
    required TResult Function(_ChangeTitleAccountInputEvent value) changeTitle,
    required TResult Function(_ChangeIsDebtAccountInputEvent value)
        changeIsDebt,
    required TResult Function(_ChangeCurrencyAccoutnInputEvent value)
        changeCurrency,
    required TResult Function(_SaveAccountInputEvent value) save,
  }) {
    return save(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAccountInputEvent value)? fetch,
    TResult? Function(_ChangeTitleAccountInputEvent value)? changeTitle,
    TResult? Function(_ChangeIsDebtAccountInputEvent value)? changeIsDebt,
    TResult? Function(_ChangeCurrencyAccoutnInputEvent value)? changeCurrency,
    TResult? Function(_SaveAccountInputEvent value)? save,
  }) {
    return save?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAccountInputEvent value)? fetch,
    TResult Function(_ChangeTitleAccountInputEvent value)? changeTitle,
    TResult Function(_ChangeIsDebtAccountInputEvent value)? changeIsDebt,
    TResult Function(_ChangeCurrencyAccoutnInputEvent value)? changeCurrency,
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
  Currency get currency => throw _privateConstructorUsedError;
  Account? get account => throw _privateConstructorUsedError;
  bool get isSaved => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
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
      Currency currency,
      Account? account,
      bool isSaved});

  $AccountCopyWith<$Res>? get account;
}

/// @nodoc
class _$AccountInputStateCopyWithImpl<$Res, $Val extends AccountInputState>
    implements $AccountInputStateCopyWith<$Res> {
  _$AccountInputStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? isDebt = null,
    Object? currency = null,
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
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account?,
      isSaved: null == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AccountCopyWith<$Res>? get account {
    if (_value.account == null) {
      return null;
    }

    return $AccountCopyWith<$Res>(_value.account!, (value) {
      return _then(_value.copyWith(account: value) as $Val);
    });
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
      Currency currency,
      Account? account,
      bool isSaved});

  @override
  $AccountCopyWith<$Res>? get account;
}

/// @nodoc
class __$$AccountInputStateImplCopyWithImpl<$Res>
    extends _$AccountInputStateCopyWithImpl<$Res, _$AccountInputStateImpl>
    implements _$$AccountInputStateImplCopyWith<$Res> {
  __$$AccountInputStateImplCopyWithImpl(_$AccountInputStateImpl _value,
      $Res Function(_$AccountInputStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? isDebt = null,
    Object? currency = null,
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
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account?,
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
      required this.currency,
      this.account,
      required this.isSaved});

  @override
  final String title;
  @override
  final bool isDebt;
  @override
  final Currency currency;
  @override
  final Account? account;
  @override
  final bool isSaved;

  @override
  String toString() {
    return 'AccountInputState(title: $title, isDebt: $isDebt, currency: $currency, account: $account, isSaved: $isSaved)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountInputStateImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isDebt, isDebt) || other.isDebt == isDebt) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, isDebt, currency, account, isSaved);

  @JsonKey(ignore: true)
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
      required final Currency currency,
      final Account? account,
      required final bool isSaved}) = _$AccountInputStateImpl;

  @override
  String get title;
  @override
  bool get isDebt;
  @override
  Currency get currency;
  @override
  Account? get account;
  @override
  bool get isSaved;
  @override
  @JsonKey(ignore: true)
  _$$AccountInputStateImplCopyWith<_$AccountInputStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
