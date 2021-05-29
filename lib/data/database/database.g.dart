// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class AccountDB extends DataClass implements Insertable<AccountDB> {
  final int id;
  final String title;
  AccountDB({required this.id, required this.title});
  factory AccountDB.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return AccountDB(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    return map;
  }

  AccountsCompanion toCompanion(bool nullToAbsent) {
    return AccountsCompanion(
      id: Value(id),
      title: Value(title),
    );
  }

  factory AccountDB.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return AccountDB(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
    };
  }

  AccountDB copyWith({int? id, String? title}) => AccountDB(
        id: id ?? this.id,
        title: title ?? this.title,
      );
  @override
  String toString() {
    return (StringBuffer('AccountDB(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, title.hashCode));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccountDB && other.id == this.id && other.title == this.title);
}

class AccountsCompanion extends UpdateCompanion<AccountDB> {
  final Value<int> id;
  final Value<String> title;
  const AccountsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
  });
  AccountsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
  }) : title = Value(title);
  static Insertable<AccountDB> custom({
    Expression<int>? id,
    Expression<String>? title,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
    });
  }

  AccountsCompanion copyWith({Value<int>? id, Value<String>? title}) {
    return AccountsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title')
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
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedTextColumn title = _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, title];
  @override
  $AccountsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'accounts';
  @override
  final String actualTableName = 'accounts';
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
  CategoryDB(
      {required this.id, required this.title, required this.operationType});
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
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      title: Value(title),
      operationType: Value(operationType),
    );
  }

  factory CategoryDB.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CategoryDB(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      operationType: serializer.fromJson<OperationType>(json['operationType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'operationType': serializer.toJson<OperationType>(operationType),
    };
  }

  CategoryDB copyWith({int? id, String? title, OperationType? operationType}) =>
      CategoryDB(
        id: id ?? this.id,
        title: title ?? this.title,
        operationType: operationType ?? this.operationType,
      );
  @override
  String toString() {
    return (StringBuffer('CategoryDB(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('operationType: $operationType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(title.hashCode, operationType.hashCode)));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryDB &&
          other.id == this.id &&
          other.title == this.title &&
          other.operationType == this.operationType);
}

class CategoriesCompanion extends UpdateCompanion<CategoryDB> {
  final Value<int> id;
  final Value<String> title;
  final Value<OperationType> operationType;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.operationType = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required OperationType operationType,
  })  : title = Value(title),
        operationType = Value(operationType);
  static Insertable<CategoryDB> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<OperationType>? operationType,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (operationType != null) 'operation_type': operationType,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<OperationType>? operationType}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      operationType: operationType ?? this.operationType,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('operationType: $operationType')
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
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedTextColumn title = _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _operationTypeMeta =
      const VerificationMeta('operationType');
  @override
  late final GeneratedIntColumn operationType = _constructOperationType();
  GeneratedIntColumn _constructOperationType() {
    return GeneratedIntColumn(
      'operation_type',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, title, operationType];
  @override
  $CategoriesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'categories';
  @override
  final String actualTableName = 'categories';
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
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedDateTimeColumn date = _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _operationTypeMeta =
      const VerificationMeta('operationType');
  @override
  late final GeneratedIntColumn operationType = _constructOperationType();
  GeneratedIntColumn _constructOperationType() {
    return GeneratedIntColumn(
      'operation_type',
      $tableName,
      false,
    );
  }

  final VerificationMeta _accountMeta = const VerificationMeta('account');
  @override
  late final GeneratedIntColumn account = _constructAccount();
  GeneratedIntColumn _constructAccount() {
    return GeneratedIntColumn('account', $tableName, false,
        $customConstraints: 'NULL REFERENCES account(id)');
  }

  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  @override
  late final GeneratedIntColumn category = _constructCategory();
  GeneratedIntColumn _constructCategory() {
    return GeneratedIntColumn('category', $tableName, true,
        $customConstraints: 'NULL REFERENCES category(id)');
  }

  final VerificationMeta _recAccountMeta = const VerificationMeta('recAccount');
  @override
  late final GeneratedIntColumn recAccount = _constructRecAccount();
  GeneratedIntColumn _constructRecAccount() {
    return GeneratedIntColumn('rec_account', $tableName, true,
        $customConstraints: 'NULL REFERENCES account(id)');
  }

  final VerificationMeta _sumMeta = const VerificationMeta('sum');
  @override
  late final GeneratedIntColumn sum = _constructSum();
  GeneratedIntColumn _constructSum() {
    return GeneratedIntColumn(
      'sum',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, date, operationType, account, category, recAccount, sum];
  @override
  $OperationsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'operations';
  @override
  final String actualTableName = 'operations';
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
  @override
  late final GeneratedDateTimeColumn date = _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _operationMeta = const VerificationMeta('operation');
  @override
  late final GeneratedIntColumn operation = _constructOperation();
  GeneratedIntColumn _constructOperation() {
    return GeneratedIntColumn('operation', $tableName, false,
        $customConstraints: 'NULL REFERENCES operation(id)');
  }

  final VerificationMeta _accountMeta = const VerificationMeta('account');
  @override
  late final GeneratedIntColumn account = _constructAccount();
  GeneratedIntColumn _constructAccount() {
    return GeneratedIntColumn('account', $tableName, false,
        $customConstraints: 'NULL REFERENCES account(id)');
  }

  final VerificationMeta _sumMeta = const VerificationMeta('sum');
  @override
  late final GeneratedIntColumn sum = _constructSum();
  GeneratedIntColumn _constructSum() {
    return GeneratedIntColumn(
      'sum',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [date, operation, account, sum];
  @override
  $BalancesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'balance';
  @override
  final String actualTableName = 'balance';
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
  @override
  late final GeneratedDateTimeColumn date = _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _operationMeta = const VerificationMeta('operation');
  @override
  late final GeneratedIntColumn operation = _constructOperation();
  GeneratedIntColumn _constructOperation() {
    return GeneratedIntColumn('operation', $tableName, false,
        $customConstraints: 'NULL REFERENCES operation(id)');
  }

  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  @override
  late final GeneratedIntColumn category = _constructCategory();
  GeneratedIntColumn _constructCategory() {
    return GeneratedIntColumn('category', $tableName, false,
        $customConstraints: 'NULL REFERENCES category(id)');
  }

  final VerificationMeta _sumMeta = const VerificationMeta('sum');
  @override
  late final GeneratedIntColumn sum = _constructSum();
  GeneratedIntColumn _constructSum() {
    return GeneratedIntColumn(
      'sum',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [date, operation, category, sum];
  @override
  $CashflowsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'cashflow';
  @override
  final String actualTableName = 'cashflow';
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

class BudgetDB extends DataClass implements Insertable<BudgetDB> {
  final int year;
  final int month;
  final int category;
  final BudgetType budgetType;
  final int sum;
  BudgetDB(
      {required this.year,
      required this.month,
      required this.category,
      required this.budgetType,
      required this.sum});
  factory BudgetDB.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return BudgetDB(
      year: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}year'])!,
      month: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}month'])!,
      category: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category'])!,
      budgetType: $BudgetsTable.$converter0.mapToDart(const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}budget_type']))!,
      sum: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sum'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['year'] = Variable<int>(year);
    map['month'] = Variable<int>(month);
    map['category'] = Variable<int>(category);
    {
      final converter = $BudgetsTable.$converter0;
      map['budget_type'] = Variable<int>(converter.mapToSql(budgetType)!);
    }
    map['sum'] = Variable<int>(sum);
    return map;
  }

  BudgetsCompanion toCompanion(bool nullToAbsent) {
    return BudgetsCompanion(
      year: Value(year),
      month: Value(month),
      category: Value(category),
      budgetType: Value(budgetType),
      sum: Value(sum),
    );
  }

  factory BudgetDB.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BudgetDB(
      year: serializer.fromJson<int>(json['year']),
      month: serializer.fromJson<int>(json['month']),
      category: serializer.fromJson<int>(json['category']),
      budgetType: serializer.fromJson<BudgetType>(json['budgetType']),
      sum: serializer.fromJson<int>(json['sum']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'year': serializer.toJson<int>(year),
      'month': serializer.toJson<int>(month),
      'category': serializer.toJson<int>(category),
      'budgetType': serializer.toJson<BudgetType>(budgetType),
      'sum': serializer.toJson<int>(sum),
    };
  }

  BudgetDB copyWith(
          {int? year,
          int? month,
          int? category,
          BudgetType? budgetType,
          int? sum}) =>
      BudgetDB(
        year: year ?? this.year,
        month: month ?? this.month,
        category: category ?? this.category,
        budgetType: budgetType ?? this.budgetType,
        sum: sum ?? this.sum,
      );
  @override
  String toString() {
    return (StringBuffer('BudgetDB(')
          ..write('year: $year, ')
          ..write('month: $month, ')
          ..write('category: $category, ')
          ..write('budgetType: $budgetType, ')
          ..write('sum: $sum')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      year.hashCode,
      $mrjc(month.hashCode,
          $mrjc(category.hashCode, $mrjc(budgetType.hashCode, sum.hashCode)))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BudgetDB &&
          other.year == this.year &&
          other.month == this.month &&
          other.category == this.category &&
          other.budgetType == this.budgetType &&
          other.sum == this.sum);
}

class BudgetsCompanion extends UpdateCompanion<BudgetDB> {
  final Value<int> year;
  final Value<int> month;
  final Value<int> category;
  final Value<BudgetType> budgetType;
  final Value<int> sum;
  const BudgetsCompanion({
    this.year = const Value.absent(),
    this.month = const Value.absent(),
    this.category = const Value.absent(),
    this.budgetType = const Value.absent(),
    this.sum = const Value.absent(),
  });
  BudgetsCompanion.insert({
    required int year,
    required int month,
    required int category,
    required BudgetType budgetType,
    required int sum,
  })  : year = Value(year),
        month = Value(month),
        category = Value(category),
        budgetType = Value(budgetType),
        sum = Value(sum);
  static Insertable<BudgetDB> custom({
    Expression<int>? year,
    Expression<int>? month,
    Expression<int>? category,
    Expression<BudgetType>? budgetType,
    Expression<int>? sum,
  }) {
    return RawValuesInsertable({
      if (year != null) 'year': year,
      if (month != null) 'month': month,
      if (category != null) 'category': category,
      if (budgetType != null) 'budget_type': budgetType,
      if (sum != null) 'sum': sum,
    });
  }

  BudgetsCompanion copyWith(
      {Value<int>? year,
      Value<int>? month,
      Value<int>? category,
      Value<BudgetType>? budgetType,
      Value<int>? sum}) {
    return BudgetsCompanion(
      year: year ?? this.year,
      month: month ?? this.month,
      category: category ?? this.category,
      budgetType: budgetType ?? this.budgetType,
      sum: sum ?? this.sum,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (year.present) {
      map['year'] = Variable<int>(year.value);
    }
    if (month.present) {
      map['month'] = Variable<int>(month.value);
    }
    if (category.present) {
      map['category'] = Variable<int>(category.value);
    }
    if (budgetType.present) {
      final converter = $BudgetsTable.$converter0;
      map['budget_type'] = Variable<int>(converter.mapToSql(budgetType.value)!);
    }
    if (sum.present) {
      map['sum'] = Variable<int>(sum.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BudgetsCompanion(')
          ..write('year: $year, ')
          ..write('month: $month, ')
          ..write('category: $category, ')
          ..write('budgetType: $budgetType, ')
          ..write('sum: $sum')
          ..write(')'))
        .toString();
  }
}

class $BudgetsTable extends Budgets with TableInfo<$BudgetsTable, BudgetDB> {
  final GeneratedDatabase _db;
  final String? _alias;
  $BudgetsTable(this._db, [this._alias]);
  final VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedIntColumn year = _constructYear();
  GeneratedIntColumn _constructYear() {
    return GeneratedIntColumn(
      'year',
      $tableName,
      false,
    );
  }

  final VerificationMeta _monthMeta = const VerificationMeta('month');
  @override
  late final GeneratedIntColumn month = _constructMonth();
  GeneratedIntColumn _constructMonth() {
    return GeneratedIntColumn(
      'month',
      $tableName,
      false,
    );
  }

  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  @override
  late final GeneratedIntColumn category = _constructCategory();
  GeneratedIntColumn _constructCategory() {
    return GeneratedIntColumn('category', $tableName, false,
        $customConstraints: 'NULL REFERENCES category(id)');
  }

  final VerificationMeta _budgetTypeMeta = const VerificationMeta('budgetType');
  @override
  late final GeneratedIntColumn budgetType = _constructBudgetType();
  GeneratedIntColumn _constructBudgetType() {
    return GeneratedIntColumn(
      'budget_type',
      $tableName,
      false,
    );
  }

  final VerificationMeta _sumMeta = const VerificationMeta('sum');
  @override
  late final GeneratedIntColumn sum = _constructSum();
  GeneratedIntColumn _constructSum() {
    return GeneratedIntColumn(
      'sum',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [year, month, category, budgetType, sum];
  @override
  $BudgetsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'budgets';
  @override
  final String actualTableName = 'budgets';
  @override
  VerificationContext validateIntegrity(Insertable<BudgetDB> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('year')) {
      context.handle(
          _yearMeta, year.isAcceptableOrUnknown(data['year']!, _yearMeta));
    } else if (isInserting) {
      context.missing(_yearMeta);
    }
    if (data.containsKey('month')) {
      context.handle(
          _monthMeta, month.isAcceptableOrUnknown(data['month']!, _monthMeta));
    } else if (isInserting) {
      context.missing(_monthMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    context.handle(_budgetTypeMeta, const VerificationResult.success());
    if (data.containsKey('sum')) {
      context.handle(
          _sumMeta, sum.isAcceptableOrUnknown(data['sum']!, _sumMeta));
    } else if (isInserting) {
      context.missing(_sumMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {year, month, category, budgetType};
  @override
  BudgetDB map(Map<String, dynamic> data, {String? tablePrefix}) {
    return BudgetDB.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BudgetsTable createAlias(String alias) {
    return $BudgetsTable(_db, alias);
  }

  static TypeConverter<BudgetType, int> $converter0 =
      const BudgetTypeConverter();
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $AccountsTable accounts = $AccountsTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $OperationsTable operations = $OperationsTable(this);
  late final $BalancesTable balances = $BalancesTable(this);
  late final $CashflowsTable cashflows = $CashflowsTable(this);
  late final $BudgetsTable budgets = $BudgetsTable(this);
  late final AccountDao accountDao = AccountDao(this as Database);
  late final CategoryDao categoryDao = CategoryDao(this as Database);
  late final OperationDao operationDao = OperationDao(this as Database);
  late final BudgetDao budgetDao = BudgetDao(this as Database);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [accounts, categories, operations, balances, cashflows, budgets];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$AccountDaoMixin on DatabaseAccessor<Database> {
  $AccountsTable get accounts => attachedDatabase.accounts;
  $BalancesTable get balances => attachedDatabase.balances;
}
mixin _$CategoryDaoMixin on DatabaseAccessor<Database> {
  $CategoriesTable get categories => attachedDatabase.categories;
  $BudgetsTable get budgets => attachedDatabase.budgets;
  $CashflowsTable get cashflows => attachedDatabase.cashflows;
}
mixin _$OperationDaoMixin on DatabaseAccessor<Database> {
  $AccountsTable get accounts => attachedDatabase.accounts;
  $CategoriesTable get categories => attachedDatabase.categories;
  $OperationsTable get operations => attachedDatabase.operations;
  $BalancesTable get balances => attachedDatabase.balances;
  $CashflowsTable get cashflows => attachedDatabase.cashflows;
}
mixin _$BudgetDaoMixin on DatabaseAccessor<Database> {
  $BudgetsTable get budgets => attachedDatabase.budgets;
}
