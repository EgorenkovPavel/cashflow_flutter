import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:money_tracker/src/data/sources/local/data/account_dao.dart';
import 'package:money_tracker/src/data/sources/local/data/category_dao.dart';
import 'package:money_tracker/src/data/sources/local/data/operation_dao.dart';
import 'package:money_tracker/src/data/sources/local/db_converters/budget_type_converter.dart';
import 'package:money_tracker/src/data/sources/local/db_converters/operation_type_converter.dart';
import 'package:money_tracker/src/domain/models/enum/budget_type.dart';
import 'package:money_tracker/src/domain/models/enum/operation_type.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../../../domain/models/enum/currency.dart';
import '../db_converters/currency_converter.dart';

part 'database.g.dart';

@DataClassName('AccountDB')
class Accounts extends Table {
  @override
  String get tableName => 'accounts';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get cloudId => text()();

  TextColumn get title => text()();

  TextColumn get currency => text().withDefault(const Constant('RUB')).map(const CurrencyConverter())();

  BoolColumn get isDebt => boolean().withDefault(const Constant(false))();

  BoolColumn get synced => boolean().withDefault(const Constant(false))();
}

@DataClassName('CategoryDB')
class Categories extends Table {
  @override
  String get tableName => 'categories';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get cloudId => text()();

  TextColumn get title => text()();

  IntColumn get operationType =>
      integer().named('operation_type').map(const OperationTypeConverter())();

  IntColumn get budgetType =>
      integer().named('budget_type').map(const BudgetTypeConverter())();

  IntColumn get budget => integer()();

  TextColumn get currency => text().withDefault(const Constant('RUB')).map(const CurrencyConverter())();

  BoolColumn get synced => boolean().withDefault(const Constant(false))();
}

@DataClassName('OperationDB')
class Operations extends Table {
  @override
  String get tableName => 'operations';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get cloudId => text()();

  DateTimeColumn get date => dateTime()();

  IntColumn get operationType =>
      integer().named('operation_type').map(const OperationTypeConverter())();

  IntColumn get account => integer().references(Accounts, #id)();

  IntColumn get category => integer().nullable().references(Categories, #id)();

  IntColumn get recAccount => integer().nullable().references(Accounts, #id)();

  IntColumn get sum => integer()();

  IntColumn get recSum => integer().withDefault(const Constant(0))();

  BoolColumn get synced => boolean().withDefault(const Constant(false))();

  BoolColumn get deleted => boolean().withDefault(const Constant(false))();
}

@DataClassName('BalanceDB')
class Balances extends Table {
  @override
  String get tableName => 'balance';

  DateTimeColumn get date => dateTime()();

  IntColumn get operation => integer().references(Operations, #id)();

  IntColumn get account => integer().references(Accounts, #id)();

  IntColumn get sum => integer()();

  @override
  Set<Column> get primaryKey => {operation, account};
}

@DataClassName('CashflowDB')
class Cashflows extends Table {
  @override
  String get tableName => 'cashflow';

  DateTimeColumn get date => dateTime()();

  IntColumn get operation => integer().references(Operations, #id)();

  IntColumn get category => integer().references(Categories, #id)();

  IntColumn get sum => integer()();

  @override
  Set<Column> get primaryKey => {operation, category};
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the local file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase(file);
  });
}

@DriftDatabase(
  tables: [Accounts, Categories, Operations, Balances, Cashflows],
  daos: [AccountDao, CategoryDao, OperationDao],
)
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 8;

  @override
  MigrationStrategy get migration =>
      MigrationStrategy(
        onCreate: (Migrator m) {
          return m.createAll();
        },
        onUpgrade: (Migrator m, int from, int to) async {
          if (from == 1) {
            // we added the dueDate property in the change from version 1
            await m.addColumn(accounts, accounts.isDebt);
          }

          if (from == 2) {
            await m.addColumn(accounts, accounts.cloudId);
            await m.addColumn(categories, categories.cloudId);
            await m.addColumn(operations, operations.cloudId);

            await m.addColumn(accounts, accounts.synced);
            await m.addColumn(categories, categories.synced);
            await m.addColumn(operations, operations.synced);
          }

          if (from < 6) {
            await m.addColumn(operations, operations.deleted);
          }

          if (from < 7) {
            await m.addColumn(accounts, accounts.currency);
          }

          if (from < 8) {
            await m.addColumn(categories, categories.currency);
            await m.addColumn(operations, operations.recSum);
          }
        },
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
          () =>
          accounts
              .map((p) => p.toJson(serializer: const _DefaultValueSerializer()))
              .toList(),
    );

    data.putIfAbsent(
      'category',
          () =>
          categories
              .map((p) => p.toJson(serializer: const _DefaultValueSerializer()))
              .toList(),
    );

    data.putIfAbsent(
      'operation',
          () =>
          operations
              .map((p) => p.toJson(serializer: const _DefaultValueSerializer()))
              .toList(),
    );

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
                currency: Currency.RUB,
                synced: false,
              ));
            } else {
              accounts.add(AccountDB.fromJson(
                d,
                serializer: const _DefaultValueSerializer(),
              ));
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
                operationType: converter.fromSql(
                  int.parse(d['category_type']),
                ),
                budget: int.parse(d['category_budget']),
                budgetType: const BudgetTypeConverter().fromSql(
                  int.parse(d['category_budget_type']),
                ),
                currency: Currency.RUB,
                synced: false,
              ));
            } else {
              categories.add(CategoryDB.fromJson(
                d,
                serializer: const _DefaultValueSerializer(),
              ));
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
                  int.parse(d['operation_date']),
                ),
                operationType:
                converter.fromSql(int.parse(d['operation_type'])),
                account: int.parse(d['operation_account_id']),
                category: _getId(d['operation_category_id']),
                recAccount: _getId(d['operation_recipient_account_id']),
                sum: int.parse(d['operation_sum']),
                recSum: 0,
                synced: false,
                deleted: false,
              ));
            } else {
              operations.add(OperationDB.fromJson(
                d,
                serializer: const _DefaultValueSerializer(),
              ));
            }
          }
        });
        await OperationDao(this).batchInsert(operations);
      }
    });
  }

  int? _getId(String id) {
    return id.isEmpty ? null : int.parse(id);
  }
}

class _DefaultValueSerializer extends ValueSerializer {
  const _DefaultValueSerializer();

  final _operationTypeConverter = const OperationTypeConverter();
  final _budgetTypeConverter = const BudgetTypeConverter();
  final _currencyConverter = const CurrencyConverter();

  @override
  T fromJson<T>(dynamic json) {
    if (T == DateTime) {
      return DateTime.fromMillisecondsSinceEpoch(json as int) as T;
    } else if (T == OperationType) {
      return _operationTypeConverter.fromSql(json as int) as T;
    } else if (T == BudgetType) {
      if (json == null) {
        return BudgetType.MONTH as T;
      }

      return _budgetTypeConverter.fromSql(json as int) as T;
    } else if (T == Currency) {
      if (json == null) {
        return Currency.RUB as T;
      }

      return _currencyConverter.fromSql(json as String) as T;
    } else if (T == int && json == null) {
      return 0 as T;
    } else if (T == String && json == null) {
      return '' as T;
    } else if (T == bool && json == null) {
      return false as T;
    }

    return json as T;
  }

  @override
  dynamic toJson<T>(T value) {
    if (value is DateTime) {
      return value.millisecondsSinceEpoch;
    } else if (value is OperationType) {
      return _operationTypeConverter.toSql(value);
    } else if (value is BudgetType) {
      return _budgetTypeConverter.toSql(value);
    }

    return value;
  }
}
