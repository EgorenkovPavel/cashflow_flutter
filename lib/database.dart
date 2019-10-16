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

class Operation extends Table{
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  IntColumn get operationType => integer().named('operation_type').map(const OperationTypeConverter())();
  IntColumn get account => integer().customConstraint('NULL REFERENCES account(id)')();
  IntColumn get category => integer().nullable().customConstraint('NULL REFERENCES category(id)')();
  IntColumn get recAccount => integer().nullable().customConstraint('NULL REFERENCES account(id)')();
  IntColumn get sum => integer()();
}

class OperationItem {

  OperationData _operation;
  AccountData account;
  CategoryData category;
  AccountData recAccount;

  OperationItem(this._operation, this.account, this.category,
      this.recAccount);

  OperationData get operationData =>
      _operation.copyWith(account: account.id, category: category.id, recAccount: recAccount.id);

  DateTime get date => _operation.date;
  OperationType get type => _operation.operationType;
  int get sum => _operation.sum;

  set date(DateTime value) {
    _operation.copyWith(date: value);
  }

  set type(OperationType value) {
    _operation.copyWith(operationType: value);
  }

  set sum(int value) {
    _operation.copyWith(sum: value);
  }
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

@UseMoor(tables: [Account, Category, Operation], daos: [AccountDao, CategoryDao, OperationDao])
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

  Future<List<AccountData>> getAllTasks() => select(account).get();
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
  Stream<List<CategoryData>> watchAllCategoriesByType(OperationType type) => (select(category)
      ..where((cat) => cat.operationType.equals(OperationTypeConverter().mapToSql(type)))).watch();

  Future insertCategory(CategoryData entity) => into(category).insert(entity);
  Future updateCategory(CategoryData entity) => update(category).replace(entity);
//  Future deleteTask(Task task) => delete(tasks).delete(task);
}

@UseDao(tables: [Account, Category, Operation])
class OperationDao extends DatabaseAccessor<Database> with _$OperationDaoMixin {
  final Database db;

  // Called by the AppDatabase class
  OperationDao(this.db) : super(db);

  Stream<List<OperationItem>> watchAllOperationItems(){

    final acc = alias(account, 'a');
    final rec = alias(account, 'rec');

    return select(operation).join(
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
    ).watch()
        .map(
          (rows) => rows.map(
            (row) {
          return OperationItem(
            row.readTable(operation),
            row.readTable(acc),
            row.readTable(category),
            row.readTable(rec)
          );
        },
      ).toList(),
    );
   }

  Future insertOperationItem(OperationItem entity) => into(operation).insert(entity.operationData);
  Future insertOperation(OperationData entity) => into(operation).insert(entity);

}