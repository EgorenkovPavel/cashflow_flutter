// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'operation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Operation {
  int get id => throw _privateConstructorUsedError;
  String get cloudId => throw _privateConstructorUsedError;
  bool get synced => throw _privateConstructorUsedError;
  bool get deleted => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  Account get account => throw _privateConstructorUsedError;
  int get sum => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, String cloudId, bool synced, bool deleted,
            DateTime date, Account account, Category category, int sum)
        input,
    required TResult Function(int id, String cloudId, bool synced, bool deleted,
            DateTime date, Account account, Category category, int sum)
        output,
    required TResult Function(int id, String cloudId, bool synced, bool deleted,
            DateTime date, Account account, Account recAccount, int sum)
        transfer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, String cloudId, bool synced, bool deleted,
            DateTime date, Account account, Category category, int sum)?
        input,
    TResult? Function(int id, String cloudId, bool synced, bool deleted,
            DateTime date, Account account, Category category, int sum)?
        output,
    TResult? Function(int id, String cloudId, bool synced, bool deleted,
            DateTime date, Account account, Account recAccount, int sum)?
        transfer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, String cloudId, bool synced, bool deleted,
            DateTime date, Account account, Category category, int sum)?
        input,
    TResult Function(int id, String cloudId, bool synced, bool deleted,
            DateTime date, Account account, Category category, int sum)?
        output,
    TResult Function(int id, String cloudId, bool synced, bool deleted,
            DateTime date, Account account, Account recAccount, int sum)?
        transfer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InputOperation value) input,
    required TResult Function(_OutputOperation value) output,
    required TResult Function(_TransferOperation value) transfer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InputOperation value)? input,
    TResult? Function(_OutputOperation value)? output,
    TResult? Function(_TransferOperation value)? transfer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InputOperation value)? input,
    TResult Function(_OutputOperation value)? output,
    TResult Function(_TransferOperation value)? transfer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OperationCopyWith<Operation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OperationCopyWith<$Res> {
  factory $OperationCopyWith(Operation value, $Res Function(Operation) then) =
      _$OperationCopyWithImpl<$Res, Operation>;
  @useResult
  $Res call(
      {int id,
      String cloudId,
      bool synced,
      bool deleted,
      DateTime date,
      Account account,
      int sum});

  $AccountCopyWith<$Res> get account;
}

/// @nodoc
class _$OperationCopyWithImpl<$Res, $Val extends Operation>
    implements $OperationCopyWith<$Res> {
  _$OperationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cloudId = null,
    Object? synced = null,
    Object? deleted = null,
    Object? date = null,
    Object? account = null,
    Object? sum = null,
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
      synced: null == synced
          ? _value.synced
          : synced // ignore: cast_nullable_to_non_nullable
              as bool,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account,
      sum: null == sum
          ? _value.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AccountCopyWith<$Res> get account {
    return $AccountCopyWith<$Res>(_value.account, (value) {
      return _then(_value.copyWith(account: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_InputOperationCopyWith<$Res>
    implements $OperationCopyWith<$Res> {
  factory _$$_InputOperationCopyWith(
          _$_InputOperation value, $Res Function(_$_InputOperation) then) =
      __$$_InputOperationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String cloudId,
      bool synced,
      bool deleted,
      DateTime date,
      Account account,
      Category category,
      int sum});

  @override
  $AccountCopyWith<$Res> get account;
  $CategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$$_InputOperationCopyWithImpl<$Res>
    extends _$OperationCopyWithImpl<$Res, _$_InputOperation>
    implements _$$_InputOperationCopyWith<$Res> {
  __$$_InputOperationCopyWithImpl(
      _$_InputOperation _value, $Res Function(_$_InputOperation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cloudId = null,
    Object? synced = null,
    Object? deleted = null,
    Object? date = null,
    Object? account = null,
    Object? category = null,
    Object? sum = null,
  }) {
    return _then(_$_InputOperation(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cloudId: null == cloudId
          ? _value.cloudId
          : cloudId // ignore: cast_nullable_to_non_nullable
              as String,
      synced: null == synced
          ? _value.synced
          : synced // ignore: cast_nullable_to_non_nullable
              as bool,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      sum: null == sum
          ? _value.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res> get category {
    return $CategoryCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value));
    });
  }
}

/// @nodoc

class _$_InputOperation extends _InputOperation {
  const _$_InputOperation(
      {this.id = 0,
      this.cloudId = '',
      this.synced = false,
      this.deleted = false,
      required this.date,
      required this.account,
      required this.category,
      required this.sum})
      : super._();

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String cloudId;
  @override
  @JsonKey()
  final bool synced;
  @override
  @JsonKey()
  final bool deleted;
  @override
  final DateTime date;
  @override
  final Account account;
  @override
  final Category category;
  @override
  final int sum;

  @override
  String toString() {
    return 'Operation.input(id: $id, cloudId: $cloudId, synced: $synced, deleted: $deleted, date: $date, account: $account, category: $category, sum: $sum)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InputOperation &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cloudId, cloudId) || other.cloudId == cloudId) &&
            (identical(other.synced, synced) || other.synced == synced) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.sum, sum) || other.sum == sum));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, cloudId, synced, deleted, date, account, category, sum);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InputOperationCopyWith<_$_InputOperation> get copyWith =>
      __$$_InputOperationCopyWithImpl<_$_InputOperation>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, String cloudId, bool synced, bool deleted,
            DateTime date, Account account, Category category, int sum)
        input,
    required TResult Function(int id, String cloudId, bool synced, bool deleted,
            DateTime date, Account account, Category category, int sum)
        output,
    required TResult Function(int id, String cloudId, bool synced, bool deleted,
            DateTime date, Account account, Account recAccount, int sum)
        transfer,
  }) {
    return input(id, cloudId, synced, deleted, date, account, category, sum);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, String cloudId, bool synced, bool deleted,
            DateTime date, Account account, Category category, int sum)?
        input,
    TResult? Function(int id, String cloudId, bool synced, bool deleted,
            DateTime date, Account account, Category category, int sum)?
        output,
    TResult? Function(int id, String cloudId, bool synced, bool deleted,
            DateTime date, Account account, Account recAccount, int sum)?
        transfer,
  }) {
    return input?.call(
        id, cloudId, synced, deleted, date, account, category, sum);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, String cloudId, bool synced, bool deleted,
            DateTime date, Account account, Category category, int sum)?
        input,
    TResult Function(int id, String cloudId, bool synced, bool deleted,
            DateTime date, Account account, Category category, int sum)?
        output,
    TResult Function(int id, String cloudId, bool synced, bool deleted,
            DateTime date, Account account, Account recAccount, int sum)?
        transfer,
    required TResult orElse(),
  }) {
    if (input != null) {
      return input(id, cloudId, synced, deleted, date, account, category, sum);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InputOperation value) input,
    required TResult Function(_OutputOperation value) output,
    required TResult Function(_TransferOperation value) transfer,
  }) {
    return input(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InputOperation value)? input,
    TResult? Function(_OutputOperation value)? output,
    TResult? Function(_TransferOperation value)? transfer,
  }) {
    return input?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InputOperation value)? input,
    TResult Function(_OutputOperation value)? output,
    TResult Function(_TransferOperation value)? transfer,
    required TResult orElse(),
  }) {
    if (input != null) {
      return input(this);
    }
    return orElse();
  }
}

abstract class _InputOperation extends Operation {
  const factory _InputOperation(
      {final int id,
      final String cloudId,
      final bool synced,
      final bool deleted,
      required final DateTime date,
      required final Account account,
      required final Category category,
      required final int sum}) = _$_InputOperation;
  const _InputOperation._() : super._();

  @override
  int get id;
  @override
  String get cloudId;
  @override
  bool get synced;
  @override
  bool get deleted;
  @override
  DateTime get date;
  @override
  Account get account;
  Category get category;
  @override
  int get sum;
  @override
  @JsonKey(ignore: true)
  _$$_InputOperationCopyWith<_$_InputOperation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_OutputOperationCopyWith<$Res>
    implements $OperationCopyWith<$Res> {
  factory _$$_OutputOperationCopyWith(
          _$_OutputOperation value, $Res Function(_$_OutputOperation) then) =
      __$$_OutputOperationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String cloudId,
      bool synced,
      bool deleted,
      DateTime date,
      Account account,
      Category category,
      int sum});

  @override
  $AccountCopyWith<$Res> get account;
  $CategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$$_OutputOperationCopyWithImpl<$Res>
    extends _$OperationCopyWithImpl<$Res, _$_OutputOperation>
    implements _$$_OutputOperationCopyWith<$Res> {
  __$$_OutputOperationCopyWithImpl(
      _$_OutputOperation _value, $Res Function(_$_OutputOperation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cloudId = null,
    Object? synced = null,
    Object? deleted = null,
    Object? date = null,
    Object? account = null,
    Object? category = null,
    Object? sum = null,
  }) {
    return _then(_$_OutputOperation(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cloudId: null == cloudId
          ? _value.cloudId
          : cloudId // ignore: cast_nullable_to_non_nullable
              as String,
      synced: null == synced
          ? _value.synced
          : synced // ignore: cast_nullable_to_non_nullable
              as bool,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      sum: null == sum
          ? _value.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res> get category {
    return $CategoryCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value));
    });
  }
}

/// @nodoc

class _$_OutputOperation extends _OutputOperation {
  const _$_OutputOperation(
      {this.id = 0,
      this.cloudId = '',
      this.synced = false,
      this.deleted = false,
      required this.date,
      required this.account,
      required this.category,
      required this.sum})
      : super._();

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String cloudId;
  @override
  @JsonKey()
  final bool synced;
  @override
  @JsonKey()
  final bool deleted;
  @override
  final DateTime date;
  @override
  final Account account;
  @override
  final Category category;
  @override
  final int sum;

  @override
  String toString() {
    return 'Operation.output(id: $id, cloudId: $cloudId, synced: $synced, deleted: $deleted, date: $date, account: $account, category: $category, sum: $sum)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OutputOperation &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cloudId, cloudId) || other.cloudId == cloudId) &&
            (identical(other.synced, synced) || other.synced == synced) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.sum, sum) || other.sum == sum));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, cloudId, synced, deleted, date, account, category, sum);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OutputOperationCopyWith<_$_OutputOperation> get copyWith =>
      __$$_OutputOperationCopyWithImpl<_$_OutputOperation>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, String cloudId, bool synced, bool deleted,
            DateTime date, Account account, Category category, int sum)
        input,
    required TResult Function(int id, String cloudId, bool synced, bool deleted,
            DateTime date, Account account, Category category, int sum)
        output,
    required TResult Function(int id, String cloudId, bool synced, bool deleted,
            DateTime date, Account account, Account recAccount, int sum)
        transfer,
  }) {
    return output(id, cloudId, synced, deleted, date, account, category, sum);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, String cloudId, bool synced, bool deleted,
            DateTime date, Account account, Category category, int sum)?
        input,
    TResult? Function(int id, String cloudId, bool synced, bool deleted,
            DateTime date, Account account, Category category, int sum)?
        output,
    TResult? Function(int id, String cloudId, bool synced, bool deleted,
            DateTime date, Account account, Account recAccount, int sum)?
        transfer,
  }) {
    return output?.call(
        id, cloudId, synced, deleted, date, account, category, sum);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, String cloudId, bool synced, bool deleted,
            DateTime date, Account account, Category category, int sum)?
        input,
    TResult Function(int id, String cloudId, bool synced, bool deleted,
            DateTime date, Account account, Category category, int sum)?
        output,
    TResult Function(int id, String cloudId, bool synced, bool deleted,
            DateTime date, Account account, Account recAccount, int sum)?
        transfer,
    required TResult orElse(),
  }) {
    if (output != null) {
      return output(id, cloudId, synced, deleted, date, account, category, sum);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InputOperation value) input,
    required TResult Function(_OutputOperation value) output,
    required TResult Function(_TransferOperation value) transfer,
  }) {
    return output(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InputOperation value)? input,
    TResult? Function(_OutputOperation value)? output,
    TResult? Function(_TransferOperation value)? transfer,
  }) {
    return output?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InputOperation value)? input,
    TResult Function(_OutputOperation value)? output,
    TResult Function(_TransferOperation value)? transfer,
    required TResult orElse(),
  }) {
    if (output != null) {
      return output(this);
    }
    return orElse();
  }
}

abstract class _OutputOperation extends Operation {
  const factory _OutputOperation(
      {final int id,
      final String cloudId,
      final bool synced,
      final bool deleted,
      required final DateTime date,
      required final Account account,
      required final Category category,
      required final int sum}) = _$_OutputOperation;
  const _OutputOperation._() : super._();

  @override
  int get id;
  @override
  String get cloudId;
  @override
  bool get synced;
  @override
  bool get deleted;
  @override
  DateTime get date;
  @override
  Account get account;
  Category get category;
  @override
  int get sum;
  @override
  @JsonKey(ignore: true)
  _$$_OutputOperationCopyWith<_$_OutputOperation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_TransferOperationCopyWith<$Res>
    implements $OperationCopyWith<$Res> {
  factory _$$_TransferOperationCopyWith(_$_TransferOperation value,
          $Res Function(_$_TransferOperation) then) =
      __$$_TransferOperationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String cloudId,
      bool synced,
      bool deleted,
      DateTime date,
      Account account,
      Account recAccount,
      int sum});

  @override
  $AccountCopyWith<$Res> get account;
  $AccountCopyWith<$Res> get recAccount;
}

/// @nodoc
class __$$_TransferOperationCopyWithImpl<$Res>
    extends _$OperationCopyWithImpl<$Res, _$_TransferOperation>
    implements _$$_TransferOperationCopyWith<$Res> {
  __$$_TransferOperationCopyWithImpl(
      _$_TransferOperation _value, $Res Function(_$_TransferOperation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cloudId = null,
    Object? synced = null,
    Object? deleted = null,
    Object? date = null,
    Object? account = null,
    Object? recAccount = null,
    Object? sum = null,
  }) {
    return _then(_$_TransferOperation(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cloudId: null == cloudId
          ? _value.cloudId
          : cloudId // ignore: cast_nullable_to_non_nullable
              as String,
      synced: null == synced
          ? _value.synced
          : synced // ignore: cast_nullable_to_non_nullable
              as bool,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account,
      recAccount: null == recAccount
          ? _value.recAccount
          : recAccount // ignore: cast_nullable_to_non_nullable
              as Account,
      sum: null == sum
          ? _value.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AccountCopyWith<$Res> get recAccount {
    return $AccountCopyWith<$Res>(_value.recAccount, (value) {
      return _then(_value.copyWith(recAccount: value));
    });
  }
}

/// @nodoc

class _$_TransferOperation extends _TransferOperation {
  const _$_TransferOperation(
      {this.id = 0,
      this.cloudId = '',
      this.synced = false,
      this.deleted = false,
      required this.date,
      required this.account,
      required this.recAccount,
      required this.sum})
      : super._();

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String cloudId;
  @override
  @JsonKey()
  final bool synced;
  @override
  @JsonKey()
  final bool deleted;
  @override
  final DateTime date;
  @override
  final Account account;
  @override
  final Account recAccount;
  @override
  final int sum;

  @override
  String toString() {
    return 'Operation.transfer(id: $id, cloudId: $cloudId, synced: $synced, deleted: $deleted, date: $date, account: $account, recAccount: $recAccount, sum: $sum)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransferOperation &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cloudId, cloudId) || other.cloudId == cloudId) &&
            (identical(other.synced, synced) || other.synced == synced) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.recAccount, recAccount) ||
                other.recAccount == recAccount) &&
            (identical(other.sum, sum) || other.sum == sum));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, cloudId, synced, deleted,
      date, account, recAccount, sum);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransferOperationCopyWith<_$_TransferOperation> get copyWith =>
      __$$_TransferOperationCopyWithImpl<_$_TransferOperation>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, String cloudId, bool synced, bool deleted,
            DateTime date, Account account, Category category, int sum)
        input,
    required TResult Function(int id, String cloudId, bool synced, bool deleted,
            DateTime date, Account account, Category category, int sum)
        output,
    required TResult Function(int id, String cloudId, bool synced, bool deleted,
            DateTime date, Account account, Account recAccount, int sum)
        transfer,
  }) {
    return transfer(
        id, cloudId, synced, deleted, date, account, recAccount, sum);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, String cloudId, bool synced, bool deleted,
            DateTime date, Account account, Category category, int sum)?
        input,
    TResult? Function(int id, String cloudId, bool synced, bool deleted,
            DateTime date, Account account, Category category, int sum)?
        output,
    TResult? Function(int id, String cloudId, bool synced, bool deleted,
            DateTime date, Account account, Account recAccount, int sum)?
        transfer,
  }) {
    return transfer?.call(
        id, cloudId, synced, deleted, date, account, recAccount, sum);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, String cloudId, bool synced, bool deleted,
            DateTime date, Account account, Category category, int sum)?
        input,
    TResult Function(int id, String cloudId, bool synced, bool deleted,
            DateTime date, Account account, Category category, int sum)?
        output,
    TResult Function(int id, String cloudId, bool synced, bool deleted,
            DateTime date, Account account, Account recAccount, int sum)?
        transfer,
    required TResult orElse(),
  }) {
    if (transfer != null) {
      return transfer(
          id, cloudId, synced, deleted, date, account, recAccount, sum);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InputOperation value) input,
    required TResult Function(_OutputOperation value) output,
    required TResult Function(_TransferOperation value) transfer,
  }) {
    return transfer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InputOperation value)? input,
    TResult? Function(_OutputOperation value)? output,
    TResult? Function(_TransferOperation value)? transfer,
  }) {
    return transfer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InputOperation value)? input,
    TResult Function(_OutputOperation value)? output,
    TResult Function(_TransferOperation value)? transfer,
    required TResult orElse(),
  }) {
    if (transfer != null) {
      return transfer(this);
    }
    return orElse();
  }
}

abstract class _TransferOperation extends Operation {
  const factory _TransferOperation(
      {final int id,
      final String cloudId,
      final bool synced,
      final bool deleted,
      required final DateTime date,
      required final Account account,
      required final Account recAccount,
      required final int sum}) = _$_TransferOperation;
  const _TransferOperation._() : super._();

  @override
  int get id;
  @override
  String get cloudId;
  @override
  bool get synced;
  @override
  bool get deleted;
  @override
  DateTime get date;
  @override
  Account get account;
  Account get recAccount;
  @override
  int get sum;
  @override
  @JsonKey(ignore: true)
  _$$_TransferOperationCopyWith<_$_TransferOperation> get copyWith =>
      throw _privateConstructorUsedError;
}
