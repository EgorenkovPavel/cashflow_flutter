// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UserGroupsTable extends UserGroups
    with TableInfo<$UserGroupsTable, UserGroupDBO> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserGroupsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<UuidValue> id = GeneratedColumn<UuidValue>(
      'id', aliasedName, false,
      type: PgTypes.uuid,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
      defaultValue: genRandomUuid());
  @override
  List<GeneratedColumn> get $columns => [id];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_groups';
  @override
  VerificationContext validateIntegrity(Insertable<UserGroupDBO> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  UserGroupDBO map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserGroupDBO(
      id: attachedDatabase.typeMapping
          .read(PgTypes.uuid, data['${effectivePrefix}id'])!,
    );
  }

  @override
  $UserGroupsTable createAlias(String alias) {
    return $UserGroupsTable(attachedDatabase, alias);
  }
}

class UserGroupDBO extends DataClass implements Insertable<UserGroupDBO> {
  final UuidValue id;
  const UserGroupDBO({required this.id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<UuidValue>(id, PgTypes.uuid);
    return map;
  }

  UserGroupsCompanion toCompanion(bool nullToAbsent) {
    return UserGroupsCompanion(
      id: Value(id),
    );
  }

  factory UserGroupDBO.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserGroupDBO(
      id: serializer.fromJson<UuidValue>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<UuidValue>(id),
    };
  }

  UserGroupDBO copyWith({UuidValue? id}) => UserGroupDBO(
        id: id ?? this.id,
      );
  UserGroupDBO copyWithCompanion(UserGroupsCompanion data) {
    return UserGroupDBO(
      id: data.id.present ? data.id.value : this.id,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserGroupDBO(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => id.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is UserGroupDBO && other.id == this.id);
}

class UserGroupsCompanion extends UpdateCompanion<UserGroupDBO> {
  final Value<UuidValue> id;
  final Value<int> rowid;
  const UserGroupsCompanion({
    this.id = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserGroupsCompanion.insert({
    this.id = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<UserGroupDBO> custom({
    Expression<UuidValue>? id,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserGroupsCompanion copyWith({Value<UuidValue>? id, Value<int>? rowid}) {
    return UserGroupsCompanion(
      id: id ?? this.id,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<UuidValue>(id.value, PgTypes.uuid);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserGroupsCompanion(')
          ..write('id: $id, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, UserDBO> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<UuidValue> id = GeneratedColumn<UuidValue>(
      'id', aliasedName, false,
      type: PgTypes.uuid,
      requiredDuringInsert: false,
      defaultValue: genRandomUuid());
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _googleIdMeta =
      const VerificationMeta('googleId');
  @override
  late final GeneratedColumn<String> googleId = GeneratedColumn<String>(
      'google_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _photoMeta = const VerificationMeta('photo');
  @override
  late final GeneratedColumn<String> photo = GeneratedColumn<String>(
      'photo', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _groupIdMeta =
      const VerificationMeta('groupId');
  @override
  late final GeneratedColumn<UuidValue> groupId = GeneratedColumn<UuidValue>(
      'group_id', aliasedName, false,
      type: PgTypes.uuid,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES user_groups (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, googleId, email, photo, groupId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<UserDBO> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('google_id')) {
      context.handle(_googleIdMeta,
          googleId.isAcceptableOrUnknown(data['google_id']!, _googleIdMeta));
    } else if (isInserting) {
      context.missing(_googleIdMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('photo')) {
      context.handle(
          _photoMeta, photo.isAcceptableOrUnknown(data['photo']!, _photoMeta));
    } else if (isInserting) {
      context.missing(_photoMeta);
    }
    if (data.containsKey('group_id')) {
      context.handle(_groupIdMeta,
          groupId.isAcceptableOrUnknown(data['group_id']!, _groupIdMeta));
    } else if (isInserting) {
      context.missing(_groupIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  UserDBO map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserDBO(
      id: attachedDatabase.typeMapping
          .read(PgTypes.uuid, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      googleId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}google_id'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      photo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}photo'])!,
      groupId: attachedDatabase.typeMapping
          .read(PgTypes.uuid, data['${effectivePrefix}group_id'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class UserDBO extends DataClass implements Insertable<UserDBO> {
  final UuidValue id;
  final String name;
  final String googleId;
  final String email;
  final String photo;
  final UuidValue groupId;
  const UserDBO(
      {required this.id,
      required this.name,
      required this.googleId,
      required this.email,
      required this.photo,
      required this.groupId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<UuidValue>(id, PgTypes.uuid);
    map['name'] = Variable<String>(name);
    map['google_id'] = Variable<String>(googleId);
    map['email'] = Variable<String>(email);
    map['photo'] = Variable<String>(photo);
    map['group_id'] = Variable<UuidValue>(groupId, PgTypes.uuid);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      name: Value(name),
      googleId: Value(googleId),
      email: Value(email),
      photo: Value(photo),
      groupId: Value(groupId),
    );
  }

  factory UserDBO.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserDBO(
      id: serializer.fromJson<UuidValue>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      googleId: serializer.fromJson<String>(json['googleId']),
      email: serializer.fromJson<String>(json['email']),
      photo: serializer.fromJson<String>(json['photo']),
      groupId: serializer.fromJson<UuidValue>(json['groupId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<UuidValue>(id),
      'name': serializer.toJson<String>(name),
      'googleId': serializer.toJson<String>(googleId),
      'email': serializer.toJson<String>(email),
      'photo': serializer.toJson<String>(photo),
      'groupId': serializer.toJson<UuidValue>(groupId),
    };
  }

  UserDBO copyWith(
          {UuidValue? id,
          String? name,
          String? googleId,
          String? email,
          String? photo,
          UuidValue? groupId}) =>
      UserDBO(
        id: id ?? this.id,
        name: name ?? this.name,
        googleId: googleId ?? this.googleId,
        email: email ?? this.email,
        photo: photo ?? this.photo,
        groupId: groupId ?? this.groupId,
      );
  UserDBO copyWithCompanion(UsersCompanion data) {
    return UserDBO(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      googleId: data.googleId.present ? data.googleId.value : this.googleId,
      email: data.email.present ? data.email.value : this.email,
      photo: data.photo.present ? data.photo.value : this.photo,
      groupId: data.groupId.present ? data.groupId.value : this.groupId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserDBO(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('googleId: $googleId, ')
          ..write('email: $email, ')
          ..write('photo: $photo, ')
          ..write('groupId: $groupId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, googleId, email, photo, groupId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserDBO &&
          other.id == this.id &&
          other.name == this.name &&
          other.googleId == this.googleId &&
          other.email == this.email &&
          other.photo == this.photo &&
          other.groupId == this.groupId);
}

class UsersCompanion extends UpdateCompanion<UserDBO> {
  final Value<UuidValue> id;
  final Value<String> name;
  final Value<String> googleId;
  final Value<String> email;
  final Value<String> photo;
  final Value<UuidValue> groupId;
  final Value<int> rowid;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.googleId = const Value.absent(),
    this.email = const Value.absent(),
    this.photo = const Value.absent(),
    this.groupId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String googleId,
    required String email,
    required String photo,
    required UuidValue groupId,
    this.rowid = const Value.absent(),
  })  : name = Value(name),
        googleId = Value(googleId),
        email = Value(email),
        photo = Value(photo),
        groupId = Value(groupId);
  static Insertable<UserDBO> custom({
    Expression<UuidValue>? id,
    Expression<String>? name,
    Expression<String>? googleId,
    Expression<String>? email,
    Expression<String>? photo,
    Expression<UuidValue>? groupId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (googleId != null) 'google_id': googleId,
      if (email != null) 'email': email,
      if (photo != null) 'photo': photo,
      if (groupId != null) 'group_id': groupId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith(
      {Value<UuidValue>? id,
      Value<String>? name,
      Value<String>? googleId,
      Value<String>? email,
      Value<String>? photo,
      Value<UuidValue>? groupId,
      Value<int>? rowid}) {
    return UsersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      googleId: googleId ?? this.googleId,
      email: email ?? this.email,
      photo: photo ?? this.photo,
      groupId: groupId ?? this.groupId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<UuidValue>(id.value, PgTypes.uuid);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (googleId.present) {
      map['google_id'] = Variable<String>(googleId.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (photo.present) {
      map['photo'] = Variable<String>(photo.value);
    }
    if (groupId.present) {
      map['group_id'] = Variable<UuidValue>(groupId.value, PgTypes.uuid);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('googleId: $googleId, ')
          ..write('email: $email, ')
          ..write('photo: $photo, ')
          ..write('groupId: $groupId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AccountsTable extends Accounts
    with TableInfo<$AccountsTable, AccountDBO> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<UuidValue> id = GeneratedColumn<UuidValue>(
      'id', aliasedName, false,
      type: PgTypes.uuid,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
      defaultValue: genRandomUuid());
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<UuidValue> userId = GeneratedColumn<UuidValue>(
      'user_id', aliasedName, false,
      type: PgTypes.uuid,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users (id)'));
  static const VerificationMeta _isDebtMeta = const VerificationMeta('isDebt');
  @override
  late final GeneratedColumn<bool> isDebt = GeneratedColumn<bool>(
      'is_debt', aliasedName, false,
      type: DriftSqlType.bool, requiredDuringInsert: true);
  static const VerificationMeta _groupIdMeta =
      const VerificationMeta('groupId');
  @override
  late final GeneratedColumn<UuidValue> groupId = GeneratedColumn<UuidValue>(
      'group_id', aliasedName, false,
      type: PgTypes.uuid,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES user_groups (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, name, userId, isDebt, groupId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'accounts';
  @override
  VerificationContext validateIntegrity(Insertable<AccountDBO> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('is_debt')) {
      context.handle(_isDebtMeta,
          isDebt.isAcceptableOrUnknown(data['is_debt']!, _isDebtMeta));
    } else if (isInserting) {
      context.missing(_isDebtMeta);
    }
    if (data.containsKey('group_id')) {
      context.handle(_groupIdMeta,
          groupId.isAcceptableOrUnknown(data['group_id']!, _groupIdMeta));
    } else if (isInserting) {
      context.missing(_groupIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  AccountDBO map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AccountDBO(
      id: attachedDatabase.typeMapping
          .read(PgTypes.uuid, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      userId: attachedDatabase.typeMapping
          .read(PgTypes.uuid, data['${effectivePrefix}user_id'])!,
      isDebt: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_debt'])!,
      groupId: attachedDatabase.typeMapping
          .read(PgTypes.uuid, data['${effectivePrefix}group_id'])!,
    );
  }

  @override
  $AccountsTable createAlias(String alias) {
    return $AccountsTable(attachedDatabase, alias);
  }
}

class AccountDBO extends DataClass implements Insertable<AccountDBO> {
  final UuidValue id;
  final String name;
  final UuidValue userId;
  final bool isDebt;
  final UuidValue groupId;
  const AccountDBO(
      {required this.id,
      required this.name,
      required this.userId,
      required this.isDebt,
      required this.groupId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<UuidValue>(id, PgTypes.uuid);
    map['name'] = Variable<String>(name);
    map['user_id'] = Variable<UuidValue>(userId, PgTypes.uuid);
    map['is_debt'] = Variable<bool>(isDebt);
    map['group_id'] = Variable<UuidValue>(groupId, PgTypes.uuid);
    return map;
  }

  AccountsCompanion toCompanion(bool nullToAbsent) {
    return AccountsCompanion(
      id: Value(id),
      name: Value(name),
      userId: Value(userId),
      isDebt: Value(isDebt),
      groupId: Value(groupId),
    );
  }

  factory AccountDBO.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AccountDBO(
      id: serializer.fromJson<UuidValue>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      userId: serializer.fromJson<UuidValue>(json['userId']),
      isDebt: serializer.fromJson<bool>(json['isDebt']),
      groupId: serializer.fromJson<UuidValue>(json['groupId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<UuidValue>(id),
      'name': serializer.toJson<String>(name),
      'userId': serializer.toJson<UuidValue>(userId),
      'isDebt': serializer.toJson<bool>(isDebt),
      'groupId': serializer.toJson<UuidValue>(groupId),
    };
  }

  AccountDBO copyWith(
          {UuidValue? id,
          String? name,
          UuidValue? userId,
          bool? isDebt,
          UuidValue? groupId}) =>
      AccountDBO(
        id: id ?? this.id,
        name: name ?? this.name,
        userId: userId ?? this.userId,
        isDebt: isDebt ?? this.isDebt,
        groupId: groupId ?? this.groupId,
      );
  AccountDBO copyWithCompanion(AccountsCompanion data) {
    return AccountDBO(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      userId: data.userId.present ? data.userId.value : this.userId,
      isDebt: data.isDebt.present ? data.isDebt.value : this.isDebt,
      groupId: data.groupId.present ? data.groupId.value : this.groupId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AccountDBO(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('userId: $userId, ')
          ..write('isDebt: $isDebt, ')
          ..write('groupId: $groupId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, userId, isDebt, groupId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccountDBO &&
          other.id == this.id &&
          other.name == this.name &&
          other.userId == this.userId &&
          other.isDebt == this.isDebt &&
          other.groupId == this.groupId);
}

class AccountsCompanion extends UpdateCompanion<AccountDBO> {
  final Value<UuidValue> id;
  final Value<String> name;
  final Value<UuidValue> userId;
  final Value<bool> isDebt;
  final Value<UuidValue> groupId;
  final Value<int> rowid;
  const AccountsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.userId = const Value.absent(),
    this.isDebt = const Value.absent(),
    this.groupId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AccountsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required UuidValue userId,
    required bool isDebt,
    required UuidValue groupId,
    this.rowid = const Value.absent(),
  })  : name = Value(name),
        userId = Value(userId),
        isDebt = Value(isDebt),
        groupId = Value(groupId);
  static Insertable<AccountDBO> custom({
    Expression<UuidValue>? id,
    Expression<String>? name,
    Expression<UuidValue>? userId,
    Expression<bool>? isDebt,
    Expression<UuidValue>? groupId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (userId != null) 'user_id': userId,
      if (isDebt != null) 'is_debt': isDebt,
      if (groupId != null) 'group_id': groupId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AccountsCompanion copyWith(
      {Value<UuidValue>? id,
      Value<String>? name,
      Value<UuidValue>? userId,
      Value<bool>? isDebt,
      Value<UuidValue>? groupId,
      Value<int>? rowid}) {
    return AccountsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      userId: userId ?? this.userId,
      isDebt: isDebt ?? this.isDebt,
      groupId: groupId ?? this.groupId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<UuidValue>(id.value, PgTypes.uuid);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<UuidValue>(userId.value, PgTypes.uuid);
    }
    if (isDebt.present) {
      map['is_debt'] = Variable<bool>(isDebt.value);
    }
    if (groupId.present) {
      map['group_id'] = Variable<UuidValue>(groupId.value, PgTypes.uuid);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('userId: $userId, ')
          ..write('isDebt: $isDebt, ')
          ..write('groupId: $groupId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UserGroupsTable userGroups = $UserGroupsTable(this);
  late final $UsersTable users = $UsersTable(this);
  late final $AccountsTable accounts = $AccountsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [userGroups, users, accounts];
}

typedef $$UserGroupsTableCreateCompanionBuilder = UserGroupsCompanion Function({
  Value<UuidValue> id,
  Value<int> rowid,
});
typedef $$UserGroupsTableUpdateCompanionBuilder = UserGroupsCompanion Function({
  Value<UuidValue> id,
  Value<int> rowid,
});

final class $$UserGroupsTableReferences
    extends BaseReferences<_$AppDatabase, $UserGroupsTable, UserGroupDBO> {
  $$UserGroupsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$UsersTable, List<UserDBO>> _usersRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.users,
          aliasName: $_aliasNameGenerator(db.userGroups.id, db.users.groupId));

  $$UsersTableProcessedTableManager get usersRefs {
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.groupId.id.sqlEquals($_itemColumn<UuidValue>('id')!));

    final cache = $_typedResult.readTableOrNull(_usersRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$AccountsTable, List<AccountDBO>>
      _accountsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.accounts,
              aliasName:
                  $_aliasNameGenerator(db.userGroups.id, db.accounts.groupId));

  $$AccountsTableProcessedTableManager get accountsRefs {
    final manager = $$AccountsTableTableManager($_db, $_db.accounts)
        .filter((f) => f.groupId.id.sqlEquals($_itemColumn<UuidValue>('id')!));

    final cache = $_typedResult.readTableOrNull(_accountsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$UserGroupsTableFilterComposer
    extends Composer<_$AppDatabase, $UserGroupsTable> {
  $$UserGroupsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<UuidValue> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  Expression<bool> usersRefs(
      Expression<bool> Function($$UsersTableFilterComposer f) f) {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.groupId,
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
    return f(composer);
  }

  Expression<bool> accountsRefs(
      Expression<bool> Function($$AccountsTableFilterComposer f) f) {
    final $$AccountsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.accounts,
        getReferencedColumn: (t) => t.groupId,
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

class $$UserGroupsTableOrderingComposer
    extends Composer<_$AppDatabase, $UserGroupsTable> {
  $$UserGroupsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<UuidValue> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));
}

class $$UserGroupsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserGroupsTable> {
  $$UserGroupsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<UuidValue> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  Expression<T> usersRefs<T extends Object>(
      Expression<T> Function($$UsersTableAnnotationComposer a) f) {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.groupId,
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
    return f(composer);
  }

  Expression<T> accountsRefs<T extends Object>(
      Expression<T> Function($$AccountsTableAnnotationComposer a) f) {
    final $$AccountsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.accounts,
        getReferencedColumn: (t) => t.groupId,
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

class $$UserGroupsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UserGroupsTable,
    UserGroupDBO,
    $$UserGroupsTableFilterComposer,
    $$UserGroupsTableOrderingComposer,
    $$UserGroupsTableAnnotationComposer,
    $$UserGroupsTableCreateCompanionBuilder,
    $$UserGroupsTableUpdateCompanionBuilder,
    (UserGroupDBO, $$UserGroupsTableReferences),
    UserGroupDBO,
    PrefetchHooks Function({bool usersRefs, bool accountsRefs})> {
  $$UserGroupsTableTableManager(_$AppDatabase db, $UserGroupsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserGroupsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserGroupsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserGroupsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<UuidValue> id = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserGroupsCompanion(
            id: id,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<UuidValue> id = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserGroupsCompanion.insert(
            id: id,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$UserGroupsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({usersRefs = false, accountsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (usersRefs) db.users,
                if (accountsRefs) db.accounts
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (usersRefs)
                    await $_getPrefetchedData<UserGroupDBO, $UserGroupsTable,
                            UserDBO>(
                        currentTable: table,
                        referencedTable:
                            $$UserGroupsTableReferences._usersRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UserGroupsTableReferences(db, table, p0)
                                .usersRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.groupId == item.id),
                        typedResults: items),
                  if (accountsRefs)
                    await $_getPrefetchedData<UserGroupDBO, $UserGroupsTable,
                            AccountDBO>(
                        currentTable: table,
                        referencedTable:
                            $$UserGroupsTableReferences._accountsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UserGroupsTableReferences(db, table, p0)
                                .accountsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.groupId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$UserGroupsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UserGroupsTable,
    UserGroupDBO,
    $$UserGroupsTableFilterComposer,
    $$UserGroupsTableOrderingComposer,
    $$UserGroupsTableAnnotationComposer,
    $$UserGroupsTableCreateCompanionBuilder,
    $$UserGroupsTableUpdateCompanionBuilder,
    (UserGroupDBO, $$UserGroupsTableReferences),
    UserGroupDBO,
    PrefetchHooks Function({bool usersRefs, bool accountsRefs})>;
typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  Value<UuidValue> id,
  required String name,
  required String googleId,
  required String email,
  required String photo,
  required UuidValue groupId,
  Value<int> rowid,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<UuidValue> id,
  Value<String> name,
  Value<String> googleId,
  Value<String> email,
  Value<String> photo,
  Value<UuidValue> groupId,
  Value<int> rowid,
});

final class $$UsersTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTable, UserDBO> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UserGroupsTable _groupIdTable(_$AppDatabase db) => db.userGroups
      .createAlias($_aliasNameGenerator(db.users.groupId, db.userGroups.id));

  $$UserGroupsTableProcessedTableManager get groupId {
    final $_column = $_itemColumn<UuidValue>('group_id')!;

    final manager = $$UserGroupsTableTableManager($_db, $_db.userGroups)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_groupIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$AccountsTable, List<AccountDBO>>
      _accountsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.accounts,
              aliasName: $_aliasNameGenerator(db.users.id, db.accounts.userId));

  $$AccountsTableProcessedTableManager get accountsRefs {
    final manager = $$AccountsTableTableManager($_db, $_db.accounts)
        .filter((f) => f.userId.id.sqlEquals($_itemColumn<UuidValue>('id')!));

    final cache = $_typedResult.readTableOrNull(_accountsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<UuidValue> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get googleId => $composableBuilder(
      column: $table.googleId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get photo => $composableBuilder(
      column: $table.photo, builder: (column) => ColumnFilters(column));

  $$UserGroupsTableFilterComposer get groupId {
    final $$UserGroupsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupId,
        referencedTable: $db.userGroups,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UserGroupsTableFilterComposer(
              $db: $db,
              $table: $db.userGroups,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> accountsRefs(
      Expression<bool> Function($$AccountsTableFilterComposer f) f) {
    final $$AccountsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.accounts,
        getReferencedColumn: (t) => t.userId,
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

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<UuidValue> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get googleId => $composableBuilder(
      column: $table.googleId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get photo => $composableBuilder(
      column: $table.photo, builder: (column) => ColumnOrderings(column));

  $$UserGroupsTableOrderingComposer get groupId {
    final $$UserGroupsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupId,
        referencedTable: $db.userGroups,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UserGroupsTableOrderingComposer(
              $db: $db,
              $table: $db.userGroups,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<UuidValue> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get googleId =>
      $composableBuilder(column: $table.googleId, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get photo =>
      $composableBuilder(column: $table.photo, builder: (column) => column);

  $$UserGroupsTableAnnotationComposer get groupId {
    final $$UserGroupsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupId,
        referencedTable: $db.userGroups,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UserGroupsTableAnnotationComposer(
              $db: $db,
              $table: $db.userGroups,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> accountsRefs<T extends Object>(
      Expression<T> Function($$AccountsTableAnnotationComposer a) f) {
    final $$AccountsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.accounts,
        getReferencedColumn: (t) => t.userId,
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
    _$AppDatabase,
    $UsersTable,
    UserDBO,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (UserDBO, $$UsersTableReferences),
    UserDBO,
    PrefetchHooks Function({bool groupId, bool accountsRefs})> {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
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
            Value<UuidValue> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> googleId = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> photo = const Value.absent(),
            Value<UuidValue> groupId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UsersCompanion(
            id: id,
            name: name,
            googleId: googleId,
            email: email,
            photo: photo,
            groupId: groupId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<UuidValue> id = const Value.absent(),
            required String name,
            required String googleId,
            required String email,
            required String photo,
            required UuidValue groupId,
            Value<int> rowid = const Value.absent(),
          }) =>
              UsersCompanion.insert(
            id: id,
            name: name,
            googleId: googleId,
            email: email,
            photo: photo,
            groupId: groupId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$UsersTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({groupId = false, accountsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (accountsRefs) db.accounts],
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
                if (groupId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.groupId,
                    referencedTable: $$UsersTableReferences._groupIdTable(db),
                    referencedColumn:
                        $$UsersTableReferences._groupIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (accountsRefs)
                    await $_getPrefetchedData<UserDBO, $UsersTable, AccountDBO>(
                        currentTable: table,
                        referencedTable:
                            $$UsersTableReferences._accountsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableReferences(db, table, p0).accountsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.userId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$UsersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UsersTable,
    UserDBO,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (UserDBO, $$UsersTableReferences),
    UserDBO,
    PrefetchHooks Function({bool groupId, bool accountsRefs})>;
typedef $$AccountsTableCreateCompanionBuilder = AccountsCompanion Function({
  Value<UuidValue> id,
  required String name,
  required UuidValue userId,
  required bool isDebt,
  required UuidValue groupId,
  Value<int> rowid,
});
typedef $$AccountsTableUpdateCompanionBuilder = AccountsCompanion Function({
  Value<UuidValue> id,
  Value<String> name,
  Value<UuidValue> userId,
  Value<bool> isDebt,
  Value<UuidValue> groupId,
  Value<int> rowid,
});

final class $$AccountsTableReferences
    extends BaseReferences<_$AppDatabase, $AccountsTable, AccountDBO> {
  $$AccountsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users
      .createAlias($_aliasNameGenerator(db.accounts.userId, db.users.id));

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<UuidValue>('user_id')!;

    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $UserGroupsTable _groupIdTable(_$AppDatabase db) => db.userGroups
      .createAlias($_aliasNameGenerator(db.accounts.groupId, db.userGroups.id));

  $$UserGroupsTableProcessedTableManager get groupId {
    final $_column = $_itemColumn<UuidValue>('group_id')!;

    final manager = $$UserGroupsTableTableManager($_db, $_db.userGroups)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_groupIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$AccountsTableFilterComposer
    extends Composer<_$AppDatabase, $AccountsTable> {
  $$AccountsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<UuidValue> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDebt => $composableBuilder(
      column: $table.isDebt, builder: (column) => ColumnFilters(column));

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
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

  $$UserGroupsTableFilterComposer get groupId {
    final $$UserGroupsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupId,
        referencedTable: $db.userGroups,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UserGroupsTableFilterComposer(
              $db: $db,
              $table: $db.userGroups,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AccountsTableOrderingComposer
    extends Composer<_$AppDatabase, $AccountsTable> {
  $$AccountsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<UuidValue> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDebt => $composableBuilder(
      column: $table.isDebt, builder: (column) => ColumnOrderings(column));

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
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

  $$UserGroupsTableOrderingComposer get groupId {
    final $$UserGroupsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupId,
        referencedTable: $db.userGroups,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UserGroupsTableOrderingComposer(
              $db: $db,
              $table: $db.userGroups,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AccountsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AccountsTable> {
  $$AccountsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<UuidValue> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get isDebt =>
      $composableBuilder(column: $table.isDebt, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
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

  $$UserGroupsTableAnnotationComposer get groupId {
    final $$UserGroupsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupId,
        referencedTable: $db.userGroups,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UserGroupsTableAnnotationComposer(
              $db: $db,
              $table: $db.userGroups,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AccountsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AccountsTable,
    AccountDBO,
    $$AccountsTableFilterComposer,
    $$AccountsTableOrderingComposer,
    $$AccountsTableAnnotationComposer,
    $$AccountsTableCreateCompanionBuilder,
    $$AccountsTableUpdateCompanionBuilder,
    (AccountDBO, $$AccountsTableReferences),
    AccountDBO,
    PrefetchHooks Function({bool userId, bool groupId})> {
  $$AccountsTableTableManager(_$AppDatabase db, $AccountsTable table)
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
            Value<UuidValue> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<UuidValue> userId = const Value.absent(),
            Value<bool> isDebt = const Value.absent(),
            Value<UuidValue> groupId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AccountsCompanion(
            id: id,
            name: name,
            userId: userId,
            isDebt: isDebt,
            groupId: groupId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<UuidValue> id = const Value.absent(),
            required String name,
            required UuidValue userId,
            required bool isDebt,
            required UuidValue groupId,
            Value<int> rowid = const Value.absent(),
          }) =>
              AccountsCompanion.insert(
            id: id,
            name: name,
            userId: userId,
            isDebt: isDebt,
            groupId: groupId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$AccountsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({userId = false, groupId = false}) {
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
                if (userId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.userId,
                    referencedTable: $$AccountsTableReferences._userIdTable(db),
                    referencedColumn:
                        $$AccountsTableReferences._userIdTable(db).id,
                  ) as T;
                }
                if (groupId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.groupId,
                    referencedTable:
                        $$AccountsTableReferences._groupIdTable(db),
                    referencedColumn:
                        $$AccountsTableReferences._groupIdTable(db).id,
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

typedef $$AccountsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AccountsTable,
    AccountDBO,
    $$AccountsTableFilterComposer,
    $$AccountsTableOrderingComposer,
    $$AccountsTableAnnotationComposer,
    $$AccountsTableCreateCompanionBuilder,
    $$AccountsTableUpdateCompanionBuilder,
    (AccountDBO, $$AccountsTableReferences),
    AccountDBO,
    PrefetchHooks Function({bool userId, bool groupId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UserGroupsTableTableManager get userGroups =>
      $$UserGroupsTableTableManager(_db, _db.userGroups);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$AccountsTableTableManager get accounts =>
      $$AccountsTableTableManager(_db, _db.accounts);
}
