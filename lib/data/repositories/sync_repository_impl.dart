import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:money_tracker/common_blocs/sync/loading_state.dart';
import 'package:money_tracker/data/sources/local/db_converters/budget_type_converter.dart';
import 'package:money_tracker/data/sources/local/db_converters/operation_type_converter.dart';
import 'package:money_tracker/data/sources/local/local_sync_source.dart';
import 'package:money_tracker/data/sources/network_info.dart';
import 'package:money_tracker/data/sources/remote/cloud_model_extensions.dart';
import 'package:money_tracker/data/sources/remote/remote_data_source.dart';
import 'package:money_tracker/data/sources/remote/table_dao.dart';
import 'package:money_tracker/domain/interfaces/sync_repository.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/domain/models/category/category.dart' as model;
import 'package:money_tracker/utils/exceptions.dart';
import 'package:money_tracker/utils/try.dart';

import '../sources/remote/models/cloud_models.dart';

class SyncRepositoryImpl implements SyncRepository {
  final LocalSyncSource _localSource;
  final RemoteDataSource _remoteSource;
  final NetworkInfo _networkInfo;

  SyncRepositoryImpl(this._remoteSource, this._localSource, this._networkInfo);

  @override
  Future<Try<void>> addToDatabase(User user) async {
    try {
      await _remoteSource.addUserToDatabase(user);

      return Success(true);
    } on NoRemoteDBException {
      return NoRemoteDBFailure();
    } on NetworkException {
      return NetworkFailure();
    }
  }

  @override
  Future<Try<void>> createDatabase(User user) async {
    try {
      await _remoteSource.createDatabase(user);

      return Success(true);
    } on NetworkException {
      return NetworkFailure();
    }
  }

  @override
  Future<Try<bool>> databaseExists(User user) async {
    try {
      return Success(await _remoteSource.databaseExists(user));
    } on NetworkException {
      return NetworkFailure();
    }
  }

  @override
  Future<Try<List<User>>> getAllUsers() async {
    try {
      return Success(await _remoteSource.getAllUsers());
    } on NoRemoteDBException {
      return NoRemoteDBFailure();
    } on NetworkException {
      return NetworkFailure();
    }
  }

  @override
  Future<Try<bool>> isAdmin(User user) async {
    try {
      return Success(await _remoteSource.isAdmin(user));
    } on NoRemoteDBException {
      return NoRemoteDBFailure();
    } on NetworkException {
      return NetworkFailure();
    }
  }

  @override
  Future<Try<void>> logIn(User user) async {
    try {
      return Success(await _remoteSource.connect(user));
    } on NoRemoteDBException {
      return NoRemoteDBFailure();
    } on NetworkException {
      return NetworkFailure();
    }
  }

  @override
  Future<void> logOut() => _remoteSource.disconnect();

  @override
  Stream<LoadingState> loadFromCloud(DateTime date) async* {

    final accountTable = _remoteSource.accounts;
    final categoryTable = _remoteSource.categories;
    final operationsTable = _remoteSource.operations;

    if (accountTable == null || categoryTable == null || operationsTable == null){
      return;
    }

    var accounts;
    var categories;
    var operations;

    try {
      accounts = await accountTable.getAll(date);
      categories = await categoryTable.getAll(date);
      operations = await operationsTable.getAll(date);
    } on NoRemoteDBException {
      return;
    } on NetworkException {
      return;
    }

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
      await _loadAccountFromCloud(cloudAccount);

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
      await _loadCategoryFromCloud(cloudCategory);

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
      await _loadOperationFromCloud(cloudOperation);

      operationCount--;
      yield (LoadingState(
        accountCount: accountCount,
        categoryCount: categoryCount,
        operationCount: operationCount,
      ));
    }
  }

  Future<void> _loadAccountFromCloud(CloudAccount cloudAccount) async {
    var _account =
        await _localSource.accountsSync.getByCloudId(cloudAccount.id);
    if (_account == null) {
      await _localSource.accountsSync.insertFromCloud(Account(
        cloudId: cloudAccount.id,
        title: cloudAccount.title,
        isDebt: cloudAccount.isDebt,
      ));
    } else {
      await _localSource.accountsSync.updateFromCloud(_account.copyWith(
        title: cloudAccount.title,
        isDebt: cloudAccount.isDebt,
      ));
    }
  }

  Future<void> _loadCategoryFromCloud(CloudCategory cloudCategory) async {
    var _category =
        await _localSource.categoriesSync.getByCloudId(cloudCategory.id);
    if (_category == null) {
      await _localSource.categoriesSync.insertFromCloud(model.Category(
        title: cloudCategory.title,
        cloudId: cloudCategory.id,
        operationType: const OperationTypeConverter()
            .mapToDart(cloudCategory.operationType)!,
        budgetType:
            const BudgetTypeConverter().mapToDart(cloudCategory.budgetType)!,
        budget: cloudCategory.budget,
      ));
    } else {
      await _localSource.categoriesSync.updateFromCloud(_category.copyWith(
        title: cloudCategory.title,
        cloudId: cloudCategory.id,
        operationType: const OperationTypeConverter()
            .mapToDart(cloudCategory.operationType),
        budgetType:
            const BudgetTypeConverter().mapToDart(cloudCategory.budgetType),
        budget: cloudCategory.budget,
      ));
    }
  }

  Future<void> _loadOperationFromCloud(CloudOperation cloudOperation) async {
    var _operation =
        await _localSource.operationsSync.getByCloudId(cloudOperation.id);

    var _account =
        await _localSource.accountsSync.getByCloudId(cloudOperation.account);
    var _category = cloudOperation.category == null
        ? null
        : await _localSource.categoriesSync
            .getByCloudId(cloudOperation.category!);
    var _recAccount = cloudOperation.recAccount == null
        ? null
        : await _localSource.accountsSync
            .getByCloudId(cloudOperation.recAccount!);

    if (_operation == null) {
      await _localSource.operationsSync.insertFromCloud(Operation(
        cloudId: cloudOperation.id,
        synced: true,
        deleted: cloudOperation.deleted,
        date: cloudOperation.date,
        type: const OperationTypeConverter()
            .mapToDart(cloudOperation.operationType)!,
        account: _account!,
        category: _category,
        recAccount: _recAccount,
        sum: cloudOperation.sum,
      ));
    } else {
      await _localSource.operationsSync.updateFromCloud(_operation.copyWith(
        cloudId: cloudOperation.id,
        synced: true,
        deleted: cloudOperation.deleted,
        date: cloudOperation.date,
        type: const OperationTypeConverter()
            .mapToDart(cloudOperation.operationType),
        account: _account!,
        category: _category,
        recAccount: _recAccount,
        sum: cloudOperation.sum,
      ));
    }
  }

  @override
  Stream<LoadingState> loadToCloud() async* {

    //TODO rewrite to streamController

    final accountTable = _remoteSource.accounts;
    final categoryTable = _remoteSource.categories;
    final operationTable = _remoteSource.operations;

    if (accountTable == null || categoryTable == null || operationTable == null){
      return;
    }

    final accounts = await _localSource.accountsSync.getAllNotSynced();
    final categories = await _localSource.categoriesSync.getAllNotSynced();
    final operations = await _localSource.operationsSync.getAllNotSynced();

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
      try {
        await _loadAccountToCloud(account, accountTable);
      }on NetworkException{
        return;
      }

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

      try {
        await _loadCategoryToCloud(category, categoryTable);
      }on NetworkException{
        return;
      }

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

      try {
        await _loadOperationToCloud(operation, operationTable);
      }on NetworkException{
        return;
      }

      operationCount--;
      yield (LoadingState(
        accountCount: accountCount,
        categoryCount: categoryCount,
        operationCount: operationCount,
      ));
    }
  }

  /// Throw [NoRemoteDBException] and [NetworkException]
  Future<void> _loadAccountToCloud(
    Account account,
    TableDAO<CloudAccount> accounts,
  ) async {
    if (account.cloudId.isNotEmpty) {
      await accounts.update(account.toCloudAccount());
      await _localSource.accountsSync.markAsSynced(account.id, account.cloudId);
    } else {
      var _cloudId = await accounts.add(account.toCloudAccount());
      await _localSource.accountsSync.markAsSynced(account.id, _cloudId);
    }
  }

  /// Throw [NoRemoteDBException] and [NetworkException]
  Future<void> _loadCategoryToCloud(
    model.Category category,
    TableDAO<CloudCategory> categories,
  ) async {
    if (category.cloudId.isNotEmpty) {
      await categories.update(category.toCloudCategory());
      await _localSource.categoriesSync
          .markAsSynced(category.id, category.cloudId);
    } else {
      var _cloudId = await categories.add(category.toCloudCategory());
      await _localSource.categoriesSync.markAsSynced(category.id, _cloudId);
    }
  }

  /// Throw [NoRemoteDBException] and [NetworkException]
  Future<void> _loadOperationToCloud(
    Operation operation,
    TableDAO<CloudOperation> operations,
  ) async {
    if (operation.cloudId.isNotEmpty) {
      await operations.update(operation.toCloudOperation());
      await _localSource.operationsSync
          .markAsSynced(operation.id, operation.cloudId);
    } else {
      var _cloudId = await operations.add(operation.toCloudOperation());
      await _localSource.operationsSync.markAsSynced(operation.id, _cloudId);
    }
  }

  @override
  Stream<bool> connectedToInternet() {
    return _networkInfo.connected();
  }
}
