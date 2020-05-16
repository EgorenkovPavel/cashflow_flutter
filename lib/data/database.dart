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

  DateTimeColumn get date => dateTime()();

  IntColumn get operation =>
      integer().customConstraint('NULL REFERENCES operation(id)')();

  IntColumn get account =>
      integer().customConstraint('NULL REFERENCES account(id)')();

  IntColumn get sum => integer()();

  @override
  Set<Column> get primaryKey => {operation, account};
}

class CashflowEntity extends Table {
  @override
  String get tableName => 'cashflow';

//
//  IntColumn get id => integer().autoIncrement()();

  DateTimeColumn get date => dateTime()();

  IntColumn get operation =>
      integer().customConstraint('NULL REFERENCES operation(id)')();

  IntColumn get category =>
      integer().customConstraint('NULL REFERENCES category(id)')();

  IntColumn get sum => integer()();

  @override
  Set<Column> get primaryKey => {operation, category};
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

class MonthBalance {
  DateTime date;
  int sum;

  MonthBalance(this.date, this.sum);
}

class AccountBalanceEntity {
  AccountEntityData account;
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
  CategoryEntityData category;
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
  OperationEntityData _operation;
  AccountEntityData account;
  CategoryEntityData category;
  AccountEntityData recAccount;

  OperationItem(this._operation, this.account, this.category, this.recAccount);

  //TODO rewrite to date, type, account, category, recAccount sum
  OperationEntityData get operationData {
    switch (_operation.operationType) {
      case OperationType.INPUT:
      case OperationType.OUTPUT:
        return _operation.copyWith(account: account.id, category: category.id);
      case OperationType.TRANSFER:
        return _operation.copyWith(
            account: account.id, recAccount: recAccount.id);
      default:
        return null;
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
      await delete(balanceEntity).go();
      await delete(cashflowEntity).go();
      await delete(operationEntity).go();
      await delete(budget).go();
      await delete(accountEntity).go();
      await delete(categoryEntity).go();
    });
  }

  Future<Map<String, List<Map<String, dynamic>>>> getDbData() async {
    Map<String, List<Map<String, dynamic>>> data = {};

    List<AccountEntityData> accounts = await accountDao.getAllAccounts();
    List<CategoryEntityData> categories = await categoryDao.getAllCategories();
    List<OperationEntityData> operations =
        await operationDao.getAllOperations();

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
    var converter = const OperationTypeConverter();

    data.forEach((String key, dynamic value) async {
      if (key == 'account') {
        List<AccountEntityData> accounts = [];
        value.forEach((dynamic d) async {
          if (d is Map<String, dynamic>) {
            if(d.containsKey('account_title')){
              accounts.add(AccountEntityData(
                id: int.parse(d['_id']),
                title: d['account_title'],
                archive: false,
              ));
            }else {
              accounts.add(AccountEntityData.fromJson(d,
                  serializer: _DefaultValueSerializer()));
            }
          }
        });
        await accountDao.batchInsert(accounts);
      } else if (key == 'category') {
        List<CategoryEntityData> categories = [];
        value.forEach((dynamic d) async {
          if (d is Map<String, dynamic>) {
            if(d.containsKey('category_title')){
              categories.add(CategoryEntityData(
                id: int.parse(d['_id']),
                title: d['category_title'],
                operationType: converter.mapToDart(int.parse(d['category_type'])),
                archive: false,
              ));
            }else{
            categories.add(CategoryEntityData.fromJson(d,
                serializer: _DefaultValueSerializer()));
          }}
        });
        await categoryDao.batchInsert(categories);
      } else if (key == 'operation') {
        List<OperationEntityData> operations = [];
        value.forEach((dynamic d) async {
          if (d is Map<String, dynamic>) {
            if(d.containsKey('operation_date')){
              operations.add(OperationEntityData(
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
            }else{
            operations.add(OperationEntityData.fromJson(d,
                serializer: _DefaultValueSerializer()));
          }}
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

  Stream<List<AccountEntityData>> watchAllAccounts({bool archive = false}) =>
      (select(accountEntity)
            ..orderBy([(t) => OrderingTerm(expression: t.title)]))
          .watch();

  Future<List<AccountEntityData>> getAllAccounts() =>
      select(accountEntity).get();

  Stream<AccountEntityData> watchAccountById(int id) =>
      (select(accountEntity)..where((c) => c.id.equals(id))).watchSingle();

  Future<AccountEntityData> getAccountById(int id) =>
      (select(accountEntity)..where((c) => c.id.equals(id))).getSingle();

  Future insertAccount(AccountEntityData entity) =>
      into(accountEntity).insert(entity);

  Future updateAccount(AccountEntityData entity) =>
      update(accountEntity).replace(entity);

  Stream<int> getTotalBalance() {
    return customSelectQuery(
      'SELECT SUM(sum) as sum FROM balance',
    ).watchSingle().map((row) => row.readInt('sum') ?? 0);
  }

  Stream<List<AccountBalanceEntity>> watchAllAccountsWithBalance(
      {bool archive = false}) {
    final sumBalance = balanceEntity.sum.sum();

    final query = db.select(accountEntity).join([
      leftOuterJoin(
        balanceEntity,
        balanceEntity.account.equalsExp(accountEntity.id),
        useColumns: false,
      )
    ]);
    query
      ..addColumns([sumBalance])
      ..groupBy([accountEntity.id]);

    return query.watch().map((rows) {
      return rows
          .map((row) => AccountBalanceEntity(
              row.readTable(accountEntity), row.read(sumBalance) ?? 0))
          .toList();
    });
  }

  Future<void> batchInsert(List<AccountEntityData> accounts) async {
    await batch((batch) {
      batch.insertAll(
        accountEntity,
        accounts
            .map((p) => AccountEntityCompanion.insert(
                  id: Value(p.id),
                  title: p.title,
                  archive: Value(p.archive),
                ))
            .toList(),
      );
    });
  }

  Stream<MonthBalance> watchBalance(DateTime date) {
    final sumBalance = balanceEntity.sum.sum();

    final query = db.selectOnly(balanceEntity)
      ..where(balanceEntity.date.isSmallerOrEqualValue(date))
      ..addColumns([sumBalance]);

    return query
        .watchSingle()
        .map((c) => MonthBalance(date, c.read(sumBalance) ?? 0));
  }
}

@UseDao(tables: [CategoryEntity, Budget, CashflowEntity])
class CategoryDao extends DatabaseAccessor<Database> with _$CategoryDaoMixin {
  final Database db;

  // Called by the AppDatabase class
  CategoryDao(this.db) : super(db);

  //Future<List<Task>> getAllTasks() => select(tasks).get();
  Stream<List<CategoryEntityData>> watchAllCategories({bool archive = false}) =>
      (select(categoryEntity)
            //..where((a) => a.archive.equals(false) | a.archive.equals(archive))
            ..orderBy([(t) => OrderingTerm(expression: t.title)]))
          .watch();

  Future<List<CategoryEntityData>> getAllCategories() =>
      select(categoryEntity).get();

  Stream<CategoryEntityData> getCategoryById(int id) =>
      (select(categoryEntity)..where((c) => c.id.equals(id))).watchSingle();

  Stream<List<CategoryEntityData>> watchAllCategoriesByType(OperationType type,
          {bool archive = false}) =>
      (select(categoryEntity)
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
      readsFrom: {categoryEntity, cashflowEntity, budget},
    ).watch().map((rows) {
      return rows
          .map((row) => CategoryCashflowBudgetEntity(
                date.year,
                date.month,
                CategoryEntityData.fromData(row.data, db),
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
      readsFrom: {categoryEntity, cashflowEntity, budget},
    ).watch().map((rows) {
      return rows
          .map((row) => CategoryCashflowBudgetEntity(
                date.year,
                date.month,
                CategoryEntityData.fromData(row.data, db),
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
      readsFrom: {categoryEntity, cashflowEntity},
    ).watch().map((rows) {
      return rows.map((row) {
        print(row.readDateTime('date').toString());
        return CategoryCashflowBudgetEntity(
          row.readDateTime('date').year,
          row.readDateTime('date').month,
          CategoryEntityData.fromData(row.data, db),
          0,
          row.readInt('sum') ?? 0,
        );
      }).toList();
    });
  }

  Future insertCategory(CategoryEntityData entity) =>
      into(categoryEntity).insert(entity);

  Future updateCategory(CategoryEntityData entity) =>
      update(categoryEntity).replace(entity);

  Stream<int> watchBudget(DateTime date) {
    return customSelectQuery(
      'SELECT c.operation_type, '
      '(SELECT sum as sum FROM budgets WHERE category = c.id AND date <= ? ORDER BY date LIMIT 1) AS "budget" '
      'FROM categories c;',
      variables: [
        Variable.withDateTime(date),
      ],
      readsFrom: {categoryEntity, budget},
    ).watch().map((rows) {
      return rows
          .map((row) => OperationTypeConverter()
                      .mapToDart(row.readInt('operation_type')) ==
                  OperationType.INPUT
              ? row.readInt('budget') ?? 0
              : -(row.readInt('budget') ?? 0))
          .fold(0, (a, b) => a + b);
    });
  }

  Future<void> batchInsert(List<CategoryEntityData> categories) async {
    await batch((batch) {
      batch.insertAll(
        categoryEntity,
        categories
            .map((p) => CategoryEntityCompanion.insert(
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
    final acc = alias(accountEntity, 'a');
    final rec = alias(accountEntity, 'rec');

    return (select(operationEntity)
          ..orderBy([
            (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc)
          ]))
        .join(
          [
            innerJoin(
              acc,
              acc.id.equalsExp(operationEntity.account),
            ),
            leftOuterJoin(
              categoryEntity,
              categoryEntity.id.equalsExp(operationEntity.category),
            ),
            leftOuterJoin(
              rec,
              rec.id.equalsExp(operationEntity.recAccount),
            ),
          ],
        )
        .watch()
        .map(
          (rows) => rows.map(
            (row) {
              return OperationItem(
                  row.readTable(operationEntity),
                  row.readTable(acc),
                  row.readTable(categoryEntity),
                  row.readTable(rec));
            },
          ).toList(),
        );
  }

  Stream<List<OperationItem>> watchAllOperationItemsByCategory(int categoryId) {
    final acc = alias(accountEntity, 'a');
    final rec = alias(accountEntity, 'rec');

    return (select(operationEntity)
          ..where((t) => t.category.equals(categoryId))
          ..orderBy([
            (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc)
          ]))
        .join(
          [
            innerJoin(
              acc,
              acc.id.equalsExp(operationEntity.account),
            ),
            leftOuterJoin(
              categoryEntity,
              categoryEntity.id.equalsExp(operationEntity.category),
            ),
            leftOuterJoin(
              rec,
              rec.id.equalsExp(operationEntity.recAccount),
            ),
          ],
        )
        .watch()
        .map(
          (rows) => rows.map(
            (row) {
              return OperationItem(
                  row.readTable(operationEntity),
                  row.readTable(acc),
                  row.readTable(categoryEntity),
                  row.readTable(rec));
            },
          ).toList(),
        );
  }

  Stream<List<OperationItem>> watchLastOperationItems(int limit) {
    final acc = alias(accountEntity, 'a');
    final rec = alias(accountEntity, 'rec');

    return (select(operationEntity)
          ..orderBy([
            (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc)
          ])
          ..limit(limit))
        .join(
          [
            innerJoin(
              acc,
              acc.id.equalsExp(operationEntity.account),
            ),
            leftOuterJoin(
              categoryEntity,
              categoryEntity.id.equalsExp(operationEntity.category),
            ),
            leftOuterJoin(
              rec,
              rec.id.equalsExp(operationEntity.recAccount),
            ),
          ],
        )
        .watch()
        .map(
          (rows) => rows.map(
            (row) {
              return OperationItem(
                  row.readTable(operationEntity),
                  row.readTable(acc),
                  row.readTable(categoryEntity),
                  row.readTable(rec));
            },
          ).toList(),
        );
  }

  Future<List<OperationEntityData>> getAllOperations() =>
      select(operationEntity).get();

  Stream<OperationItem> getOperationById(int id) {
    final acc = alias(accountEntity, 'a');
    final rec = alias(accountEntity, 'rec');

    return (select(operationEntity)..where((o) => o.id.equals(id)))
        .join(
          [
            innerJoin(
              acc,
              acc.id.equalsExp(operationEntity.account),
            ),
            leftOuterJoin(
              categoryEntity,
              categoryEntity.id.equalsExp(operationEntity.category),
            ),
            leftOuterJoin(
              rec,
              rec.id.equalsExp(operationEntity.recAccount),
            ),
          ],
        )
        .watchSingle()
        .map((row) {
          return OperationItem(
              row.readTable(operationEntity),
              row.readTable(acc),
              row.readTable(categoryEntity),
              row.readTable(rec));
        });
  }

  Future insertOperationItem(OperationItem entity) {
    return transaction(() async {
      int id = await into(operationEntity).insert(entity.operationData);

      OperationEntityData operationData = entity.operationData.copyWith(id: id);
      await _insertAnalytic(operationData);
    });
  }

  Future insertOperation(OperationEntityData entity) {
    return transaction(() async {
      int id = await into(operationEntity).insert(entity);

      OperationEntityData operationData = entity.copyWith(id: id);
      await _insertAnalytic(operationData);
    });
  }

  Future updateOperation(OperationEntityData entity) {
    return transaction(() async {
      await deleteOperation(entity);
      await insertOperation(entity);
    });
  }

  Future deleteOperation(OperationEntityData entity) {
    return transaction(() async {
      await delete(operationEntity).delete(entity);
      await _deleteAnalytic(entity);
    });
  }

  Future<void> batchInsert(List<OperationEntityData> operationData) async {
    List<CashflowEntityData> cashflowData = [];
    List<BalanceEntityData> balanceData = [];

    operationData.forEach((operation) {
      switch (operation.operationType) {
        case OperationType.INPUT:
          {
            balanceData.add(BalanceEntityData(
                date: operation.date,
                operation: operation.id,
                account: operation.account,
                sum: operation.sum));
            cashflowData.add(CashflowEntityData(
                date: operation.date,
                operation: operation.id,
                category: operation.category,
                sum: operation.sum));
            break;
          }
        case OperationType.OUTPUT:
          {
            balanceData.add(BalanceEntityData(
                date: operation.date,
                operation: operation.id,
                account: operation.account,
                sum: -1 * operation.sum));
            cashflowData.add(CashflowEntityData(
                date: operation.date,
                operation: operation.id,
                category: operation.category,
                sum: operation.sum));
            break;
          }
        case OperationType.TRANSFER:
          {
            balanceData.add(BalanceEntityData(
                date: operation.date,
                operation: operation.id,
                account: operation.account,
                sum: -1 * operation.sum));
            balanceData.add(BalanceEntityData(
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
        operationEntity,
        operationData
            .map((p) => OperationEntityCompanion.insert(
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
        cashflowEntity,
        cashflowData
            .map((p) => CashflowEntityCompanion.insert(
                date: p.date,
                operation: p.operation,
                category: p.category,
                sum: p.sum))
            .toList(),
      );
      batch.insertAll(
          balanceEntity,
          balanceData
              .map((p) => BalanceEntityCompanion.insert(
                  date: p.date,
                  operation: p.operation,
                  account: p.account,
                  sum: p.sum))
              .toList());
    });
  }

  Future _insertAnalytic(OperationEntityData operation) async {
    switch (operation.operationType) {
      case OperationType.INPUT:
        {
          await into(balanceEntity).insert(BalanceEntityData(
              date: operation.date,
              operation: operation.id,
              account: operation.account,
              sum: operation.sum));
          await into(cashflowEntity).insert(CashflowEntityData(
              date: operation.date,
              operation: operation.id,
              category: operation.category,
              sum: operation.sum));
          break;
        }
      case OperationType.OUTPUT:
        {
          await into(balanceEntity).insert(BalanceEntityData(
              date: operation.date,
              operation: operation.id,
              account: operation.account,
              sum: -1 * operation.sum));
          await into(cashflowEntity).insert(CashflowEntityData(
              date: operation.date,
              operation: operation.id,
              category: operation.category,
              sum: operation.sum));
          break;
        }
      case OperationType.TRANSFER:
        {
          await into(balanceEntity).insert(BalanceEntityData(
              date: operation.date,
              operation: operation.id,
              account: operation.account,
              sum: -1 * operation.sum));
          await into(balanceEntity).insert(BalanceEntityData(
              date: operation.date,
              operation: operation.id,
              account: operation.recAccount,
              sum: operation.sum));
          break;
        }
    }
  }

  Future _deleteAnalytic(OperationEntityData operation) async {
    await (delete(balanceEntity)
          ..where((entry) => entry.operation.equals(operation.id)))
        .go();
    await (delete(cashflowEntity)
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

  Stream<List<MonthBalance>> watchMonthBudget() {
//    return select(budget)
//        .map((t) => MonthBudget(t.year, t.month, t.sum))
//        .watch();
    return customSelectQuery(
        'SELECT date, SUM(sum) as sum FROM budget GROUP BY date ORDER BY date',
        readsFrom: {budget}).watch().map((rows) {
      return rows
          .map((t) => MonthBalance(t.readDateTime('date'), t.readInt('sum')))
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
