// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class AccountDB extends DataClass implements Insertable<AccountDB> {
  final int id;
  final String cloudId;
  final String title;
  final bool isDebt;
  final bool synced;
  const AccountDB(
      {required this.id,
      required this.cloudId,
      required this.title,
      required this.isDebt,
      required this.synced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['cloud_id'] = Variable<String>(cloudId);
    map['title'] = Variable<String>(title);
    map['is_debt'] = Variable<bool>(isDebt);
    map['synced'] = Variable<bool>(synced);
    return map;
  }

  AccountsCompanion toCompanion(bool nullToAbsent) {
    return AccountsCompanion(
      id: Value(id),
      cloudId: Value(cloudId),
      title: Value(title),
      isDebt: Value(isDebt),
      synced: Value(synced),
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
    };
  }

  AccountDB copyWith(
          {int? id,
          String? cloudId,
          String? title,
          bool? isDebt,
          bool? synced}) =>
      AccountDB(
        id: id ?? this.id,
        cloudId: cloudId ?? this.cloudId,
        title: title ?? this.title,
        isDebt: isDebt ?? this.isDebt,
        synced: synced ?? this.synced,
      );
  @override
  String toString() {
    return (StringBuffer('AccountDB(')
          ..write('id: $id, ')
          ..write('cloudId: $cloudId, ')
          ..write('title: $title, ')
          ..write('isDebt: $isDebt, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, cloudId, title, isDebt, synced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccountDB &&
          other.id == this.id &&
          other.cloudId == this.cloudId &&
          other.title == this.title &&
          other.isDebt == this.isDebt &&
          other.synced == this.synced);
}

class AccountsCompanion extends UpdateCompanion<AccountDB> {
  final Value<int> id;
  final Value<String> cloudId;
  final Value<String> title;
  final Value<bool> isDebt;
  final Value<bool> synced;
  const AccountsCompanion({
    this.id = const Value.absent(),
    this.cloudId = const Value.absent(),
    this.title = const Value.absent(),
    this.isDebt = const Value.absent(),
    this.synced = const Value.absent(),
  });
  AccountsCompanion.insert({
    this.id = const Value.absent(),
    required String cloudId,
    required String title,
    this.isDebt = const Value.absent(),
    this.synced = const Value.absent(),
  })  : cloudId = Value(cloudId),
        title = Value(title);
  static Insertable<AccountDB> custom({
    Expression<int>? id,
    Expression<String>? cloudId,
    Expression<String>? title,
    Expression<bool>? isDebt,
    Expression<bool>? synced,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cloudId != null) 'cloud_id': cloudId,
      if (title != null) 'title': title,
      if (isDebt != null) 'is_debt': isDebt,
      if (synced != null) 'synced': synced,
    });
  }

  AccountsCompanion copyWith(
      {Value<int>? id,
      Value<String>? cloudId,
      Value<String>? title,
      Value<bool>? isDebt,
      Value<bool>? synced}) {
    return AccountsCompanion(
      id: id ?? this.id,
      cloudId: cloudId ?? this.cloudId,
      title: title ?? this.title,
      isDebt: isDebt ?? this.isDebt,
      synced: synced ?? this.synced,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountsCompanion(')
          ..write('id: $id, ')
          ..write('cloudId: $cloudId, ')
          ..write('title: $title, ')
          ..write('isDebt: $isDebt, ')
          ..write('synced: $synced')
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
  late final GeneratedColumn<bool> isDebt =
      GeneratedColumn<bool>('is_debt', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_debt" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  @override
  late final GeneratedColumn<bool> synced =
      GeneratedColumn<bool>('synced', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("synced" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [id, cloudId, title, isDebt, synced];
  @override
  String get aliasedName => _alias ?? 'accounts';
  @override
  String get actualTableName => 'accounts';
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
    );
  }

  @override
  $AccountsTable createAlias(String alias) {
    return $AccountsTable(attachedDatabase, alias);
  }
}

class CategoryDB extends DataClass implements Insertable<CategoryDB> {
  final int id;
  final String cloudId;
  final String title;
  final OperationType operationType;
  final BudgetType budgetType;
  final int budget;
  final bool synced;
  const CategoryDB(
      {required this.id,
      required this.cloudId,
      required this.title,
      required this.operationType,
      required this.budgetType,
      required this.budget,
      required this.synced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['cloud_id'] = Variable<String>(cloudId);
    map['title'] = Variable<String>(title);
    {
      final converter = $CategoriesTable.$converteroperationType;
      map['operation_type'] = Variable<int>(converter.toSql(operationType));
    }
    {
      final converter = $CategoriesTable.$converterbudgetType;
      map['budget_type'] = Variable<int>(converter.toSql(budgetType));
    }
    map['budget'] = Variable<int>(budget);
    map['synced'] = Variable<bool>(synced);
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
    };
  }

  CategoryDB copyWith(
          {int? id,
          String? cloudId,
          String? title,
          OperationType? operationType,
          BudgetType? budgetType,
          int? budget,
          bool? synced}) =>
      CategoryDB(
        id: id ?? this.id,
        cloudId: cloudId ?? this.cloudId,
        title: title ?? this.title,
        operationType: operationType ?? this.operationType,
        budgetType: budgetType ?? this.budgetType,
        budget: budget ?? this.budget,
        synced: synced ?? this.synced,
      );
  @override
  String toString() {
    return (StringBuffer('CategoryDB(')
          ..write('id: $id, ')
          ..write('cloudId: $cloudId, ')
          ..write('title: $title, ')
          ..write('operationType: $operationType, ')
          ..write('budgetType: $budgetType, ')
          ..write('budget: $budget, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, cloudId, title, operationType, budgetType, budget, synced);
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
          other.synced == this.synced);
}

class CategoriesCompanion extends UpdateCompanion<CategoryDB> {
  final Value<int> id;
  final Value<String> cloudId;
  final Value<String> title;
  final Value<OperationType> operationType;
  final Value<BudgetType> budgetType;
  final Value<int> budget;
  final Value<bool> synced;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.cloudId = const Value.absent(),
    this.title = const Value.absent(),
    this.operationType = const Value.absent(),
    this.budgetType = const Value.absent(),
    this.budget = const Value.absent(),
    this.synced = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String cloudId,
    required String title,
    required OperationType operationType,
    required BudgetType budgetType,
    required int budget,
    this.synced = const Value.absent(),
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
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cloudId != null) 'cloud_id': cloudId,
      if (title != null) 'title': title,
      if (operationType != null) 'operation_type': operationType,
      if (budgetType != null) 'budget_type': budgetType,
      if (budget != null) 'budget': budget,
      if (synced != null) 'synced': synced,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? cloudId,
      Value<String>? title,
      Value<OperationType>? operationType,
      Value<BudgetType>? budgetType,
      Value<int>? budget,
      Value<bool>? synced}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      cloudId: cloudId ?? this.cloudId,
      title: title ?? this.title,
      operationType: operationType ?? this.operationType,
      budgetType: budgetType ?? this.budgetType,
      budget: budget ?? this.budget,
      synced: synced ?? this.synced,
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
      final converter = $CategoriesTable.$converteroperationType;
      map['operation_type'] =
          Variable<int>(converter.toSql(operationType.value));
    }
    if (budgetType.present) {
      final converter = $CategoriesTable.$converterbudgetType;
      map['budget_type'] = Variable<int>(converter.toSql(budgetType.value));
    }
    if (budget.present) {
      map['budget'] = Variable<int>(budget.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
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
          ..write('synced: $synced')
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
  late final GeneratedColumn<bool> synced =
      GeneratedColumn<bool>('synced', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("synced" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, cloudId, title, operationType, budgetType, budget, synced];
  @override
  String get aliasedName => _alias ?? 'categories';
  @override
  String get actualTableName => 'categories';
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

class OperationDB extends DataClass implements Insertable<OperationDB> {
  final int id;
  final String cloudId;
  final DateTime date;
  final OperationType operationType;
  final int account;
  final int? category;
  final int? recAccount;
  final int sum;
  final bool synced;
  final bool deleted;
  const OperationDB(
      {required this.id,
      required this.cloudId,
      required this.date,
      required this.operationType,
      required this.account,
      this.category,
      this.recAccount,
      required this.sum,
      required this.synced,
      required this.deleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['cloud_id'] = Variable<String>(cloudId);
    map['date'] = Variable<DateTime>(date);
    {
      final converter = $OperationsTable.$converteroperationType;
      map['operation_type'] = Variable<int>(converter.toSql(operationType));
    }
    map['account'] = Variable<int>(account);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<int>(category);
    }
    if (!nullToAbsent || recAccount != null) {
      map['rec_account'] = Variable<int>(recAccount);
    }
    map['sum'] = Variable<int>(sum);
    map['synced'] = Variable<bool>(synced);
    map['deleted'] = Variable<bool>(deleted);
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
      synced: Value(synced),
      deleted: Value(deleted),
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
      synced: serializer.fromJson<bool>(json['synced']),
      deleted: serializer.fromJson<bool>(json['deleted']),
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
      'synced': serializer.toJson<bool>(synced),
      'deleted': serializer.toJson<bool>(deleted),
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
          bool? synced,
          bool? deleted}) =>
      OperationDB(
        id: id ?? this.id,
        cloudId: cloudId ?? this.cloudId,
        date: date ?? this.date,
        operationType: operationType ?? this.operationType,
        account: account ?? this.account,
        category: category.present ? category.value : this.category,
        recAccount: recAccount.present ? recAccount.value : this.recAccount,
        sum: sum ?? this.sum,
        synced: synced ?? this.synced,
        deleted: deleted ?? this.deleted,
      );
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
          ..write('synced: $synced, ')
          ..write('deleted: $deleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, cloudId, date, operationType, account,
      category, recAccount, sum, synced, deleted);
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
          other.synced == this.synced &&
          other.deleted == this.deleted);
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
  final Value<bool> synced;
  final Value<bool> deleted;
  const OperationsCompanion({
    this.id = const Value.absent(),
    this.cloudId = const Value.absent(),
    this.date = const Value.absent(),
    this.operationType = const Value.absent(),
    this.account = const Value.absent(),
    this.category = const Value.absent(),
    this.recAccount = const Value.absent(),
    this.sum = const Value.absent(),
    this.synced = const Value.absent(),
    this.deleted = const Value.absent(),
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
    this.synced = const Value.absent(),
    this.deleted = const Value.absent(),
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
    Expression<bool>? synced,
    Expression<bool>? deleted,
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
      if (synced != null) 'synced': synced,
      if (deleted != null) 'deleted': deleted,
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
      Value<bool>? synced,
      Value<bool>? deleted}) {
    return OperationsCompanion(
      id: id ?? this.id,
      cloudId: cloudId ?? this.cloudId,
      date: date ?? this.date,
      operationType: operationType ?? this.operationType,
      account: account ?? this.account,
      category: category ?? this.category,
      recAccount: recAccount ?? this.recAccount,
      sum: sum ?? this.sum,
      synced: synced ?? this.synced,
      deleted: deleted ?? this.deleted,
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
      final converter = $OperationsTable.$converteroperationType;
      map['operation_type'] =
          Variable<int>(converter.toSql(operationType.value));
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
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
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
          ..write('synced: $synced, ')
          ..write('deleted: $deleted')
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
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  @override
  late final GeneratedColumn<bool> synced =
      GeneratedColumn<bool>('synced', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("synced" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  static const VerificationMeta _deletedMeta =
      const VerificationMeta('deleted');
  @override
  late final GeneratedColumn<bool> deleted =
      GeneratedColumn<bool>('deleted', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("deleted" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
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
        synced,
        deleted
      ];
  @override
  String get aliasedName => _alias ?? 'operations';
  @override
  String get actualTableName => 'operations';
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
    if (data.containsKey('synced')) {
      context.handle(_syncedMeta,
          synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta));
    }
    if (data.containsKey('deleted')) {
      context.handle(_deletedMeta,
          deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta));
    }
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
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted'])!,
    );
  }

  @override
  $OperationsTable createAlias(String alias) {
    return $OperationsTable(attachedDatabase, alias);
  }

  static TypeConverter<OperationType, int> $converteroperationType =
      const OperationTypeConverter();
}

class BalanceDB extends DataClass implements Insertable<BalanceDB> {
  final DateTime date;
  final int operation;
  final int account;
  final int sum;
  const BalanceDB(
      {required this.date,
      required this.operation,
      required this.account,
      required this.sum});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['date'] = Variable<DateTime>(date);
    map['operation'] = Variable<int>(operation);
    map['account'] = Variable<int>(account);
    map['sum'] = Variable<int>(sum);
    return map;
  }

  BalancesCompanion toCompanion(bool nullToAbsent) {
    return BalancesCompanion(
      date: Value(date),
      operation: Value(operation),
      account: Value(account),
      sum: Value(sum),
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
    };
  }

  BalanceDB copyWith(
          {DateTime? date, int? operation, int? account, int? sum}) =>
      BalanceDB(
        date: date ?? this.date,
        operation: operation ?? this.operation,
        account: account ?? this.account,
        sum: sum ?? this.sum,
      );
  @override
  String toString() {
    return (StringBuffer('BalanceDB(')
          ..write('date: $date, ')
          ..write('operation: $operation, ')
          ..write('account: $account, ')
          ..write('sum: $sum')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(date, operation, account, sum);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BalanceDB &&
          other.date == this.date &&
          other.operation == this.operation &&
          other.account == this.account &&
          other.sum == this.sum);
}

class BalancesCompanion extends UpdateCompanion<BalanceDB> {
  final Value<DateTime> date;
  final Value<int> operation;
  final Value<int> account;
  final Value<int> sum;
  const BalancesCompanion({
    this.date = const Value.absent(),
    this.operation = const Value.absent(),
    this.account = const Value.absent(),
    this.sum = const Value.absent(),
  });
  BalancesCompanion.insert({
    required DateTime date,
    required int operation,
    required int account,
    required int sum,
  })  : date = Value(date),
        operation = Value(operation),
        account = Value(account),
        sum = Value(sum);
  static Insertable<BalanceDB> custom({
    Expression<DateTime>? date,
    Expression<int>? operation,
    Expression<int>? account,
    Expression<int>? sum,
  }) {
    return RawValuesInsertable({
      if (date != null) 'date': date,
      if (operation != null) 'operation': operation,
      if (account != null) 'account': account,
      if (sum != null) 'sum': sum,
    });
  }

  BalancesCompanion copyWith(
      {Value<DateTime>? date,
      Value<int>? operation,
      Value<int>? account,
      Value<int>? sum}) {
    return BalancesCompanion(
      date: date ?? this.date,
      operation: operation ?? this.operation,
      account: account ?? this.account,
      sum: sum ?? this.sum,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BalancesCompanion(')
          ..write('date: $date, ')
          ..write('operation: $operation, ')
          ..write('account: $account, ')
          ..write('sum: $sum')
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
  @override
  List<GeneratedColumn> get $columns => [date, operation, account, sum];
  @override
  String get aliasedName => _alias ?? 'balance';
  @override
  String get actualTableName => 'balance';
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
    );
  }

  @override
  $BalancesTable createAlias(String alias) {
    return $BalancesTable(attachedDatabase, alias);
  }
}

class CashflowDB extends DataClass implements Insertable<CashflowDB> {
  final DateTime date;
  final int operation;
  final int category;
  final int sum;
  const CashflowDB(
      {required this.date,
      required this.operation,
      required this.category,
      required this.sum});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['date'] = Variable<DateTime>(date);
    map['operation'] = Variable<int>(operation);
    map['category'] = Variable<int>(category);
    map['sum'] = Variable<int>(sum);
    return map;
  }

  CashflowsCompanion toCompanion(bool nullToAbsent) {
    return CashflowsCompanion(
      date: Value(date),
      operation: Value(operation),
      category: Value(category),
      sum: Value(sum),
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
    };
  }

  CashflowDB copyWith(
          {DateTime? date, int? operation, int? category, int? sum}) =>
      CashflowDB(
        date: date ?? this.date,
        operation: operation ?? this.operation,
        category: category ?? this.category,
        sum: sum ?? this.sum,
      );
  @override
  String toString() {
    return (StringBuffer('CashflowDB(')
          ..write('date: $date, ')
          ..write('operation: $operation, ')
          ..write('category: $category, ')
          ..write('sum: $sum')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(date, operation, category, sum);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CashflowDB &&
          other.date == this.date &&
          other.operation == this.operation &&
          other.category == this.category &&
          other.sum == this.sum);
}

class CashflowsCompanion extends UpdateCompanion<CashflowDB> {
  final Value<DateTime> date;
  final Value<int> operation;
  final Value<int> category;
  final Value<int> sum;
  const CashflowsCompanion({
    this.date = const Value.absent(),
    this.operation = const Value.absent(),
    this.category = const Value.absent(),
    this.sum = const Value.absent(),
  });
  CashflowsCompanion.insert({
    required DateTime date,
    required int operation,
    required int category,
    required int sum,
  })  : date = Value(date),
        operation = Value(operation),
        category = Value(category),
        sum = Value(sum);
  static Insertable<CashflowDB> custom({
    Expression<DateTime>? date,
    Expression<int>? operation,
    Expression<int>? category,
    Expression<int>? sum,
  }) {
    return RawValuesInsertable({
      if (date != null) 'date': date,
      if (operation != null) 'operation': operation,
      if (category != null) 'category': category,
      if (sum != null) 'sum': sum,
    });
  }

  CashflowsCompanion copyWith(
      {Value<DateTime>? date,
      Value<int>? operation,
      Value<int>? category,
      Value<int>? sum}) {
    return CashflowsCompanion(
      date: date ?? this.date,
      operation: operation ?? this.operation,
      category: category ?? this.category,
      sum: sum ?? this.sum,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CashflowsCompanion(')
          ..write('date: $date, ')
          ..write('operation: $operation, ')
          ..write('category: $category, ')
          ..write('sum: $sum')
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
  @override
  List<GeneratedColumn> get $columns => [date, operation, category, sum];
  @override
  String get aliasedName => _alias ?? 'cashflow';
  @override
  String get actualTableName => 'cashflow';
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
    );
  }

  @override
  $CashflowsTable createAlias(String alias) {
    return $CashflowsTable(attachedDatabase, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  late final $AccountsTable accounts = $AccountsTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $OperationsTable operations = $OperationsTable(this);
  late final $BalancesTable balances = $BalancesTable(this);
  late final $CashflowsTable cashflows = $CashflowsTable(this);
  late final AccountDao accountDao = AccountDao(this as Database);
  late final CategoryDao categoryDao = CategoryDao(this as Database);
  late final OperationDao operationDao = OperationDao(this as Database);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [accounts, categories, operations, balances, cashflows];
}
