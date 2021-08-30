// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class AccountDB extends DataClass implements Insertable<AccountDB> {
  final int id;
  final String title;
  final bool isDebt;
  AccountDB({required this.id, required this.title, required this.isDebt});
  factory AccountDB.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return AccountDB(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      isDebt: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_debt'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['is_debt'] = Variable<bool>(isDebt);
    return map;
  }

  AccountsCompanion toCompanion(bool nullToAbsent) {
    return AccountsCompanion(
      id: Value(id),
      title: Value(title),
      isDebt: Value(isDebt),
    );
  }

  factory AccountDB.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return AccountDB(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      isDebt: serializer.fromJson<bool>(json['isDebt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'isDebt': serializer.toJson<bool>(isDebt),
    };
  }

  AccountDB copyWith({int? id, String? title, bool? isDebt}) => AccountDB(
        id: id ?? this.id,
        title: title ?? this.title,
        isDebt: isDebt ?? this.isDebt,
      );
  @override
  String toString() {
    return (StringBuffer('AccountDB(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('isDebt: $isDebt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(title.hashCode, isDebt.hashCode)));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccountDB &&
          other.id == this.id &&
          other.title == this.title &&
          other.isDebt == this.isDebt);
}

class AccountsCompanion extends UpdateCompanion<AccountDB> {
  final Value<int> id;
  final Value<String> title;
  final Value<bool> isDebt;
  const AccountsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.isDebt = const Value.absent(),
  });
  AccountsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.isDebt = const Value.absent(),
  }) : title = Value(title);
  static Insertable<AccountDB> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<bool>? isDebt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (isDebt != null) 'is_debt': isDebt,
    });
  }

  AccountsCompanion copyWith(
      {Value<int>? id, Value<String>? title, Value<bool>? isDebt}) {
    return AccountsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      isDebt: isDebt ?? this.isDebt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (isDebt.present) {
      map['is_debt'] = Variable<bool>(isDebt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('isDebt: $isDebt')
          ..write(')'))
        .toString();
  }
}

class $AccountsTable extends Accounts
    with TableInfo<$AccountsTable, AccountDB> {
  final GeneratedDatabase _db;
  final String? _alias;
  $AccountsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _isDebtMeta = const VerificationMeta('isDebt');
  late final GeneratedColumn<bool?> isDebt = GeneratedColumn<bool?>(
      'is_debt', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_debt IN (0, 1))',
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [id, title, isDebt];
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AccountDB map(Map<String, dynamic> data, {String? tablePrefix}) {
    return AccountDB.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $AccountsTable createAlias(String alias) {
    return $AccountsTable(_db, alias);
  }
}

class CategoryDB extends DataClass implements Insertable<CategoryDB> {
  final int id;
  final String title;
  final OperationType operationType;
  final BudgetType budgetType;
  final int budget;
  CategoryDB(
      {required this.id,
      required this.title,
      required this.operationType,
      required this.budgetType,
      required this.budget});
  factory CategoryDB.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CategoryDB(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      operationType: $CategoriesTable.$converter0.mapToDart(const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}operation_type']))!,
      budgetType: $CategoriesTable.$converter1.mapToDart(const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}budget_type']))!,
      budget: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}budget'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    {
      final converter = $CategoriesTable.$converter0;
      map['operation_type'] = Variable<int>(converter.mapToSql(operationType)!);
    }
    {
      final converter = $CategoriesTable.$converter1;
      map['budget_type'] = Variable<int>(converter.mapToSql(budgetType)!);
    }
    map['budget'] = Variable<int>(budget);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      title: Value(title),
      operationType: Value(operationType),
      budgetType: Value(budgetType),
      budget: Value(budget),
    );
  }

  factory CategoryDB.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CategoryDB(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      operationType: serializer.fromJson<OperationType>(json['operationType']),
      budgetType: serializer.fromJson<BudgetType>(json['budgetType']),
      budget: serializer.fromJson<int>(json['budget']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'operationType': serializer.toJson<OperationType>(operationType),
      'budgetType': serializer.toJson<BudgetType>(budgetType),
      'budget': serializer.toJson<int>(budget),
    };
  }

  CategoryDB copyWith(
          {int? id,
          String? title,
          OperationType? operationType,
          BudgetType? budgetType,
          int? budget}) =>
      CategoryDB(
        id: id ?? this.id,
        title: title ?? this.title,
        operationType: operationType ?? this.operationType,
        budgetType: budgetType ?? this.budgetType,
        budget: budget ?? this.budget,
      );
  @override
  String toString() {
    return (StringBuffer('CategoryDB(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('operationType: $operationType, ')
          ..write('budgetType: $budgetType, ')
          ..write('budget: $budget')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          title.hashCode,
          $mrjc(operationType.hashCode,
              $mrjc(budgetType.hashCode, budget.hashCode)))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryDB &&
          other.id == this.id &&
          other.title == this.title &&
          other.operationType == this.operationType &&
          other.budgetType == this.budgetType &&
          other.budget == this.budget);
}

class CategoriesCompanion extends UpdateCompanion<CategoryDB> {
  final Value<int> id;
  final Value<String> title;
  final Value<OperationType> operationType;
  final Value<BudgetType> budgetType;
  final Value<int> budget;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.operationType = const Value.absent(),
    this.budgetType = const Value.absent(),
    this.budget = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required OperationType operationType,
    required BudgetType budgetType,
    required int budget,
  })  : title = Value(title),
        operationType = Value(operationType),
        budgetType = Value(budgetType),
        budget = Value(budget);
  static Insertable<CategoryDB> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<OperationType>? operationType,
    Expression<BudgetType>? budgetType,
    Expression<int>? budget,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (operationType != null) 'operation_type': operationType,
      if (budgetType != null) 'budget_type': budgetType,
      if (budget != null) 'budget': budget,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<OperationType>? operationType,
      Value<BudgetType>? budgetType,
      Value<int>? budget}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      operationType: operationType ?? this.operationType,
      budgetType: budgetType ?? this.budgetType,
      budget: budget ?? this.budget,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (operationType.present) {
      final converter = $CategoriesTable.$converter0;
      map['operation_type'] =
          Variable<int>(converter.mapToSql(operationType.value)!);
    }
    if (budgetType.present) {
      final converter = $CategoriesTable.$converter1;
      map['budget_type'] = Variable<int>(converter.mapToSql(budgetType.value)!);
    }
    if (budget.present) {
      map['budget'] = Variable<int>(budget.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('operationType: $operationType, ')
          ..write('budgetType: $budgetType, ')
          ..write('budget: $budget')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, CategoryDB> {
  final GeneratedDatabase _db;
  final String? _alias;
  $CategoriesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _operationTypeMeta =
      const VerificationMeta('operationType');
  late final GeneratedColumnWithTypeConverter<OperationType, int?>
      operationType = GeneratedColumn<int?>(
              'operation_type', aliasedName, false,
              typeName: 'INTEGER', requiredDuringInsert: true)
          .withConverter<OperationType>($CategoriesTable.$converter0);
  final VerificationMeta _budgetTypeMeta = const VerificationMeta('budgetType');
  late final GeneratedColumnWithTypeConverter<BudgetType, int?> budgetType =
      GeneratedColumn<int?>('budget_type', aliasedName, false,
              typeName: 'INTEGER', requiredDuringInsert: true)
          .withConverter<BudgetType>($CategoriesTable.$converter1);
  final VerificationMeta _budgetMeta = const VerificationMeta('budget');
  late final GeneratedColumn<int?> budget = GeneratedColumn<int?>(
      'budget', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, operationType, budgetType, budget];
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryDB map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CategoryDB.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(_db, alias);
  }

  static TypeConverter<OperationType, int> $converter0 =
      const OperationTypeConverter();
  static TypeConverter<BudgetType, int> $converter1 =
      const BudgetTypeConverter();
}

class OperationDB extends DataClass implements Insertable<OperationDB> {
  final int id;
  final DateTime date;
  final OperationType operationType;
  final int account;
  final int? category;
  final int? recAccount;
  final int sum;
  OperationDB(
      {required this.id,
      required this.date,
      required this.operationType,
      required this.account,
      this.category,
      this.recAccount,
      required this.sum});
  factory OperationDB.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return OperationDB(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date'])!,
      operationType: $OperationsTable.$converter0.mapToDart(const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}operation_type']))!,
      account: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}account'])!,
      category: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category']),
      recAccount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}rec_account']),
      sum: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sum'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    {
      final converter = $OperationsTable.$converter0;
      map['operation_type'] = Variable<int>(converter.mapToSql(operationType)!);
    }
    map['account'] = Variable<int>(account);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<int?>(category);
    }
    if (!nullToAbsent || recAccount != null) {
      map['rec_account'] = Variable<int?>(recAccount);
    }
    map['sum'] = Variable<int>(sum);
    return map;
  }

  OperationsCompanion toCompanion(bool nullToAbsent) {
    return OperationsCompanion(
      id: Value(id),
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
    );
  }

  factory OperationDB.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return OperationDB(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      operationType: serializer.fromJson<OperationType>(json['operationType']),
      account: serializer.fromJson<int>(json['account']),
      category: serializer.fromJson<int?>(json['category']),
      recAccount: serializer.fromJson<int?>(json['recAccount']),
      sum: serializer.fromJson<int>(json['sum']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'operationType': serializer.toJson<OperationType>(operationType),
      'account': serializer.toJson<int>(account),
      'category': serializer.toJson<int?>(category),
      'recAccount': serializer.toJson<int?>(recAccount),
      'sum': serializer.toJson<int>(sum),
    };
  }

  OperationDB copyWith(
          {int? id,
          DateTime? date,
          OperationType? operationType,
          int? account,
          int? category,
          int? recAccount,
          int? sum}) =>
      OperationDB(
        id: id ?? this.id,
        date: date ?? this.date,
        operationType: operationType ?? this.operationType,
        account: account ?? this.account,
        category: category ?? this.category,
        recAccount: recAccount ?? this.recAccount,
        sum: sum ?? this.sum,
      );
  @override
  String toString() {
    return (StringBuffer('OperationDB(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('operationType: $operationType, ')
          ..write('account: $account, ')
          ..write('category: $category, ')
          ..write('recAccount: $recAccount, ')
          ..write('sum: $sum')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          date.hashCode,
          $mrjc(
              operationType.hashCode,
              $mrjc(
                  account.hashCode,
                  $mrjc(category.hashCode,
                      $mrjc(recAccount.hashCode, sum.hashCode)))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OperationDB &&
          other.id == this.id &&
          other.date == this.date &&
          other.operationType == this.operationType &&
          other.account == this.account &&
          other.category == this.category &&
          other.recAccount == this.recAccount &&
          other.sum == this.sum);
}

class OperationsCompanion extends UpdateCompanion<OperationDB> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<OperationType> operationType;
  final Value<int> account;
  final Value<int?> category;
  final Value<int?> recAccount;
  final Value<int> sum;
  const OperationsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.operationType = const Value.absent(),
    this.account = const Value.absent(),
    this.category = const Value.absent(),
    this.recAccount = const Value.absent(),
    this.sum = const Value.absent(),
  });
  OperationsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required OperationType operationType,
    required int account,
    this.category = const Value.absent(),
    this.recAccount = const Value.absent(),
    required int sum,
  })  : date = Value(date),
        operationType = Value(operationType),
        account = Value(account),
        sum = Value(sum);
  static Insertable<OperationDB> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<OperationType>? operationType,
    Expression<int>? account,
    Expression<int?>? category,
    Expression<int?>? recAccount,
    Expression<int>? sum,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (operationType != null) 'operation_type': operationType,
      if (account != null) 'account': account,
      if (category != null) 'category': category,
      if (recAccount != null) 'rec_account': recAccount,
      if (sum != null) 'sum': sum,
    });
  }

  OperationsCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? date,
      Value<OperationType>? operationType,
      Value<int>? account,
      Value<int?>? category,
      Value<int?>? recAccount,
      Value<int>? sum}) {
    return OperationsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      operationType: operationType ?? this.operationType,
      account: account ?? this.account,
      category: category ?? this.category,
      recAccount: recAccount ?? this.recAccount,
      sum: sum ?? this.sum,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (operationType.present) {
      final converter = $OperationsTable.$converter0;
      map['operation_type'] =
          Variable<int>(converter.mapToSql(operationType.value)!);
    }
    if (account.present) {
      map['account'] = Variable<int>(account.value);
    }
    if (category.present) {
      map['category'] = Variable<int?>(category.value);
    }
    if (recAccount.present) {
      map['rec_account'] = Variable<int?>(recAccount.value);
    }
    if (sum.present) {
      map['sum'] = Variable<int>(sum.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OperationsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('operationType: $operationType, ')
          ..write('account: $account, ')
          ..write('category: $category, ')
          ..write('recAccount: $recAccount, ')
          ..write('sum: $sum')
          ..write(')'))
        .toString();
  }
}

class $OperationsTable extends Operations
    with TableInfo<$OperationsTable, OperationDB> {
  final GeneratedDatabase _db;
  final String? _alias;
  $OperationsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  late final GeneratedColumn<DateTime?> date = GeneratedColumn<DateTime?>(
      'date', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _operationTypeMeta =
      const VerificationMeta('operationType');
  late final GeneratedColumnWithTypeConverter<OperationType, int?>
      operationType = GeneratedColumn<int?>(
              'operation_type', aliasedName, false,
              typeName: 'INTEGER', requiredDuringInsert: true)
          .withConverter<OperationType>($OperationsTable.$converter0);
  final VerificationMeta _accountMeta = const VerificationMeta('account');
  late final GeneratedColumn<int?> account = GeneratedColumn<int?>(
      'account', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      $customConstraints: 'NULL REFERENCES account(id)');
  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  late final GeneratedColumn<int?> category = GeneratedColumn<int?>(
      'category', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      $customConstraints: 'NULL REFERENCES category(id)');
  final VerificationMeta _recAccountMeta = const VerificationMeta('recAccount');
  late final GeneratedColumn<int?> recAccount = GeneratedColumn<int?>(
      'rec_account', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      $customConstraints: 'NULL REFERENCES account(id)');
  final VerificationMeta _sumMeta = const VerificationMeta('sum');
  late final GeneratedColumn<int?> sum = GeneratedColumn<int?>(
      'sum', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, date, operationType, account, category, recAccount, sum];
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OperationDB map(Map<String, dynamic> data, {String? tablePrefix}) {
    return OperationDB.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $OperationsTable createAlias(String alias) {
    return $OperationsTable(_db, alias);
  }

  static TypeConverter<OperationType, int> $converter0 =
      const OperationTypeConverter();
}

class BalanceDB extends DataClass implements Insertable<BalanceDB> {
  final DateTime date;
  final int operation;
  final int account;
  final int sum;
  BalanceDB(
      {required this.date,
      required this.operation,
      required this.account,
      required this.sum});
  factory BalanceDB.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return BalanceDB(
      date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date'])!,
      operation: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}operation'])!,
      account: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}account'])!,
      sum: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sum'])!,
    );
  }
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
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BalanceDB(
      date: serializer.fromJson<DateTime>(json['date']),
      operation: serializer.fromJson<int>(json['operation']),
      account: serializer.fromJson<int>(json['account']),
      sum: serializer.fromJson<int>(json['sum']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
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
  int get hashCode => $mrjf($mrjc(date.hashCode,
      $mrjc(operation.hashCode, $mrjc(account.hashCode, sum.hashCode))));
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
  final GeneratedDatabase _db;
  final String? _alias;
  $BalancesTable(this._db, [this._alias]);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  late final GeneratedColumn<DateTime?> date = GeneratedColumn<DateTime?>(
      'date', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _operationMeta = const VerificationMeta('operation');
  late final GeneratedColumn<int?> operation = GeneratedColumn<int?>(
      'operation', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      $customConstraints: 'NULL REFERENCES operation(id)');
  final VerificationMeta _accountMeta = const VerificationMeta('account');
  late final GeneratedColumn<int?> account = GeneratedColumn<int?>(
      'account', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      $customConstraints: 'NULL REFERENCES account(id)');
  final VerificationMeta _sumMeta = const VerificationMeta('sum');
  late final GeneratedColumn<int?> sum = GeneratedColumn<int?>(
      'sum', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
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
    return BalanceDB.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BalancesTable createAlias(String alias) {
    return $BalancesTable(_db, alias);
  }
}

class CashflowDB extends DataClass implements Insertable<CashflowDB> {
  final DateTime date;
  final int operation;
  final int category;
  final int sum;
  CashflowDB(
      {required this.date,
      required this.operation,
      required this.category,
      required this.sum});
  factory CashflowDB.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CashflowDB(
      date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date'])!,
      operation: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}operation'])!,
      category: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category'])!,
      sum: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sum'])!,
    );
  }
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
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CashflowDB(
      date: serializer.fromJson<DateTime>(json['date']),
      operation: serializer.fromJson<int>(json['operation']),
      category: serializer.fromJson<int>(json['category']),
      sum: serializer.fromJson<int>(json['sum']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
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
  int get hashCode => $mrjf($mrjc(date.hashCode,
      $mrjc(operation.hashCode, $mrjc(category.hashCode, sum.hashCode))));
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
  final GeneratedDatabase _db;
  final String? _alias;
  $CashflowsTable(this._db, [this._alias]);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  late final GeneratedColumn<DateTime?> date = GeneratedColumn<DateTime?>(
      'date', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _operationMeta = const VerificationMeta('operation');
  late final GeneratedColumn<int?> operation = GeneratedColumn<int?>(
      'operation', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      $customConstraints: 'NULL REFERENCES operation(id)');
  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  late final GeneratedColumn<int?> category = GeneratedColumn<int?>(
      'category', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      $customConstraints: 'NULL REFERENCES category(id)');
  final VerificationMeta _sumMeta = const VerificationMeta('sum');
  late final GeneratedColumn<int?> sum = GeneratedColumn<int?>(
      'sum', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
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
    return CashflowDB.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CashflowsTable createAlias(String alias) {
    return $CashflowsTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $AccountsTable accounts = $AccountsTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $OperationsTable operations = $OperationsTable(this);
  late final $BalancesTable balances = $BalancesTable(this);
  late final $CashflowsTable cashflows = $CashflowsTable(this);
  late final AccountDao accountDao = AccountDao(this as Database);
  late final CategoryDao categoryDao = CategoryDao(this as Database);
  late final OperationDao operationDao = OperationDao(this as Database);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [accounts, categories, operations, balances, cashflows];
}
