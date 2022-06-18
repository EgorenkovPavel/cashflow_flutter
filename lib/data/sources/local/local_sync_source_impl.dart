import 'package:money_tracker/data/sources/local/local_sync_source.dart';

import '../../../domain/models.dart';

class LocalSyncSourceImpl extends LocalSyncSource {
  final LocalSyncTable<Account> accountRepo;
  final LocalSyncTable<Category> categoryRepo;
  final LocalSyncTable<Operation> operationRepo;

  LocalSyncSourceImpl({
    required this.accountRepo,
    required this.categoryRepo,
    required this.operationRepo,
  });

  @override
  LocalSyncTable<Account> get accountsSync => accountRepo;

  @override
  LocalSyncTable<Category> get categoriesSync => categoryRepo;

  @override
  LocalSyncTable<Operation> get operationsSync => operationRepo;
}
