import 'package:money_tracker/src/data/interfaces/local_sync_source.dart';
import 'package:money_tracker/src/domain/interfaces/data_repository.dart';

import '../../../domain/models.dart';

class LocalSyncSourceImpl extends LocalSyncSource {
  final LocalSyncTable<BaseAccount> accountRepo;
  final LocalSyncTable<Category> categoryRepo;
  final LocalSyncTable<Operation> operationRepo;
  final DataRepository dataRepository;

  LocalSyncSourceImpl({
    required this.accountRepo,
    required this.categoryRepo,
    required this.operationRepo,
    required this.dataRepository,
  });

  Future<User?> getUserByGoogleId(String googleId) => dataRepository.getUserByGoogleId(googleId);

  @override
  LocalSyncTable<BaseAccount> get accounts => accountRepo;

  @override
  LocalSyncTable<Category> get categories => categoryRepo;

  @override
  LocalSyncTable<Operation> get operations => operationRepo;
}
