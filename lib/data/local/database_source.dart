
import 'package:money_tracker/data/local/data/account_dao.dart';
import 'package:money_tracker/data/local/local_source.dart';
import 'package:money_tracker/data/local/repos/account_repository.dart';
import 'package:money_tracker/data/local/data/category_dao.dart';
import 'package:money_tracker/data/local/repos/category_repository.dart';
import 'package:money_tracker/data/local/data/database.dart';
import 'package:money_tracker/data/local/data/operation_dao.dart';
import 'package:money_tracker/data/local/repos/operation_repository.dart';
import 'package:money_tracker/domain/models/account.dart';
import 'package:money_tracker/domain/models/category.dart';
import 'package:money_tracker/domain/models/operation.dart';

class DatabaseSource extends LocalSource{
  final Database db;

  final AccountRepository _accountRepo;
  final CategoryRepository _categoryRepo;
  final OperationRepository _operationRepo;

  DatabaseSource(this.db) :
    _accountRepo = AccountRepository(AccountDao(db)),
    _categoryRepo = CategoryRepository(CategoryDao(db)),
    _operationRepo = OperationRepository(OperationDao(db));

  @override
  AccountRepository get accounts => _accountRepo;

  @override
  CategoryRepository get categories => _categoryRepo;

  @override
  OperationRepository get operations => _operationRepo;

  @override
  LocalSyncTable<Account> get accountsSync => _accountRepo;

  @override
  LocalSyncTable<Category> get categoriesSync => _categoryRepo;

  @override
  LocalSyncTable<Operation> get operationsSync => _operationRepo;

  @override
  Future deleteAll() => db.deleteAll();

  @override
  Future<Map<String, List<Map<String, dynamic>>>> exportData() => db.getDbData();

  @override
  Future importData(Map<String, dynamic> data) async {
    await deleteAll();
    return db.loadData(data);
  }
}