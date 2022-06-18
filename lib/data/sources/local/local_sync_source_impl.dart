import 'package:money_tracker/data/sources/local/local_sync_source.dart';

import '../../../domain/models.dart';
import 'data/account_dao.dart';
import 'data/category_dao.dart';
import 'data/database.dart';
import 'data/operation_dao.dart';
import 'repos/account_data_repository_impl.dart';
import 'repos/category_data_repository_impl.dart';
import 'repos/operation_data_repository_impl.dart';

class LocalSyncSourceImpl extends LocalSyncSource{

  final Database db;

  final LocalSyncTable<Account> _accountRepo;
  final LocalSyncTable<Category> _categoryRepo;
  final LocalSyncTable<Operation> _operationRepo;

  LocalSyncSourceImpl(this.db)
      : _accountRepo = AccountDataRepositoryImpl(AccountDao(db)),
        _categoryRepo = CategoryDataRepositoryImpl(CategoryDao(db)),
        _operationRepo = OperationDataRepositoryImpl(OperationDao(db));


  @override
  LocalSyncTable<Account> get accountsSync => _accountRepo;

  @override
  LocalSyncTable<Category> get categoriesSync => _categoryRepo;

  @override
  LocalSyncTable<Operation> get operationsSync => _operationRepo;

}