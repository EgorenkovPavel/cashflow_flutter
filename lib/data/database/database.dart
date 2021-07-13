import 'package:money_tracker/data/database/account_dao.dart';
import 'package:money_tracker/data/database/category_dao.dart';
import 'package:money_tracker/data/database/operation_dao.dart';
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

  IntColumn get budgetType =>
      integer().named('budget_type').map(const BudgetTypeConverter())();

  IntColumn get budget => integer()();
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

class CategoryCashflowEntity {
  CategoryDB category;
  int cashflow;

  CategoryCashflowEntity({
    required this.category,
    required this.cashflow,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryCashflowEntity &&
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
    tables: [Accounts, Categories, Operations, Balances, Cashflows],
    daos: [AccountDao, CategoryDao, OperationDao])
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;

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
                title: d['account_title'],
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
