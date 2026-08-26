// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UserGroupsTable extends UserGroups
    with TableInfo<$UserGroupsTable, user_group> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserGroupsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<UuidValue> id = GeneratedColumn<UuidValue>(
    'id',
    aliasedName,
    false,
    type: PgTypes.uuid,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
    defaultValue: genRandomUuid(),
  );
  @override
  List<GeneratedColumn> get $columns => [id];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_groups';
  @override
  VerificationContext validateIntegrity(
    Insertable<user_group> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  user_group map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return user_group(
      id: attachedDatabase.typeMapping.read(
        PgTypes.uuid,
        data['${effectivePrefix}id'],
      )!,
    );
  }

  @override
  $UserGroupsTable createAlias(String alias) {
    return $UserGroupsTable(attachedDatabase, alias);
  }
}

class user_group extends DataClass implements Insertable<user_group> {
  final UuidValue id;
  const user_group({required this.id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<UuidValue>(id, PgTypes.uuid);
    return map;
  }

  UserGroupsCompanion toCompanion(bool nullToAbsent) {
    return UserGroupsCompanion(id: Value(id));
  }

  factory user_group.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return user_group(id: serializer.fromJson<UuidValue>(json['id']));
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{'id': serializer.toJson<UuidValue>(id)};
  }

  user_group copyWith({UuidValue? id}) => user_group(id: id ?? this.id);
  user_group copyWithCompanion(UserGroupsCompanion data) {
    return user_group(id: data.id.present ? data.id.value : this.id);
  }

  @override
  String toString() {
    return (StringBuffer('user_group(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => id.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is user_group && other.id == this.id);
}

class UserGroupsCompanion extends UpdateCompanion<user_group> {
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
  static Insertable<user_group> custom({
    Expression<UuidValue>? id,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserGroupsCompanion copyWith({Value<UuidValue>? id, Value<int>? rowid}) {
    return UserGroupsCompanion(id: id ?? this.id, rowid: rowid ?? this.rowid);
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

class $UsersTable extends Users with TableInfo<$UsersTable, user> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<UuidValue> id = GeneratedColumn<UuidValue>(
    'id',
    aliasedName,
    false,
    type: PgTypes.uuid,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
    defaultValue: genRandomUuid(),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _googleIdMeta = const VerificationMeta(
    'googleId',
  );
  @override
  late final GeneratedColumn<String> googleId = GeneratedColumn<String>(
    'google_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _photoMeta = const VerificationMeta('photo');
  @override
  late final GeneratedColumn<String> photo = GeneratedColumn<String>(
    'photo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userGroupIdMeta = const VerificationMeta(
    'userGroupId',
  );
  @override
  late final GeneratedColumn<UuidValue> userGroupId =
      GeneratedColumn<UuidValue>(
        'user_group_id',
        aliasedName,
        false,
        type: PgTypes.uuid,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES user_groups (id)',
        ),
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    googleId,
    email,
    photo,
    userGroupId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<user> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('google_id')) {
      context.handle(
        _googleIdMeta,
        googleId.isAcceptableOrUnknown(data['google_id']!, _googleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_googleIdMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('photo')) {
      context.handle(
        _photoMeta,
        photo.isAcceptableOrUnknown(data['photo']!, _photoMeta),
      );
    } else if (isInserting) {
      context.missing(_photoMeta);
    }
    if (data.containsKey('user_group_id')) {
      context.handle(
        _userGroupIdMeta,
        userGroupId.isAcceptableOrUnknown(
          data['user_group_id']!,
          _userGroupIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_userGroupIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  user map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return user(
      id: attachedDatabase.typeMapping.read(
        PgTypes.uuid,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      googleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}google_id'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      photo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo'],
      )!,
      userGroupId: attachedDatabase.typeMapping.read(
        PgTypes.uuid,
        data['${effectivePrefix}user_group_id'],
      )!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class user extends DataClass implements Insertable<user> {
  final UuidValue id;
  final String name;
  final String googleId;
  final String email;
  final String photo;
  final UuidValue userGroupId;
  const user({
    required this.id,
    required this.name,
    required this.googleId,
    required this.email,
    required this.photo,
    required this.userGroupId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<UuidValue>(id, PgTypes.uuid);
    map['name'] = Variable<String>(name);
    map['google_id'] = Variable<String>(googleId);
    map['email'] = Variable<String>(email);
    map['photo'] = Variable<String>(photo);
    map['user_group_id'] = Variable<UuidValue>(userGroupId, PgTypes.uuid);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      name: Value(name),
      googleId: Value(googleId),
      email: Value(email),
      photo: Value(photo),
      userGroupId: Value(userGroupId),
    );
  }

  factory user.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return user(
      id: serializer.fromJson<UuidValue>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      googleId: serializer.fromJson<String>(json['googleId']),
      email: serializer.fromJson<String>(json['email']),
      photo: serializer.fromJson<String>(json['photo']),
      userGroupId: serializer.fromJson<UuidValue>(json['userGroupId']),
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
      'userGroupId': serializer.toJson<UuidValue>(userGroupId),
    };
  }

  user copyWith({
    UuidValue? id,
    String? name,
    String? googleId,
    String? email,
    String? photo,
    UuidValue? userGroupId,
  }) => user(
    id: id ?? this.id,
    name: name ?? this.name,
    googleId: googleId ?? this.googleId,
    email: email ?? this.email,
    photo: photo ?? this.photo,
    userGroupId: userGroupId ?? this.userGroupId,
  );
  user copyWithCompanion(UsersCompanion data) {
    return user(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      googleId: data.googleId.present ? data.googleId.value : this.googleId,
      email: data.email.present ? data.email.value : this.email,
      photo: data.photo.present ? data.photo.value : this.photo,
      userGroupId: data.userGroupId.present
          ? data.userGroupId.value
          : this.userGroupId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('user(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('googleId: $googleId, ')
          ..write('email: $email, ')
          ..write('photo: $photo, ')
          ..write('userGroupId: $userGroupId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, googleId, email, photo, userGroupId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is user &&
          other.id == this.id &&
          other.name == this.name &&
          other.googleId == this.googleId &&
          other.email == this.email &&
          other.photo == this.photo &&
          other.userGroupId == this.userGroupId);
}

class UsersCompanion extends UpdateCompanion<user> {
  final Value<UuidValue> id;
  final Value<String> name;
  final Value<String> googleId;
  final Value<String> email;
  final Value<String> photo;
  final Value<UuidValue> userGroupId;
  final Value<int> rowid;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.googleId = const Value.absent(),
    this.email = const Value.absent(),
    this.photo = const Value.absent(),
    this.userGroupId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String googleId,
    required String email,
    required String photo,
    required UuidValue userGroupId,
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       googleId = Value(googleId),
       email = Value(email),
       photo = Value(photo),
       userGroupId = Value(userGroupId);
  static Insertable<user> custom({
    Expression<UuidValue>? id,
    Expression<String>? name,
    Expression<String>? googleId,
    Expression<String>? email,
    Expression<String>? photo,
    Expression<UuidValue>? userGroupId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (googleId != null) 'google_id': googleId,
      if (email != null) 'email': email,
      if (photo != null) 'photo': photo,
      if (userGroupId != null) 'user_group_id': userGroupId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith({
    Value<UuidValue>? id,
    Value<String>? name,
    Value<String>? googleId,
    Value<String>? email,
    Value<String>? photo,
    Value<UuidValue>? userGroupId,
    Value<int>? rowid,
  }) {
    return UsersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      googleId: googleId ?? this.googleId,
      email: email ?? this.email,
      photo: photo ?? this.photo,
      userGroupId: userGroupId ?? this.userGroupId,
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
    if (userGroupId.present) {
      map['user_group_id'] = Variable<UuidValue>(
        userGroupId.value,
        PgTypes.uuid,
      );
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
          ..write('userGroupId: $userGroupId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AccountsTable extends Accounts with TableInfo<$AccountsTable, account> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<UuidValue> id = GeneratedColumn<UuidValue>(
    'id',
    aliasedName,
    false,
    type: PgTypes.uuid,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
    defaultValue: genRandomUuid(),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<UuidValue> userId = GeneratedColumn<UuidValue>(
    'user_id',
    aliasedName,
    false,
    type: PgTypes.uuid,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _isDebtMeta = const VerificationMeta('isDebt');
  @override
  late final GeneratedColumn<bool> isDebt = GeneratedColumn<bool>(
    'is_debt',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userGroupIdMeta = const VerificationMeta(
    'userGroupId',
  );
  @override
  late final GeneratedColumn<UuidValue> userGroupId =
      GeneratedColumn<UuidValue>(
        'user_group_id',
        aliasedName,
        false,
        type: PgTypes.uuid,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES user_groups (id)',
        ),
      );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<PgDateTime> updatedAt =
      GeneratedColumn<PgDateTime>(
        'updated_at',
        aliasedName,
        false,
        type: PgTypes.timestampNoTimezone,
        requiredDuringInsert: true,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    userId,
    isDebt,
    userGroupId,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'accounts';
  @override
  VerificationContext validateIntegrity(
    Insertable<account> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('is_debt')) {
      context.handle(
        _isDebtMeta,
        isDebt.isAcceptableOrUnknown(data['is_debt']!, _isDebtMeta),
      );
    } else if (isInserting) {
      context.missing(_isDebtMeta);
    }
    if (data.containsKey('user_group_id')) {
      context.handle(
        _userGroupIdMeta,
        userGroupId.isAcceptableOrUnknown(
          data['user_group_id']!,
          _userGroupIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_userGroupIdMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  account map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return account(
      id: attachedDatabase.typeMapping.read(
        PgTypes.uuid,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        PgTypes.uuid,
        data['${effectivePrefix}user_id'],
      )!,
      isDebt: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_debt'],
      )!,
      userGroupId: attachedDatabase.typeMapping.read(
        PgTypes.uuid,
        data['${effectivePrefix}user_group_id'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        PgTypes.timestampNoTimezone,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $AccountsTable createAlias(String alias) {
    return $AccountsTable(attachedDatabase, alias);
  }
}

class account extends DataClass implements Insertable<account> {
  final UuidValue id;
  final String name;
  final UuidValue userId;
  final bool isDebt;
  final UuidValue userGroupId;
  final PgDateTime updatedAt;
  const account({
    required this.id,
    required this.name,
    required this.userId,
    required this.isDebt,
    required this.userGroupId,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<UuidValue>(id, PgTypes.uuid);
    map['name'] = Variable<String>(name);
    map['user_id'] = Variable<UuidValue>(userId, PgTypes.uuid);
    map['is_debt'] = Variable<bool>(isDebt);
    map['user_group_id'] = Variable<UuidValue>(userGroupId, PgTypes.uuid);
    map['updated_at'] = Variable<PgDateTime>(
      updatedAt,
      PgTypes.timestampNoTimezone,
    );
    return map;
  }

  AccountsCompanion toCompanion(bool nullToAbsent) {
    return AccountsCompanion(
      id: Value(id),
      name: Value(name),
      userId: Value(userId),
      isDebt: Value(isDebt),
      userGroupId: Value(userGroupId),
      updatedAt: Value(updatedAt),
    );
  }

  factory account.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return account(
      id: serializer.fromJson<UuidValue>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      userId: serializer.fromJson<UuidValue>(json['userId']),
      isDebt: serializer.fromJson<bool>(json['isDebt']),
      userGroupId: serializer.fromJson<UuidValue>(json['userGroupId']),
      updatedAt: serializer.fromJson<PgDateTime>(json['updatedAt']),
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
      'userGroupId': serializer.toJson<UuidValue>(userGroupId),
      'updatedAt': serializer.toJson<PgDateTime>(updatedAt),
    };
  }

  account copyWith({
    UuidValue? id,
    String? name,
    UuidValue? userId,
    bool? isDebt,
    UuidValue? userGroupId,
    PgDateTime? updatedAt,
  }) => account(
    id: id ?? this.id,
    name: name ?? this.name,
    userId: userId ?? this.userId,
    isDebt: isDebt ?? this.isDebt,
    userGroupId: userGroupId ?? this.userGroupId,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  account copyWithCompanion(AccountsCompanion data) {
    return account(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      userId: data.userId.present ? data.userId.value : this.userId,
      isDebt: data.isDebt.present ? data.isDebt.value : this.isDebt,
      userGroupId: data.userGroupId.present
          ? data.userGroupId.value
          : this.userGroupId,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('account(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('userId: $userId, ')
          ..write('isDebt: $isDebt, ')
          ..write('userGroupId: $userGroupId, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, userId, isDebt, userGroupId, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is account &&
          other.id == this.id &&
          other.name == this.name &&
          other.userId == this.userId &&
          other.isDebt == this.isDebt &&
          other.userGroupId == this.userGroupId &&
          other.updatedAt == this.updatedAt);
}

class AccountsCompanion extends UpdateCompanion<account> {
  final Value<UuidValue> id;
  final Value<String> name;
  final Value<UuidValue> userId;
  final Value<bool> isDebt;
  final Value<UuidValue> userGroupId;
  final Value<PgDateTime> updatedAt;
  final Value<int> rowid;
  const AccountsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.userId = const Value.absent(),
    this.isDebt = const Value.absent(),
    this.userGroupId = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AccountsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required UuidValue userId,
    required bool isDebt,
    required UuidValue userGroupId,
    required PgDateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       userId = Value(userId),
       isDebt = Value(isDebt),
       userGroupId = Value(userGroupId),
       updatedAt = Value(updatedAt);
  static Insertable<account> custom({
    Expression<UuidValue>? id,
    Expression<String>? name,
    Expression<UuidValue>? userId,
    Expression<bool>? isDebt,
    Expression<UuidValue>? userGroupId,
    Expression<PgDateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (userId != null) 'user_id': userId,
      if (isDebt != null) 'is_debt': isDebt,
      if (userGroupId != null) 'user_group_id': userGroupId,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AccountsCompanion copyWith({
    Value<UuidValue>? id,
    Value<String>? name,
    Value<UuidValue>? userId,
    Value<bool>? isDebt,
    Value<UuidValue>? userGroupId,
    Value<PgDateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return AccountsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      userId: userId ?? this.userId,
      isDebt: isDebt ?? this.isDebt,
      userGroupId: userGroupId ?? this.userGroupId,
      updatedAt: updatedAt ?? this.updatedAt,
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
    if (userGroupId.present) {
      map['user_group_id'] = Variable<UuidValue>(
        userGroupId.value,
        PgTypes.uuid,
      );
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<PgDateTime>(
        updatedAt.value,
        PgTypes.timestampNoTimezone,
      );
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
          ..write('userGroupId: $userGroupId, ')
          ..write('updatedAt: $updatedAt, ')
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
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    userGroups,
    users,
    accounts,
  ];
}

typedef $$UserGroupsTableCreateCompanionBuilder =
    UserGroupsCompanion Function({Value<UuidValue> id, Value<int> rowid});
typedef $$UserGroupsTableUpdateCompanionBuilder =
    UserGroupsCompanion Function({Value<UuidValue> id, Value<int> rowid});

final class $$UserGroupsTableReferences
    extends BaseReferences<_$AppDatabase, $UserGroupsTable, user_group> {
  $$UserGroupsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$UsersTable, List<user>> _usersRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.users,
    aliasName: $_aliasNameGenerator(db.userGroups.id, db.users.userGroupId),
  );

  $$UsersTableProcessedTableManager get usersRefs {
    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.userGroupId.id.sqlEquals($_itemColumn<UuidValue>('id')!));

    final cache = $_typedResult.readTableOrNull(_usersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AccountsTable, List<account>> _accountsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.accounts,
    aliasName: $_aliasNameGenerator(db.userGroups.id, db.accounts.userGroupId),
  );

  $$AccountsTableProcessedTableManager get accountsRefs {
    final manager = $$AccountsTableTableManager(
      $_db,
      $_db.accounts,
    ).filter((f) => f.userGroupId.id.sqlEquals($_itemColumn<UuidValue>('id')!));

    final cache = $_typedResult.readTableOrNull(_accountsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
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
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> usersRefs(
    Expression<bool> Function($$UsersTableFilterComposer f) f,
  ) {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.userGroupId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> accountsRefs(
    Expression<bool> Function($$AccountsTableFilterComposer f) f,
  ) {
    final $$AccountsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.accounts,
      getReferencedColumn: (t) => t.userGroupId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountsTableFilterComposer(
            $db: $db,
            $table: $db.accounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
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
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );
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
    Expression<T> Function($$UsersTableAnnotationComposer a) f,
  ) {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.userGroupId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> accountsRefs<T extends Object>(
    Expression<T> Function($$AccountsTableAnnotationComposer a) f,
  ) {
    final $$AccountsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.accounts,
      getReferencedColumn: (t) => t.userGroupId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountsTableAnnotationComposer(
            $db: $db,
            $table: $db.accounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UserGroupsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserGroupsTable,
          user_group,
          $$UserGroupsTableFilterComposer,
          $$UserGroupsTableOrderingComposer,
          $$UserGroupsTableAnnotationComposer,
          $$UserGroupsTableCreateCompanionBuilder,
          $$UserGroupsTableUpdateCompanionBuilder,
          (user_group, $$UserGroupsTableReferences),
          user_group,
          PrefetchHooks Function({bool usersRefs, bool accountsRefs})
        > {
  $$UserGroupsTableTableManager(_$AppDatabase db, $UserGroupsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserGroupsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserGroupsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserGroupsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<UuidValue> id = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserGroupsCompanion(id: id, rowid: rowid),
          createCompanionCallback:
              ({
                Value<UuidValue> id = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserGroupsCompanion.insert(id: id, rowid: rowid),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UserGroupsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({usersRefs = false, accountsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (usersRefs) db.users,
                if (accountsRefs) db.accounts,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (usersRefs)
                    await $_getPrefetchedData<
                      user_group,
                      $UserGroupsTable,
                      user
                    >(
                      currentTable: table,
                      referencedTable: $$UserGroupsTableReferences
                          ._usersRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$UserGroupsTableReferences(db, table, p0).usersRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.userGroupId == item.id,
                          ),
                      typedResults: items,
                    ),
                  if (accountsRefs)
                    await $_getPrefetchedData<
                      user_group,
                      $UserGroupsTable,
                      account
                    >(
                      currentTable: table,
                      referencedTable: $$UserGroupsTableReferences
                          ._accountsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$UserGroupsTableReferences(
                            db,
                            table,
                            p0,
                          ).accountsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.userGroupId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$UserGroupsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserGroupsTable,
      user_group,
      $$UserGroupsTableFilterComposer,
      $$UserGroupsTableOrderingComposer,
      $$UserGroupsTableAnnotationComposer,
      $$UserGroupsTableCreateCompanionBuilder,
      $$UserGroupsTableUpdateCompanionBuilder,
      (user_group, $$UserGroupsTableReferences),
      user_group,
      PrefetchHooks Function({bool usersRefs, bool accountsRefs})
    >;
typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      Value<UuidValue> id,
      required String name,
      required String googleId,
      required String email,
      required String photo,
      required UuidValue userGroupId,
      Value<int> rowid,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<UuidValue> id,
      Value<String> name,
      Value<String> googleId,
      Value<String> email,
      Value<String> photo,
      Value<UuidValue> userGroupId,
      Value<int> rowid,
    });

final class $$UsersTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTable, user> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UserGroupsTable _userGroupIdTable(_$AppDatabase db) =>
      db.userGroups.createAlias(
        $_aliasNameGenerator(db.users.userGroupId, db.userGroups.id),
      );

  $$UserGroupsTableProcessedTableManager get userGroupId {
    final $_column = $_itemColumn<UuidValue>('user_group_id')!;

    final manager = $$UserGroupsTableTableManager(
      $_db,
      $_db.userGroups,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userGroupIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$AccountsTable, List<account>> _accountsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.accounts,
    aliasName: $_aliasNameGenerator(db.users.id, db.accounts.userId),
  );

  $$AccountsTableProcessedTableManager get accountsRefs {
    final manager = $$AccountsTableTableManager(
      $_db,
      $_db.accounts,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<UuidValue>('id')!));

    final cache = $_typedResult.readTableOrNull(_accountsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
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
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get googleId => $composableBuilder(
    column: $table.googleId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photo => $composableBuilder(
    column: $table.photo,
    builder: (column) => ColumnFilters(column),
  );

  $$UserGroupsTableFilterComposer get userGroupId {
    final $$UserGroupsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userGroupId,
      referencedTable: $db.userGroups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserGroupsTableFilterComposer(
            $db: $db,
            $table: $db.userGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> accountsRefs(
    Expression<bool> Function($$AccountsTableFilterComposer f) f,
  ) {
    final $$AccountsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.accounts,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountsTableFilterComposer(
            $db: $db,
            $table: $db.accounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
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
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get googleId => $composableBuilder(
    column: $table.googleId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photo => $composableBuilder(
    column: $table.photo,
    builder: (column) => ColumnOrderings(column),
  );

  $$UserGroupsTableOrderingComposer get userGroupId {
    final $$UserGroupsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userGroupId,
      referencedTable: $db.userGroups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserGroupsTableOrderingComposer(
            $db: $db,
            $table: $db.userGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
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

  $$UserGroupsTableAnnotationComposer get userGroupId {
    final $$UserGroupsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userGroupId,
      referencedTable: $db.userGroups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserGroupsTableAnnotationComposer(
            $db: $db,
            $table: $db.userGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> accountsRefs<T extends Object>(
    Expression<T> Function($$AccountsTableAnnotationComposer a) f,
  ) {
    final $$AccountsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.accounts,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountsTableAnnotationComposer(
            $db: $db,
            $table: $db.accounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTable,
          user,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (user, $$UsersTableReferences),
          user,
          PrefetchHooks Function({bool userGroupId, bool accountsRefs})
        > {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<UuidValue> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> googleId = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String> photo = const Value.absent(),
                Value<UuidValue> userGroupId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion(
                id: id,
                name: name,
                googleId: googleId,
                email: email,
                photo: photo,
                userGroupId: userGroupId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<UuidValue> id = const Value.absent(),
                required String name,
                required String googleId,
                required String email,
                required String photo,
                required UuidValue userGroupId,
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion.insert(
                id: id,
                name: name,
                googleId: googleId,
                email: email,
                photo: photo,
                userGroupId: userGroupId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$UsersTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({userGroupId = false, accountsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (accountsRefs) db.accounts],
              addJoins:
                  <
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
                      dynamic
                    >
                  >(state) {
                    if (userGroupId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userGroupId,
                                referencedTable: $$UsersTableReferences
                                    ._userGroupIdTable(db),
                                referencedColumn: $$UsersTableReferences
                                    ._userGroupIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (accountsRefs)
                    await $_getPrefetchedData<user, $UsersTable, account>(
                      currentTable: table,
                      referencedTable: $$UsersTableReferences
                          ._accountsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$UsersTableReferences(db, table, p0).accountsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.userId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTable,
      user,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (user, $$UsersTableReferences),
      user,
      PrefetchHooks Function({bool userGroupId, bool accountsRefs})
    >;
typedef $$AccountsTableCreateCompanionBuilder =
    AccountsCompanion Function({
      Value<UuidValue> id,
      required String name,
      required UuidValue userId,
      required bool isDebt,
      required UuidValue userGroupId,
      required PgDateTime updatedAt,
      Value<int> rowid,
    });
typedef $$AccountsTableUpdateCompanionBuilder =
    AccountsCompanion Function({
      Value<UuidValue> id,
      Value<String> name,
      Value<UuidValue> userId,
      Value<bool> isDebt,
      Value<UuidValue> userGroupId,
      Value<PgDateTime> updatedAt,
      Value<int> rowid,
    });

final class $$AccountsTableReferences
    extends BaseReferences<_$AppDatabase, $AccountsTable, account> {
  $$AccountsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.accounts.userId, db.users.id),
  );

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<UuidValue>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UserGroupsTable _userGroupIdTable(_$AppDatabase db) =>
      db.userGroups.createAlias(
        $_aliasNameGenerator(db.accounts.userGroupId, db.userGroups.id),
      );

  $$UserGroupsTableProcessedTableManager get userGroupId {
    final $_column = $_itemColumn<UuidValue>('user_group_id')!;

    final manager = $$UserGroupsTableTableManager(
      $_db,
      $_db.userGroups,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userGroupIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
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
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDebt => $composableBuilder(
    column: $table.isDebt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<PgDateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UserGroupsTableFilterComposer get userGroupId {
    final $$UserGroupsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userGroupId,
      referencedTable: $db.userGroups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserGroupsTableFilterComposer(
            $db: $db,
            $table: $db.userGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
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
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDebt => $composableBuilder(
    column: $table.isDebt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<PgDateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UserGroupsTableOrderingComposer get userGroupId {
    final $$UserGroupsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userGroupId,
      referencedTable: $db.userGroups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserGroupsTableOrderingComposer(
            $db: $db,
            $table: $db.userGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
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

  GeneratedColumn<PgDateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UserGroupsTableAnnotationComposer get userGroupId {
    final $$UserGroupsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userGroupId,
      referencedTable: $db.userGroups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserGroupsTableAnnotationComposer(
            $db: $db,
            $table: $db.userGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AccountsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AccountsTable,
          account,
          $$AccountsTableFilterComposer,
          $$AccountsTableOrderingComposer,
          $$AccountsTableAnnotationComposer,
          $$AccountsTableCreateCompanionBuilder,
          $$AccountsTableUpdateCompanionBuilder,
          (account, $$AccountsTableReferences),
          account,
          PrefetchHooks Function({bool userId, bool userGroupId})
        > {
  $$AccountsTableTableManager(_$AppDatabase db, $AccountsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AccountsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AccountsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AccountsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<UuidValue> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<UuidValue> userId = const Value.absent(),
                Value<bool> isDebt = const Value.absent(),
                Value<UuidValue> userGroupId = const Value.absent(),
                Value<PgDateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AccountsCompanion(
                id: id,
                name: name,
                userId: userId,
                isDebt: isDebt,
                userGroupId: userGroupId,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<UuidValue> id = const Value.absent(),
                required String name,
                required UuidValue userId,
                required bool isDebt,
                required UuidValue userGroupId,
                required PgDateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => AccountsCompanion.insert(
                id: id,
                name: name,
                userId: userId,
                isDebt: isDebt,
                userGroupId: userGroupId,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AccountsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false, userGroupId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
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
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable: $$AccountsTableReferences
                                    ._userIdTable(db),
                                referencedColumn: $$AccountsTableReferences
                                    ._userIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (userGroupId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userGroupId,
                                referencedTable: $$AccountsTableReferences
                                    ._userGroupIdTable(db),
                                referencedColumn: $$AccountsTableReferences
                                    ._userGroupIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AccountsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AccountsTable,
      account,
      $$AccountsTableFilterComposer,
      $$AccountsTableOrderingComposer,
      $$AccountsTableAnnotationComposer,
      $$AccountsTableCreateCompanionBuilder,
      $$AccountsTableUpdateCompanionBuilder,
      (account, $$AccountsTableReferences),
      account,
      PrefetchHooks Function({bool userId, bool userGroupId})
    >;

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
