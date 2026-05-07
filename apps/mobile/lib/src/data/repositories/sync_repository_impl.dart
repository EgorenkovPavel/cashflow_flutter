import 'dart:async';

import 'package:money_tracker/src/data/services/sync/account_sync_service_impl.dart';

import '../../common_blocs/sync/loading_state.dart';
import '../../domain/interfaces/sync_repository.dart';
import '../../domain/interfaces/user_repository.dart';
import '../../domain/models.dart';
import '../interfaces/local_sync_source.dart';
import '../interfaces/network_info.dart';
import '../interfaces/remote_data_source.dart';
import '../services/sync/category_sync_service_impl.dart';
import '../services/sync/operation_sync_service_impl.dart';

class SyncRepositoryImpl implements SyncRepository {
  final LocalSyncSource _localSource;
  final RemoteDataSource _remoteSource;
  final NetworkInfo _networkInfo;
  final UserRepository _userRepository;

  SyncRepositoryImpl({
    required RemoteDataSource remoteSource,
    required LocalSyncSource localSource,
    required NetworkInfo networkInfo,
    required UserRepository userRepository,
  })
      : _remoteSource = remoteSource,
        _localSource = localSource,
        _networkInfo = networkInfo,
        _userRepository = userRepository;

  @override
  Future<void> addToDatabase(User user) =>
      _remoteSource.addUserToDatabase(user);

  @override
  Future<void> createDatabase({required User admin}) =>
      _remoteSource.createDatabase(admin);

  @override
  Future<bool> databaseExists({required User admin}) =>
      _remoteSource.databaseExists(admin);

  @override
  Future<Result<List<User>>> getAllUsers() => _remoteSource.getAllUsers();

  @override
  Result<bool> isCurrentAdmin() => _remoteSource.isCurrentAdmin();

  @override
  Future<void> logIn(User user) => _remoteSource.connect(user);

  @override
  Future<void> logOut() => _remoteSource.disconnect();

  @override
  Stream<LoadingState> downloadFromCloud(DateTime date) async* {
    final _accountSyncService = AccountSyncServiceImpl(
      localSource: _localSource,
      accountTable: _remoteSource.accounts.getOrThrow(),
    );
    final _categorySyncService = CategorySyncServiceImpl(
      localSource: _localSource,
      categoryTable: _remoteSource.categories.getOrThrow(),
    );
    final _operationSyncService = OperationSyncServiceImpl(
      localSource: _localSource,
      operationTable: _remoteSource.operations.getOrThrow(),
    );

    final cloudUsers = (await _remoteSource.getAllUsers()).getOrThrow();
    for (final cloudUser in cloudUsers) {
      final localUser = await _userRepository.getByGoogleId(
        cloudUser.googleId,
      );
      if (localUser == null) {
        await _userRepository.insert(cloudUser);
      }
    }

    final accountCount = await _accountSyncService.downloadFromCloud(date);
    final categoryCount = await _categorySyncService.downloadFromCloud(date);
    final operationCount = await _operationSyncService.downloadFromCloud(date);

    yield (LoadingState(
      accountCount: accountCount,
      categoryCount: categoryCount,
      operationCount: operationCount,
    ));

  }

  @override
  Stream<LoadingState> uploadToCloud() async* {
    final _accountSyncService = AccountSyncServiceImpl(
      localSource: _localSource,
      accountTable: _remoteSource.accounts.getOrThrow(),
    );
    final _categorySyncService = CategorySyncServiceImpl(
      localSource: _localSource,
      categoryTable: _remoteSource.categories.getOrThrow(),
    );
    final _operationSyncService = OperationSyncServiceImpl(
      localSource: _localSource,
      operationTable: _remoteSource.operations.getOrThrow(),
    );

    final accountCount = await _accountSyncService.uploadToCloud();
    final categoryCount = await _categorySyncService.uploadToCloud();
    final operationCount = await _operationSyncService.uploadToCloud();

    yield (LoadingState(
      accountCount: accountCount,
      categoryCount: categoryCount,
      operationCount: operationCount,
    ));
  }

  @override
  Stream<bool> connectedToInternet() {
    return _networkInfo.connected();
  }
}
