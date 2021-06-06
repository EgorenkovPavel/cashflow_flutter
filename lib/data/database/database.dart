import 'package:money_tracker/domain/models/budget_type.dart';
import 'package:money_tracker/domain/models/operation_type.dart';
import 'package:moor/ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:moor/moor.dart';
import 'dart:io';

part 'database.g.dart';

@DataClassName('AccountDB')
class Accounts extends Table {
  @override
  String get tableName => 'accounts';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();
}

@DataClassName('CategoryDB')
class Categories extends Table {
  @override
  String get tableName => 'categories';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();

  IntColumn get operationType =>
      integer().named('operation_type').map(const OperationTypeConverter())();
}

@DataClassName('OperationDB')
class Operations extends Table {
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

@DataClassName('BalanceDB')
class Balances extends Table {
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

@DataClassName('CashflowDB')
class Cashflows extends Table {
  @override
  String get tableName => 'cashflow';

  DateTimeColumn get date => dateTime()();

  IntColumn get operation =>
      integer().customConstraint('NULL REFERENCES operation(id)')();

  IntColumn get category =>
      integer().customConstraint('NULL REFERENCES category(id)')();

  IntColumn get sum => integer()();

  @override
  Set<Column> get primaryKey => {operation, category};
}

@DataClassName('BudgetDB')
class Budgets extends Table {
  @override
  String get tableName => 'budgets';

  IntColumn get year => integer()();

  IntColumn get month => integer()();

  IntColumn get category =>
      integer().customConstraint('NULL REFERENCES category(id)')();

  IntColumn get budgetType =>
      integer().named('budget_type').map(const BudgetTypeConverter())();

  IntColumn get sum => integer()();

  @override
  Set<Column> get primaryKey => {year, month, category, budgetType};
}

class BudgetItem {
  final int year;
  final int month;
  final CategoryDB category;
  final BudgetType budgetType;
  final int sum;

  BudgetItem(
      {required this.year,
      required this.month,
      required this.category,
      required this.budgetType,
      required this.sum});
}

class BalanceOnDate {
  DateTime date;
  int sum;

  BalanceOnDate(this.date, this.sum);
}

class AccountBalanceEntity {
  AccountDB account;
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

class CategoryBudgetEntity {
  CategoryDB category;
  int budget;

  CategoryBudgetEntity(this.category, this.budget);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryBudgetEntity &&
          runtimeType == other.runtimeType &&
          category == other.category;

  @override
  int get hashCode => category.hashCode;
}

class CategoryCashflowBudgetEntity {
  int year;
  int month;
  CategoryDB category;
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
  OperationDB operation;
  AccountDB account;
  CategoryDB? category;
  AccountDB? recAccount;

  OperationItem(
      {required this.operation,
      required this.account,
      this.category,
      this.recAccount});

  //TODO rewrite to date, type, account, category, recAccount sum
  OperationDB get operationData {
    switch (operation.operationType) {
      case OperationType.INPUT:
      case OperationType.OUTPUT:
        return operation.copyWith(account: account.id, category: category!.id);
      case OperationType.TRANSFER:
        return operation.copyWith(
            account: account.id, recAccount: recAccount!.id);
    }
  }

  DateTime get date => operation.date;

  OperationType get type => operation.operationType;

  int get sum => operation.sum;

  set date(DateTime value) {
    operation = operation.copyWith(date: value);
  }

  set type(OperationType value) {
    operation = operation.copyWith(operationType: value);
  }

  set sum(int value) {
    operation = operation.copyWith(sum: value);
  }
}

class BudgetTypeConverter extends TypeConverter<BudgetType, int> {
  const BudgetTypeConverter();

  @override
  BudgetType? mapToDart(int? fromDb) {
    if (fromDb == null) {
      return null;
    }

    switch (fromDb) {
      case 1:
        return BudgetType.MONTH;
      case 2:
        return BudgetType.YEAR;
      default:
        return null;
    }
  }

  @override
  int? mapToSql(BudgetType? value) {
    if (value == null) {
      return null;
    }

    switch (value) {
      case BudgetType.MONTH:
        return 1;
      case BudgetType.YEAR:
        return 2;
      default:
        return null;
    }
  }
}

class OperationTypeConverter extends TypeConverter<OperationType, int> {
  const OperationTypeConverter();

  @override
  OperationType? mapToDart(int? fromDb) {
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
  int? mapToSql(OperationType? value) {
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

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(
    tables: [Accounts, Categories, Operations, Balances, Cashflows, Budgets],
    daos: [AccountDao, CategoryDao, OperationDao, BudgetDao])
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future deleteAll() {
    return transaction(() async {
      await delete(balances).go();
      await delete(cashflows).go();
      await delete(operations).go();
      await delete(budgets).go();
      await delete(accounts).go();
      await delete(categories).go();
    });
  }

  Future<Map<String, List<Map<String, dynamic>>>> getDbData() async {
    var data = <String, List<Map<String, dynamic>>>{};

    var accounts = await accountDao.getAllAccounts();
    var categories = await categoryDao.getAllCategories();
    var operations = await operationDao.getAllOperations();
    var budgets = await budgetDao.getAllBudgets();

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

    data.putIfAbsent(
        'budget',
        () => budgets
            .map((p) => p.toJson(serializer: _DefaultValueSerializer()))
            .toList());

    return data;
  }

  Future loadData(Map<String, dynamic> data) async {
    var converter = const OperationTypeConverter();

    data.forEach((String key, dynamic value) async {
      if (key == 'account') {
        var accounts = <AccountDB>[];
        value.forEach((dynamic d) async {
          if (d is Map<String, dynamic>) {
            if (d.containsKey('account_title')) {
              accounts.add(AccountDB(
                id: int.parse(d['_id']),
                title: d['account_title'],
              ));
            } else {
              accounts.add(
                  AccountDB.fromJson(d, serializer: _DefaultValueSerializer()));
            }
          }
        });
        await accountDao.batchInsert(accounts);
      } else if (key == 'category') {
        var categories = <CategoryDB>[];
        value.forEach((dynamic d) async {
          if (d is Map<String, dynamic>) {
            if (d.containsKey('category_title')) {
              categories.add(CategoryDB(
                id: int.parse(d['_id']),
                title: d['category_title'],
                operationType:
                    converter.mapToDart(int.parse(d['category_type']))!,
              ));
            } else {
              categories.add(CategoryDB.fromJson(d,
                  serializer: _DefaultValueSerializer()));
            }
          }
        });
        await categoryDao.batchInsert(categories);
      } else if (key == 'operation') {
        var operations = <OperationDB>[];
        value.forEach((dynamic d) async {
          if (d is Map<String, dynamic>) {
            if (d.containsKey('operation_date')) {
              operations.add(OperationDB(
                id: int.parse(d['_id']),
                date: DateTime.fromMillisecondsSinceEpoch(
                    int.parse(d['operation_date'])),
                operationType:
                    converter.mapToDart(int.parse(d['operation_type']))!,
                account: int.parse(d['operation_account_id']),
                category: _getId(d['operation_category_id']),
                recAccount: _getId(d['operation_recipient_account_id']),
                sum: int.parse(d['operation_sum']),
              ));
            } else {
              operations.add(OperationDB.fromJson(d,
                  serializer: _DefaultValueSerializer()));
            }
          }
        });
        await operationDao.batchInsert(operations);
      }
      //TODO
      // else if (key == 'budget') {
      //   var budgets = <BudgetDB>[];
      //   value.forEach((dynamic d) async {
      //     if (d is Map<String, dynamic>) {
      //       budgets.add(
      //           BudgetDB.fromJson(d, serializer: _DefaultValueSerializer()));
      //     }
      //   });
      //   await budgetDao.batchInsert(budgets);
      // }
    });
  }

  int? _getId(String id) {
    if (id.isEmpty) {
      return null;
    } else {
      return int.parse(id);
    }
  }
}

@UseDao(tables: [Accounts, Balances])
class AccountDao extends DatabaseAccessor<Database> with _$AccountDaoMixin {
  // Called by the AppDatabase class
  AccountDao(Database db) : super(db);

  Stream<List<AccountDB>> watchAllAccounts() =>
      (select(accounts)..orderBy([(t) => OrderingTerm(expression: t.title)]))
          .watch();

  Future<List<AccountDB>> getAllAccounts() => select(accounts).get();

  Stream<AccountDB> watchAccountById(int id) =>
      (select(accounts)..where((c) => c.id.equals(id))).watchSingle();

  Future<AccountDB> getAccountById(int id) =>
      (select(accounts)..where((c) => c.id.equals(id))).getSingle();

  Future<int> insertAccount(AccountDB entity) => into(accounts).insert(entity);

  Future<bool> updateAccount(AccountDB entity) => update(accounts).replace(entity);

  Stream<int> getTotalBalance() {
    return customSelect(
      'SELECT SUM(sum) as sum FROM balance',
    ).watchSingle().map((row) => row.read<int>('sum'));
  }

  Stream<List<AccountBalanceEntity>> watchAllAccountsWithBalance(
      {bool archive = false}) {
    final sumBalance = balances.sum.sum();

    final query = db.select(accounts).join([
      leftOuterJoin(
        balances,
        balances.account.equalsExp(accounts.id),
        useColumns: false,
      )
    ]);
    query
      ..addColumns([sumBalance])
      ..groupBy([accounts.id])
      ..orderBy([OrderingTerm(expression: accounts.title)]);

    return query.watch().map((rows) {
      return rows
          .map((row) => AccountBalanceEntity(
              row.readTable(accounts), row.read(sumBalance) ?? 0))
          .toList();
    });
  }

  Future<List<AccountBalanceEntity>> getAllAccountsBalance() async {
    final sumBalance = balances.sum.sum();

    final query = db.select(accounts).join([
      leftOuterJoin(
        balances,
        balances.account.equalsExp(accounts.id),
        useColumns: false,
      )
    ]);
    query
      ..addColumns([sumBalance])
      ..groupBy([accounts.id])
      ..orderBy([OrderingTerm(expression: accounts.title)]);

    var result = await query.get();
    return result
        .map((row) => AccountBalanceEntity(
            row.readTable(accounts), row.read(sumBalance) ?? 0))
        .toList();
  }

  Future<void> batchInsert(List<AccountDB> _accounts) async {
    await batch((batch) {
      batch.insertAll(
        accounts,
        _accounts
            .map((a) => AccountsCompanion.insert(
                  id: Value(a.id),
                  title: a.title,
                ))
            .toList(),
      );
    });
  }

  Stream<List<BalanceOnDate>> watchBalanceOnPeriod(
      DateTime start, DateTime end) {
    final sumBalance = balances.sum.sum().cast<int>();
    //final date = CustomExpression<DateTime>("DATE(balance.date, 'start of day')");

    final day = balances.date.day.cast<int>();
    final month = balances.date.month.cast<int>();
    final year = balances.date.year.cast<int>();

    final query = db.selectOnly(balances)
      ..where(balances.date.isBiggerOrEqualValue(start) &
          balances.date.isSmallerOrEqualValue(end));

    query
      ..addColumns([day, month, year, sumBalance])
      ..groupBy([day, month, year])
      ..orderBy([
        OrderingTerm(expression: year),
        OrderingTerm(expression: month),
        OrderingTerm(expression: day)
      ]);

    return query.watch().map((list) {
      return list
          .map((c) => BalanceOnDate(
              DateTime(c.read(year), c.read(month), c.read(day)),
              c.read(sumBalance)))
          .toList();
    });
  }

  Stream<BalanceOnDate> watchBalance(DateTime date) {
    final sumBalance = balances.sum.sum();

    final query = db.selectOnly(balances)
      ..where(balances.date.isSmallerOrEqualValue(date))
      ..addColumns([sumBalance]);

    return query
        .watchSingle()
        .map((c) => BalanceOnDate(date, c.read(sumBalance) ?? 0));
  }
}

@UseDao(tables: [Categories, Budgets, Cashflows])
class CategoryDao extends DatabaseAccessor<Database> with _$CategoryDaoMixin {
  // Called by the AppDatabase class
  CategoryDao(Database db) : super(db);

  //Future<List<Task>> getAllTasks() => select(tasks).get();
  Stream<List<CategoryDB>> watchAllCategories() =>
      (select(categories)..orderBy([(t) => OrderingTerm(expression: t.title)]))
          .watch();

  Future<List<CategoryDB>> getAllCategories() =>
      (select(categories)..orderBy([(t) => OrderingTerm(expression: t.title)]))
          .get();

  Future<CategoryDB> getCategoryById(int id) =>
      (select(categories)..where((c) => c.id.equals(id))).getSingle();

  Stream<List<CategoryDB>> watchAllCategoriesByType(OperationType type) =>
      (select(categories)
            ..where((cat) => cat.operationType
                .equals(const OperationTypeConverter().mapToSql(type)))
            ..orderBy([(t) => OrderingTerm(expression: t.title)]))
          .watch();

  Future<List<CategoryDB>> getAllCategoriesByType(OperationType type) =>
      (select(categories)
        ..where((cat) => cat.operationType
            .equals(const OperationTypeConverter().mapToSql(type)))
        ..orderBy([(t) => OrderingTerm(expression: t.title)]))
          .get();

  Stream<List<CategoryCashflowBudgetEntity>> watchAllCategoryCashflowBudget(
      DateTime date) {
    var monthStart = DateTime(date.year, date.month);
    var monthEnd = date.month < 12
        ? DateTime(date.year, date.month + 1)
        : DateTime(date.year + 1, 1);

    return customSelect(
      'SELECT *, '
      '(SELECT sum as sum FROM budgets WHERE category = c.id AND date <= ? ORDER BY date DESC LIMIT 1) AS "budget", '
      '(SELECT SUM(sum) as sum FROM cashflow WHERE category = c.id AND date BETWEEN ? AND ?) AS "cashflow" '
      'FROM categories c ORDER BY title;',
      variables: [
        Variable.withDateTime(monthStart),
        Variable.withDateTime(monthStart),
        Variable.withDateTime(monthEnd)
      ],
      readsFrom: {categories, cashflows, budgets},
    ).watch().map((rows) {
      return rows
          .map((row) => CategoryCashflowBudgetEntity(
                date.year,
                date.month,
                CategoryDB.fromData(row.data, db),
                row.read<int>('budget'),
                row.read<int>('cashflow'),
              ))
          .toList();
    });
  }

  Stream<List<CategoryCashflowBudgetEntity>> watchCategoryCashflowBudgetByType(
      DateTime date, OperationType type) {
    var monthStart = DateTime(date.year, date.month);
    var monthEnd = date.month < 12
        ? DateTime(date.year, date.month + 1)
        : DateTime(date.year + 1, 1);

    return customSelect(
      'SELECT *, '
      '(SELECT sum as sum FROM budgets WHERE category = c.id AND date <= ? ORDER BY date DESC LIMIT 1) AS "budget", '
      '(SELECT SUM(sum) as sum FROM cashflow WHERE category = c.id AND date BETWEEN ? AND ?) AS "cashflow" '
      'FROM categories c '
      'WHERE operation_type = ? '
      'ORDER BY title;',
      variables: [
        Variable.withDateTime(monthStart),
        Variable.withDateTime(monthStart),
        Variable.withDateTime(monthEnd),
        Variable.withInt(OperationTypeConverter().mapToSql(type)!),
      ],
      readsFrom: {categories, cashflows, budgets},
    ).watch().map((rows) {
      return rows
          .map((row) => CategoryCashflowBudgetEntity(
                date.year,
                date.month,
                CategoryDB.fromData(row.data, db),
                row.read<int>('budget'),
                row.read<int>('cashflow'),
              ))
          .toList();
    });
  }

  Stream<List<CategoryBudgetEntity>> watchCategoryBudgetByType(
      OperationType type) {
    return customSelect(
      'SELECT *, '
      '(SELECT sum as sum FROM budgets WHERE category = c.id AND date <= ? ORDER BY date DESC LIMIT 1) AS "budget" '
      'FROM categories c '
      'WHERE operation_type = ? '
      'ORDER BY title;',
      variables: [
        Variable.withDateTime(DateTime.now()),
        Variable.withInt(OperationTypeConverter().mapToSql(type)!),
      ],
      readsFrom: {categories, budgets},
    ).watch().map((rows) {
      return rows
          .map((row) => CategoryBudgetEntity(
              CategoryDB.fromData(row.data, db), row.read<int>('budget')))
          .toList();
    });
  }

  Stream<List<CategoryCashflowBudgetEntity>> watchCashflowBudgetByCategory(
      int categoryId) {
    return customSelect(
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
      readsFrom: {categories, cashflows},
    ).watch().map((rows) {
      return rows.map((row) {
        print(row.read<DateTime>('date').toString());
        return CategoryCashflowBudgetEntity(
          row.read<DateTime>('date').year,
          row.read<DateTime>('date').month,
          CategoryDB.fromData(row.data, db),
          0,
          row.read<int>('sum'),
        );
      }).toList();
    });
  }

  Future<int> insertCategory(CategoryDB entity) =>
      into(categories).insert(entity);

  Future updateCategory(CategoryDB entity) =>
      update(categories).replace(entity);

  Stream<int> watchBudget(DateTime date) {
    return customSelect(
      'SELECT c.operation_type, '
      '(SELECT sum as sum FROM budgets WHERE category = c.id AND date <= ? ORDER BY date LIMIT 1) AS "budget" '
      'FROM categories c;',
      variables: [
        Variable.withDateTime(date),
      ],
      readsFrom: {categories, budgets},
    ).watch().map((rows) {
      return rows
          .map((row) => OperationTypeConverter()
                      .mapToDart(row.read<int>('operation_type')) ==
                  OperationType.INPUT
              ? row.read<int>('budget')
              : -(row.read<int>('budget')))
          .fold(0, (a, b) => a + b);
    });
  }

  Future<void> batchInsert(List<CategoryDB> _categories) async {
    await batch((batch) {
      batch.insertAll(
        categories,
        _categories
            .map((p) => CategoriesCompanion.insert(
                  id: Value(p.id),
                  title: p.title,
                  operationType: p.operationType,
                ))
            .toList(),
      );
    });
  }
}

@UseDao(tables: [Accounts, Categories, Operations, Balances, Cashflows])
class OperationDao extends DatabaseAccessor<Database> with _$OperationDaoMixin {
  // Called by the AppDatabase class
  OperationDao(Database db) : super(db);

  Stream<List<OperationItem>> watchAllOperationItems() {
    final acc = alias(accounts, 'a');
    final rec = alias(accounts, 'rec');

    return (select(operations)
          ..orderBy([
            (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc)
          ]))
        .join(
          [
            innerJoin(
              acc,
              acc.id.equalsExp(operations.account),
            ),
            leftOuterJoin(
              categories,
              categories.id.equalsExp(operations.category),
            ),
            leftOuterJoin(
              rec,
              rec.id.equalsExp(operations.recAccount),
            ),
          ],
        )
        .watch()
        .map(
          (rows) => rows.map(
            (row) {
              var op = row.readTable(operations);
              return OperationItem(
                  operation: op,
                  account: row.readTable(acc),
                  category: op.operationType == OperationType.TRANSFER
                      ? null
                      : row.readTable(categories),
                  recAccount: op.operationType == OperationType.TRANSFER
                      ? row.readTable(rec)
                      : null);
            },
          ).toList(),
        );
  }

  Stream<List<OperationItem>> watchAllOperationItemsByFilter(
      {required DateTime? start,
      required DateTime? end,
      required Set<int> accountIds,
      required Set<int> categoriesIds}) {
    final acc = alias(accounts, 'aсс');
    final rec = alias(accounts, 'rec');

    var sel = select(operations);
    if (start != null) {
      sel.where((t) => t.date.isBiggerOrEqualValue(start));
    }

    if (end != null) {
      sel.where((t) => t.date.isSmallerOrEqualValue(end));
    }

    if (accountIds.isNotEmpty) {
      sel.where(
          (t) => t.account.isIn(accountIds) | t.recAccount.isIn(accountIds));
    }

    if (categoriesIds.isNotEmpty) {
      sel.where((t) => t.category.isIn(categoriesIds));
    }

    return (sel
          ..orderBy([
            (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc)
          ]))
        .join(
          [
            innerJoin(
              acc,
              acc.id.equalsExp(operations.account),
            ),
            leftOuterJoin(
              categories,
              categories.id.equalsExp(operations.category),
            ),
            leftOuterJoin(
              rec,
              rec.id.equalsExp(operations.recAccount),
            ),
          ],
        )
        .watch()
        .map(
          (rows) => rows.map(
            (row) {
              var op = row.readTable(operations);
              return OperationItem(
                  operation: op,
                  account: row.readTable(acc),
                  category: op.operationType == OperationType.TRANSFER
                      ? null
                      : row.readTable(categories),
                  recAccount: op.operationType == OperationType.TRANSFER
                      ? row.readTable(rec)
                      : null);
            },
          ).toList(),
        );
  }

  Stream<List<OperationItem>> watchAllOperationItemsByCategory(int categoryId) {
    final acc = alias(accounts, 'a');
    final rec = alias(accounts, 'rec');

    return (select(operations)
          ..where((t) => t.category.equals(categoryId))
          ..orderBy([
            (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc)
          ]))
        .join(
          [
            innerJoin(
              acc,
              acc.id.equalsExp(operations.account),
            ),
            leftOuterJoin(
              categories,
              categories.id.equalsExp(operations.category),
            ),
            leftOuterJoin(
              rec,
              rec.id.equalsExp(operations.recAccount),
            ),
          ],
        )
        .watch()
        .map(
          (rows) => rows.map(
            (row) {
              var op = row.readTable(operations);
              return OperationItem(
                  operation: op,
                  account: row.readTable(acc),
                  category: op.operationType == OperationType.TRANSFER
                      ? null
                      : row.readTable(categories),
                  recAccount: op.operationType == OperationType.TRANSFER
                      ? row.readTable(rec)
                      : null);
            },
          ).toList(),
        );
  }

  Stream<List<OperationItem>> watchAllOperationItemsByAccount(int accountId) {
    final acc = alias(accounts, 'a');
    final rec = alias(accounts, 'rec');

    return (select(operations)
          ..where((t) =>
              t.account.equals(accountId) | t.recAccount.equals(accountId))
          ..orderBy([
            (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc)
          ]))
        .join(
          [
            innerJoin(
              acc,
              acc.id.equalsExp(operations.account),
            ),
            leftOuterJoin(
              categories,
              categories.id.equalsExp(operations.category),
            ),
            leftOuterJoin(
              rec,
              rec.id.equalsExp(operations.recAccount),
            ),
          ],
        )
        .watch()
        .map(
          (rows) => rows.map(
            (row) {
              var op = row.readTable(operations);
              return OperationItem(
                  operation: op,
                  account: row.readTable(acc),
                  category: op.operationType == OperationType.TRANSFER
                      ? null
                      : row.readTable(categories),
                  recAccount: op.operationType == OperationType.TRANSFER
                      ? row.readTable(rec)
                      : null);
            },
          ).toList(),
        );
  }

  Stream<List<OperationItem>> watchLastOperationItems(int limit) {
    final acc = alias(accounts, 'a');
    final rec = alias(accounts, 'rec');

    return (select(operations)
          ..orderBy([
            (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc)
          ])
          ..limit(limit))
        .join(
          [
            innerJoin(
              acc,
              acc.id.equalsExp(operations.account),
            ),
            leftOuterJoin(
              categories,
              categories.id.equalsExp(operations.category),
            ),
            leftOuterJoin(
              rec,
              rec.id.equalsExp(operations.recAccount),
            ),
          ],
        )
        .watch()
        .map(
          (rows) => rows.map(
            (row) {
              var op = row.readTable(operations);
              return OperationItem(
                  operation: op,
                  account: row.readTable(acc),
                  category: op.operationType == OperationType.TRANSFER
                      ? null
                      : row.readTable(categories),
                  recAccount: op.operationType == OperationType.TRANSFER
                      ? row.readTable(rec)
                      : null);
            },
          ).toList(),
        );
  }

  Future<OperationItem?> getLastOperationItem() {
    final acc = alias(accounts, 'a');
    final rec = alias(accounts, 'rec');

    return (select(operations)
          ..orderBy([
            (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc)
          ])
          ..limit(1))
        .join(
          [
            innerJoin(
              acc,
              acc.id.equalsExp(operations.account),
            ),
            leftOuterJoin(
              categories,
              categories.id.equalsExp(operations.category),
            ),
            leftOuterJoin(
              rec,
              rec.id.equalsExp(operations.recAccount),
            ),
          ],
        )
        .getSingle()
        .then((row) {
          var op = row.readTable(operations);
          return OperationItem(
              operation: op,
              account: row.readTable(acc),
              category: op.operationType == OperationType.TRANSFER
                  ? null
                  : row.readTable(categories),
              recAccount: op.operationType == OperationType.TRANSFER
                  ? row.readTable(rec)
                  : null);
        });
  }

  Future<List<OperationDB>> getAllOperations() => select(operations).get();

  Stream<OperationItem> getOperationById(int id) {
    final acc = alias(accounts, 'a');
    final rec = alias(accounts, 'rec');

    return (select(operations)..where((o) => o.id.equals(id)))
        .join(
          [
            innerJoin(
              acc,
              acc.id.equalsExp(operations.account),
            ),
            leftOuterJoin(
              categories,
              categories.id.equalsExp(operations.category),
            ),
            leftOuterJoin(
              rec,
              rec.id.equalsExp(operations.recAccount),
            ),
          ],
        )
        .watchSingle()
        .map((row) {
          var op = row.readTable(operations);
          return OperationItem(
              operation: op,
              account: row.readTable(acc),
              category: op.operationType == OperationType.TRANSFER
                  ? null
                  : row.readTable(categories),
              recAccount: op.operationType == OperationType.TRANSFER
                  ? row.readTable(rec)
                  : null);
        });
  }

  Future insertOperationItem(OperationItem entity) {
    return transaction(() async {
      var id = await into(operations).insert(entity.operationData);

      var operationData = entity.operationData.copyWith(id: id);
      await _insertAnalytic(operationData);
    });
  }

  Future<int> insertOperation(OperationDB entity) {
    return transaction(() async {
      var id = await into(operations).insert(entity);

      var operationData = entity.copyWith(id: id);
      await _insertAnalytic(operationData);
      return id;
    });
  }

  Future<int> updateOperation(OperationDB entity) {
    return transaction(() async {
      await deleteOperation(entity);
      return await insertOperation(entity);
    });
  }

  Future deleteOperation(OperationDB entity) {
    return transaction(() async {
      await delete(operations).delete(entity);
      await _deleteAnalytic(entity);
    });
  }

  Future deleteOperationById(int operationId) {
    return transaction(() async {
      await (delete(operations)..where((tbl) => tbl.id.equals(operationId)))
          .go();
      await _deleteAnalyticByOperationId(operationId);
    });
  }

  Future<void> batchInsert(List<OperationDB> operationData) async {
    var cashflowData = <CashflowDB>[];
    var balanceData = <BalanceDB>[];

    operationData.forEach((operation) {
      switch (operation.operationType) {
        case OperationType.INPUT:
          {
            balanceData.add(BalanceDB(
                date: operation.date,
                operation: operation.id,
                account: operation.account,
                sum: operation.sum));
            cashflowData.add(CashflowDB(
                date: operation.date,
                operation: operation.id,
                category: operation.category!,
                sum: operation.sum));
            break;
          }
        case OperationType.OUTPUT:
          {
            balanceData.add(BalanceDB(
                date: operation.date,
                operation: operation.id,
                account: operation.account,
                sum: -1 * operation.sum));
            cashflowData.add(CashflowDB(
                date: operation.date,
                operation: operation.id,
                category: operation.category!,
                sum: operation.sum));
            break;
          }
        case OperationType.TRANSFER:
          {
            balanceData.add(BalanceDB(
                date: operation.date,
                operation: operation.id,
                account: operation.account,
                sum: -1 * operation.sum));
            balanceData.add(BalanceDB(
                date: operation.date,
                operation: operation.id,
                account: operation.recAccount!,
                sum: operation.sum));
            break;
          }
      }
    });

    await batch((batch) {
      batch.insertAll(
        operations,
        operationData
            .map((p) => OperationsCompanion.insert(
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
        cashflows,
        cashflowData
            .map((p) => CashflowsCompanion.insert(
                date: p.date,
                operation: p.operation,
                category: p.category,
                sum: p.sum))
            .toList(),
      );
      batch.insertAll(
          balances,
          balanceData
              .map((p) => BalancesCompanion.insert(
                  date: p.date,
                  operation: p.operation,
                  account: p.account,
                  sum: p.sum))
              .toList());
    });
  }

  Future _insertAnalytic(OperationDB operation) async {
    switch (operation.operationType) {
      case OperationType.INPUT:
        {
          await into(balances).insert(BalanceDB(
              date: operation.date,
              operation: operation.id,
              account: operation.account,
              sum: operation.sum));
          await into(cashflows).insert(CashflowDB(
              date: operation.date,
              operation: operation.id,
              category: operation.category!,
              sum: operation.sum));
          break;
        }
      case OperationType.OUTPUT:
        {
          await into(balances).insert(BalanceDB(
              date: operation.date,
              operation: operation.id,
              account: operation.account,
              sum: -1 * operation.sum));
          await into(cashflows).insert(CashflowDB(
              date: operation.date,
              operation: operation.id,
              category: operation.category!,
              sum: operation.sum));
          break;
        }
      case OperationType.TRANSFER:
        {
          await into(balances).insert(BalanceDB(
              date: operation.date,
              operation: operation.id,
              account: operation.account,
              sum: -1 * operation.sum));
          await into(balances).insert(BalanceDB(
              date: operation.date,
              operation: operation.id,
              account: operation.recAccount!,
              sum: operation.sum));
          break;
        }
    }
  }

  Future _deleteAnalytic(OperationDB operation) async {
    await _deleteAnalyticByOperationId(operation.id);
  }

  Future _deleteAnalyticByOperationId(int operationId) async {
    await (delete(balances)
          ..where((entry) => entry.operation.equals(operationId)))
        .go();
    await (delete(cashflows)
          ..where((entry) => entry.operation.equals(operationId)))
        .go();
  }
}

@UseDao(tables: [Budgets, Categories])
class BudgetDao extends DatabaseAccessor<Database> with _$BudgetDaoMixin {
  BudgetDao(Database db) : super(db);

  Future<List<BudgetDB>> getAllBudgets() async {
    return select(budgets).get();
  }

  Future<List<BudgetItem>> getAllBudgetItems() async {
    var result = await select(budgets).join([
      innerJoin(
        categories,
        categories.id.equalsExp(budgets.category),
      ),
    ]).get();

    return result.map((row) {
      var budget = row.readTable(budgets);
      var category = row.readTable(categories);
      return BudgetItem(
          year: budget.year,
          month: budget.month,
          category: category,
          budgetType: budget.budgetType,
          sum: budget.sum);
    }).toList();
  }

  Future<BudgetItem> getBudget(
      int categoryId, BudgetType type, int month, int year) async {
    var row = await (select(budgets)
          ..where((tbl) =>
              tbl.budgetType
                  .equals(const BudgetTypeConverter().mapToSql(type)) &
              tbl.category.equals(categoryId) &
              tbl.month.equals(month) &
              tbl.year.equals(year)))
        .join([
      innerJoin(
        categories,
        categories.id.equalsExp(budgets.category),
      ),
    ]).getSingle();

    var budget = row.readTable(budgets);
    var category = row.readTable(categories);
    return BudgetItem(
        year: budget.year,
        month: budget.month,
        category: category,
        budgetType: budget.budgetType,
        sum: budget.sum);
  }

  Stream<List<BudgetItem>> watchBudgetByCategory(int categoryId) {
    return (select(budgets)
      ..where((tbl) => tbl.category.equals(categoryId)))
        .join([
      innerJoin(
        categories,
        categories.id.equalsExp(budgets.category),
      ),
    ])
        .watch()
        .map((rows) => rows.map((row) {
      var budget = row.readTable(budgets);
      var category = row.readTable(categories);
      return BudgetItem(
          year: budget.year,
          month: budget.month,
          category: category,
          budgetType: budget.budgetType,
          sum: budget.sum);
    }).toList());
  }

  Stream<List<BudgetItem>> watchBudgetByType(BudgetType type) {
    return (select(budgets)
          ..where((tbl) => tbl.budgetType
              .equals(const BudgetTypeConverter().mapToSql(type))))
        .join([
          innerJoin(
            categories,
            categories.id.equalsExp(budgets.category),
          ),
        ])
        .watch()
        .map((rows) => rows.map((row) {
              var budget = row.readTable(budgets);
              var category = row.readTable(categories);
              return BudgetItem(
                  year: budget.year,
                  month: budget.month,
                  category: category,
                  budgetType: budget.budgetType,
                  sum: budget.sum);
            }).toList());
  }

  Future<int> insertBudget(BudgetDB entity) {
    return into(budgets).insert(entity);
  }

  Future<bool> updateBudget(BudgetDB entity) {
    return update(budgets).replace(entity);
  }

  Future<int> deleteBudget(BudgetDB entity) {
    return (delete(budgets)
          ..where((tbl) =>
              tbl.budgetType.equals(
                  const BudgetTypeConverter().mapToSql(entity.budgetType)) &
              tbl.category.equals(entity.category) &
              tbl.month.equals(entity.month) &
              tbl.year.equals(entity.year)))
        .go();
  }

  Future<void> batchInsert(List<BudgetDB> _budgets) async {
    await batch((batch) {
      batch.insertAll(
        budgets,
        _budgets
            .map((p) => BudgetsCompanion.insert(
                  month: p.month,
                  year: p.year,
                  budgetType: p.budgetType,
                  category: p.category,
                  sum: p.sum,
                ))
            .toList(),
      );
    });
  }
}

class _DefaultValueSerializer extends ValueSerializer {
  const _DefaultValueSerializer();

  final _converter = const OperationTypeConverter();

  @override
  T fromJson<T>(dynamic json) {
    if (T == DateTime) {
      return DateTime.fromMillisecondsSinceEpoch(json as int) as T;
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
