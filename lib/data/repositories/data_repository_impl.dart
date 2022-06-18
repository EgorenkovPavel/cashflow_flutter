
import '../../domain/interfaces/data/account_data_repository.dart';
import '../../domain/interfaces/data/category_data_repository.dart';
import '../../domain/interfaces/data/data_repository.dart';
import '../../domain/interfaces/data/operation_data_repository.dart';
import '../sources/local/data/account_dao.dart';
import '../sources/local/data/category_dao.dart';
import '../sources/local/data/database.dart';
import '../sources/local/data/operation_dao.dart';
import '../sources/local/repos/account_data_repository_impl.dart';
import '../sources/local/repos/category_data_repository_impl.dart';
import '../sources/local/repos/operation_data_repository_impl.dart';

class DataRepositoryImpl implements DataRepository {

  final Database db;

  final AccountDataRepositoryImpl _accountRepo;
  final CategoryDataRepositoryImpl _categoryRepo;
  final OperationDataRepositoryImpl _operationRepo;

  DataRepositoryImpl(this.db) :
        _accountRepo = AccountDataRepositoryImpl(AccountDao(db)),
        _categoryRepo = CategoryDataRepositoryImpl(CategoryDao(db)),
        _operationRepo = OperationDataRepositoryImpl(OperationDao(db));

  @override
  AccountDataRepository get accounts => _accountRepo;

  @override
  CategoryDataRepository get categories => _categoryRepo;

  @override
  OperationDataRepository get operations => _operationRepo;

}
