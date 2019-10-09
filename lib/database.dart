import 'package:moor_flutter/moor_flutter.dart';

part 'database.g.dart';

class Account extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
}

class Category extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
}

@UseMoor(tables: [Account, Category], daos: [AccountDao])
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