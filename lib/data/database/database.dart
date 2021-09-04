import 'package:money_tracker/data/database/account_dao.dart';
import 'package:money_tracker/data/database/budget_type_converter.dart';
import 'package:money_tracker/data/database/category_dao.dart';
import 'package:money_tracker/data/database/operation_dao.dart';
import 'package:money_tracker/data/database/operation_type_converter.dart';
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

  TextColumn get cloudId => text().withDefault(const Constant(''))();

  TextColumn get title => text()();

  BoolColumn get isDebt => boolean().withDefault(const Constant(false))();
}

@DataClassName('CategoryDB')
class Categories extends Table {
  @override
  String get tableName => 'categories';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get cloudId => text().withDefault(const Constant(''))();

  TextColumn get title => text()();

  IntColumn get operationType =>
      integer().named('operation_type').map(const OperationTypeConverter())();

  IntColumn get budgetType =>
      integer().named('budget_type').map(const BudgetTypeConverter())();

  IntColumn get budget => integer()();
}

@DataClassName('OperationDB')
class Operations extends Table {
  @override
  String get tableName => 'operations';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get cloudId => text().withDefault(const Constant(''))();

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
    tables: [Accounts, Categories, Operations, Balances, Cashflows],
    daos: [AccountDao, CategoryDao, OperationDao])
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
      onCreate: (Migrator m) {
        return m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from == 1) {
          // we added the dueDate property in the change from version 1
          await m.addColumn(accounts, accounts.isDebt);
        }

        if (from >= 2){
          await m.addColumn(accounts, accounts.cloudId);
          await m.addColumn(categories, categories.cloudId);
          await m.addColumn(operations, operations.cloudId);
        }
      }
  );


  Future deleteAll() {
    return transaction(() async {
      await delete(balances).go();
      await delete(cashflows).go();
      await delete(operations).go();
      await delete(accounts).go();
      await delete(categories).go();
    });
  }

  Future<Map<String, List<Map<String, dynamic>>>> getDbData() async {
    var data = <String, List<Map<String, dynamic>>>{};

    var accounts = await AccountDao(this).getAllAccounts();
    var categories = await CategoryDao(this).getAllCategories();
    var operations = await OperationDao(this).getAllOperations();

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
        var accounts = <AccountDB>[];
        value.forEach((dynamic d) async {
          if (d is Map<String, dynamic>) {
            if (d.containsKey('account_title')) {
              accounts.add(AccountDB(
                id: int.parse(d['_id']),
                cloudId: '',
                title: d['account_title'],
                isDebt: false,
              ));
            } else {
              accounts.add(
                  AccountDB.fromJson(d, serializer: _DefaultValueSerializer()));
            }
          }
        });
        await AccountDao(this).batchInsert(accounts);
      } else if (key == 'category') {
        var categories = <CategoryDB>[];
        value.forEach((dynamic d) async {
          if (d is Map<String, dynamic>) {
            if (d.containsKey('category_title')) {
              categories.add(CategoryDB(
                id: int.parse(d['_id']),
                cloudId: '',
                title: d['category_title'],
                operationType: converter.mapToDart(
                  int.parse(d['category_type']),
                )!,
                budget: int.parse(d['category_budget']),
                budgetType: const BudgetTypeConverter().mapToDart(
                  int.parse(d['category_budget_type']),
                )!,
              ));
            } else {
              categories.add(CategoryDB.fromJson(d,
                  serializer: _DefaultValueSerializer()));
            }
          }
        });
        await CategoryDao(this).batchInsert(categories);
      } else if (key == 'operation') {
        var operations = <OperationDB>[];
        value.forEach((dynamic d) async {
          if (d is Map<String, dynamic>) {
            if (d.containsKey('operation_date')) {
              operations.add(OperationDB(
                id: int.parse(d['_id']),
                cloudId: '',
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
        await OperationDao(this).batchInsert(operations);
      }
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

class _DefaultValueSerializer extends ValueSerializer {
  const _DefaultValueSerializer();

  final _operationTypeConverter = const OperationTypeConverter();
  final _budgetTypeConverter = const BudgetTypeConverter();


  @override
  T fromJson<T>(dynamic json) {
    if (T == DateTime) {
      return DateTime.fromMillisecondsSinceEpoch(json as int) as T;
    } else if (T == OperationType) {
      return _operationTypeConverter.mapToDart(json as int) as T;
    } else if (T == BudgetType) {
      if (json == null){
        return BudgetType.MONTH as T;
      }
      return _budgetTypeConverter.mapToDart(json as int) as T;
    } else if (T == int && json == null){
      return 0 as T;
    }

    return json as T;
  }

  @override
  dynamic toJson<T>(T value) {
    if (value is DateTime) {
      return value.millisecondsSinceEpoch;
    } else if (value is OperationType) {
      return _operationTypeConverter.mapToSql(value);
    } else if (value is BudgetType) {
      return _budgetTypeConverter.mapToSql(value);
    }

    return value;
  }
}
