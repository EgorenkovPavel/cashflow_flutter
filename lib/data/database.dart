import 'package:cashflow/data/operation_type.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'database.g.dart';

class AccountEntity extends Table {
  @override
  String get tableName => 'accounts';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();

  BoolColumn get archive => boolean().withDefault(const Constant(false))();
}

class CategoryEntity extends Table {
  @override
  String get tableName => 'categories';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();

  BoolColumn get archive => boolean().withDefault(const Constant(false))();

  IntColumn get operationType =>
      integer().named('operation_type').map(const OperationTypeConverter())();
}

class OperationEntity extends Table {
  @override
  String get tableName => 'operations';

  IntColumn get id => integer().autoIncrement()();

  DateTimeColumn get date => dateTime()();

  IntColumn get operationType =>
      integer().named('operation_type').map(const OperationTypeConverter())();

  IntColumn get account =>
      integer().customConstraint('NULL REFERENCES account(id)')();

  IntColumn get category =>
      integer().nullable().customConstraint('NULL REFERENCES category(id)')();

  IntColumn get recAccount =>
      integer().nullable().customConstraint('NULL REFERENCES account(id)')();

  IntColumn get sum => integer()();
}

class BalanceEntity extends Table {
  @override
  String get tableName => 'balance';

  IntColumn get id => integer().autoIncrement()();

  DateTimeColumn get date => dateTime()();

  IntColumn get operation =>
      integer().customConstraint('NULL REFERENCES operation(id)')();

  IntColumn get account =>
      integer().customConstraint('NULL REFERENCES account(id)')();

  IntColumn get sum => integer()();
}

class CashflowEntity extends Table {
  @override
  String get tableName => 'cashflow';

  IntColumn get id => integer().autoIncrement()();

  DateTimeColumn get date => dateTime()();

  IntColumn get operation =>
      integer().customConstraint('NULL REFERENCES operation(id)')();

  IntColumn get category =>
      integer().customConstraint('NULL REFERENCES category(id)')();

  IntColumn get sum => integer()();
}

class Budget extends Table {
  @override
  String get tableName => 'budgets';

  DateTimeColumn get date => dateTime()();

  IntColumn get category =>
      integer().customConstraint('NULL REFERENCES category(id)')();

  @override
  Set<Column> get primaryKey => {date, category};

  IntColumn get sum => integer()();
}

class MonthBudget {
  DateTime date;
  int sum;

  MonthBudget(this.date, this.sum);
}

class AccountBalanceEntity {
  AccountData account;
  int sum;

  AccountBalanceEntity(this.account, this.sum);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountBalanceEntity &&
          runtimeType == other.runtimeType &&
          account == other.account;

  @override
  int get hashCode => account.hashCode;
}

class CategoryCashflowBudgetEntity {
  int year;
  int month;
  CategoryData category;
  int budget;
  int cashflow;

  CategoryCashflowBudgetEntity(
      this.year, this.month, this.category, this.budget, this.cashflow);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryCashflowBudgetEntity &&
          runtimeType == other.runtimeType &&
          category == other.category;

  @override
  int get hashCode => category.hashCode;
}

class OperationItem {
  OperationData _operation;
  AccountData account;
  CategoryData category;
  AccountData recAccount;

  OperationItem(this._operation, this.account, this.category, this.recAccount);

  //TODO rewrite to date, type, account, category, recAccount sum
  OperationData get operationData {
    switch (_operation.operationType) {
      case OperationType.INPUT:
      case OperationType.OUTPUT:
        return _operation.copyWith(account: account.id, category: category.id);
      case OperationType.TRANSFER:
        return _operation.copyWith(
            account: account.id, recAccount: recAccount.id);
      default: return null;
    }
  }

  DateTime get date => _operation.date;

  OperationType get type => _operation.operationType;

  int get sum => _operation.sum;

  set date(DateTime value) {
    _operation = _operation.copyWith(date: value);
  }

  set type(OperationType value) {
    _operation = _operation.copyWith(operationType: value);
  }

  set sum(int value) {
    _operation = _operation.copyWith(sum: value);
  }
}

class OperationTypeConverter extends TypeConverter<OperationType, int> {
  const OperationTypeConverter();

  @override
  OperationType mapToDart(int fromDb) {
    if (fromDb == null) {
      return null;
    }

    switch (fromDb) {
      case 1:
        return OperationType.INPUT;
      case 2:
        return OperationType.OUTPUT;
      case 3:
        return OperationType.TRANSFER;
      default:
        return null;
    }
  }

  @override
  int mapToSql(OperationType value) {
    if (value == null) {
      return null;
    }

    switch (value) {
      case OperationType.INPUT:
        return 1;
      case OperationType.OUTPUT:
        return 2;
      case OperationType.TRANSFER:
        return 3;
      default:
        return null;
    }
  }
}

@UseMoor(tables: [
  AccountEntity,
  CategoryEntity,
  OperationEntity,
  BalanceEntity,
  CashflowEntity,
  Budget
], daos: [
  AccountDao,
  CategoryDao,
  OperationDao,
  BudgetDao
])
class Database extends _$Database {
  Database()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

  Future deleteAll() {
    return transaction(() async {
      await delete(balance).go();
      await delete(cashflow).go();
      await delete(operation).go();
      await delete(budget).go();
      await delete(account).go();
      await delete(category).go();
    });
  }

  Future<Map<String, List<Map<String, dynamic>>>> getDbData() async {
    Map<String, List<Map<String, dynamic>>> data = {};

    List<AccountData> accounts = await accountDao.getAllAccounts();
    List<CategoryData> categories = await categoryDao.getAllCategories();
    List<OperationData> operations = await operationDao.getAllOperations();

    data.putIfAbsent(
        'account',
        () => accounts
            .map((p) => p.toJson(serializer: _DefaultValueSerializer()))
            .toList());

    data.putIfAbsent(
        'category',
        () => categories
            .map((p) => p.toJson(serializer: _DefaultValueSerializer()))
            .toList());

    data.putIfAbsent(
        'operation',
        () => operations
            .map((p) => p.toJson(serializer: _DefaultValueSerializer()))
            .toList());

    return data;
  }

  Future loadData(Map<String, dynamic> data) async {
    data.forEach((String key, dynamic value) async {
      if (key == 'account') {
        List<AccountData> accounts = [];
        value.forEach((dynamic d) async {
          if (d is Map<String, dynamic>) {
            accounts.add(
                AccountData.fromJson(d, serializer: _DefaultValueSerializer()));
          }
        });
        await accountDao.batchInsert(accounts);
      } else if (key == 'category') {
        List<CategoryData> categories = [];
        value.forEach((dynamic d) async {
          if (d is Map<String, dynamic>) {
            categories.add(CategoryData.fromJson(d,
                serializer: _DefaultValueSerializer()));
          }
        });
        await categoryDao.batchInsert(categories);
      } else if (key == 'operation') {
        List<OperationData> operations = [];
        value.forEach((dynamic d) async {
          if (d is Map<String, dynamic>) {
            operations.add(OperationData.fromJson(d,
                serializer: _DefaultValueSerializer()));
          }
        });
        await operationDao.batchInsert(operations);
      }
    });
  }

  Future loadOldData(Map<String, dynamic> data) async {
    var converter = const OperationTypeConverter();

    data.forEach((String key, dynamic value) async {
      if (key == 'account') {
        List<AccountData> accounts = [];
        value.forEach((dynamic d) async {
          if (d is Map<String, dynamic>) {
            accounts.add(AccountData(
              id: int.parse(d['_id']),
              title: d['account_title'],
              archive: false,
            ));
          }
        });
        await accountDao.batchInsert(accounts);
      } else if (key == 'category') {
        List<CategoryData> categories = [];
        value.forEach((dynamic d) async {
          if (d is Map<String, dynamic>) {
            categories.add(CategoryData(
              id: int.parse(d['_id']),
              title: d['category_title'],
              operationType: converter.mapToDart(int.parse(d['category_type'])),
              archive: false,
            ));
          }
        });
        await categoryDao.batchInsert(categories);
      } else if (key == 'operation') {
        List<OperationData> operations = [];
        value.forEach((dynamic d) async {
          if (d is Map<String, dynamic>) {
            operations.add(OperationData(
              id: int.parse(d['_id']),
              date: DateTime.fromMillisecondsSinceEpoch(
                  int.parse(d['operation_date'])),
              operationType:
                  converter.mapToDart(int.parse(d['operation_type'])),
              account: int.parse(d['operation_account_id']),
              category: _getId(d['operation_category_id']),
              recAccount: _getId(d['operation_recipient_account_id']),
              sum: int.parse(d['operation_sum']),
            ));
          }
        });
        await operationDao.batchInsert(operations);
      }
    });
  }

  int _getId(String id) {
    if (id.isEmpty) {
      return null;
    } else {
      return int.parse(id);
    }
  }
}

@UseDao(tables: [AccountEntity, BalanceEntity])
class AccountDao extends DatabaseAccessor<Database> with _$AccountDaoMixin {
  final Database db;

  // Called by the AppDatabase class
  AccountDao(this.db) : super(db);

  Stream<List<AccountData>> watchAllAccounts({bool archive = false}) =>
      (select(account)..orderBy([(t) => OrderingTerm(expression: t.title)]))
          .watch();

  Future<List<AccountData>> getAllAccounts() => select(account).get();

  Stream<AccountData> getAccountById(int id) =>
      (select(account)..where((c) => c.id.equals(id))).watchSingle();

  Future insertAccount(AccountData entity) => into(account).insert(entity);

  Future updateAccount(AccountData entity) => update(account).replace(entity);

  Stream<int> getTotalBalance() {
    return customSelectQuery(
      'SELECT SUM(sum) as sum FROM balance',
    ).watchSingle().map((row) => row.readInt('sum') ?? 0);
  }

  Stream<List<AccountBalanceEntity>> watchAllAccountsWithBalance(
      {bool archive = false}) {
    return customSelectQuery(
        'SELECT *, (SELECT SUM(sum) as sum FROM balance WHERE account = c.id) AS "sum" '
        'FROM accounts c ORDER BY title;',
        readsFrom: {account, balance}).watch().map((rows) {
      return rows
          .map((row) => AccountBalanceEntity(
              AccountData.fromData(row.data, db), row.readInt('sum') ?? 0))
          .where((a) => archive ? true : !a.account.archive)
          .toList();
    });
  }

  Future<void> batchInsert(List<AccountData> accounts) async {
    await batch((batch) {
      batch.insertAll(
        account,
        accounts
            .map((p) => AccountCompanion.insert(
                  id: Value(p.id),
                  title: p.title,
                  archive: Value(p.archive),
                ))
            .toList(),
      );
    });
  }
}

@UseDao(tables: [CategoryEntity, Budget, CashflowEntity])
class CategoryDao extends DatabaseAccessor<Database> with _$CategoryDaoMixin {
  final Database db;

  // Called by the AppDatabase class
  CategoryDao(this.db) : super(db);

  //Future<List<Task>> getAllTasks() => select(tasks).get();
  Stream<List<CategoryData>> watchAllCategories({bool archive = false}) =>
      (select(category)
            //..where((a) => a.archive.equals(false) | a.archive.equals(archive))
            ..orderBy([(t) => OrderingTerm(expression: t.title)]))
          .watch();

  Future<List<CategoryData>> getAllCategories() => select(category).get();

  Stream<CategoryData> getCategoryById(int id) =>
      (select(category)..where((c) => c.id.equals(id))).watchSingle();

  Stream<List<CategoryData>> watchAllCategoriesByType(OperationType type,
          {bool archive = false}) =>
      (select(category)
            ..where((a) => a.archive.equals(false) | a.archive.equals(archive))
            ..where((cat) => cat.operationType
                .equals(OperationTypeConverter().mapToSql(type)))
            ..orderBy([(t) => OrderingTerm(expression: t.title)]))
          .watch();

  Stream<List<CategoryCashflowBudgetEntity>> watchAllCategoryCashflowBudget(
      DateTime date) {
    DateTime monthStart = DateTime(date.year, date.month);
    DateTime monthEnd = date.month < 12
        ? DateTime(date.year, date.month + 1)
        : DateTime(date.year + 1, 1);

    return customSelectQuery(
      'SELECT *, '
      '(SELECT sum as sum FROM budgets WHERE category = c.id AND date <= ? ORDER BY date LIMIT 1) AS "budget", '
      '(SELECT SUM(sum) as sum FROM cashflow WHERE category = c.id AND date BETWEEN ? AND ?) AS "cashflow" '
      'FROM categories c ORDER BY title;',
      variables: [
        Variable.withDateTime(monthStart),
        Variable.withDateTime(monthStart),
        Variable.withDateTime(monthEnd)
      ],
      readsFrom: {category, cashflow, budget},
    ).watch().map((rows) {
      return rows
          .map((row) => CategoryCashflowBudgetEntity(
                date.year,
                date.month,
                CategoryData.fromData(row.data, db),
                row.readInt('budget') ?? 0,
                row.readInt('cashflow') ?? 0,
              ))
          .toList();
    });
  }

  Stream<List<CategoryCashflowBudgetEntity>> watchCategoryCashflowBudgetByType(
      DateTime date, OperationType type) {
    DateTime monthStart = DateTime(date.year, date.month);
    DateTime monthEnd = date.month < 12
        ? DateTime(date.year, date.month + 1)
        : DateTime(date.year + 1, 1);

    return customSelectQuery(
      'SELECT *, '
          '(SELECT sum as sum FROM budgets WHERE category = c.id AND date <= ? ORDER BY date LIMIT 1) AS "budget", '
          '(SELECT SUM(sum) as sum FROM cashflow WHERE category = c.id AND date BETWEEN ? AND ?) AS "cashflow" '
          'FROM categories c '
          'WHERE operation_type = ? '
          'ORDER BY title;',
      variables: [
        Variable.withDateTime(monthStart),
        Variable.withDateTime(monthStart),
        Variable.withDateTime(monthEnd),
        Variable.withInt(OperationTypeConverter().mapToSql(type)),
      ],
      readsFrom: {category, cashflow, budget},
    ).watch().map((rows) {
      return rows
          .map((row) => CategoryCashflowBudgetEntity(
        date.year,
        date.month,
        CategoryData.fromData(row.data, db),
        row.readInt('budget') ?? 0,
        row.readInt('cashflow') ?? 0,
      ))
          .toList();
    });
  }

  Stream<List<CategoryCashflowBudgetEntity>> watchCashflowBudgetByCategory(
      int categoryId) {
    return customSelectQuery(
      'SELECT *, '
      'cashflow.date as date,'
      'cashflow.sum as sum '
      'FROM category c '
      'INNER JOIN '
      '(SELECT '
      'date(date, "start of month") as date, '
//          '0 as SUM '
      'SUM(sum) as sum '
      'FROM cashflow as cash '
      'WHERE category = ? '
      //'GROUP BY date(strftime(\'%Y-%m-%d\', cash.date), "start of month")'

      ') AS "cashflow" '
      'WHERE c.id = ?;',
      variables: [
        Variable.withInt(categoryId),
        Variable.withInt(categoryId),
      ],
      readsFrom: {category, cashflow},
    ).watch().map((rows) {
      return rows.map((row) {
        print(row.readDateTime('date').toString());
        return CategoryCashflowBudgetEntity(
          row.readDateTime('date').year,
          row.readDateTime('date').month,
          CategoryData.fromData(row.data, db),
          0,
          row.readInt('sum') ?? 0,
        );
      }).toList();
    });
  }

  Future insertCategory(CategoryData entity) => into(category).insert(entity);

  Future updateCategory(CategoryData entity) =>
      update(category).replace(entity);

  Future<void> batchInsert(List<CategoryData> categories) async {
    await batch((batch) {
      batch.insertAll(
        category,
        categories
            .map((p) => CategoryCompanion.insert(
                  id: Value(p.id),
                  title: p.title,
                  operationType: p.operationType,
                  archive: Value(p.archive),
                ))
            .toList(),
      );
    });
  }
}

@UseDao(tables: [
  AccountEntity,
  CategoryEntity,
  OperationEntity,
  BalanceEntity,
  CashflowEntity
])
class OperationDao extends DatabaseAccessor<Database> with _$OperationDaoMixin {
  final Database db;

  // Called by the AppDatabase class
  OperationDao(this.db) : super(db);

  Stream<List<OperationItem>> watchAllOperationItems() {
    final acc = alias(account, 'a');
    final rec = alias(account, 'rec');

    return (select(operation)
          ..orderBy([
            (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc)
          ]))
        .join(
          [
            innerJoin(
              acc,
              acc.id.equalsExp(operation.account),
            ),
            leftOuterJoin(
              category,
              category.id.equalsExp(operation.category),
            ),
            leftOuterJoin(
              rec,
              rec.id.equalsExp(operation.recAccount),
            ),
          ],
        )
        .watch()
        .map(
          (rows) => rows.map(
            (row) {
              return OperationItem(row.readTable(operation), row.readTable(acc),
                  row.readTable(category), row.readTable(rec));
            },
          ).toList(),
        );
  }

  Stream<List<OperationItem>> watchAllOperationItemsByCategory(int categoryId) {
    final acc = alias(account, 'a');
    final rec = alias(account, 'rec');

    return (select(operation)
          ..where((t) => t.category.equals(categoryId))
          ..orderBy([
            (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc)
          ]))
        .join(
          [
            innerJoin(
              acc,
              acc.id.equalsExp(operation.account),
            ),
            leftOuterJoin(
              category,
              category.id.equalsExp(operation.category),
            ),
            leftOuterJoin(
              rec,
              rec.id.equalsExp(operation.recAccount),
            ),
          ],
        )
        .watch()
        .map(
          (rows) => rows.map(
            (row) {
              return OperationItem(row.readTable(operation), row.readTable(acc),
                  row.readTable(category), row.readTable(rec));
            },
          ).toList(),
        );
  }

  Stream<List<OperationItem>> watchLastOperationItems(int limit) {
    final acc = alias(account, 'a');
    final rec = alias(account, 'rec');

    return (select(operation)
      ..orderBy([
            (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc)
      ])
        ..limit(limit)
    )
        .join(
      [
        innerJoin(
          acc,
          acc.id.equalsExp(operation.account),
        ),
        leftOuterJoin(
          category,
          category.id.equalsExp(operation.category),
        ),
        leftOuterJoin(
          rec,
          rec.id.equalsExp(operation.recAccount),
        ),
      ],
    )
        .watch()
        .map(
          (rows) => rows.map(
            (row) {
          return OperationItem(row.readTable(operation), row.readTable(acc),
              row.readTable(category), row.readTable(rec));
        },
      ).toList(),
    );
  }

  Future<List<OperationData>> getAllOperations() => select(operation).get();

  Future insertOperationItem(OperationItem entity) {
    return transaction(() async {
      int id = await into(operation).insert(entity.operationData);

      OperationData operationData = entity.operationData.copyWith(id: id);
      _insertAnalytic(operationData);
    });
  }

  Future insertOperation(OperationData entity) {
    return transaction(() async {
      int id = await into(operation).insert(entity);

      OperationData operationData = entity.copyWith(id: id);
      _insertAnalytic(operationData);
    });
  }

  Future updateOperation(OperationData entity) {
    return transaction(() async {
      await deleteOperation(entity);
      await insertOperation(entity);
    });
  }

  Future deleteOperation(OperationData entity) {
    return transaction(() async {
      await delete(operation).delete(entity);
      await _deleteAnalytic(entity);
    });
  }

  Future<void> batchInsert(List<OperationData> operationData) async {

    List<CashflowData> cashflowData = [];
    List<BalanceData> balanceData = [];

    operationData.forEach((operation) {
      switch (operation.operationType) {
        case OperationType.INPUT:
          {
            balanceData.add(BalanceData(
                date: operation.date,
                operation: operation.id,
                account: operation.account,
                sum: operation.sum));
            cashflowData.add(CashflowData(
                date: operation.date,
                operation: operation.id,
                category: operation.category,
                sum: operation.sum));
            break;
          }
        case OperationType.OUTPUT:
          {
            balanceData.add(BalanceData(
                date: operation.date,
                operation: operation.id,
                account: operation.account,
                sum: -1 * operation.sum));
            cashflowData.add(CashflowData(
                date: operation.date,
                operation: operation.id,
                category: operation.category,
                sum: operation.sum));
            break;
          }
        case OperationType.TRANSFER:
          {
            balanceData.add(BalanceData(
                date: operation.date,
                operation: operation.id,
                account: operation.account,
                sum: -1 * operation.sum));
            balanceData.add(BalanceData(
                date: operation.date,
                operation: operation.id,
                account: operation.recAccount,
                sum: operation.sum));
            break;
          }
      }
    });

    await batch((batch) {
      batch.insertAll(
        operation,
        operationData
            .map((p) => OperationCompanion.insert(
                  id: Value(p.id),
                  date: p.date,
                  operationType: p.operationType,
                  account: p.account,
                  category: Value(p.category),
                  recAccount: Value(p.recAccount),
                  sum: p.sum,
                ))
            .toList(),
      );
      batch.insertAll(
        cashflow,
        cashflowData
            .map((p) => CashflowCompanion.insert(
                date: p.date,
                operation: p.operation,
                category: p.category,
                sum: p.sum))
            .toList(),
      );
      batch.insertAll(
          balance,
          balanceData
              .map((p) => BalanceCompanion.insert(
                  date: p.date,
                  operation: p.operation,
                  account: p.account,
                  sum: p.sum))
              .toList());
    });
  }

  Future _insertAnalytic(OperationData operation) async {
    switch (operation.operationType) {
      case OperationType.INPUT:
        {
          await into(balance).insert(BalanceData(
              date: operation.date,
              operation: operation.id,
              account: operation.account,
              sum: operation.sum));
          await into(cashflow).insert(CashflowData(
              date: operation.date,
              operation: operation.id,
              category: operation.category,
              sum: operation.sum));
          break;
        }
      case OperationType.OUTPUT:
        {
          await into(balance).insert(BalanceData(
              date: operation.date,
              operation: operation.id,
              account: operation.account,
              sum: -1 * operation.sum));
          await into(cashflow).insert(CashflowData(
              date: operation.date,
              operation: operation.id,
              category: operation.category,
              sum: operation.sum));
          break;
        }
      case OperationType.TRANSFER:
        {
          await into(balance).insert(BalanceData(
              date: operation.date,
              operation: operation.id,
              account: operation.account,
              sum: -1 * operation.sum));
          await into(balance).insert(BalanceData(
              date: operation.date,
              operation: operation.id,
              account: operation.recAccount,
              sum: operation.sum));
          break;
        }
    }
  }

  Future _deleteAnalytic(OperationData operation) async {
    await (delete(balance)
          ..where((entry) => entry.operation.equals(operation.id)))
        .go();
    await (delete(cashflow)
          ..where((entry) => entry.operation.equals(operation.id)))
        .go();
  }
}

@UseDao(tables: [Budget])
class BudgetDao extends DatabaseAccessor<Database> with _$BudgetDaoMixin {
  final Database db;

  BudgetDao(this.db) : super(db);

  Stream<List<BudgetData>> watchBudget(DateTime date) {
    DateTime monthStart = DateTime(date.year, date.month);
    return (select(budget)..where((t) => budget.date.equals(monthStart)))
        .watch();
  }

  Stream<List<BudgetData>> watchBudgetByCategory(int categoryId) {
    return (select(budget)
          ..where((t) => t.category.equals(categoryId))
          ..orderBy([
            (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc)
          ]))
        .watch();
  }

  Stream<List<MonthBudget>> watchMonthBudget() {
//    return select(budget)
//        .map((t) => MonthBudget(t.year, t.month, t.sum))
//        .watch();
    return customSelectQuery(
        'SELECT date, SUM(sum) as sum FROM budget GROUP BY date ORDER BY date',
        readsFrom: {budget}).watch().map((rows) {
      return rows
          .map((t) => MonthBudget(t.readDateTime('date'), t.readInt('sum')))
          .toList();
    });
  }

  Future<void> insertBudget(BudgetData entity) {
    DateTime monthStart = DateTime(entity.date.year, entity.date.month);
    return into(budget).insert(entity.copyWith(date: monthStart));
  }

  Future<void> updateBudget(BudgetData entity) {
    DateTime monthStart = DateTime(entity.date.year, entity.date.month);
    return update(budget).replace(entity.copyWith(date: monthStart));
  }

  Future<void> deleteBudget(BudgetData entity) {
    return delete(budget).delete(entity);
  }
}

class _DefaultValueSerializer extends ValueSerializer {
  const _DefaultValueSerializer();

  final _converter = const OperationTypeConverter();

  @override
  T fromJson<T>(dynamic json) {
    if (T == DateTime) {
      if (json == null) {
        return null;
      } else {
        return DateTime.fromMillisecondsSinceEpoch(json as int) as T;
      }
    } else if (T == OperationType) {
      return _converter.mapToDart(json as int) as T;
    }

    return json as T;
  }

  @override
  dynamic toJson<T>(T value) {
    if (value is DateTime) {
      return value.millisecondsSinceEpoch;
    } else if (value is OperationType) {
      return _converter.mapToSql(value);
    }

    return value;
  }
}
