// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, UserDB> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _googleIdMeta =
      const VerificationMeta('googleId');
  @override
  late final GeneratedColumn<String> googleId = GeneratedColumn<String>(
      'google_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _photoMeta = const VerificationMeta('photo');
  @override
  late final GeneratedColumn<String> photo = GeneratedColumn<String>(
      'photo', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, googleId, name, photo];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<UserDB> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('google_id')) {
      context.handle(_googleIdMeta,
          googleId.isAcceptableOrUnknown(data['google_id']!, _googleIdMeta));
    } else if (isInserting) {
      context.missing(_googleIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('photo')) {
      context.handle(
          _photoMeta, photo.isAcceptableOrUnknown(data['photo']!, _photoMeta));
    } else if (isInserting) {
      context.missing(_photoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserDB map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserDB(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      googleId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}google_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      photo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}photo'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class UserDB extends DataClass implements Insertable<UserDB> {
  final int id;
  final String googleId;
  final String name;
  final String photo;
  const UserDB(
      {required this.id,
      required this.googleId,
      required this.name,
      required this.photo});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['google_id'] = Variable<String>(googleId);
    map['name'] = Variable<String>(name);
    map['photo'] = Variable<String>(photo);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      googleId: Value(googleId),
      name: Value(name),
      photo: Value(photo),
    );
  }

  factory UserDB.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserDB(
      id: serializer.fromJson<int>(json['id']),
      googleId: serializer.fromJson<String>(json['googleId']),
      name: serializer.fromJson<String>(json['name']),
      photo: serializer.fromJson<String>(json['photo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'googleId': serializer.toJson<String>(googleId),
      'name': serializer.toJson<String>(name),
      'photo': serializer.toJson<String>(photo),
    };
  }

  UserDB copyWith({int? id, String? googleId, String? name, String? photo}) =>
      UserDB(
        id: id ?? this.id,
        googleId: googleId ?? this.googleId,
        name: name ?? this.name,
        photo: photo ?? this.photo,
      );
  UserDB copyWithCompanion(UsersCompanion data) {
    return UserDB(
      id: data.id.present ? data.id.value : this.id,
      googleId: data.googleId.present ? data.googleId.value : this.googleId,
      name: data.name.present ? data.name.value : this.name,
      photo: data.photo.present ? data.photo.value : this.photo,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserDB(')
          ..write('id: $id, ')
          ..write('googleId: $googleId, ')
          ..write('name: $name, ')
          ..write('photo: $photo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, googleId, name, photo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserDB &&
          other.id == this.id &&
          other.googleId == this.googleId &&
          other.name == this.name &&
          other.photo == this.photo);
}

class UsersCompanion extends UpdateCompanion<UserDB> {
  final Value<int> id;
  final Value<String> googleId;
  final Value<String> name;
  final Value<String> photo;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.googleId = const Value.absent(),
    this.name = const Value.absent(),
    this.photo = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String googleId,
    required String name,
    required String photo,
  })  : googleId = Value(googleId),
        name = Value(name),
        photo = Value(photo);
  static Insertable<UserDB> custom({
    Expression<int>? id,
    Expression<String>? googleId,
    Expression<String>? name,
    Expression<String>? photo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (googleId != null) 'google_id': googleId,
      if (name != null) 'name': name,
      if (photo != null) 'photo': photo,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? id,
      Value<String>? googleId,
      Value<String>? name,
      Value<String>? photo}) {
    return UsersCompanion(
      id: id ?? this.id,
      googleId: googleId ?? this.googleId,
      name: name ?? this.name,
      photo: photo ?? this.photo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (googleId.present) {
      map['google_id'] = Variable<String>(googleId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (photo.present) {
      map['photo'] = Variable<String>(photo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('googleId: $googleId, ')
          ..write('name: $name, ')
          ..write('photo: $photo')
          ..write(')'))
        .toString();
  }
}

class $AccountsTable extends Accounts
    with TableInfo<$AccountsTable, AccountDB> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _cloudIdMeta =
      const VerificationMeta('cloudId');
  @override
  late final GeneratedColumn<String> cloudId = GeneratedColumn<String>(
      'cloud_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isDebtMeta = const VerificationMeta('isDebt');
  @override
  late final GeneratedColumn<bool> isDebt = GeneratedColumn<bool>(
      'is_debt', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_debt" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  @override
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _userMeta = const VerificationMeta('user');
  @override
  late final GeneratedColumn<int> user = GeneratedColumn<int>(
      'user', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, cloudId, title, isDebt, synced, user];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'accounts';
  @override
  VerificationContext validateIntegrity(Insertable<AccountDB> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('cloud_id')) {
      context.handle(_cloudIdMeta,
          cloudId.isAcceptableOrUnknown(data['cloud_id']!, _cloudIdMeta));
    } else if (isInserting) {
      context.missing(_cloudIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('is_debt')) {
      context.handle(_isDebtMeta,
          isDebt.isAcceptableOrUnknown(data['is_debt']!, _isDebtMeta));
    }
    if (data.containsKey('synced')) {
      context.handle(_syncedMeta,
          synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta));
    }
    if (data.containsKey('user')) {
      context.handle(
          _userMeta, user.isAcceptableOrUnknown(data['user']!, _userMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AccountDB map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AccountDB(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      cloudId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cloud_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      isDebt: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_debt'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      user: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user']),
    );
  }

  @override
  $AccountsTable createAlias(String alias) {
    return $AccountsTable(attachedDatabase, alias);
  }
}

class AccountDB extends DataClass implements Insertable<AccountDB> {
  final int id;
  final String cloudId;
  final String title;
  final bool isDebt;
  final bool synced;
  final int? user;
  const AccountDB(
      {required this.id,
      required this.cloudId,
      required this.title,
      required this.isDebt,
      required this.synced,
      this.user});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['cloud_id'] = Variable<String>(cloudId);
    map['title'] = Variable<String>(title);
    map['is_debt'] = Variable<bool>(isDebt);
    map['synced'] = Variable<bool>(synced);
    if (!nullToAbsent || user != null) {
      map['user'] = Variable<int>(user);
    }
    return map;
  }

  AccountsCompanion toCompanion(bool nullToAbsent) {
    return AccountsCompanion(
      id: Value(id),
      cloudId: Value(cloudId),
      title: Value(title),
      isDebt: Value(isDebt),
      synced: Value(synced),
      user: user == null && nullToAbsent ? const Value.absent() : Value(user),
    );
  }

  factory AccountDB.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AccountDB(
      id: serializer.fromJson<int>(json['id']),
      cloudId: serializer.fromJson<String>(json['cloudId']),
      title: serializer.fromJson<String>(json['title']),
      isDebt: serializer.fromJson<bool>(json['isDebt']),
      synced: serializer.fromJson<bool>(json['synced']),
      user: serializer.fromJson<int?>(json['user']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'cloudId': serializer.toJson<String>(cloudId),
      'title': serializer.toJson<String>(title),
      'isDebt': serializer.toJson<bool>(isDebt),
      'synced': serializer.toJson<bool>(synced),
      'user': serializer.toJson<int?>(user),
    };
  }

  AccountDB copyWith(
          {int? id,
          String? cloudId,
          String? title,
          bool? isDebt,
          bool? synced,
          Value<int?> user = const Value.absent()}) =>
      AccountDB(
        id: id ?? this.id,
        cloudId: cloudId ?? this.cloudId,
        title: title ?? this.title,
        isDebt: isDebt ?? this.isDebt,
        synced: synced ?? this.synced,
        user: user.present ? user.value : this.user,
      );
  AccountDB copyWithCompanion(AccountsCompanion data) {
    return AccountDB(
      id: data.id.present ? data.id.value : this.id,
      cloudId: data.cloudId.present ? data.cloudId.value : this.cloudId,
      title: data.title.present ? data.title.value : this.title,
      isDebt: data.isDebt.present ? data.isDebt.value : this.isDebt,
      synced: data.synced.present ? data.synced.value : this.synced,
      user: data.user.present ? data.user.value : this.user,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AccountDB(')
          ..write('id: $id, ')
          ..write('cloudId: $cloudId, ')
          ..write('title: $title, ')
          ..write('isDebt: $isDebt, ')
          ..write('synced: $synced, ')
          ..write('user: $user')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, cloudId, title, isDebt, synced, user);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccountDB &&
          other.id == this.id &&
          other.cloudId == this.cloudId &&
          other.title == this.title &&
          other.isDebt == this.isDebt &&
          other.synced == this.synced &&
          other.user == this.user);
}

class AccountsCompanion extends UpdateCompanion<AccountDB> {
  final Value<int> id;
  final Value<String> cloudId;
  final Value<String> title;
  final Value<bool> isDebt;
  final Value<bool> synced;
  final Value<int?> user;
  const AccountsCompanion({
    this.id = const Value.absent(),
    this.cloudId = const Value.absent(),
    this.title = const Value.absent(),
    this.isDebt = const Value.absent(),
    this.synced = const Value.absent(),
    this.user = const Value.absent(),
  });
  AccountsCompanion.insert({
    this.id = const Value.absent(),
    required String cloudId,
    required String title,
    this.isDebt = const Value.absent(),
    this.synced = const Value.absent(),
    this.user = const Value.absent(),
  })  : cloudId = Value(cloudId),
        title = Value(title);
  static Insertable<AccountDB> custom({
    Expression<int>? id,
    Expression<String>? cloudId,
    Expression<String>? title,
    Expression<bool>? isDebt,
    Expression<bool>? synced,
    Expression<int>? user,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cloudId != null) 'cloud_id': cloudId,
      if (title != null) 'title': title,
      if (isDebt != null) 'is_debt': isDebt,
      if (synced != null) 'synced': synced,
      if (user != null) 'user': user,
    });
  }

  AccountsCompanion copyWith(
      {Value<int>? id,
      Value<String>? cloudId,
      Value<String>? title,
      Value<bool>? isDebt,
      Value<bool>? synced,
      Value<int?>? user}) {
    return AccountsCompanion(
      id: id ?? this.id,
      cloudId: cloudId ?? this.cloudId,
      title: title ?? this.title,
      isDebt: isDebt ?? this.isDebt,
      synced: synced ?? this.synced,
      user: user ?? this.user,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (cloudId.present) {
      map['cloud_id'] = Variable<String>(cloudId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (isDebt.present) {
      map['is_debt'] = Variable<bool>(isDebt.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    if (user.present) {
      map['user'] = Variable<int>(user.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountsCompanion(')
          ..write('id: $id, ')
          ..write('cloudId: $cloudId, ')
          ..write('title: $title, ')
          ..write('isDebt: $isDebt, ')
          ..write('synced: $synced, ')
          ..write('user: $user')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, CategoryDB> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _cloudIdMeta =
      const VerificationMeta('cloudId');
  @override
  late final GeneratedColumn<String> cloudId = GeneratedColumn<String>(
      'cloud_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _operationTypeMeta =
      const VerificationMeta('operationType');
  @override
  late final GeneratedColumnWithTypeConverter<OperationType, int>
      operationType = GeneratedColumn<int>('operation_type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<OperationType>(
              $CategoriesTable.$converteroperationType);
  static const VerificationMeta _budgetTypeMeta =
      const VerificationMeta('budgetType');
  @override
  late final GeneratedColumnWithTypeConverter<BudgetType, int> budgetType =
      GeneratedColumn<int>('budget_type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<BudgetType>($CategoriesTable.$converterbudgetType);
  static const VerificationMeta _budgetMeta = const VerificationMeta('budget');
  @override
  late final GeneratedColumn<int> budget = GeneratedColumn<int>(
      'budget', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  @override
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _isGroupMeta =
      const VerificationMeta('isGroup');
  @override
  late final GeneratedColumn<bool> isGroup = GeneratedColumn<bool>(
      'is_group', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_group" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _parentMeta = const VerificationMeta('parent');
  @override
  late final GeneratedColumn<int> parent = GeneratedColumn<int>(
      'parent', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES categories (id)'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        cloudId,
        title,
        operationType,
        budgetType,
        budget,
        synced,
        isGroup,
        parent
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryDB> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('cloud_id')) {
      context.handle(_cloudIdMeta,
          cloudId.isAcceptableOrUnknown(data['cloud_id']!, _cloudIdMeta));
    } else if (isInserting) {
      context.missing(_cloudIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    context.handle(_operationTypeMeta, const VerificationResult.success());
    context.handle(_budgetTypeMeta, const VerificationResult.success());
    if (data.containsKey('budget')) {
      context.handle(_budgetMeta,
          budget.isAcceptableOrUnknown(data['budget']!, _budgetMeta));
    } else if (isInserting) {
      context.missing(_budgetMeta);
    }
    if (data.containsKey('synced')) {
      context.handle(_syncedMeta,
          synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta));
    }
    if (data.containsKey('is_group')) {
      context.handle(_isGroupMeta,
          isGroup.isAcceptableOrUnknown(data['is_group']!, _isGroupMeta));
    }
    if (data.containsKey('parent')) {
      context.handle(_parentMeta,
          parent.isAcceptableOrUnknown(data['parent']!, _parentMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryDB map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryDB(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      cloudId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cloud_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      operationType: $CategoriesTable.$converteroperationType.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.int, data['${effectivePrefix}operation_type'])!),
      budgetType: $CategoriesTable.$converterbudgetType.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}budget_type'])!),
      budget: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}budget'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      isGroup: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_group'])!,
      parent: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}parent']),
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }

  static TypeConverter<OperationType, int> $converteroperationType =
      const OperationTypeConverter();
  static TypeConverter<BudgetType, int> $converterbudgetType =
      const BudgetTypeConverter();
}

class CategoryDB extends DataClass implements Insertable<CategoryDB> {
  final int id;
  final String cloudId;
  final String title;
  final OperationType operationType;
  final BudgetType budgetType;
  final int budget;
  final bool synced;
  final bool isGroup;
  final int? parent;
  const CategoryDB(
      {required this.id,
      required this.cloudId,
      required this.title,
      required this.operationType,
      required this.budgetType,
      required this.budget,
      required this.synced,
      required this.isGroup,
      this.parent});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['cloud_id'] = Variable<String>(cloudId);
    map['title'] = Variable<String>(title);
    {
      map['operation_type'] = Variable<int>(
          $CategoriesTable.$converteroperationType.toSql(operationType));
    }
    {
      map['budget_type'] = Variable<int>(
          $CategoriesTable.$converterbudgetType.toSql(budgetType));
    }
    map['budget'] = Variable<int>(budget);
    map['synced'] = Variable<bool>(synced);
    map['is_group'] = Variable<bool>(isGroup);
    if (!nullToAbsent || parent != null) {
      map['parent'] = Variable<int>(parent);
    }
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      cloudId: Value(cloudId),
      title: Value(title),
      operationType: Value(operationType),
      budgetType: Value(budgetType),
      budget: Value(budget),
      synced: Value(synced),
      isGroup: Value(isGroup),
      parent:
          parent == null && nullToAbsent ? const Value.absent() : Value(parent),
    );
  }

  factory CategoryDB.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryDB(
      id: serializer.fromJson<int>(json['id']),
      cloudId: serializer.fromJson<String>(json['cloudId']),
      title: serializer.fromJson<String>(json['title']),
      operationType: serializer.fromJson<OperationType>(json['operationType']),
      budgetType: serializer.fromJson<BudgetType>(json['budgetType']),
      budget: serializer.fromJson<int>(json['budget']),
      synced: serializer.fromJson<bool>(json['synced']),
      isGroup: serializer.fromJson<bool>(json['isGroup']),
      parent: serializer.fromJson<int?>(json['parent']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'cloudId': serializer.toJson<String>(cloudId),
      'title': serializer.toJson<String>(title),
      'operationType': serializer.toJson<OperationType>(operationType),
      'budgetType': serializer.toJson<BudgetType>(budgetType),
      'budget': serializer.toJson<int>(budget),
      'synced': serializer.toJson<bool>(synced),
      'isGroup': serializer.toJson<bool>(isGroup),
      'parent': serializer.toJson<int?>(parent),
    };
  }

  CategoryDB copyWith(
          {int? id,
          String? cloudId,
          String? title,
          OperationType? operationType,
          BudgetType? budgetType,
          int? budget,
          bool? synced,
          bool? isGroup,
          Value<int?> parent = const Value.absent()}) =>
      CategoryDB(
        id: id ?? this.id,
        cloudId: cloudId ?? this.cloudId,
        title: title ?? this.title,
        operationType: operationType ?? this.operationType,
        budgetType: budgetType ?? this.budgetType,
        budget: budget ?? this.budget,
        synced: synced ?? this.synced,
        isGroup: isGroup ?? this.isGroup,
        parent: parent.present ? parent.value : this.parent,
      );
  CategoryDB copyWithCompanion(CategoriesCompanion data) {
    return CategoryDB(
      id: data.id.present ? data.id.value : this.id,
      cloudId: data.cloudId.present ? data.cloudId.value : this.cloudId,
      title: data.title.present ? data.title.value : this.title,
      operationType: data.operationType.present
          ? data.operationType.value
          : this.operationType,
      budgetType:
          data.budgetType.present ? data.budgetType.value : this.budgetType,
      budget: data.budget.present ? data.budget.value : this.budget,
      synced: data.synced.present ? data.synced.value : this.synced,
      isGroup: data.isGroup.present ? data.isGroup.value : this.isGroup,
      parent: data.parent.present ? data.parent.value : this.parent,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryDB(')
          ..write('id: $id, ')
          ..write('cloudId: $cloudId, ')
          ..write('title: $title, ')
          ..write('operationType: $operationType, ')
          ..write('budgetType: $budgetType, ')
          ..write('budget: $budget, ')
          ..write('synced: $synced, ')
          ..write('isGroup: $isGroup, ')
          ..write('parent: $parent')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, cloudId, title, operationType, budgetType,
      budget, synced, isGroup, parent);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryDB &&
          other.id == this.id &&
          other.cloudId == this.cloudId &&
          other.title == this.title &&
          other.operationType == this.operationType &&
          other.budgetType == this.budgetType &&
          other.budget == this.budget &&
          other.synced == this.synced &&
          other.isGroup == this.isGroup &&
          other.parent == this.parent);
}

class CategoriesCompanion extends UpdateCompanion<CategoryDB> {
  final Value<int> id;
  final Value<String> cloudId;
  final Value<String> title;
  final Value<OperationType> operationType;
  final Value<BudgetType> budgetType;
  final Value<int> budget;
  final Value<bool> synced;
  final Value<bool> isGroup;
  final Value<int?> parent;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.cloudId = const Value.absent(),
    this.title = const Value.absent(),
    this.operationType = const Value.absent(),
    this.budgetType = const Value.absent(),
    this.budget = const Value.absent(),
    this.synced = const Value.absent(),
    this.isGroup = const Value.absent(),
    this.parent = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String cloudId,
    required String title,
    required OperationType operationType,
    required BudgetType budgetType,
    required int budget,
    this.synced = const Value.absent(),
    this.isGroup = const Value.absent(),
    this.parent = const Value.absent(),
  })  : cloudId = Value(cloudId),
        title = Value(title),
        operationType = Value(operationType),
        budgetType = Value(budgetType),
        budget = Value(budget);
  static Insertable<CategoryDB> custom({
    Expression<int>? id,
    Expression<String>? cloudId,
    Expression<String>? title,
    Expression<int>? operationType,
    Expression<int>? budgetType,
    Expression<int>? budget,
    Expression<bool>? synced,
    Expression<bool>? isGroup,
    Expression<int>? parent,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cloudId != null) 'cloud_id': cloudId,
      if (title != null) 'title': title,
      if (operationType != null) 'operation_type': operationType,
      if (budgetType != null) 'budget_type': budgetType,
      if (budget != null) 'budget': budget,
      if (synced != null) 'synced': synced,
      if (isGroup != null) 'is_group': isGroup,
      if (parent != null) 'parent': parent,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? cloudId,
      Value<String>? title,
      Value<OperationType>? operationType,
      Value<BudgetType>? budgetType,
      Value<int>? budget,
      Value<bool>? synced,
      Value<bool>? isGroup,
      Value<int?>? parent}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      cloudId: cloudId ?? this.cloudId,
      title: title ?? this.title,
      operationType: operationType ?? this.operationType,
      budgetType: budgetType ?? this.budgetType,
      budget: budget ?? this.budget,
      synced: synced ?? this.synced,
      isGroup: isGroup ?? this.isGroup,
      parent: parent ?? this.parent,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (cloudId.present) {
      map['cloud_id'] = Variable<String>(cloudId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (operationType.present) {
      map['operation_type'] = Variable<int>(
          $CategoriesTable.$converteroperationType.toSql(operationType.value));
    }
    if (budgetType.present) {
      map['budget_type'] = Variable<int>(
          $CategoriesTable.$converterbudgetType.toSql(budgetType.value));
    }
    if (budget.present) {
      map['budget'] = Variable<int>(budget.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    if (isGroup.present) {
      map['is_group'] = Variable<bool>(isGroup.value);
    }
    if (parent.present) {
      map['parent'] = Variable<int>(parent.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('cloudId: $cloudId, ')
          ..write('title: $title, ')
          ..write('operationType: $operationType, ')
          ..write('budgetType: $budgetType, ')
          ..write('budget: $budget, ')
          ..write('synced: $synced, ')
          ..write('isGroup: $isGroup, ')
          ..write('parent: $parent')
          ..write(')'))
        .toString();
  }
}

class $OperationsTable extends Operations
    with TableInfo<$OperationsTable, OperationDB> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OperationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _cloudIdMeta =
      const VerificationMeta('cloudId');
  @override
  late final GeneratedColumn<String> cloudId = GeneratedColumn<String>(
      'cloud_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _operationTypeMeta =
      const VerificationMeta('operationType');
  @override
  late final GeneratedColumnWithTypeConverter<OperationType, int>
      operationType = GeneratedColumn<int>('operation_type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<OperationType>(
              $OperationsTable.$converteroperationType);
  static const VerificationMeta _accountMeta =
      const VerificationMeta('account');
  @override
  late final GeneratedColumn<int> account = GeneratedColumn<int>(
      'account', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES accounts (id)'));
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<int> category = GeneratedColumn<int>(
      'category', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES categories (id)'));
  static const VerificationMeta _recAccountMeta =
      const VerificationMeta('recAccount');
  @override
  late final GeneratedColumn<int> recAccount = GeneratedColumn<int>(
      'rec_account', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES accounts (id)'));
  static const VerificationMeta _sumMeta = const VerificationMeta('sum');
  @override
  late final GeneratedColumn<int> sum = GeneratedColumn<int>(
      'sum', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _recSumMeta = const VerificationMeta('recSum');
  @override
  late final GeneratedColumn<int> recSum = GeneratedColumn<int>(
      'rec_sum', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  @override
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _deletedMeta =
      const VerificationMeta('deleted');
  @override
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _currencySentMeta =
      const VerificationMeta('currencySent');
  @override
  late final GeneratedColumnWithTypeConverter<Currency, String> currencySent =
      GeneratedColumn<String>('currency_sent', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('RUB'))
          .withConverter<Currency>($OperationsTable.$convertercurrencySent);
  static const VerificationMeta _currencyReceivedMeta =
      const VerificationMeta('currencyReceived');
  @override
  late final GeneratedColumnWithTypeConverter<Currency, String>
      currencyReceived = GeneratedColumn<String>(
              'currency_received', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('RUB'))
          .withConverter<Currency>($OperationsTable.$convertercurrencyReceived);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        cloudId,
        date,
        operationType,
        account,
        category,
        recAccount,
        sum,
        recSum,
        synced,
        deleted,
        currencySent,
        currencyReceived
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'operations';
  @override
  VerificationContext validateIntegrity(Insertable<OperationDB> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('cloud_id')) {
      context.handle(_cloudIdMeta,
          cloudId.isAcceptableOrUnknown(data['cloud_id']!, _cloudIdMeta));
    } else if (isInserting) {
      context.missing(_cloudIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    context.handle(_operationTypeMeta, const VerificationResult.success());
    if (data.containsKey('account')) {
      context.handle(_accountMeta,
          account.isAcceptableOrUnknown(data['account']!, _accountMeta));
    } else if (isInserting) {
      context.missing(_accountMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    }
    if (data.containsKey('rec_account')) {
      context.handle(
          _recAccountMeta,
          recAccount.isAcceptableOrUnknown(
              data['rec_account']!, _recAccountMeta));
    }
    if (data.containsKey('sum')) {
      context.handle(
          _sumMeta, sum.isAcceptableOrUnknown(data['sum']!, _sumMeta));
    } else if (isInserting) {
      context.missing(_sumMeta);
    }
    if (data.containsKey('rec_sum')) {
      context.handle(_recSumMeta,
          recSum.isAcceptableOrUnknown(data['rec_sum']!, _recSumMeta));
    }
    if (data.containsKey('synced')) {
      context.handle(_syncedMeta,
          synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta));
    }
    if (data.containsKey('deleted')) {
      context.handle(_deletedMeta,
          deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta));
    }
    context.handle(_currencySentMeta, const VerificationResult.success());
    context.handle(_currencyReceivedMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OperationDB map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OperationDB(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      cloudId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cloud_id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      operationType: $OperationsTable.$converteroperationType.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.int, data['${effectivePrefix}operation_type'])!),
      account: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}account'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category']),
      recAccount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}rec_account']),
      sum: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sum'])!,
      recSum: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}rec_sum'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted'])!,
      currencySent: $OperationsTable.$convertercurrencySent.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}currency_sent'])!),
      currencyReceived: $OperationsTable.$convertercurrencyReceived.fromSql(
          attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}currency_received'])!),
    );
  }

  @override
  $OperationsTable createAlias(String alias) {
    return $OperationsTable(attachedDatabase, alias);
  }

  static TypeConverter<OperationType, int> $converteroperationType =
      const OperationTypeConverter();
  static TypeConverter<Currency, String> $convertercurrencySent =
      const CurrencyConverter();
  static TypeConverter<Currency, String> $convertercurrencyReceived =
      const CurrencyConverter();
}

class OperationDB extends DataClass implements Insertable<OperationDB> {
  final int id;
  final String cloudId;
  final DateTime date;
  final OperationType operationType;
  final int account;
  final int? category;
  final int? recAccount;
  final int sum;
  final int recSum;
  final bool synced;
  final bool deleted;
  final Currency currencySent;
  final Currency currencyReceived;
  const OperationDB(
      {required this.id,
      required this.cloudId,
      required this.date,
      required this.operationType,
      required this.account,
      this.category,
      this.recAccount,
      required this.sum,
      required this.recSum,
      required this.synced,
      required this.deleted,
      required this.currencySent,
      required this.currencyReceived});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['cloud_id'] = Variable<String>(cloudId);
    map['date'] = Variable<DateTime>(date);
    {
      map['operation_type'] = Variable<int>(
          $OperationsTable.$converteroperationType.toSql(operationType));
    }
    map['account'] = Variable<int>(account);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<int>(category);
    }
    if (!nullToAbsent || recAccount != null) {
      map['rec_account'] = Variable<int>(recAccount);
    }
    map['sum'] = Variable<int>(sum);
    map['rec_sum'] = Variable<int>(recSum);
    map['synced'] = Variable<bool>(synced);
    map['deleted'] = Variable<bool>(deleted);
    {
      map['currency_sent'] = Variable<String>(
          $OperationsTable.$convertercurrencySent.toSql(currencySent));
    }
    {
      map['currency_received'] = Variable<String>(
          $OperationsTable.$convertercurrencyReceived.toSql(currencyReceived));
    }
    return map;
  }

  OperationsCompanion toCompanion(bool nullToAbsent) {
    return OperationsCompanion(
      id: Value(id),
      cloudId: Value(cloudId),
      date: Value(date),
      operationType: Value(operationType),
      account: Value(account),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      recAccount: recAccount == null && nullToAbsent
          ? const Value.absent()
          : Value(recAccount),
      sum: Value(sum),
      recSum: Value(recSum),
      synced: Value(synced),
      deleted: Value(deleted),
      currencySent: Value(currencySent),
      currencyReceived: Value(currencyReceived),
    );
  }

  factory OperationDB.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OperationDB(
      id: serializer.fromJson<int>(json['id']),
      cloudId: serializer.fromJson<String>(json['cloudId']),
      date: serializer.fromJson<DateTime>(json['date']),
      operationType: serializer.fromJson<OperationType>(json['operationType']),
      account: serializer.fromJson<int>(json['account']),
      category: serializer.fromJson<int?>(json['category']),
      recAccount: serializer.fromJson<int?>(json['recAccount']),
      sum: serializer.fromJson<int>(json['sum']),
      recSum: serializer.fromJson<int>(json['recSum']),
      synced: serializer.fromJson<bool>(json['synced']),
      deleted: serializer.fromJson<bool>(json['deleted']),
      currencySent: serializer.fromJson<Currency>(json['currencySent']),
      currencyReceived: serializer.fromJson<Currency>(json['currencyReceived']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'cloudId': serializer.toJson<String>(cloudId),
      'date': serializer.toJson<DateTime>(date),
      'operationType': serializer.toJson<OperationType>(operationType),
      'account': serializer.toJson<int>(account),
      'category': serializer.toJson<int?>(category),
      'recAccount': serializer.toJson<int?>(recAccount),
      'sum': serializer.toJson<int>(sum),
      'recSum': serializer.toJson<int>(recSum),
      'synced': serializer.toJson<bool>(synced),
      'deleted': serializer.toJson<bool>(deleted),
      'currencySent': serializer.toJson<Currency>(currencySent),
      'currencyReceived': serializer.toJson<Currency>(currencyReceived),
    };
  }

  OperationDB copyWith(
          {int? id,
          String? cloudId,
          DateTime? date,
          OperationType? operationType,
          int? account,
          Value<int?> category = const Value.absent(),
          Value<int?> recAccount = const Value.absent(),
          int? sum,
          int? recSum,
          bool? synced,
          bool? deleted,
          Currency? currencySent,
          Currency? currencyReceived}) =>
      OperationDB(
        id: id ?? this.id,
        cloudId: cloudId ?? this.cloudId,
        date: date ?? this.date,
        operationType: operationType ?? this.operationType,
        account: account ?? this.account,
        category: category.present ? category.value : this.category,
        recAccount: recAccount.present ? recAccount.value : this.recAccount,
        sum: sum ?? this.sum,
        recSum: recSum ?? this.recSum,
        synced: synced ?? this.synced,
        deleted: deleted ?? this.deleted,
        currencySent: currencySent ?? this.currencySent,
        currencyReceived: currencyReceived ?? this.currencyReceived,
      );
  OperationDB copyWithCompanion(OperationsCompanion data) {
    return OperationDB(
      id: data.id.present ? data.id.value : this.id,
      cloudId: data.cloudId.present ? data.cloudId.value : this.cloudId,
      date: data.date.present ? data.date.value : this.date,
      operationType: data.operationType.present
          ? data.operationType.value
          : this.operationType,
      account: data.account.present ? data.account.value : this.account,
      category: data.category.present ? data.category.value : this.category,
      recAccount:
          data.recAccount.present ? data.recAccount.value : this.recAccount,
      sum: data.sum.present ? data.sum.value : this.sum,
      recSum: data.recSum.present ? data.recSum.value : this.recSum,
      synced: data.synced.present ? data.synced.value : this.synced,
      deleted: data.deleted.present ? data.deleted.value : this.deleted,
      currencySent: data.currencySent.present
          ? data.currencySent.value
          : this.currencySent,
      currencyReceived: data.currencyReceived.present
          ? data.currencyReceived.value
          : this.currencyReceived,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OperationDB(')
          ..write('id: $id, ')
          ..write('cloudId: $cloudId, ')
          ..write('date: $date, ')
          ..write('operationType: $operationType, ')
          ..write('account: $account, ')
          ..write('category: $category, ')
          ..write('recAccount: $recAccount, ')
          ..write('sum: $sum, ')
          ..write('recSum: $recSum, ')
          ..write('synced: $synced, ')
          ..write('deleted: $deleted, ')
          ..write('currencySent: $currencySent, ')
          ..write('currencyReceived: $currencyReceived')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      cloudId,
      date,
      operationType,
      account,
      category,
      recAccount,
      sum,
      recSum,
      synced,
      deleted,
      currencySent,
      currencyReceived);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OperationDB &&
          other.id == this.id &&
          other.cloudId == this.cloudId &&
          other.date == this.date &&
          other.operationType == this.operationType &&
          other.account == this.account &&
          other.category == this.category &&
          other.recAccount == this.recAccount &&
          other.sum == this.sum &&
          other.recSum == this.recSum &&
          other.synced == this.synced &&
          other.deleted == this.deleted &&
          other.currencySent == this.currencySent &&
          other.currencyReceived == this.currencyReceived);
}

class OperationsCompanion extends UpdateCompanion<OperationDB> {
  final Value<int> id;
  final Value<String> cloudId;
  final Value<DateTime> date;
  final Value<OperationType> operationType;
  final Value<int> account;
  final Value<int?> category;
  final Value<int?> recAccount;
  final Value<int> sum;
  final Value<int> recSum;
  final Value<bool> synced;
  final Value<bool> deleted;
  final Value<Currency> currencySent;
  final Value<Currency> currencyReceived;
  const OperationsCompanion({
    this.id = const Value.absent(),
    this.cloudId = const Value.absent(),
    this.date = const Value.absent(),
    this.operationType = const Value.absent(),
    this.account = const Value.absent(),
    this.category = const Value.absent(),
    this.recAccount = const Value.absent(),
    this.sum = const Value.absent(),
    this.recSum = const Value.absent(),
    this.synced = const Value.absent(),
    this.deleted = const Value.absent(),
    this.currencySent = const Value.absent(),
    this.currencyReceived = const Value.absent(),
  });
  OperationsCompanion.insert({
    this.id = const Value.absent(),
    required String cloudId,
    required DateTime date,
    required OperationType operationType,
    required int account,
    this.category = const Value.absent(),
    this.recAccount = const Value.absent(),
    required int sum,
    this.recSum = const Value.absent(),
    this.synced = const Value.absent(),
    this.deleted = const Value.absent(),
    this.currencySent = const Value.absent(),
    this.currencyReceived = const Value.absent(),
  })  : cloudId = Value(cloudId),
        date = Value(date),
        operationType = Value(operationType),
        account = Value(account),
        sum = Value(sum);
  static Insertable<OperationDB> custom({
    Expression<int>? id,
    Expression<String>? cloudId,
    Expression<DateTime>? date,
    Expression<int>? operationType,
    Expression<int>? account,
    Expression<int>? category,
    Expression<int>? recAccount,
    Expression<int>? sum,
    Expression<int>? recSum,
    Expression<bool>? synced,
    Expression<bool>? deleted,
    Expression<String>? currencySent,
    Expression<String>? currencyReceived,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cloudId != null) 'cloud_id': cloudId,
      if (date != null) 'date': date,
      if (operationType != null) 'operation_type': operationType,
      if (account != null) 'account': account,
      if (category != null) 'category': category,
      if (recAccount != null) 'rec_account': recAccount,
      if (sum != null) 'sum': sum,
      if (recSum != null) 'rec_sum': recSum,
      if (synced != null) 'synced': synced,
      if (deleted != null) 'deleted': deleted,
      if (currencySent != null) 'currency_sent': currencySent,
      if (currencyReceived != null) 'currency_received': currencyReceived,
    });
  }

  OperationsCompanion copyWith(
      {Value<int>? id,
      Value<String>? cloudId,
      Value<DateTime>? date,
      Value<OperationType>? operationType,
      Value<int>? account,
      Value<int?>? category,
      Value<int?>? recAccount,
      Value<int>? sum,
      Value<int>? recSum,
      Value<bool>? synced,
      Value<bool>? deleted,
      Value<Currency>? currencySent,
      Value<Currency>? currencyReceived}) {
    return OperationsCompanion(
      id: id ?? this.id,
      cloudId: cloudId ?? this.cloudId,
      date: date ?? this.date,
      operationType: operationType ?? this.operationType,
      account: account ?? this.account,
      category: category ?? this.category,
      recAccount: recAccount ?? this.recAccount,
      sum: sum ?? this.sum,
      recSum: recSum ?? this.recSum,
      synced: synced ?? this.synced,
      deleted: deleted ?? this.deleted,
      currencySent: currencySent ?? this.currencySent,
      currencyReceived: currencyReceived ?? this.currencyReceived,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (cloudId.present) {
      map['cloud_id'] = Variable<String>(cloudId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (operationType.present) {
      map['operation_type'] = Variable<int>(
          $OperationsTable.$converteroperationType.toSql(operationType.value));
    }
    if (account.present) {
      map['account'] = Variable<int>(account.value);
    }
    if (category.present) {
      map['category'] = Variable<int>(category.value);
    }
    if (recAccount.present) {
      map['rec_account'] = Variable<int>(recAccount.value);
    }
    if (sum.present) {
      map['sum'] = Variable<int>(sum.value);
    }
    if (recSum.present) {
      map['rec_sum'] = Variable<int>(recSum.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (currencySent.present) {
      map['currency_sent'] = Variable<String>(
          $OperationsTable.$convertercurrencySent.toSql(currencySent.value));
    }
    if (currencyReceived.present) {
      map['currency_received'] = Variable<String>($OperationsTable
          .$convertercurrencyReceived
          .toSql(currencyReceived.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OperationsCompanion(')
          ..write('id: $id, ')
          ..write('cloudId: $cloudId, ')
          ..write('date: $date, ')
          ..write('operationType: $operationType, ')
          ..write('account: $account, ')
          ..write('category: $category, ')
          ..write('recAccount: $recAccount, ')
          ..write('sum: $sum, ')
          ..write('recSum: $recSum, ')
          ..write('synced: $synced, ')
          ..write('deleted: $deleted, ')
          ..write('currencySent: $currencySent, ')
          ..write('currencyReceived: $currencyReceived')
          ..write(')'))
        .toString();
  }
}

class $BalancesTable extends Balances
    with TableInfo<$BalancesTable, BalanceDB> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BalancesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _operationMeta =
      const VerificationMeta('operation');
  @override
  late final GeneratedColumn<int> operation = GeneratedColumn<int>(
      'operation', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES operations (id)'));
  static const VerificationMeta _accountMeta =
      const VerificationMeta('account');
  @override
  late final GeneratedColumn<int> account = GeneratedColumn<int>(
      'account', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES accounts (id)'));
  static const VerificationMeta _sumMeta = const VerificationMeta('sum');
  @override
  late final GeneratedColumn<int> sum = GeneratedColumn<int>(
      'sum', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _currencyMeta =
      const VerificationMeta('currency');
  @override
  late final GeneratedColumnWithTypeConverter<Currency, String> currency =
      GeneratedColumn<String>('currency', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('RUB'))
          .withConverter<Currency>($BalancesTable.$convertercurrency);
  @override
  List<GeneratedColumn> get $columns =>
      [date, operation, account, sum, currency];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'balance';
  @override
  VerificationContext validateIntegrity(Insertable<BalanceDB> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('operation')) {
      context.handle(_operationMeta,
          operation.isAcceptableOrUnknown(data['operation']!, _operationMeta));
    } else if (isInserting) {
      context.missing(_operationMeta);
    }
    if (data.containsKey('account')) {
      context.handle(_accountMeta,
          account.isAcceptableOrUnknown(data['account']!, _accountMeta));
    } else if (isInserting) {
      context.missing(_accountMeta);
    }
    if (data.containsKey('sum')) {
      context.handle(
          _sumMeta, sum.isAcceptableOrUnknown(data['sum']!, _sumMeta));
    } else if (isInserting) {
      context.missing(_sumMeta);
    }
    context.handle(_currencyMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {operation, account};
  @override
  BalanceDB map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BalanceDB(
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      operation: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}operation'])!,
      account: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}account'])!,
      sum: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sum'])!,
      currency: $BalancesTable.$convertercurrency.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency'])!),
    );
  }

  @override
  $BalancesTable createAlias(String alias) {
    return $BalancesTable(attachedDatabase, alias);
  }

  static TypeConverter<Currency, String> $convertercurrency =
      const CurrencyConverter();
}

class BalanceDB extends DataClass implements Insertable<BalanceDB> {
  final DateTime date;
  final int operation;
  final int account;
  final int sum;
  final Currency currency;
  const BalanceDB(
      {required this.date,
      required this.operation,
      required this.account,
      required this.sum,
      required this.currency});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['date'] = Variable<DateTime>(date);
    map['operation'] = Variable<int>(operation);
    map['account'] = Variable<int>(account);
    map['sum'] = Variable<int>(sum);
    {
      map['currency'] =
          Variable<String>($BalancesTable.$convertercurrency.toSql(currency));
    }
    return map;
  }

  BalancesCompanion toCompanion(bool nullToAbsent) {
    return BalancesCompanion(
      date: Value(date),
      operation: Value(operation),
      account: Value(account),
      sum: Value(sum),
      currency: Value(currency),
    );
  }

  factory BalanceDB.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BalanceDB(
      date: serializer.fromJson<DateTime>(json['date']),
      operation: serializer.fromJson<int>(json['operation']),
      account: serializer.fromJson<int>(json['account']),
      sum: serializer.fromJson<int>(json['sum']),
      currency: serializer.fromJson<Currency>(json['currency']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'date': serializer.toJson<DateTime>(date),
      'operation': serializer.toJson<int>(operation),
      'account': serializer.toJson<int>(account),
      'sum': serializer.toJson<int>(sum),
      'currency': serializer.toJson<Currency>(currency),
    };
  }

  BalanceDB copyWith(
          {DateTime? date,
          int? operation,
          int? account,
          int? sum,
          Currency? currency}) =>
      BalanceDB(
        date: date ?? this.date,
        operation: operation ?? this.operation,
        account: account ?? this.account,
        sum: sum ?? this.sum,
        currency: currency ?? this.currency,
      );
  BalanceDB copyWithCompanion(BalancesCompanion data) {
    return BalanceDB(
      date: data.date.present ? data.date.value : this.date,
      operation: data.operation.present ? data.operation.value : this.operation,
      account: data.account.present ? data.account.value : this.account,
      sum: data.sum.present ? data.sum.value : this.sum,
      currency: data.currency.present ? data.currency.value : this.currency,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BalanceDB(')
          ..write('date: $date, ')
          ..write('operation: $operation, ')
          ..write('account: $account, ')
          ..write('sum: $sum, ')
          ..write('currency: $currency')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(date, operation, account, sum, currency);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BalanceDB &&
          other.date == this.date &&
          other.operation == this.operation &&
          other.account == this.account &&
          other.sum == this.sum &&
          other.currency == this.currency);
}

class BalancesCompanion extends UpdateCompanion<BalanceDB> {
  final Value<DateTime> date;
  final Value<int> operation;
  final Value<int> account;
  final Value<int> sum;
  final Value<Currency> currency;
  final Value<int> rowid;
  const BalancesCompanion({
    this.date = const Value.absent(),
    this.operation = const Value.absent(),
    this.account = const Value.absent(),
    this.sum = const Value.absent(),
    this.currency = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BalancesCompanion.insert({
    required DateTime date,
    required int operation,
    required int account,
    required int sum,
    this.currency = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : date = Value(date),
        operation = Value(operation),
        account = Value(account),
        sum = Value(sum);
  static Insertable<BalanceDB> custom({
    Expression<DateTime>? date,
    Expression<int>? operation,
    Expression<int>? account,
    Expression<int>? sum,
    Expression<String>? currency,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (date != null) 'date': date,
      if (operation != null) 'operation': operation,
      if (account != null) 'account': account,
      if (sum != null) 'sum': sum,
      if (currency != null) 'currency': currency,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BalancesCompanion copyWith(
      {Value<DateTime>? date,
      Value<int>? operation,
      Value<int>? account,
      Value<int>? sum,
      Value<Currency>? currency,
      Value<int>? rowid}) {
    return BalancesCompanion(
      date: date ?? this.date,
      operation: operation ?? this.operation,
      account: account ?? this.account,
      sum: sum ?? this.sum,
      currency: currency ?? this.currency,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (operation.present) {
      map['operation'] = Variable<int>(operation.value);
    }
    if (account.present) {
      map['account'] = Variable<int>(account.value);
    }
    if (sum.present) {
      map['sum'] = Variable<int>(sum.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(
          $BalancesTable.$convertercurrency.toSql(currency.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BalancesCompanion(')
          ..write('date: $date, ')
          ..write('operation: $operation, ')
          ..write('account: $account, ')
          ..write('sum: $sum, ')
          ..write('currency: $currency, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CashflowsTable extends Cashflows
    with TableInfo<$CashflowsTable, CashflowDB> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CashflowsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _operationMeta =
      const VerificationMeta('operation');
  @override
  late final GeneratedColumn<int> operation = GeneratedColumn<int>(
      'operation', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES operations (id)'));
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<int> category = GeneratedColumn<int>(
      'category', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES categories (id)'));
  static const VerificationMeta _sumMeta = const VerificationMeta('sum');
  @override
  late final GeneratedColumn<int> sum = GeneratedColumn<int>(
      'sum', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _currencyMeta =
      const VerificationMeta('currency');
  @override
  late final GeneratedColumnWithTypeConverter<Currency, String> currency =
      GeneratedColumn<String>('currency', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('RUB'))
          .withConverter<Currency>($CashflowsTable.$convertercurrency);
  @override
  List<GeneratedColumn> get $columns =>
      [date, operation, category, sum, currency];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cashflow';
  @override
  VerificationContext validateIntegrity(Insertable<CashflowDB> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('operation')) {
      context.handle(_operationMeta,
          operation.isAcceptableOrUnknown(data['operation']!, _operationMeta));
    } else if (isInserting) {
      context.missing(_operationMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('sum')) {
      context.handle(
          _sumMeta, sum.isAcceptableOrUnknown(data['sum']!, _sumMeta));
    } else if (isInserting) {
      context.missing(_sumMeta);
    }
    context.handle(_currencyMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {operation, category};
  @override
  CashflowDB map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CashflowDB(
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      operation: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}operation'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category'])!,
      sum: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sum'])!,
      currency: $CashflowsTable.$convertercurrency.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency'])!),
    );
  }

  @override
  $CashflowsTable createAlias(String alias) {
    return $CashflowsTable(attachedDatabase, alias);
  }

  static TypeConverter<Currency, String> $convertercurrency =
      const CurrencyConverter();
}

class CashflowDB extends DataClass implements Insertable<CashflowDB> {
  final DateTime date;
  final int operation;
  final int category;
  final int sum;
  final Currency currency;
  const CashflowDB(
      {required this.date,
      required this.operation,
      required this.category,
      required this.sum,
      required this.currency});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['date'] = Variable<DateTime>(date);
    map['operation'] = Variable<int>(operation);
    map['category'] = Variable<int>(category);
    map['sum'] = Variable<int>(sum);
    {
      map['currency'] =
          Variable<String>($CashflowsTable.$convertercurrency.toSql(currency));
    }
    return map;
  }

  CashflowsCompanion toCompanion(bool nullToAbsent) {
    return CashflowsCompanion(
      date: Value(date),
      operation: Value(operation),
      category: Value(category),
      sum: Value(sum),
      currency: Value(currency),
    );
  }

  factory CashflowDB.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CashflowDB(
      date: serializer.fromJson<DateTime>(json['date']),
      operation: serializer.fromJson<int>(json['operation']),
      category: serializer.fromJson<int>(json['category']),
      sum: serializer.fromJson<int>(json['sum']),
      currency: serializer.fromJson<Currency>(json['currency']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'date': serializer.toJson<DateTime>(date),
      'operation': serializer.toJson<int>(operation),
      'category': serializer.toJson<int>(category),
      'sum': serializer.toJson<int>(sum),
      'currency': serializer.toJson<Currency>(currency),
    };
  }

  CashflowDB copyWith(
          {DateTime? date,
          int? operation,
          int? category,
          int? sum,
          Currency? currency}) =>
      CashflowDB(
        date: date ?? this.date,
        operation: operation ?? this.operation,
        category: category ?? this.category,
        sum: sum ?? this.sum,
        currency: currency ?? this.currency,
      );
  CashflowDB copyWithCompanion(CashflowsCompanion data) {
    return CashflowDB(
      date: data.date.present ? data.date.value : this.date,
      operation: data.operation.present ? data.operation.value : this.operation,
      category: data.category.present ? data.category.value : this.category,
      sum: data.sum.present ? data.sum.value : this.sum,
      currency: data.currency.present ? data.currency.value : this.currency,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CashflowDB(')
          ..write('date: $date, ')
          ..write('operation: $operation, ')
          ..write('category: $category, ')
          ..write('sum: $sum, ')
          ..write('currency: $currency')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(date, operation, category, sum, currency);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CashflowDB &&
          other.date == this.date &&
          other.operation == this.operation &&
          other.category == this.category &&
          other.sum == this.sum &&
          other.currency == this.currency);
}

class CashflowsCompanion extends UpdateCompanion<CashflowDB> {
  final Value<DateTime> date;
  final Value<int> operation;
  final Value<int> category;
  final Value<int> sum;
  final Value<Currency> currency;
  final Value<int> rowid;
  const CashflowsCompanion({
    this.date = const Value.absent(),
    this.operation = const Value.absent(),
    this.category = const Value.absent(),
    this.sum = const Value.absent(),
    this.currency = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CashflowsCompanion.insert({
    required DateTime date,
    required int operation,
    required int category,
    required int sum,
    this.currency = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : date = Value(date),
        operation = Value(operation),
        category = Value(category),
        sum = Value(sum);
  static Insertable<CashflowDB> custom({
    Expression<DateTime>? date,
    Expression<int>? operation,
    Expression<int>? category,
    Expression<int>? sum,
    Expression<String>? currency,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (date != null) 'date': date,
      if (operation != null) 'operation': operation,
      if (category != null) 'category': category,
      if (sum != null) 'sum': sum,
      if (currency != null) 'currency': currency,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CashflowsCompanion copyWith(
      {Value<DateTime>? date,
      Value<int>? operation,
      Value<int>? category,
      Value<int>? sum,
      Value<Currency>? currency,
      Value<int>? rowid}) {
    return CashflowsCompanion(
      date: date ?? this.date,
      operation: operation ?? this.operation,
      category: category ?? this.category,
      sum: sum ?? this.sum,
      currency: currency ?? this.currency,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (operation.present) {
      map['operation'] = Variable<int>(operation.value);
    }
    if (category.present) {
      map['category'] = Variable<int>(category.value);
    }
    if (sum.present) {
      map['sum'] = Variable<int>(sum.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(
          $CashflowsTable.$convertercurrency.toSql(currency.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CashflowsCompanion(')
          ..write('date: $date, ')
          ..write('operation: $operation, ')
          ..write('category: $category, ')
          ..write('sum: $sum, ')
          ..write('currency: $currency, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $AccountsTable accounts = $AccountsTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $OperationsTable operations = $OperationsTable(this);
  late final $BalancesTable balances = $BalancesTable(this);
  late final $CashflowsTable cashflows = $CashflowsTable(this);
  late final AccountDao accountDao = AccountDao(this as Database);
  late final CategoryDao categoryDao = CategoryDao(this as Database);
  late final OperationDao operationDao = OperationDao(this as Database);
  late final UserDao userDao = UserDao(this as Database);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [users, accounts, categories, operations, balances, cashflows];
}

typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  required String googleId,
  required String name,
  required String photo,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  Value<String> googleId,
  Value<String> name,
  Value<String> photo,
});

final class $$UsersTableReferences
    extends BaseReferences<_$Database, $UsersTable, UserDB> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$AccountsTable, List<AccountDB>>
      _accountsRefsTable(_$Database db) =>
          MultiTypedResultKey.fromTable(db.accounts,
              aliasName: $_aliasNameGenerator(db.users.id, db.accounts.user));

  $$AccountsTableProcessedTableManager get accountsRefs {
    final manager = $$AccountsTableTableManager($_db, $_db.accounts)
        .filter((f) => f.user.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_accountsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$UsersTableFilterComposer extends Composer<_$Database, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get googleId => $composableBuilder(
      column: $table.googleId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get photo => $composableBuilder(
      column: $table.photo, builder: (column) => ColumnFilters(column));

  Expression<bool> accountsRefs(
      Expression<bool> Function($$AccountsTableFilterComposer f) f) {
    final $$AccountsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.accounts,
        getReferencedColumn: (t) => t.user,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountsTableFilterComposer(
              $db: $db,
              $table: $db.accounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$UsersTableOrderingComposer extends Composer<_$Database, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get googleId => $composableBuilder(
      column: $table.googleId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get photo => $composableBuilder(
      column: $table.photo, builder: (column) => ColumnOrderings(column));
}

class $$UsersTableAnnotationComposer extends Composer<_$Database, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get googleId =>
      $composableBuilder(column: $table.googleId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get photo =>
      $composableBuilder(column: $table.photo, builder: (column) => column);

  Expression<T> accountsRefs<T extends Object>(
      Expression<T> Function($$AccountsTableAnnotationComposer a) f) {
    final $$AccountsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.accounts,
        getReferencedColumn: (t) => t.user,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountsTableAnnotationComposer(
              $db: $db,
              $table: $db.accounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$UsersTableTableManager extends RootTableManager<
    _$Database,
    $UsersTable,
    UserDB,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (UserDB, $$UsersTableReferences),
    UserDB,
    PrefetchHooks Function({bool accountsRefs})> {
  $$UsersTableTableManager(_$Database db, $UsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> googleId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> photo = const Value.absent(),
          }) =>
              UsersCompanion(
            id: id,
            googleId: googleId,
            name: name,
            photo: photo,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String googleId,
            required String name,
            required String photo,
          }) =>
              UsersCompanion.insert(
            id: id,
            googleId: googleId,
            name: name,
            photo: photo,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$UsersTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({accountsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (accountsRefs) db.accounts],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (accountsRefs)
                    await $_getPrefetchedData<UserDB, $UsersTable, AccountDB>(
                        currentTable: table,
                        referencedTable:
                            $$UsersTableReferences._accountsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableReferences(db, table, p0).accountsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) =>
                                referencedItems.where((e) => e.user == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$UsersTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $UsersTable,
    UserDB,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (UserDB, $$UsersTableReferences),
    UserDB,
    PrefetchHooks Function({bool accountsRefs})>;
typedef $$AccountsTableCreateCompanionBuilder = AccountsCompanion Function({
  Value<int> id,
  required String cloudId,
  required String title,
  Value<bool> isDebt,
  Value<bool> synced,
  Value<int?> user,
});
typedef $$AccountsTableUpdateCompanionBuilder = AccountsCompanion Function({
  Value<int> id,
  Value<String> cloudId,
  Value<String> title,
  Value<bool> isDebt,
  Value<bool> synced,
  Value<int?> user,
});

final class $$AccountsTableReferences
    extends BaseReferences<_$Database, $AccountsTable, AccountDB> {
  $$AccountsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userTable(_$Database db) =>
      db.users.createAlias($_aliasNameGenerator(db.accounts.user, db.users.id));

  $$UsersTableProcessedTableManager? get user {
    final $_column = $_itemColumn<int>('user');
    if ($_column == null) return null;
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$BalancesTable, List<BalanceDB>>
      _balancesRefsTable(_$Database db) => MultiTypedResultKey.fromTable(
          db.balances,
          aliasName: $_aliasNameGenerator(db.accounts.id, db.balances.account));

  $$BalancesTableProcessedTableManager get balancesRefs {
    final manager = $$BalancesTableTableManager($_db, $_db.balances)
        .filter((f) => f.account.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_balancesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$AccountsTableFilterComposer
    extends Composer<_$Database, $AccountsTable> {
  $$AccountsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cloudId => $composableBuilder(
      column: $table.cloudId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDebt => $composableBuilder(
      column: $table.isDebt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get synced => $composableBuilder(
      column: $table.synced, builder: (column) => ColumnFilters(column));

  $$UsersTableFilterComposer get user {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.user,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> balancesRefs(
      Expression<bool> Function($$BalancesTableFilterComposer f) f) {
    final $$BalancesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.balances,
        getReferencedColumn: (t) => t.account,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BalancesTableFilterComposer(
              $db: $db,
              $table: $db.balances,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$AccountsTableOrderingComposer
    extends Composer<_$Database, $AccountsTable> {
  $$AccountsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cloudId => $composableBuilder(
      column: $table.cloudId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDebt => $composableBuilder(
      column: $table.isDebt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get synced => $composableBuilder(
      column: $table.synced, builder: (column) => ColumnOrderings(column));

  $$UsersTableOrderingComposer get user {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.user,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AccountsTableAnnotationComposer
    extends Composer<_$Database, $AccountsTable> {
  $$AccountsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get cloudId =>
      $composableBuilder(column: $table.cloudId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<bool> get isDebt =>
      $composableBuilder(column: $table.isDebt, builder: (column) => column);

  GeneratedColumn<bool> get synced =>
      $composableBuilder(column: $table.synced, builder: (column) => column);

  $$UsersTableAnnotationComposer get user {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.user,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> balancesRefs<T extends Object>(
      Expression<T> Function($$BalancesTableAnnotationComposer a) f) {
    final $$BalancesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.balances,
        getReferencedColumn: (t) => t.account,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BalancesTableAnnotationComposer(
              $db: $db,
              $table: $db.balances,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$AccountsTableTableManager extends RootTableManager<
    _$Database,
    $AccountsTable,
    AccountDB,
    $$AccountsTableFilterComposer,
    $$AccountsTableOrderingComposer,
    $$AccountsTableAnnotationComposer,
    $$AccountsTableCreateCompanionBuilder,
    $$AccountsTableUpdateCompanionBuilder,
    (AccountDB, $$AccountsTableReferences),
    AccountDB,
    PrefetchHooks Function({bool user, bool balancesRefs})> {
  $$AccountsTableTableManager(_$Database db, $AccountsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AccountsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AccountsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AccountsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> cloudId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<bool> isDebt = const Value.absent(),
            Value<bool> synced = const Value.absent(),
            Value<int?> user = const Value.absent(),
          }) =>
              AccountsCompanion(
            id: id,
            cloudId: cloudId,
            title: title,
            isDebt: isDebt,
            synced: synced,
            user: user,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String cloudId,
            required String title,
            Value<bool> isDebt = const Value.absent(),
            Value<bool> synced = const Value.absent(),
            Value<int?> user = const Value.absent(),
          }) =>
              AccountsCompanion.insert(
            id: id,
            cloudId: cloudId,
            title: title,
            isDebt: isDebt,
            synced: synced,
            user: user,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$AccountsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({user = false, balancesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (balancesRefs) db.balances],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (user) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.user,
                    referencedTable: $$AccountsTableReferences._userTable(db),
                    referencedColumn:
                        $$AccountsTableReferences._userTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (balancesRefs)
                    await $_getPrefetchedData<AccountDB, $AccountsTable,
                            BalanceDB>(
                        currentTable: table,
                        referencedTable:
                            $$AccountsTableReferences._balancesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$AccountsTableReferences(db, table, p0)
                                .balancesRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.account == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$AccountsTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $AccountsTable,
    AccountDB,
    $$AccountsTableFilterComposer,
    $$AccountsTableOrderingComposer,
    $$AccountsTableAnnotationComposer,
    $$AccountsTableCreateCompanionBuilder,
    $$AccountsTableUpdateCompanionBuilder,
    (AccountDB, $$AccountsTableReferences),
    AccountDB,
    PrefetchHooks Function({bool user, bool balancesRefs})>;
typedef $$CategoriesTableCreateCompanionBuilder = CategoriesCompanion Function({
  Value<int> id,
  required String cloudId,
  required String title,
  required OperationType operationType,
  required BudgetType budgetType,
  required int budget,
  Value<bool> synced,
  Value<bool> isGroup,
  Value<int?> parent,
});
typedef $$CategoriesTableUpdateCompanionBuilder = CategoriesCompanion Function({
  Value<int> id,
  Value<String> cloudId,
  Value<String> title,
  Value<OperationType> operationType,
  Value<BudgetType> budgetType,
  Value<int> budget,
  Value<bool> synced,
  Value<bool> isGroup,
  Value<int?> parent,
});

final class $$CategoriesTableReferences
    extends BaseReferences<_$Database, $CategoriesTable, CategoryDB> {
  $$CategoriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CategoriesTable _parentTable(_$Database db) =>
      db.categories.createAlias(
          $_aliasNameGenerator(db.categories.parent, db.categories.id));

  $$CategoriesTableProcessedTableManager? get parent {
    final $_column = $_itemColumn<int>('parent');
    if ($_column == null) return null;
    final manager = $$CategoriesTableTableManager($_db, $_db.categories)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_parentTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$OperationsTable, List<OperationDB>>
      _operationsRefsTable(_$Database db) => MultiTypedResultKey.fromTable(
          db.operations,
          aliasName:
              $_aliasNameGenerator(db.categories.id, db.operations.category));

  $$OperationsTableProcessedTableManager get operationsRefs {
    final manager = $$OperationsTableTableManager($_db, $_db.operations)
        .filter((f) => f.category.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_operationsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$CashflowsTable, List<CashflowDB>>
      _cashflowsRefsTable(_$Database db) => MultiTypedResultKey.fromTable(
          db.cashflows,
          aliasName:
              $_aliasNameGenerator(db.categories.id, db.cashflows.category));

  $$CashflowsTableProcessedTableManager get cashflowsRefs {
    final manager = $$CashflowsTableTableManager($_db, $_db.cashflows)
        .filter((f) => f.category.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_cashflowsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CategoriesTableFilterComposer
    extends Composer<_$Database, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cloudId => $composableBuilder(
      column: $table.cloudId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<OperationType, OperationType, int>
      get operationType => $composableBuilder(
          column: $table.operationType,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<BudgetType, BudgetType, int> get budgetType =>
      $composableBuilder(
          column: $table.budgetType,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<int> get budget => $composableBuilder(
      column: $table.budget, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get synced => $composableBuilder(
      column: $table.synced, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isGroup => $composableBuilder(
      column: $table.isGroup, builder: (column) => ColumnFilters(column));

  $$CategoriesTableFilterComposer get parent {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parent,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableFilterComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> operationsRefs(
      Expression<bool> Function($$OperationsTableFilterComposer f) f) {
    final $$OperationsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.operations,
        getReferencedColumn: (t) => t.category,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OperationsTableFilterComposer(
              $db: $db,
              $table: $db.operations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> cashflowsRefs(
      Expression<bool> Function($$CashflowsTableFilterComposer f) f) {
    final $$CashflowsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.cashflows,
        getReferencedColumn: (t) => t.category,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CashflowsTableFilterComposer(
              $db: $db,
              $table: $db.cashflows,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$Database, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cloudId => $composableBuilder(
      column: $table.cloudId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get operationType => $composableBuilder(
      column: $table.operationType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get budgetType => $composableBuilder(
      column: $table.budgetType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get budget => $composableBuilder(
      column: $table.budget, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get synced => $composableBuilder(
      column: $table.synced, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isGroup => $composableBuilder(
      column: $table.isGroup, builder: (column) => ColumnOrderings(column));

  $$CategoriesTableOrderingComposer get parent {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parent,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableOrderingComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$Database, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get cloudId =>
      $composableBuilder(column: $table.cloudId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumnWithTypeConverter<OperationType, int> get operationType =>
      $composableBuilder(
          column: $table.operationType, builder: (column) => column);

  GeneratedColumnWithTypeConverter<BudgetType, int> get budgetType =>
      $composableBuilder(
          column: $table.budgetType, builder: (column) => column);

  GeneratedColumn<int> get budget =>
      $composableBuilder(column: $table.budget, builder: (column) => column);

  GeneratedColumn<bool> get synced =>
      $composableBuilder(column: $table.synced, builder: (column) => column);

  GeneratedColumn<bool> get isGroup =>
      $composableBuilder(column: $table.isGroup, builder: (column) => column);

  $$CategoriesTableAnnotationComposer get parent {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parent,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableAnnotationComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> operationsRefs<T extends Object>(
      Expression<T> Function($$OperationsTableAnnotationComposer a) f) {
    final $$OperationsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.operations,
        getReferencedColumn: (t) => t.category,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OperationsTableAnnotationComposer(
              $db: $db,
              $table: $db.operations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> cashflowsRefs<T extends Object>(
      Expression<T> Function($$CashflowsTableAnnotationComposer a) f) {
    final $$CashflowsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.cashflows,
        getReferencedColumn: (t) => t.category,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CashflowsTableAnnotationComposer(
              $db: $db,
              $table: $db.cashflows,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CategoriesTableTableManager extends RootTableManager<
    _$Database,
    $CategoriesTable,
    CategoryDB,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableAnnotationComposer,
    $$CategoriesTableCreateCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder,
    (CategoryDB, $$CategoriesTableReferences),
    CategoryDB,
    PrefetchHooks Function(
        {bool parent, bool operationsRefs, bool cashflowsRefs})> {
  $$CategoriesTableTableManager(_$Database db, $CategoriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> cloudId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<OperationType> operationType = const Value.absent(),
            Value<BudgetType> budgetType = const Value.absent(),
            Value<int> budget = const Value.absent(),
            Value<bool> synced = const Value.absent(),
            Value<bool> isGroup = const Value.absent(),
            Value<int?> parent = const Value.absent(),
          }) =>
              CategoriesCompanion(
            id: id,
            cloudId: cloudId,
            title: title,
            operationType: operationType,
            budgetType: budgetType,
            budget: budget,
            synced: synced,
            isGroup: isGroup,
            parent: parent,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String cloudId,
            required String title,
            required OperationType operationType,
            required BudgetType budgetType,
            required int budget,
            Value<bool> synced = const Value.absent(),
            Value<bool> isGroup = const Value.absent(),
            Value<int?> parent = const Value.absent(),
          }) =>
              CategoriesCompanion.insert(
            id: id,
            cloudId: cloudId,
            title: title,
            operationType: operationType,
            budgetType: budgetType,
            budget: budget,
            synced: synced,
            isGroup: isGroup,
            parent: parent,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CategoriesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {parent = false, operationsRefs = false, cashflowsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (operationsRefs) db.operations,
                if (cashflowsRefs) db.cashflows
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (parent) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.parent,
                    referencedTable:
                        $$CategoriesTableReferences._parentTable(db),
                    referencedColumn:
                        $$CategoriesTableReferences._parentTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (operationsRefs)
                    await $_getPrefetchedData<CategoryDB, $CategoriesTable,
                            OperationDB>(
                        currentTable: table,
                        referencedTable: $$CategoriesTableReferences
                            ._operationsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CategoriesTableReferences(db, table, p0)
                                .operationsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.category == item.id),
                        typedResults: items),
                  if (cashflowsRefs)
                    await $_getPrefetchedData<CategoryDB, $CategoriesTable,
                            CashflowDB>(
                        currentTable: table,
                        referencedTable:
                            $$CategoriesTableReferences._cashflowsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CategoriesTableReferences(db, table, p0)
                                .cashflowsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.category == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CategoriesTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $CategoriesTable,
    CategoryDB,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableAnnotationComposer,
    $$CategoriesTableCreateCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder,
    (CategoryDB, $$CategoriesTableReferences),
    CategoryDB,
    PrefetchHooks Function(
        {bool parent, bool operationsRefs, bool cashflowsRefs})>;
typedef $$OperationsTableCreateCompanionBuilder = OperationsCompanion Function({
  Value<int> id,
  required String cloudId,
  required DateTime date,
  required OperationType operationType,
  required int account,
  Value<int?> category,
  Value<int?> recAccount,
  required int sum,
  Value<int> recSum,
  Value<bool> synced,
  Value<bool> deleted,
  Value<Currency> currencySent,
  Value<Currency> currencyReceived,
});
typedef $$OperationsTableUpdateCompanionBuilder = OperationsCompanion Function({
  Value<int> id,
  Value<String> cloudId,
  Value<DateTime> date,
  Value<OperationType> operationType,
  Value<int> account,
  Value<int?> category,
  Value<int?> recAccount,
  Value<int> sum,
  Value<int> recSum,
  Value<bool> synced,
  Value<bool> deleted,
  Value<Currency> currencySent,
  Value<Currency> currencyReceived,
});

final class $$OperationsTableReferences
    extends BaseReferences<_$Database, $OperationsTable, OperationDB> {
  $$OperationsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AccountsTable _accountTable(_$Database db) => db.accounts
      .createAlias($_aliasNameGenerator(db.operations.account, db.accounts.id));

  $$AccountsTableProcessedTableManager get account {
    final $_column = $_itemColumn<int>('account')!;

    final manager = $$AccountsTableTableManager($_db, $_db.accounts)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $CategoriesTable _categoryTable(_$Database db) =>
      db.categories.createAlias(
          $_aliasNameGenerator(db.operations.category, db.categories.id));

  $$CategoriesTableProcessedTableManager? get category {
    final $_column = $_itemColumn<int>('category');
    if ($_column == null) return null;
    final manager = $$CategoriesTableTableManager($_db, $_db.categories)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $AccountsTable _recAccountTable(_$Database db) =>
      db.accounts.createAlias(
          $_aliasNameGenerator(db.operations.recAccount, db.accounts.id));

  $$AccountsTableProcessedTableManager? get recAccount {
    final $_column = $_itemColumn<int>('rec_account');
    if ($_column == null) return null;
    final manager = $$AccountsTableTableManager($_db, $_db.accounts)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recAccountTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$BalancesTable, List<BalanceDB>>
      _balancesRefsTable(_$Database db) => MultiTypedResultKey.fromTable(
          db.balances,
          aliasName:
              $_aliasNameGenerator(db.operations.id, db.balances.operation));

  $$BalancesTableProcessedTableManager get balancesRefs {
    final manager = $$BalancesTableTableManager($_db, $_db.balances)
        .filter((f) => f.operation.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_balancesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$CashflowsTable, List<CashflowDB>>
      _cashflowsRefsTable(_$Database db) => MultiTypedResultKey.fromTable(
          db.cashflows,
          aliasName:
              $_aliasNameGenerator(db.operations.id, db.cashflows.operation));

  $$CashflowsTableProcessedTableManager get cashflowsRefs {
    final manager = $$CashflowsTableTableManager($_db, $_db.cashflows)
        .filter((f) => f.operation.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_cashflowsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$OperationsTableFilterComposer
    extends Composer<_$Database, $OperationsTable> {
  $$OperationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cloudId => $composableBuilder(
      column: $table.cloudId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<OperationType, OperationType, int>
      get operationType => $composableBuilder(
          column: $table.operationType,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<int> get sum => $composableBuilder(
      column: $table.sum, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get recSum => $composableBuilder(
      column: $table.recSum, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get synced => $composableBuilder(
      column: $table.synced, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get deleted => $composableBuilder(
      column: $table.deleted, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Currency, Currency, String> get currencySent =>
      $composableBuilder(
          column: $table.currencySent,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<Currency, Currency, String>
      get currencyReceived => $composableBuilder(
          column: $table.currencyReceived,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  $$AccountsTableFilterComposer get account {
    final $$AccountsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.account,
        referencedTable: $db.accounts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountsTableFilterComposer(
              $db: $db,
              $table: $db.accounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CategoriesTableFilterComposer get category {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.category,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableFilterComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$AccountsTableFilterComposer get recAccount {
    final $$AccountsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.recAccount,
        referencedTable: $db.accounts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountsTableFilterComposer(
              $db: $db,
              $table: $db.accounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> balancesRefs(
      Expression<bool> Function($$BalancesTableFilterComposer f) f) {
    final $$BalancesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.balances,
        getReferencedColumn: (t) => t.operation,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BalancesTableFilterComposer(
              $db: $db,
              $table: $db.balances,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> cashflowsRefs(
      Expression<bool> Function($$CashflowsTableFilterComposer f) f) {
    final $$CashflowsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.cashflows,
        getReferencedColumn: (t) => t.operation,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CashflowsTableFilterComposer(
              $db: $db,
              $table: $db.cashflows,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$OperationsTableOrderingComposer
    extends Composer<_$Database, $OperationsTable> {
  $$OperationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cloudId => $composableBuilder(
      column: $table.cloudId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get operationType => $composableBuilder(
      column: $table.operationType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sum => $composableBuilder(
      column: $table.sum, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get recSum => $composableBuilder(
      column: $table.recSum, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get synced => $composableBuilder(
      column: $table.synced, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get deleted => $composableBuilder(
      column: $table.deleted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currencySent => $composableBuilder(
      column: $table.currencySent,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currencyReceived => $composableBuilder(
      column: $table.currencyReceived,
      builder: (column) => ColumnOrderings(column));

  $$AccountsTableOrderingComposer get account {
    final $$AccountsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.account,
        referencedTable: $db.accounts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountsTableOrderingComposer(
              $db: $db,
              $table: $db.accounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CategoriesTableOrderingComposer get category {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.category,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableOrderingComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$AccountsTableOrderingComposer get recAccount {
    final $$AccountsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.recAccount,
        referencedTable: $db.accounts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountsTableOrderingComposer(
              $db: $db,
              $table: $db.accounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$OperationsTableAnnotationComposer
    extends Composer<_$Database, $OperationsTable> {
  $$OperationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get cloudId =>
      $composableBuilder(column: $table.cloudId, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumnWithTypeConverter<OperationType, int> get operationType =>
      $composableBuilder(
          column: $table.operationType, builder: (column) => column);

  GeneratedColumn<int> get sum =>
      $composableBuilder(column: $table.sum, builder: (column) => column);

  GeneratedColumn<int> get recSum =>
      $composableBuilder(column: $table.recSum, builder: (column) => column);

  GeneratedColumn<bool> get synced =>
      $composableBuilder(column: $table.synced, builder: (column) => column);

  GeneratedColumn<bool> get deleted =>
      $composableBuilder(column: $table.deleted, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Currency, String> get currencySent =>
      $composableBuilder(
          column: $table.currencySent, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Currency, String> get currencyReceived =>
      $composableBuilder(
          column: $table.currencyReceived, builder: (column) => column);

  $$AccountsTableAnnotationComposer get account {
    final $$AccountsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.account,
        referencedTable: $db.accounts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountsTableAnnotationComposer(
              $db: $db,
              $table: $db.accounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CategoriesTableAnnotationComposer get category {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.category,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableAnnotationComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$AccountsTableAnnotationComposer get recAccount {
    final $$AccountsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.recAccount,
        referencedTable: $db.accounts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountsTableAnnotationComposer(
              $db: $db,
              $table: $db.accounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> balancesRefs<T extends Object>(
      Expression<T> Function($$BalancesTableAnnotationComposer a) f) {
    final $$BalancesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.balances,
        getReferencedColumn: (t) => t.operation,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BalancesTableAnnotationComposer(
              $db: $db,
              $table: $db.balances,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> cashflowsRefs<T extends Object>(
      Expression<T> Function($$CashflowsTableAnnotationComposer a) f) {
    final $$CashflowsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.cashflows,
        getReferencedColumn: (t) => t.operation,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CashflowsTableAnnotationComposer(
              $db: $db,
              $table: $db.cashflows,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$OperationsTableTableManager extends RootTableManager<
    _$Database,
    $OperationsTable,
    OperationDB,
    $$OperationsTableFilterComposer,
    $$OperationsTableOrderingComposer,
    $$OperationsTableAnnotationComposer,
    $$OperationsTableCreateCompanionBuilder,
    $$OperationsTableUpdateCompanionBuilder,
    (OperationDB, $$OperationsTableReferences),
    OperationDB,
    PrefetchHooks Function(
        {bool account,
        bool category,
        bool recAccount,
        bool balancesRefs,
        bool cashflowsRefs})> {
  $$OperationsTableTableManager(_$Database db, $OperationsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OperationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OperationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OperationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> cloudId = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<OperationType> operationType = const Value.absent(),
            Value<int> account = const Value.absent(),
            Value<int?> category = const Value.absent(),
            Value<int?> recAccount = const Value.absent(),
            Value<int> sum = const Value.absent(),
            Value<int> recSum = const Value.absent(),
            Value<bool> synced = const Value.absent(),
            Value<bool> deleted = const Value.absent(),
            Value<Currency> currencySent = const Value.absent(),
            Value<Currency> currencyReceived = const Value.absent(),
          }) =>
              OperationsCompanion(
            id: id,
            cloudId: cloudId,
            date: date,
            operationType: operationType,
            account: account,
            category: category,
            recAccount: recAccount,
            sum: sum,
            recSum: recSum,
            synced: synced,
            deleted: deleted,
            currencySent: currencySent,
            currencyReceived: currencyReceived,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String cloudId,
            required DateTime date,
            required OperationType operationType,
            required int account,
            Value<int?> category = const Value.absent(),
            Value<int?> recAccount = const Value.absent(),
            required int sum,
            Value<int> recSum = const Value.absent(),
            Value<bool> synced = const Value.absent(),
            Value<bool> deleted = const Value.absent(),
            Value<Currency> currencySent = const Value.absent(),
            Value<Currency> currencyReceived = const Value.absent(),
          }) =>
              OperationsCompanion.insert(
            id: id,
            cloudId: cloudId,
            date: date,
            operationType: operationType,
            account: account,
            category: category,
            recAccount: recAccount,
            sum: sum,
            recSum: recSum,
            synced: synced,
            deleted: deleted,
            currencySent: currencySent,
            currencyReceived: currencyReceived,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$OperationsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {account = false,
              category = false,
              recAccount = false,
              balancesRefs = false,
              cashflowsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (balancesRefs) db.balances,
                if (cashflowsRefs) db.cashflows
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (account) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.account,
                    referencedTable:
                        $$OperationsTableReferences._accountTable(db),
                    referencedColumn:
                        $$OperationsTableReferences._accountTable(db).id,
                  ) as T;
                }
                if (category) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.category,
                    referencedTable:
                        $$OperationsTableReferences._categoryTable(db),
                    referencedColumn:
                        $$OperationsTableReferences._categoryTable(db).id,
                  ) as T;
                }
                if (recAccount) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.recAccount,
                    referencedTable:
                        $$OperationsTableReferences._recAccountTable(db),
                    referencedColumn:
                        $$OperationsTableReferences._recAccountTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (balancesRefs)
                    await $_getPrefetchedData<OperationDB, $OperationsTable,
                            BalanceDB>(
                        currentTable: table,
                        referencedTable:
                            $$OperationsTableReferences._balancesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$OperationsTableReferences(db, table, p0)
                                .balancesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.operation == item.id),
                        typedResults: items),
                  if (cashflowsRefs)
                    await $_getPrefetchedData<OperationDB, $OperationsTable,
                            CashflowDB>(
                        currentTable: table,
                        referencedTable:
                            $$OperationsTableReferences._cashflowsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$OperationsTableReferences(db, table, p0)
                                .cashflowsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.operation == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$OperationsTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $OperationsTable,
    OperationDB,
    $$OperationsTableFilterComposer,
    $$OperationsTableOrderingComposer,
    $$OperationsTableAnnotationComposer,
    $$OperationsTableCreateCompanionBuilder,
    $$OperationsTableUpdateCompanionBuilder,
    (OperationDB, $$OperationsTableReferences),
    OperationDB,
    PrefetchHooks Function(
        {bool account,
        bool category,
        bool recAccount,
        bool balancesRefs,
        bool cashflowsRefs})>;
typedef $$BalancesTableCreateCompanionBuilder = BalancesCompanion Function({
  required DateTime date,
  required int operation,
  required int account,
  required int sum,
  Value<Currency> currency,
  Value<int> rowid,
});
typedef $$BalancesTableUpdateCompanionBuilder = BalancesCompanion Function({
  Value<DateTime> date,
  Value<int> operation,
  Value<int> account,
  Value<int> sum,
  Value<Currency> currency,
  Value<int> rowid,
});

final class $$BalancesTableReferences
    extends BaseReferences<_$Database, $BalancesTable, BalanceDB> {
  $$BalancesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $OperationsTable _operationTable(_$Database db) =>
      db.operations.createAlias(
          $_aliasNameGenerator(db.balances.operation, db.operations.id));

  $$OperationsTableProcessedTableManager get operation {
    final $_column = $_itemColumn<int>('operation')!;

    final manager = $$OperationsTableTableManager($_db, $_db.operations)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_operationTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $AccountsTable _accountTable(_$Database db) => db.accounts
      .createAlias($_aliasNameGenerator(db.balances.account, db.accounts.id));

  $$AccountsTableProcessedTableManager get account {
    final $_column = $_itemColumn<int>('account')!;

    final manager = $$AccountsTableTableManager($_db, $_db.accounts)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$BalancesTableFilterComposer
    extends Composer<_$Database, $BalancesTable> {
  $$BalancesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sum => $composableBuilder(
      column: $table.sum, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Currency, Currency, String> get currency =>
      $composableBuilder(
          column: $table.currency,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  $$OperationsTableFilterComposer get operation {
    final $$OperationsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.operation,
        referencedTable: $db.operations,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OperationsTableFilterComposer(
              $db: $db,
              $table: $db.operations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$AccountsTableFilterComposer get account {
    final $$AccountsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.account,
        referencedTable: $db.accounts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountsTableFilterComposer(
              $db: $db,
              $table: $db.accounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BalancesTableOrderingComposer
    extends Composer<_$Database, $BalancesTable> {
  $$BalancesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sum => $composableBuilder(
      column: $table.sum, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currency => $composableBuilder(
      column: $table.currency, builder: (column) => ColumnOrderings(column));

  $$OperationsTableOrderingComposer get operation {
    final $$OperationsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.operation,
        referencedTable: $db.operations,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OperationsTableOrderingComposer(
              $db: $db,
              $table: $db.operations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$AccountsTableOrderingComposer get account {
    final $$AccountsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.account,
        referencedTable: $db.accounts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountsTableOrderingComposer(
              $db: $db,
              $table: $db.accounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BalancesTableAnnotationComposer
    extends Composer<_$Database, $BalancesTable> {
  $$BalancesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get sum =>
      $composableBuilder(column: $table.sum, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Currency, String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  $$OperationsTableAnnotationComposer get operation {
    final $$OperationsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.operation,
        referencedTable: $db.operations,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OperationsTableAnnotationComposer(
              $db: $db,
              $table: $db.operations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$AccountsTableAnnotationComposer get account {
    final $$AccountsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.account,
        referencedTable: $db.accounts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountsTableAnnotationComposer(
              $db: $db,
              $table: $db.accounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BalancesTableTableManager extends RootTableManager<
    _$Database,
    $BalancesTable,
    BalanceDB,
    $$BalancesTableFilterComposer,
    $$BalancesTableOrderingComposer,
    $$BalancesTableAnnotationComposer,
    $$BalancesTableCreateCompanionBuilder,
    $$BalancesTableUpdateCompanionBuilder,
    (BalanceDB, $$BalancesTableReferences),
    BalanceDB,
    PrefetchHooks Function({bool operation, bool account})> {
  $$BalancesTableTableManager(_$Database db, $BalancesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BalancesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BalancesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BalancesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<DateTime> date = const Value.absent(),
            Value<int> operation = const Value.absent(),
            Value<int> account = const Value.absent(),
            Value<int> sum = const Value.absent(),
            Value<Currency> currency = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BalancesCompanion(
            date: date,
            operation: operation,
            account: account,
            sum: sum,
            currency: currency,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required DateTime date,
            required int operation,
            required int account,
            required int sum,
            Value<Currency> currency = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BalancesCompanion.insert(
            date: date,
            operation: operation,
            account: account,
            sum: sum,
            currency: currency,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$BalancesTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({operation = false, account = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (operation) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.operation,
                    referencedTable:
                        $$BalancesTableReferences._operationTable(db),
                    referencedColumn:
                        $$BalancesTableReferences._operationTable(db).id,
                  ) as T;
                }
                if (account) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.account,
                    referencedTable:
                        $$BalancesTableReferences._accountTable(db),
                    referencedColumn:
                        $$BalancesTableReferences._accountTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$BalancesTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $BalancesTable,
    BalanceDB,
    $$BalancesTableFilterComposer,
    $$BalancesTableOrderingComposer,
    $$BalancesTableAnnotationComposer,
    $$BalancesTableCreateCompanionBuilder,
    $$BalancesTableUpdateCompanionBuilder,
    (BalanceDB, $$BalancesTableReferences),
    BalanceDB,
    PrefetchHooks Function({bool operation, bool account})>;
typedef $$CashflowsTableCreateCompanionBuilder = CashflowsCompanion Function({
  required DateTime date,
  required int operation,
  required int category,
  required int sum,
  Value<Currency> currency,
  Value<int> rowid,
});
typedef $$CashflowsTableUpdateCompanionBuilder = CashflowsCompanion Function({
  Value<DateTime> date,
  Value<int> operation,
  Value<int> category,
  Value<int> sum,
  Value<Currency> currency,
  Value<int> rowid,
});

final class $$CashflowsTableReferences
    extends BaseReferences<_$Database, $CashflowsTable, CashflowDB> {
  $$CashflowsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $OperationsTable _operationTable(_$Database db) =>
      db.operations.createAlias(
          $_aliasNameGenerator(db.cashflows.operation, db.operations.id));

  $$OperationsTableProcessedTableManager get operation {
    final $_column = $_itemColumn<int>('operation')!;

    final manager = $$OperationsTableTableManager($_db, $_db.operations)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_operationTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $CategoriesTable _categoryTable(_$Database db) =>
      db.categories.createAlias(
          $_aliasNameGenerator(db.cashflows.category, db.categories.id));

  $$CategoriesTableProcessedTableManager get category {
    final $_column = $_itemColumn<int>('category')!;

    final manager = $$CategoriesTableTableManager($_db, $_db.categories)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$CashflowsTableFilterComposer
    extends Composer<_$Database, $CashflowsTable> {
  $$CashflowsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sum => $composableBuilder(
      column: $table.sum, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Currency, Currency, String> get currency =>
      $composableBuilder(
          column: $table.currency,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  $$OperationsTableFilterComposer get operation {
    final $$OperationsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.operation,
        referencedTable: $db.operations,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OperationsTableFilterComposer(
              $db: $db,
              $table: $db.operations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CategoriesTableFilterComposer get category {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.category,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableFilterComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CashflowsTableOrderingComposer
    extends Composer<_$Database, $CashflowsTable> {
  $$CashflowsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sum => $composableBuilder(
      column: $table.sum, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currency => $composableBuilder(
      column: $table.currency, builder: (column) => ColumnOrderings(column));

  $$OperationsTableOrderingComposer get operation {
    final $$OperationsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.operation,
        referencedTable: $db.operations,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OperationsTableOrderingComposer(
              $db: $db,
              $table: $db.operations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CategoriesTableOrderingComposer get category {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.category,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableOrderingComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CashflowsTableAnnotationComposer
    extends Composer<_$Database, $CashflowsTable> {
  $$CashflowsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get sum =>
      $composableBuilder(column: $table.sum, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Currency, String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  $$OperationsTableAnnotationComposer get operation {
    final $$OperationsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.operation,
        referencedTable: $db.operations,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OperationsTableAnnotationComposer(
              $db: $db,
              $table: $db.operations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CategoriesTableAnnotationComposer get category {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.category,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableAnnotationComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CashflowsTableTableManager extends RootTableManager<
    _$Database,
    $CashflowsTable,
    CashflowDB,
    $$CashflowsTableFilterComposer,
    $$CashflowsTableOrderingComposer,
    $$CashflowsTableAnnotationComposer,
    $$CashflowsTableCreateCompanionBuilder,
    $$CashflowsTableUpdateCompanionBuilder,
    (CashflowDB, $$CashflowsTableReferences),
    CashflowDB,
    PrefetchHooks Function({bool operation, bool category})> {
  $$CashflowsTableTableManager(_$Database db, $CashflowsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CashflowsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CashflowsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CashflowsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<DateTime> date = const Value.absent(),
            Value<int> operation = const Value.absent(),
            Value<int> category = const Value.absent(),
            Value<int> sum = const Value.absent(),
            Value<Currency> currency = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CashflowsCompanion(
            date: date,
            operation: operation,
            category: category,
            sum: sum,
            currency: currency,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required DateTime date,
            required int operation,
            required int category,
            required int sum,
            Value<Currency> currency = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CashflowsCompanion.insert(
            date: date,
            operation: operation,
            category: category,
            sum: sum,
            currency: currency,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CashflowsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({operation = false, category = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (operation) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.operation,
                    referencedTable:
                        $$CashflowsTableReferences._operationTable(db),
                    referencedColumn:
                        $$CashflowsTableReferences._operationTable(db).id,
                  ) as T;
                }
                if (category) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.category,
                    referencedTable:
                        $$CashflowsTableReferences._categoryTable(db),
                    referencedColumn:
                        $$CashflowsTableReferences._categoryTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$CashflowsTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $CashflowsTable,
    CashflowDB,
    $$CashflowsTableFilterComposer,
    $$CashflowsTableOrderingComposer,
    $$CashflowsTableAnnotationComposer,
    $$CashflowsTableCreateCompanionBuilder,
    $$CashflowsTableUpdateCompanionBuilder,
    (CashflowDB, $$CashflowsTableReferences),
    CashflowDB,
    PrefetchHooks Function({bool operation, bool category})>;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$AccountsTableTableManager get accounts =>
      $$AccountsTableTableManager(_db, _db.accounts);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$OperationsTableTableManager get operations =>
      $$OperationsTableTableManager(_db, _db.operations);
  $$BalancesTableTableManager get balances =>
      $$BalancesTableTableManager(_db, _db.balances);
  $$CashflowsTableTableManager get cashflows =>
      $$CashflowsTableTableManager(_db, _db.cashflows);
}
