import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:money_tracker/src/domain/interfaces/data_repository.dart';

import '../../common_blocs/sync/loading_state.dart';
import '../../domain/interfaces/sync_repository.dart';
import '../../domain/models.dart';
import '../../domain/models/category/category.dart' as model;
import '../../domain/models/enum/currency.dart';
import '../../utils/exceptions.dart';
import '../interfaces/local_sync_source.dart';
import '../interfaces/network_info.dart';
import '../interfaces/remote_data_source.dart';
import '../sources/local/db_converters/operation_type_converter.dart';
import '../sources/remote/cloud_model_extensions.dart';
import '../sources/remote/daos/table_dao.dart';
import '../sources/remote/model_mapper.dart';
import '../sources/remote/models/cloud_models.dart';

class SyncRepositoryImpl implements SyncRepository {
  final LocalSyncSource _localSource;
  final RemoteDataSource _remoteSource;
  final NetworkInfo _networkInfo;
  final DataRepository _dataRepository;

  SyncRepositoryImpl({
    required RemoteDataSource remoteSource,
    required LocalSyncSource localSource,
    required NetworkInfo networkInfo,
    required DataRepository dataRepository,
  })  : _remoteSource = remoteSource,
        _localSource = localSource,
        _networkInfo = networkInfo,
        _dataRepository = dataRepository;

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
  Future<List<User>> getAllUsers() => _remoteSource.getAllUsers();

  @override
  bool isCurrentAdmin() => _remoteSource.isCurrentAdmin();

  @override
  Future<void> logIn(User user) => _remoteSource.connect(user);

  @override
  Future<void> logOut() => _remoteSource.disconnect();

  @override
  Stream<LoadingState> downloadFromCloud(DateTime date) async* {
    final accountTable = _remoteSource.accounts;
    final categoryTable = _remoteSource.categories;
    final operationsTable = _remoteSource.operations;

    if (accountTable == null ||
        categoryTable == null ||
        operationsTable == null) {
      return;
    }

    final cloudUsers = await _remoteSource.getAllUsers();
    for (final cloudUser in cloudUsers){
      final localUser = await _dataRepository.getUserByGoogleId(cloudUser.googleId);
      if (localUser == null){
        await _dataRepository.insertUser(cloudUser);
      }
    }

    Iterable<CloudAccount> accounts;
    Iterable<CloudCategory> categories;
    Iterable<CloudOperation> operations;

    accounts = await accountTable.getAll(date);
    categories = await categoryTable.getAll(date);
    operations = await operationsTable.getAll(date);

    var accountCount = accounts.length;
    var categoryCount = categories.length;
    var operationCount = operations.length;

    yield (LoadingState(
      accountCount: accountCount,
      categoryCount: categoryCount,
      operationCount: operationCount,
    ));

    for (var cloudAccount in accounts) {
      if (kDebugMode) {
        print('Load from cloud account ${cloudAccount.title}');
      }

      await _downloadAccountFromCloud(cloudAccount);

      accountCount--;
      yield (LoadingState(
        accountCount: accountCount,
        categoryCount: categoryCount,
        operationCount: operationCount,
      ));
    }

    for (var cloudCategory in categories) {
      if (kDebugMode) {
        print('Load from cloud category ${cloudCategory.title}');
      }

      await _downloadCategoryFromCloud(cloudCategory);

      categoryCount--;
      yield (LoadingState(
        accountCount: accountCount,
        categoryCount: categoryCount,
        operationCount: operationCount,
      ));
    }

    for (var cloudOperation in operations) {
      if (kDebugMode) {
        print('Load from cloud operation ${cloudOperation.id}');
      }

      await _downloadOperationFromCloud(cloudOperation);

      operationCount--;
      yield (LoadingState(
        accountCount: accountCount,
        categoryCount: categoryCount,
        operationCount: operationCount,
      ));
    }
  }

  Future<void> _downloadAccountFromCloud(CloudAccount cloudAccount) async {
    final account = await _localSource.accounts.getByCloudId(cloudAccount.id);
    final user = await _localSource.getUserByGoogleId(cloudAccount.user);
    if (account == null) {
      await _localSource.accounts.insertFromCloud(
        AccountModelMapper(user).insertModel(cloudAccount),
      );
    } else {
      await _localSource.accounts.updateFromCloud(
        AccountModelMapper(user).updateModel(account, cloudAccount),
      );
    }
  }

  Future<void> _downloadCategoryFromCloud(CloudCategory cloudCategory) async {
    var category = await _localSource.categories.getByCloudId(cloudCategory.id);
    if (category == null) {
      await _localSource.categories.insertFromCloud(
        const CategoryModelMapper().insertModel(cloudCategory),
      );
    } else {
      await _localSource.categories.updateFromCloud(
        const CategoryModelMapper().updateModel(category, cloudCategory),
      );
    }
  }

  Future<Account> _getAccountByCloudOperation(
    CloudOperation cloudOperation,
  ) async {
    final account =
        await _localSource.accounts.getByCloudId(cloudOperation.account);
    if (account == null) {
      throw NetworkException(
        'Can\'t find account by cloudId ${cloudOperation.account} in operation ${cloudOperation.id}',
      );
    } else {
      return account;
    }
  }

  Future<model.Category> _getCategoryByCloudOperation(
    CloudOperation cloudOperation,
  ) async {
    if (cloudOperation.category == null) {
      throw NetworkException(
        'Try to fetch category on null value in operation ${cloudOperation.id}',
      );
    } else {
      final category = await _localSource.categories.getByCloudId(
        cloudOperation.category!,
      );
      if (category == null) {
        throw NetworkException(
          'Can\'t find category by cloudId ${cloudOperation.category} in operation ${cloudOperation.id}',
        );
      } else {
        return category;
      }
    }
  }

  Future<Account> _getRecAccountByCloudOperation(
    CloudOperation cloudOperation,
  ) async {
    if (cloudOperation.recAccount == null) {
      throw NetworkException(
        'Try to fetch rec account on null value in operation ${cloudOperation.id}',
      );
    } else {
      final account =
          await _localSource.accounts.getByCloudId(cloudOperation.recAccount!);
      if (account == null) {
        throw NetworkException(
          'Can\'t find rec account by cloudId ${cloudOperation.recAccount} in operation ${cloudOperation.id}',
        );
      } else {
        return account;
      }
    }
  }

  Future<void> _downloadOperationFromCloud(
    CloudOperation cloudOperation,
  ) async {
    final operation =
        await _localSource.operations.getByCloudId(cloudOperation.id);

    if (operation == null) {
      final type =
          const OperationTypeConverter().fromSql(cloudOperation.operationType);

      final newOperation = await type.map(
        INPUT: () async => Operation.input(
            cloudId: cloudOperation.id,
            synced: true,
            deleted: cloudOperation.deleted,
            date: cloudOperation.date,
            account: await _getAccountByCloudOperation(cloudOperation),
            category: await _getCategoryByCloudOperation(cloudOperation),
            sum: cloudOperation.sum,
            currency: Currency.byName(cloudOperation.currencySent)),
        OUTPUT: () async => Operation.output(
          cloudId: cloudOperation.id,
          synced: true,
          deleted: cloudOperation.deleted,
          date: cloudOperation.date,
          account: await _getAccountByCloudOperation(cloudOperation),
          category: await _getCategoryByCloudOperation(cloudOperation),
          sum: cloudOperation.sum,
          currency: Currency.byName(cloudOperation.currencySent),
        ),
        TRANSFER: () async => Operation.transfer(
          cloudId: cloudOperation.id,
          synced: true,
          deleted: cloudOperation.deleted,
          date: cloudOperation.date,
          account: await _getAccountByCloudOperation(cloudOperation),
          recAccount: await _getRecAccountByCloudOperation(cloudOperation),
          sum: cloudOperation.sum,
          recSum: cloudOperation.recSum ?? 0,
          currencySent: Currency.byName(cloudOperation.currencySent),
          currencyReceived: Currency.byName(cloudOperation.currencyReceived),
        ),
      );

      await _localSource.operations.insertFromCloud(newOperation);
    } else {
      final type =
          const OperationTypeConverter().fromSql(cloudOperation.operationType);

      final newOperation = await type.map(
        INPUT: () async => Operation.input(
          id: operation.id,
          cloudId: cloudOperation.id,
          synced: true,
          deleted: cloudOperation.deleted,
          date: cloudOperation.date,
          account: await _getAccountByCloudOperation(cloudOperation),
          category: await _getCategoryByCloudOperation(cloudOperation),
          sum: cloudOperation.sum,
          currency: Currency.byName(cloudOperation.currencySent),
        ),
        OUTPUT: () async => Operation.output(
          id: operation.id,
          cloudId: cloudOperation.id,
          synced: true,
          deleted: cloudOperation.deleted,
          date: cloudOperation.date,
          account: await _getAccountByCloudOperation(cloudOperation),
          category: await _getCategoryByCloudOperation(cloudOperation),
          sum: cloudOperation.sum,
          currency: Currency.byName(cloudOperation.currencySent),
        ),
        TRANSFER: () async => Operation.transfer(
          id: operation.id,
          cloudId: cloudOperation.id,
          synced: true,
          deleted: cloudOperation.deleted,
          date: cloudOperation.date,
          account: await _getAccountByCloudOperation(cloudOperation),
          recAccount: await _getRecAccountByCloudOperation(cloudOperation),
          sum: cloudOperation.sum,
          recSum: cloudOperation.recSum ?? 0,
          currencySent: Currency.byName(cloudOperation.currencySent),
          currencyReceived: Currency.byName(cloudOperation.currencyReceived),
        ),
      );
      await _localSource.operations.updateFromCloud(newOperation);
    }
  }

  @override
  Stream<LoadingState> uploadToCloud() async* {
    //TODO rewrite to streamController

    final accountTable = _remoteSource.accounts;
    final categoryTable = _remoteSource.categories;
    final operationTable = _remoteSource.operations;

    if (accountTable == null ||
        categoryTable == null ||
        operationTable == null) {
      return;
    }

    final accounts = await _localSource.accounts.getAllNotSynced();
    final categories = await _localSource.categories.getAllNotSynced();
    final operations = await _localSource.operations.getAllNotSynced();

    var accountCount = accounts.length;
    var categoryCount = categories.length;
    var operationCount = operations.length;

    yield (LoadingState(
      accountCount: accountCount,
      categoryCount: categoryCount,
      operationCount: operationCount,
    ));

    for (var account in accounts) {
      if (kDebugMode) {
        print('Load to cloud account ${account.title}');
      }

      await _uploadAccountToCloud(account, accountTable);

      accountCount--;
      yield (LoadingState(
        accountCount: accountCount,
        categoryCount: categoryCount,
        operationCount: operationCount,
      ));
    }

    for (var category in categories) {
      if (kDebugMode) {
        print('Load to cloud category ${category.title}');
      }

      await _uploadCategoryToCloud(category, categoryTable);

      categoryCount--;
      yield (LoadingState(
        accountCount: accountCount,
        categoryCount: categoryCount,
        operationCount: operationCount,
      ));
    }

    for (var operation in operations) {
      if (kDebugMode) {
        print('Load to cloud operation ${operation.id}');
      }

      await _uploadOperationToCloud(operation, operationTable);

      operationCount--;
      yield (LoadingState(
        accountCount: accountCount,
        categoryCount: categoryCount,
        operationCount: operationCount,
      ));
    }
  }

  /// Throw [NoRemoteDBException] and [NetworkException]
  Future<void> _uploadAccountToCloud(
    Account account,
    TableDAO<CloudAccount> accounts,
  ) async {
    if (account.cloudId.isNotEmpty) {
      await accounts.update(account.toCloudAccount());
      await _localSource.accounts.markAsSynced(account.id, account.cloudId);
    } else {
      var cloudId = await accounts.add(account.toCloudAccount());
      await _localSource.accounts.markAsSynced(account.id, cloudId);
    }
  }

  /// Throw [NoRemoteDBException] and [NetworkException]
  Future<void> _uploadCategoryToCloud(
    model.Category category,
    TableDAO<CloudCategory> categories,
  ) async {
    if (category.cloudId.isNotEmpty) {
      await categories.update(category.toCloudCategory());
      await _localSource.categories.markAsSynced(category.id, category.cloudId);
    } else {
      var cloudId = await categories.add(category.toCloudCategory());
      await _localSource.categories.markAsSynced(category.id, cloudId);
    }
  }

  /// Throw [NoRemoteDBException] and [NetworkException]
  Future<void> _uploadOperationToCloud(
    Operation operation,
    TableDAO<CloudOperation> operations,
  ) async {
    if (operation.cloudId.isNotEmpty) {
      await operations.update(operation.toCloudOperation());
      await _localSource.operations
          .markAsSynced(operation.id, operation.cloudId);
    } else {
      var cloudId = await operations.add(operation.toCloudOperation());
      await _localSource.operations.markAsSynced(operation.id, cloudId);
    }
  }

  @override
  Stream<bool> connectedToInternet() {
    return _networkInfo.connected();
  }
}
