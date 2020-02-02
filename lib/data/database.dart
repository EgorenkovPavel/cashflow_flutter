import 'package:cashflow/data/operation_type.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'database.g.dart';

class Account extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();

  BoolColumn get archive => boolean().withDefault(const Constant(false))();
}

class Category extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();

  BoolColumn get archive => boolean().withDefault(const Constant(false))();

  IntColumn get operationType =>
      integer().named('operation_type').map(const OperationTypeConverter())();

  IntColumn get budget => integer()();
}

class Operation extends Table {
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

class Balance extends Table {
  IntColumn get id => integer().autoIncrement()();

  DateTimeColumn get date => dateTime()();

  IntColumn get operation =>
      integer().customConstraint('NULL REFERENCES operation(id)')();

  IntColumn get account =>
      integer().customConstraint('NULL REFERENCES account(id)')();

  IntColumn get sum => integer()();
}

class Cashflow extends Table {
  IntColumn get id => integer().autoIncrement()();

  DateTimeColumn get date => dateTime()();

  IntColumn get operation =>
      integer().customConstraint('NULL REFERENCES operation(id)')();

  IntColumn get category =>
      integer().nullable().customConstraint('NULL REFERENCES category(id)')();

  IntColumn get sum => integer()();
}

class Budget extends Table {
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

class AccountWithBalance {
  AccountData account;
  int sum;

  AccountWithBalance(this.account, this.sum);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountWithBalance &&
          runtimeType == other.runtimeType &&
          account == other.account;

  @override
  int get hashCode => account.hashCode;
}

class CategoryCashflowBudget {
  CategoryData category;
  int budget;
  int cashflow;

  CategoryCashflowBudget(this.category, this.budget, this.cashflow);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryCashflowBudget &&
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

@UseMoor(
    tables: [Account, Category, Operation, Balance, Cashflow, Budget],
    daos: [AccountDao, CategoryDao, OperationDao, BudgetDao])
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
}

@UseDao(tables: [Account, Balance])
class AccountDao extends DatabaseAccessor<Database> with _$AccountDaoMixin {
  final Database db;

  // Called by the AppDatabase class
  AccountDao(this.db) : super(db);

  Stream<List<AccountData>> watchAllAccounts({bool archive = false}) =>
      (select(account)..orderBy([(t) => OrderingTerm(expression: t.title)]))
          .watch();

  Future insertAccount(AccountData entity) => into(account).insert(entity);

  Future updateAccount(AccountData entity) => update(account).replace(entity);

  Stream<int> getTotalBalance() {
    return customSelectQuery(
      'SELECT SUM(sum) as sum FROM balance',
    ).watchSingle().map((row) => row.readInt('sum') ?? 0);
  }

  Stream<List<AccountWithBalance>> watchAllAccountsWithBalance(
      {bool archive = false}) {
    return customSelectQuery(
        'SELECT *, (SELECT SUM(sum) as sum FROM balance WHERE account = c.id) AS "sum" FROM account c ORDER BY title;',
        readsFrom: {account, balance}).watch().map((rows) {
      return rows
          .map((row) => AccountWithBalance(
              AccountData.fromData(row.data, db), row.readInt('sum') ?? 0))
          .where((a) => archive ? true : !a.account.archive)
          .toList();
    });
  }
}

@UseDao(tables: [Category, Budget, Cashflow])
class CategoryDao extends DatabaseAccessor<Database> with _$CategoryDaoMixin {
  final Database db;

  // Called by the AppDatabase class
  CategoryDao(this.db) : super(db);

  //Future<List<Task>> getAllTasks() => select(tasks).get();
  Stream<List<CategoryData>> watchAllCategories({bool archive = false}) =>
      (select(category)
            ..where((a) => a.archive.equals(false) | a.archive.equals(archive))
            ..orderBy([(t) => OrderingTerm(expression: t.title)]))
          .watch();

  Stream<List<CategoryData>> watchAllCategoriesByType(OperationType type,
          {bool archive = false}) =>
      (select(category)
            ..where((a) => a.archive.equals(false) | a.archive.equals(archive))
            ..where((cat) => cat.operationType
                .equals(OperationTypeConverter().mapToSql(type)))
            ..orderBy([(t) => OrderingTerm(expression: t.title)]))
          .watch();

  Stream<List<CategoryCashflowBudget>> watchAllCategoryCashflowBudget(
      DateTime date) {
    DateTime monthStart = DateTime(date.year, date.month);
    DateTime monthEnd = date.month < 12
        ? DateTime(date.year, date.month + 1)
        : DateTime(date.year + 1, 1);

    return customSelectQuery(
      'SELECT *, '
      '(SELECT sum as sum FROM budget WHERE category = c.id AND date <= ? ORDER BY date LIMIT 1) AS "budget", '
      '(SELECT SUM(sum) as sum FROM cashflow WHERE category = c.id AND date BETWEEN ? AND ?) AS "cashflow" '
      'FROM category c ORDER BY title;',
      variables: [
        Variable.withDateTime(monthStart),
        Variable.withDateTime(monthStart),
        Variable.withDateTime(monthEnd)
      ],
      readsFrom: {category, cashflow, budget},
    ).watch().map((rows) {
      return rows
          .map((row) => CategoryCashflowBudget(
                CategoryData.fromData(row.data, db),
                row.readInt('budget') ?? 0,
                row.readInt('cashflow') ?? 0,
              ))
          //.where((a) => archive ? true : !a.account.archive)
          .toList();
    });
  }

  Future insertCategory(CategoryData entity) => into(category).insert(entity);

  Future updateCategory(CategoryData entity) =>
      update(category).replace(entity);
//  Future deleteTask(Task task) => delete(tasks).delete(task);
}

@UseDao(tables: [Account, Category, Operation, Balance, Cashflow])
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
    return into(budget).insert(entity);
  }

  Future<void> updateBudget(BudgetData entity) {
    return update(budget).replace(entity);
  }
}
