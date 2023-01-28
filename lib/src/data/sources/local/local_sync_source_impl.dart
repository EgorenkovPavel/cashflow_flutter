import 'package:money_tracker/src/data/interfaces/local_sync_source.dart';

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
  LocalSyncTable<Account> get accounts => accountRepo;

  @override
  LocalSyncTable<Category> get categories => categoryRepo;

  @override
  LocalSyncTable<Operation> get operations => operationRepo;
}
