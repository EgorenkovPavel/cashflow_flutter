
import 'package:money_tracker/data/database/account_dao.dart';
import 'package:money_tracker/data/database/account_repository.dart';
import 'package:money_tracker/data/database/category_dao.dart';
import 'package:money_tracker/data/database/category_repository.dart';
import 'package:money_tracker/data/database/database.dart';
import 'package:money_tracker/data/database/operation_dao.dart';
import 'package:money_tracker/data/database/operation_repository.dart';

class DatabaseSource{
  final Database db;

  late final _accountRepo;
  late final _categoryRepo;
  late final _operationRepo;

  DatabaseSource(this.db){
    _accountRepo = AccountRepository(AccountDao(db));
    _categoryRepo = CategoryRepository(CategoryDao(db));
    _operationRepo = OperationRepository(OperationDao(db));
  }

  AccountRepository get accounts => _accountRepo;

  CategoryRepository get categories => _categoryRepo;

  OperationRepository get operations => _operationRepo;

  Future deleteAll() => db.deleteAll();

  Future<Map<String, List<Map<String, dynamic>>>> exportData() => db.getDbData();

  Future importData(Map<String, dynamic> data) => db.loadData(data);
}