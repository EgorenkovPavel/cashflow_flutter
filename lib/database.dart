import 'package:cashflow/data/operation_type.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'database.g.dart';

class Account extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
}

class Category extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  IntColumn get operationType => integer().named('operation_type').map(const OperationTypeConverter())();
}

class OperationTypeConverter extends TypeConverter<OperationType, int> {
  const OperationTypeConverter();

  @override
  OperationType mapToDart(int fromDb) {
    if (fromDb == null) {
      return null;
    }

    switch (fromDb){
      case 0: return OperationType.INPUT;
      case 1: return OperationType.OUTPUT;
      case 2: return OperationType.TRANSFER;
      default: return null;
    }
  }

  @override
  int mapToSql(OperationType value) {
    if (value == null) {
      return null;
    }

    switch(value){
      case OperationType.INPUT: return 0;
      case OperationType.OUTPUT: return 1;
      case OperationType.TRANSFER: return 2;
      default: return null;
    }
  }
}

@UseMoor(tables: [Account, Category], daos: [AccountDao, CategoryDao])
class Database extends _$Database{

  Database() : super(FlutterQueryExecutor.inDatabaseFolder(
      path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

}

@UseDao(tables: [Account])
class AccountDao extends DatabaseAccessor<Database> with _$AccountDaoMixin {
  final Database db;

  // Called by the AppDatabase class
  AccountDao(this.db) : super(db);

  //Future<List<Task>> getAllTasks() => select(tasks).get();
  Stream<List<AccountData>> watchAllAccounts() => select(account).watch();

  Future insertAccount(AccountData entity) => into(account).insert(entity);
  Future updateAccount(AccountData entity) => update(account).replace(entity);
//  Future deleteTask(Task task) => delete(tasks).delete(task);
}

@UseDao(tables: [Category])
class CategoryDao extends DatabaseAccessor<Database> with _$CategoryDaoMixin {
  final Database db;

  // Called by the AppDatabase class
  CategoryDao(this.db) : super(db);

  //Future<List<Task>> getAllTasks() => select(tasks).get();
  Stream<List<CategoryData>> watchAllCategories() => select(category).watch();

  Future insertCategory(CategoryData entity) => into(category).insert(entity);
  Future updateCategory(CategoryData entity) => update(category).replace(entity);
//  Future deleteTask(Task task) => delete(tasks).delete(task);
}