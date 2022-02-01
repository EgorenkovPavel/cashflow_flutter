import 'dart:async';

import 'package:money_tracker/common_blocs/sync/syncer/loading_state.dart';
import 'package:money_tracker/common_blocs/sync/syncer/sync_worker.dart';
import 'package:money_tracker/data/local/converters/budget_type_converter.dart';
import 'package:money_tracker/data/local/converters/operation_type_converter.dart';
import 'package:money_tracker/data/local/local_source.dart';
import 'package:money_tracker/data/remote/models/cloud_models.dart';
import 'package:money_tracker/data/remote/remote_source.dart';
import 'package:money_tracker/domain/models.dart';

class Syncer implements SyncWorker{
  final RemoteSource remoteSource;
  final LocalSource localSource;

  Syncer({
    required this.remoteSource,
    required this.localSource,
  });

  @override
  Stream<LoadingState> loadFromCloud(DateTime date) async* {

    var accountsTry = await remoteSource.getAccounts(date);
    var categoriesTry = await remoteSource.getCategories(date);
    var operationsTry = await remoteSource.getOperations(date);

    if (accountsTry.isFailure() ||
        categoriesTry.isFailure() ||
        operationsTry.isFailure()) {
      return;
    }

    final accounts = accountsTry.getOrDefault([]);
    final categories = categoriesTry.getOrDefault([]);
    final operations = operationsTry.getOrDefault([]);

    var accountCount = accounts.length;
    var categoryCount = categories.length;
    var operationCount = operations.length;

    yield (LoadingState(
      accountCount: accountCount,
      categoryCount: categoryCount,
      operationCount: operationCount,
    ));

    for (var cloudAccount in accounts){
      print('Load from cloud account ${cloudAccount.title}');
      await _loadAccountFromCloud(cloudAccount);

      accountCount--;
      yield (LoadingState(
        accountCount: accountCount,
        categoryCount: categoryCount,
        operationCount: operationCount,
      ));
    };

    for (var cloudCategory in categories){
      print('Load from cloud category ${cloudCategory.title}');
      await _loadCategoryFromCloud(cloudCategory);

      categoryCount--;
      yield (LoadingState(
        accountCount: accountCount,
        categoryCount: categoryCount,
        operationCount: operationCount,
      ));
    };

    for (var cloudOperation in operations){
      print('Load from cloud operation ${cloudOperation.id}');
      await _loadOperationFromCloud(cloudOperation);

      operationCount--;
      yield (LoadingState(
        accountCount: accountCount,
        categoryCount: categoryCount,
        operationCount: operationCount,
      ));
    };

  }

  Future<void> _loadAccountFromCloud(CloudAccount cloudAccount) async {
    var _account = await localSource.accountsSync.getByCloudId(cloudAccount.id);
    if (_account == null) {
      await localSource.accountsSync.insertFromCloud(Account(
        cloudId: cloudAccount.id,
        title: cloudAccount.title,
        isDebt: cloudAccount.isDebt,
      ));
    } else {
      await localSource.accountsSync.updateFromCloud(_account.copyWith(
        title: cloudAccount.title,
        isDebt: cloudAccount.isDebt,
      ));
    }
  }

  Future<void> _loadCategoryFromCloud(CloudCategory cloudCategory) async {
    var _category =
        await localSource.categoriesSync.getByCloudId(cloudCategory.id);
    if (_category == null) {
      await localSource.categoriesSync.insertFromCloud(Category(
        title: cloudCategory.title,
        cloudId: cloudCategory.id,
        operationType: const OperationTypeConverter()
            .mapToDart(cloudCategory.operationType)!,
        budgetType:
            const BudgetTypeConverter().mapToDart(cloudCategory.budgetType)!,
        budget: cloudCategory.budget,
      ));
    } else {
      await localSource.categoriesSync.updateFromCloud(_category.copyWith(
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
        await localSource.operationsSync.getByCloudId(cloudOperation.id);

    var _account =
        await localSource.accountsSync.getByCloudId(cloudOperation.account);
    var _category = cloudOperation.category == null
        ? null
        : await localSource.categoriesSync.getByCloudId(cloudOperation.category!);
    var _recAccount = cloudOperation.recAccount == null
        ? null
        : await localSource.accountsSync.getByCloudId(cloudOperation.recAccount!);

    if (_operation == null && !cloudOperation.deleted) {
      await localSource.operationsSync.insertFromCloud(Operation(
        cloudId: cloudOperation.id,
        date: cloudOperation.date,
        type: const OperationTypeConverter()
            .mapToDart(cloudOperation.operationType)!,
        account: _account!,
        category: _category,
        recAccount: _recAccount,
        sum: cloudOperation.sum,
      ));
    } else if (_operation != null && !cloudOperation.deleted) {
      await localSource.operationsSync.updateFromCloud(_operation.copyWith(
        cloudId: cloudOperation.id,
        date: cloudOperation.date,
        type: const OperationTypeConverter()
            .mapToDart(cloudOperation.operationType),
        account: _account!,
        category: _category,
        recAccount: _recAccount,
        sum: cloudOperation.sum,
      ));
    } else if (_operation != null && cloudOperation.deleted) {
      await localSource.operations.deleteById(_operation.id);
    }
  }

  CloudAccount _mapToCloudAccount(Account account) {
    return CloudAccount(
      id: account.cloudId,
      title: account.title,
      isDebt: account.isDebt,
      deleted: false,
    );
  }

  CloudCategory _mapToCloudCategory(Category category) {
    return CloudCategory(
      id: category.cloudId,
      title: category.title,
      operationType:
          const OperationTypeConverter().mapToSql(category.operationType)!,
      budgetType: const BudgetTypeConverter().mapToSql(category.budgetType)!,
      budget: category.budget,
      deleted: false,
    );
  }

  CloudOperation _mapToCloudOperation(Operation operation) {
    return CloudOperation(
      id: operation.cloudId,
      date: operation.date,
      operationType: const OperationTypeConverter().mapToSql(operation.type)!,
      account: operation.account.cloudId,
      category: operation.category?.cloudId,
      recAccount: operation.recAccount?.cloudId,
      sum: operation.sum,
      deleted: false,
    );
  }

  @override
  Stream<LoadingState> loadToCloud() async* {

    final accounts = await localSource.accountsSync.getAllNotSynced();
    final categories = await localSource.categoriesSync.getAllNotSynced();
    final operations = await localSource.operationsSync.getAllNotSynced();

    var accountCount = accounts.length;
    var categoryCount = categories.length;
    var operationCount = operations.length;

    yield (LoadingState(
      accountCount: accountCount,
      categoryCount: categoryCount,
      operationCount: operationCount,
    ));

    for (var account in accounts){
      print('Load to cloud account ${account.title}');
      await _loadAccountToCloud(account);

      accountCount--;
      yield (LoadingState(
        accountCount: accountCount,
        categoryCount: categoryCount,
        operationCount: operationCount,
      ));
    };

    for (var category in categories){
      print('Load to cloud category ${category.title}');
      await _loadCategoryToCloud(category);

      categoryCount--;
      yield (LoadingState(
        accountCount: accountCount,
        categoryCount: categoryCount,
        operationCount: operationCount,
      ));
    };

    for (var operation in operations){
      print('Load to cloud operation ${operation.id}');
      await _loadOperationToCloud(operation);

      operationCount--;
      yield (LoadingState(
        accountCount: accountCount,
        categoryCount: categoryCount,
        operationCount: operationCount,
      ));
    };
  }

  Future<void> _loadAccountToCloud(Account account) async {
    if (account.cloudId.isNotEmpty) {
      var res = await remoteSource.updateAccount(_mapToCloudAccount(account));
      if (res.isSuccess()) {
        await localSource.accountsSync.markAsSynced(account.id, account.cloudId);
      }
    } else {
      var _cloudId =
          await remoteSource.addAccount(_mapToCloudAccount(account));
      if (_cloudId.isSuccess()) {
        var res = await localSource.accountsSync
            .markAsSynced(account.id, _cloudId.getOrDefault(''));
        print('$res');
      }
    }
  }

  Future<void> _loadCategoryToCloud(Category category) async {
    if (category.cloudId.isNotEmpty) {
      var res =
          await remoteSource.updateCategory(_mapToCloudCategory(category));
      if (res.isSuccess()) {
        await localSource.categoriesSync
            .markAsSynced(category.id, category.cloudId);
      }
    } else {
      var _cloudId =
          await remoteSource.addCategory(_mapToCloudCategory(category));
      if (_cloudId.isSuccess()) {
        await localSource.categoriesSync
            .markAsSynced(category.id, _cloudId.getOrDefault(''));
      }
    }
  }

  Future<void> _loadOperationToCloud(Operation operation) async {
    if (operation.cloudId.isNotEmpty) {
      var res =
          await remoteSource.updateOperation(_mapToCloudOperation(operation));
      if (res.isSuccess()) {
        await localSource.operationsSync
            .markAsSynced(operation.id, operation.cloudId);
      }
    } else {
      var _cloudId =
          await remoteSource.addOperation(_mapToCloudOperation(operation));
      if (_cloudId.isSuccess()) {
        await localSource.operationsSync
            .markAsSynced(operation.id, _cloudId.getOrDefault(''));
      }
    }
  }
}
