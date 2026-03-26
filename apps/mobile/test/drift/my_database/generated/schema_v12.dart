// dart format width=80
// GENERATED CODE, DO NOT EDIT BY HAND.
// ignore_for_file: type=lint
import 'package:drift/drift.dart';

class Users extends Table with TableInfo<Users, UsersData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Users(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  late final GeneratedColumn<String> googleId = GeneratedColumn<String>(
    'google_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> photo = GeneratedColumn<String>(
    'photo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, googleId, name, photo];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UsersData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UsersData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      googleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}google_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      photo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo'],
      )!,
    );
  }

  @override
  Users createAlias(String alias) {
    return Users(attachedDatabase, alias);
  }
}

class UsersData extends DataClass implements Insertable<UsersData> {
  final int id;
  final String googleId;
  final String name;
  final String photo;
  const UsersData({
    required this.id,
    required this.googleId,
    required this.name,
    required this.photo,
  });
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

  factory UsersData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UsersData(
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

  UsersData copyWith({
    int? id,
    String? googleId,
    String? name,
    String? photo,
  }) => UsersData(
    id: id ?? this.id,
    googleId: googleId ?? this.googleId,
    name: name ?? this.name,
    photo: photo ?? this.photo,
  );
  UsersData copyWithCompanion(UsersCompanion data) {
    return UsersData(
      id: data.id.present ? data.id.value : this.id,
      googleId: data.googleId.present ? data.googleId.value : this.googleId,
      name: data.name.present ? data.name.value : this.name,
      photo: data.photo.present ? data.photo.value : this.photo,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UsersData(')
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
      (other is UsersData &&
          other.id == this.id &&
          other.googleId == this.googleId &&
          other.name == this.name &&
          other.photo == this.photo);
}

class UsersCompanion extends UpdateCompanion<UsersData> {
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
  }) : googleId = Value(googleId),
       name = Value(name),
       photo = Value(photo);
  static Insertable<UsersData> custom({
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

  UsersCompanion copyWith({
    Value<int>? id,
    Value<String>? googleId,
    Value<String>? name,
    Value<String>? photo,
  }) {
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

class Accounts extends Table with TableInfo<Accounts, AccountsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Accounts(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  late final GeneratedColumn<String> cloudId = GeneratedColumn<String>(
    'cloud_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<bool> isDebt = GeneratedColumn<bool>(
    'is_debt',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_debt" IN (0, 1))',
    ),
    defaultValue: const CustomExpression('0'),
  );
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
    'synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("synced" IN (0, 1))',
    ),
    defaultValue: const CustomExpression('0'),
  );
  late final GeneratedColumn<int> user = GeneratedColumn<int>(
    'user',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    cloudId,
    title,
    isDebt,
    synced,
    user,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'accounts';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AccountsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AccountsData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      cloudId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cloud_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      isDebt: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_debt'],
      )!,
      synced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}synced'],
      )!,
      user: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user'],
      ),
    );
  }

  @override
  Accounts createAlias(String alias) {
    return Accounts(attachedDatabase, alias);
  }
}

class AccountsData extends DataClass implements Insertable<AccountsData> {
  final int id;
  final String cloudId;
  final String title;
  final bool isDebt;
  final bool synced;
  final int? user;
  const AccountsData({
    required this.id,
    required this.cloudId,
    required this.title,
    required this.isDebt,
    required this.synced,
    this.user,
  });
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

  factory AccountsData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AccountsData(
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

  AccountsData copyWith({
    int? id,
    String? cloudId,
    String? title,
    bool? isDebt,
    bool? synced,
    Value<int?> user = const Value.absent(),
  }) => AccountsData(
    id: id ?? this.id,
    cloudId: cloudId ?? this.cloudId,
    title: title ?? this.title,
    isDebt: isDebt ?? this.isDebt,
    synced: synced ?? this.synced,
    user: user.present ? user.value : this.user,
  );
  AccountsData copyWithCompanion(AccountsCompanion data) {
    return AccountsData(
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
    return (StringBuffer('AccountsData(')
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
      (other is AccountsData &&
          other.id == this.id &&
          other.cloudId == this.cloudId &&
          other.title == this.title &&
          other.isDebt == this.isDebt &&
          other.synced == this.synced &&
          other.user == this.user);
}

class AccountsCompanion extends UpdateCompanion<AccountsData> {
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
  }) : cloudId = Value(cloudId),
       title = Value(title);
  static Insertable<AccountsData> custom({
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

  AccountsCompanion copyWith({
    Value<int>? id,
    Value<String>? cloudId,
    Value<String>? title,
    Value<bool>? isDebt,
    Value<bool>? synced,
    Value<int?>? user,
  }) {
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

class Categories extends Table with TableInfo<Categories, CategoriesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Categories(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  late final GeneratedColumn<String> cloudId = GeneratedColumn<String>(
    'cloud_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<int> operationType = GeneratedColumn<int>(
    'operation_type',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<int> budgetType = GeneratedColumn<int>(
    'budget_type',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<int> budget = GeneratedColumn<int>(
    'budget',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
    'synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("synced" IN (0, 1))',
    ),
    defaultValue: const CustomExpression('0'),
  );
  late final GeneratedColumn<bool> isGroup = GeneratedColumn<bool>(
    'is_group',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_group" IN (0, 1))',
    ),
    defaultValue: const CustomExpression('0'),
  );
  late final GeneratedColumn<int> parent = GeneratedColumn<int>(
    'parent',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES categories (id)',
    ),
  );
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
    parent,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoriesData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoriesData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      cloudId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cloud_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      operationType: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}operation_type'],
      )!,
      budgetType: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}budget_type'],
      )!,
      budget: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}budget'],
      )!,
      synced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}synced'],
      )!,
      isGroup: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_group'],
      )!,
      parent: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}parent'],
      ),
    );
  }

  @override
  Categories createAlias(String alias) {
    return Categories(attachedDatabase, alias);
  }
}

class CategoriesData extends DataClass implements Insertable<CategoriesData> {
  final int id;
  final String cloudId;
  final String title;
  final int operationType;
  final int budgetType;
  final int budget;
  final bool synced;
  final bool isGroup;
  final int? parent;
  const CategoriesData({
    required this.id,
    required this.cloudId,
    required this.title,
    required this.operationType,
    required this.budgetType,
    required this.budget,
    required this.synced,
    required this.isGroup,
    this.parent,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['cloud_id'] = Variable<String>(cloudId);
    map['title'] = Variable<String>(title);
    map['operation_type'] = Variable<int>(operationType);
    map['budget_type'] = Variable<int>(budgetType);
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
      parent: parent == null && nullToAbsent
          ? const Value.absent()
          : Value(parent),
    );
  }

  factory CategoriesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoriesData(
      id: serializer.fromJson<int>(json['id']),
      cloudId: serializer.fromJson<String>(json['cloudId']),
      title: serializer.fromJson<String>(json['title']),
      operationType: serializer.fromJson<int>(json['operationType']),
      budgetType: serializer.fromJson<int>(json['budgetType']),
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
      'operationType': serializer.toJson<int>(operationType),
      'budgetType': serializer.toJson<int>(budgetType),
      'budget': serializer.toJson<int>(budget),
      'synced': serializer.toJson<bool>(synced),
      'isGroup': serializer.toJson<bool>(isGroup),
      'parent': serializer.toJson<int?>(parent),
    };
  }

  CategoriesData copyWith({
    int? id,
    String? cloudId,
    String? title,
    int? operationType,
    int? budgetType,
    int? budget,
    bool? synced,
    bool? isGroup,
    Value<int?> parent = const Value.absent(),
  }) => CategoriesData(
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
  CategoriesData copyWithCompanion(CategoriesCompanion data) {
    return CategoriesData(
      id: data.id.present ? data.id.value : this.id,
      cloudId: data.cloudId.present ? data.cloudId.value : this.cloudId,
      title: data.title.present ? data.title.value : this.title,
      operationType: data.operationType.present
          ? data.operationType.value
          : this.operationType,
      budgetType: data.budgetType.present
          ? data.budgetType.value
          : this.budgetType,
      budget: data.budget.present ? data.budget.value : this.budget,
      synced: data.synced.present ? data.synced.value : this.synced,
      isGroup: data.isGroup.present ? data.isGroup.value : this.isGroup,
      parent: data.parent.present ? data.parent.value : this.parent,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesData(')
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
  int get hashCode => Object.hash(
    id,
    cloudId,
    title,
    operationType,
    budgetType,
    budget,
    synced,
    isGroup,
    parent,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoriesData &&
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

class CategoriesCompanion extends UpdateCompanion<CategoriesData> {
  final Value<int> id;
  final Value<String> cloudId;
  final Value<String> title;
  final Value<int> operationType;
  final Value<int> budgetType;
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
    required int operationType,
    required int budgetType,
    required int budget,
    this.synced = const Value.absent(),
    this.isGroup = const Value.absent(),
    this.parent = const Value.absent(),
  }) : cloudId = Value(cloudId),
       title = Value(title),
       operationType = Value(operationType),
       budgetType = Value(budgetType),
       budget = Value(budget);
  static Insertable<CategoriesData> custom({
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

  CategoriesCompanion copyWith({
    Value<int>? id,
    Value<String>? cloudId,
    Value<String>? title,
    Value<int>? operationType,
    Value<int>? budgetType,
    Value<int>? budget,
    Value<bool>? synced,
    Value<bool>? isGroup,
    Value<int?>? parent,
  }) {
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
      map['operation_type'] = Variable<int>(operationType.value);
    }
    if (budgetType.present) {
      map['budget_type'] = Variable<int>(budgetType.value);
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

class Operations extends Table with TableInfo<Operations, OperationsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Operations(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  late final GeneratedColumn<String> cloudId = GeneratedColumn<String>(
    'cloud_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<int> operationType = GeneratedColumn<int>(
    'operation_type',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<int> account = GeneratedColumn<int>(
    'account',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES accounts (id)',
    ),
  );
  late final GeneratedColumn<int> category = GeneratedColumn<int>(
    'category',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES categories (id)',
    ),
  );
  late final GeneratedColumn<int> recAccount = GeneratedColumn<int>(
    'rec_account',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES accounts (id)',
    ),
  );
  late final GeneratedColumn<int> sum = GeneratedColumn<int>(
    'sum',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<int> recSum = GeneratedColumn<int>(
    'rec_sum',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression('0'),
  );
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
    'synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("synced" IN (0, 1))',
    ),
    defaultValue: const CustomExpression('0'),
  );
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
    'deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("deleted" IN (0, 1))',
    ),
    defaultValue: const CustomExpression('0'),
  );
  late final GeneratedColumn<String> currencySent = GeneratedColumn<String>(
    'currency_sent',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression('\'RUB\''),
  );
  late final GeneratedColumn<String> currencyReceived = GeneratedColumn<String>(
    'currency_received',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression('\'RUB\''),
  );
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
    currencyReceived,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'operations';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OperationsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OperationsData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      cloudId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cloud_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      operationType: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}operation_type'],
      )!,
      account: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}account'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category'],
      ),
      recAccount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rec_account'],
      ),
      sum: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sum'],
      )!,
      recSum: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rec_sum'],
      )!,
      synced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}synced'],
      )!,
      deleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}deleted'],
      )!,
      currencySent: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency_sent'],
      )!,
      currencyReceived: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency_received'],
      )!,
    );
  }

  @override
  Operations createAlias(String alias) {
    return Operations(attachedDatabase, alias);
  }
}

class OperationsData extends DataClass implements Insertable<OperationsData> {
  final int id;
  final String cloudId;
  final DateTime date;
  final int operationType;
  final int account;
  final int? category;
  final int? recAccount;
  final int sum;
  final int recSum;
  final bool synced;
  final bool deleted;
  final String currencySent;
  final String currencyReceived;
  const OperationsData({
    required this.id,
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
    required this.currencyReceived,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['cloud_id'] = Variable<String>(cloudId);
    map['date'] = Variable<DateTime>(date);
    map['operation_type'] = Variable<int>(operationType);
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
    map['currency_sent'] = Variable<String>(currencySent);
    map['currency_received'] = Variable<String>(currencyReceived);
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

  factory OperationsData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OperationsData(
      id: serializer.fromJson<int>(json['id']),
      cloudId: serializer.fromJson<String>(json['cloudId']),
      date: serializer.fromJson<DateTime>(json['date']),
      operationType: serializer.fromJson<int>(json['operationType']),
      account: serializer.fromJson<int>(json['account']),
      category: serializer.fromJson<int?>(json['category']),
      recAccount: serializer.fromJson<int?>(json['recAccount']),
      sum: serializer.fromJson<int>(json['sum']),
      recSum: serializer.fromJson<int>(json['recSum']),
      synced: serializer.fromJson<bool>(json['synced']),
      deleted: serializer.fromJson<bool>(json['deleted']),
      currencySent: serializer.fromJson<String>(json['currencySent']),
      currencyReceived: serializer.fromJson<String>(json['currencyReceived']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'cloudId': serializer.toJson<String>(cloudId),
      'date': serializer.toJson<DateTime>(date),
      'operationType': serializer.toJson<int>(operationType),
      'account': serializer.toJson<int>(account),
      'category': serializer.toJson<int?>(category),
      'recAccount': serializer.toJson<int?>(recAccount),
      'sum': serializer.toJson<int>(sum),
      'recSum': serializer.toJson<int>(recSum),
      'synced': serializer.toJson<bool>(synced),
      'deleted': serializer.toJson<bool>(deleted),
      'currencySent': serializer.toJson<String>(currencySent),
      'currencyReceived': serializer.toJson<String>(currencyReceived),
    };
  }

  OperationsData copyWith({
    int? id,
    String? cloudId,
    DateTime? date,
    int? operationType,
    int? account,
    Value<int?> category = const Value.absent(),
    Value<int?> recAccount = const Value.absent(),
    int? sum,
    int? recSum,
    bool? synced,
    bool? deleted,
    String? currencySent,
    String? currencyReceived,
  }) => OperationsData(
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
  OperationsData copyWithCompanion(OperationsCompanion data) {
    return OperationsData(
      id: data.id.present ? data.id.value : this.id,
      cloudId: data.cloudId.present ? data.cloudId.value : this.cloudId,
      date: data.date.present ? data.date.value : this.date,
      operationType: data.operationType.present
          ? data.operationType.value
          : this.operationType,
      account: data.account.present ? data.account.value : this.account,
      category: data.category.present ? data.category.value : this.category,
      recAccount: data.recAccount.present
          ? data.recAccount.value
          : this.recAccount,
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
    return (StringBuffer('OperationsData(')
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
    currencyReceived,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OperationsData &&
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

class OperationsCompanion extends UpdateCompanion<OperationsData> {
  final Value<int> id;
  final Value<String> cloudId;
  final Value<DateTime> date;
  final Value<int> operationType;
  final Value<int> account;
  final Value<int?> category;
  final Value<int?> recAccount;
  final Value<int> sum;
  final Value<int> recSum;
  final Value<bool> synced;
  final Value<bool> deleted;
  final Value<String> currencySent;
  final Value<String> currencyReceived;
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
    required int operationType,
    required int account,
    this.category = const Value.absent(),
    this.recAccount = const Value.absent(),
    required int sum,
    this.recSum = const Value.absent(),
    this.synced = const Value.absent(),
    this.deleted = const Value.absent(),
    this.currencySent = const Value.absent(),
    this.currencyReceived = const Value.absent(),
  }) : cloudId = Value(cloudId),
       date = Value(date),
       operationType = Value(operationType),
       account = Value(account),
       sum = Value(sum);
  static Insertable<OperationsData> custom({
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

  OperationsCompanion copyWith({
    Value<int>? id,
    Value<String>? cloudId,
    Value<DateTime>? date,
    Value<int>? operationType,
    Value<int>? account,
    Value<int?>? category,
    Value<int?>? recAccount,
    Value<int>? sum,
    Value<int>? recSum,
    Value<bool>? synced,
    Value<bool>? deleted,
    Value<String>? currencySent,
    Value<String>? currencyReceived,
  }) {
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
      map['operation_type'] = Variable<int>(operationType.value);
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
      map['currency_sent'] = Variable<String>(currencySent.value);
    }
    if (currencyReceived.present) {
      map['currency_received'] = Variable<String>(currencyReceived.value);
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

class Balance extends Table with TableInfo<Balance, BalanceData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Balance(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<int> operation = GeneratedColumn<int>(
    'operation',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES operations (id)',
    ),
  );
  late final GeneratedColumn<int> account = GeneratedColumn<int>(
    'account',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES accounts (id)',
    ),
  );
  late final GeneratedColumn<int> sum = GeneratedColumn<int>(
    'sum',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
    'currency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression('\'RUB\''),
  );
  @override
  List<GeneratedColumn> get $columns => [
    date,
    operation,
    account,
    sum,
    currency,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'balance';
  @override
  Set<GeneratedColumn> get $primaryKey => {operation, account};
  @override
  BalanceData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BalanceData(
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      operation: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}operation'],
      )!,
      account: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}account'],
      )!,
      sum: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sum'],
      )!,
      currency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency'],
      )!,
    );
  }

  @override
  Balance createAlias(String alias) {
    return Balance(attachedDatabase, alias);
  }
}

class BalanceData extends DataClass implements Insertable<BalanceData> {
  final DateTime date;
  final int operation;
  final int account;
  final int sum;
  final String currency;
  const BalanceData({
    required this.date,
    required this.operation,
    required this.account,
    required this.sum,
    required this.currency,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['date'] = Variable<DateTime>(date);
    map['operation'] = Variable<int>(operation);
    map['account'] = Variable<int>(account);
    map['sum'] = Variable<int>(sum);
    map['currency'] = Variable<String>(currency);
    return map;
  }

  BalanceCompanion toCompanion(bool nullToAbsent) {
    return BalanceCompanion(
      date: Value(date),
      operation: Value(operation),
      account: Value(account),
      sum: Value(sum),
      currency: Value(currency),
    );
  }

  factory BalanceData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BalanceData(
      date: serializer.fromJson<DateTime>(json['date']),
      operation: serializer.fromJson<int>(json['operation']),
      account: serializer.fromJson<int>(json['account']),
      sum: serializer.fromJson<int>(json['sum']),
      currency: serializer.fromJson<String>(json['currency']),
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
      'currency': serializer.toJson<String>(currency),
    };
  }

  BalanceData copyWith({
    DateTime? date,
    int? operation,
    int? account,
    int? sum,
    String? currency,
  }) => BalanceData(
    date: date ?? this.date,
    operation: operation ?? this.operation,
    account: account ?? this.account,
    sum: sum ?? this.sum,
    currency: currency ?? this.currency,
  );
  BalanceData copyWithCompanion(BalanceCompanion data) {
    return BalanceData(
      date: data.date.present ? data.date.value : this.date,
      operation: data.operation.present ? data.operation.value : this.operation,
      account: data.account.present ? data.account.value : this.account,
      sum: data.sum.present ? data.sum.value : this.sum,
      currency: data.currency.present ? data.currency.value : this.currency,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BalanceData(')
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
      (other is BalanceData &&
          other.date == this.date &&
          other.operation == this.operation &&
          other.account == this.account &&
          other.sum == this.sum &&
          other.currency == this.currency);
}

class BalanceCompanion extends UpdateCompanion<BalanceData> {
  final Value<DateTime> date;
  final Value<int> operation;
  final Value<int> account;
  final Value<int> sum;
  final Value<String> currency;
  final Value<int> rowid;
  const BalanceCompanion({
    this.date = const Value.absent(),
    this.operation = const Value.absent(),
    this.account = const Value.absent(),
    this.sum = const Value.absent(),
    this.currency = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BalanceCompanion.insert({
    required DateTime date,
    required int operation,
    required int account,
    required int sum,
    this.currency = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : date = Value(date),
       operation = Value(operation),
       account = Value(account),
       sum = Value(sum);
  static Insertable<BalanceData> custom({
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

  BalanceCompanion copyWith({
    Value<DateTime>? date,
    Value<int>? operation,
    Value<int>? account,
    Value<int>? sum,
    Value<String>? currency,
    Value<int>? rowid,
  }) {
    return BalanceCompanion(
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
      map['currency'] = Variable<String>(currency.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BalanceCompanion(')
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

class Cashflow extends Table with TableInfo<Cashflow, CashflowData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Cashflow(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<int> operation = GeneratedColumn<int>(
    'operation',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES operations (id)',
    ),
  );
  late final GeneratedColumn<int> category = GeneratedColumn<int>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES categories (id)',
    ),
  );
  late final GeneratedColumn<int> sum = GeneratedColumn<int>(
    'sum',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
    'currency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression('\'RUB\''),
  );
  @override
  List<GeneratedColumn> get $columns => [
    date,
    operation,
    category,
    sum,
    currency,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cashflow';
  @override
  Set<GeneratedColumn> get $primaryKey => {operation, category};
  @override
  CashflowData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CashflowData(
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      operation: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}operation'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category'],
      )!,
      sum: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sum'],
      )!,
      currency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency'],
      )!,
    );
  }

  @override
  Cashflow createAlias(String alias) {
    return Cashflow(attachedDatabase, alias);
  }
}

class CashflowData extends DataClass implements Insertable<CashflowData> {
  final DateTime date;
  final int operation;
  final int category;
  final int sum;
  final String currency;
  const CashflowData({
    required this.date,
    required this.operation,
    required this.category,
    required this.sum,
    required this.currency,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['date'] = Variable<DateTime>(date);
    map['operation'] = Variable<int>(operation);
    map['category'] = Variable<int>(category);
    map['sum'] = Variable<int>(sum);
    map['currency'] = Variable<String>(currency);
    return map;
  }

  CashflowCompanion toCompanion(bool nullToAbsent) {
    return CashflowCompanion(
      date: Value(date),
      operation: Value(operation),
      category: Value(category),
      sum: Value(sum),
      currency: Value(currency),
    );
  }

  factory CashflowData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CashflowData(
      date: serializer.fromJson<DateTime>(json['date']),
      operation: serializer.fromJson<int>(json['operation']),
      category: serializer.fromJson<int>(json['category']),
      sum: serializer.fromJson<int>(json['sum']),
      currency: serializer.fromJson<String>(json['currency']),
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
      'currency': serializer.toJson<String>(currency),
    };
  }

  CashflowData copyWith({
    DateTime? date,
    int? operation,
    int? category,
    int? sum,
    String? currency,
  }) => CashflowData(
    date: date ?? this.date,
    operation: operation ?? this.operation,
    category: category ?? this.category,
    sum: sum ?? this.sum,
    currency: currency ?? this.currency,
  );
  CashflowData copyWithCompanion(CashflowCompanion data) {
    return CashflowData(
      date: data.date.present ? data.date.value : this.date,
      operation: data.operation.present ? data.operation.value : this.operation,
      category: data.category.present ? data.category.value : this.category,
      sum: data.sum.present ? data.sum.value : this.sum,
      currency: data.currency.present ? data.currency.value : this.currency,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CashflowData(')
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
      (other is CashflowData &&
          other.date == this.date &&
          other.operation == this.operation &&
          other.category == this.category &&
          other.sum == this.sum &&
          other.currency == this.currency);
}

class CashflowCompanion extends UpdateCompanion<CashflowData> {
  final Value<DateTime> date;
  final Value<int> operation;
  final Value<int> category;
  final Value<int> sum;
  final Value<String> currency;
  final Value<int> rowid;
  const CashflowCompanion({
    this.date = const Value.absent(),
    this.operation = const Value.absent(),
    this.category = const Value.absent(),
    this.sum = const Value.absent(),
    this.currency = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CashflowCompanion.insert({
    required DateTime date,
    required int operation,
    required int category,
    required int sum,
    this.currency = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : date = Value(date),
       operation = Value(operation),
       category = Value(category),
       sum = Value(sum);
  static Insertable<CashflowData> custom({
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

  CashflowCompanion copyWith({
    Value<DateTime>? date,
    Value<int>? operation,
    Value<int>? category,
    Value<int>? sum,
    Value<String>? currency,
    Value<int>? rowid,
  }) {
    return CashflowCompanion(
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
      map['currency'] = Variable<String>(currency.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CashflowCompanion(')
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

class DatabaseAtV12 extends GeneratedDatabase {
  DatabaseAtV12(QueryExecutor e) : super(e);
  late final Users users = Users(this);
  late final Accounts accounts = Accounts(this);
  late final Categories categories = Categories(this);
  late final Operations operations = Operations(this);
  late final Balance balance = Balance(this);
  late final Cashflow cashflow = Cashflow(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    users,
    accounts,
    categories,
    operations,
    balance,
    cashflow,
  ];
  @override
  int get schemaVersion => 12;
}
