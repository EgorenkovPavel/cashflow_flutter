import 'package:money_tracker/src/data/interfaces/local_sync_source.dart';
import 'package:money_tracker/src/domain/interfaces/account_repository.dart';
import 'package:money_tracker/src/domain/interfaces/category_repository.dart';

import '../../../domain/interfaces/user_repository.dart';
import '../../../domain/models.dart';

class LocalSyncSourceImpl implements LocalSyncSource {
  final LocalSyncTable<BaseAccount> accountRepo;
  final LocalSyncTable<Category> categoryRepo;
  final LocalSyncTable<Operation> operationRepo;
  final UserRepository userRepository;
  final AccountRepository accountRepository;
  final CategoryRepository categoryRepository;

  LocalSyncSourceImpl({
    required this.accountRepo,
    required this.categoryRepo,
    required this.operationRepo,
    required this.userRepository,
    required this.accountRepository,
    required this.categoryRepository,
  });

  @override
  Future<List<User>> getAllUsers() => userRepository.getAllUsers();

  @override
  Future<List<BaseAccount>> getAllAccounts() =>
      accountRepository.getAllAccounts();

  @override
  Future<List<Category>> getAllCategories() =>
      categoryRepository.getAllCategories();

  @override
  Future<User?> getUserByGoogleId(String googleId) =>
      userRepository.getUserByGoogleId(googleId);

  @override
  LocalSyncTable<BaseAccount> get accounts => accountRepo;

  @override
  LocalSyncTable<Category> get categories => categoryRepo;

  @override
  LocalSyncTable<Operation> get operations => operationRepo;
}
