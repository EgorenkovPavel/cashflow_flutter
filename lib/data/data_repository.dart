import 'package:money_tracker/common_blocs/sync/syncer/loading_state.dart';
import 'package:money_tracker/data/data_source.dart';
import 'package:money_tracker/data/local/converters/budget_type_converter.dart';
import 'package:money_tracker/data/local/converters/operation_type_converter.dart';
import 'package:money_tracker/data/local/local_source.dart';
import 'package:money_tracker/data/remote/remote_source.dart';
import 'package:money_tracker/domain/models.dart';

import 'remote/models/cloud_models.dart';

class DataRepository implements DataSource{
  final LocalSource _localSource;
  final RemoteSource _remoteSource;

  DataRepository(this._localSource, this._remoteSource);

  @override
  AccountDataSource get accounts => _localSource.accounts;

  @override
  CategoryDataSource get categories => _localSource.categories;

  @override
  OperationDataSource get operations => _localSource.operations;

  @override
  UsersDataSource get users => _remoteSource;

  @override
  Future deleteAll() {
    return _localSource.deleteAll();
  }

  @override
  Future<Map<String, List<Map<String, dynamic>>>> exportData() {
    return _localSource.exportData();
  }

  @override
  Future importData(Map<String, dynamic> data) {
    return _localSource.importData(data);
  }

  @override
  Stream<LoadingState> loadFromCloud(DateTime date) async* {

    var accountsTry = await _remoteSource.accounts.getAll(date);
    var categoriesTry = await _remoteSource.categories.getAll(date);
    var operationsTry = await _remoteSource.operations.getAll(date);

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
    }

    for (var cloudCategory in categories){
      print('Load from cloud category ${cloudCategory.title}');
      await _loadCategoryFromCloud(cloudCategory);

      categoryCount--;
      yield (LoadingState(
        accountCount: accountCount,
        categoryCount: categoryCount,
        operationCount: operationCount,
      ));
    }

    for (var cloudOperation in operations){
      print('Load from cloud operation ${cloudOperation.id}');
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
    var _account = await _localSource.accountsSync.getByCloudId(cloudAccount.id);
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
      await _localSource.categoriesSync.insertFromCloud(Category(
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
        : await _localSource.categoriesSync.getByCloudId(cloudOperation.category!);
    var _recAccount = cloudOperation.recAccount == null
        ? null
        : await _localSource.accountsSync.getByCloudId(cloudOperation.recAccount!);

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
      deleted: operation.deleted,
    );
  }

  @override
  Stream<LoadingState> loadToCloud() async* {

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

    for (var account in accounts){
      print('Load to cloud account ${account.title}');
      await _loadAccountToCloud(account);

      accountCount--;
      yield (LoadingState(
        accountCount: accountCount,
        categoryCount: categoryCount,
        operationCount: operationCount,
      ));
    }

    for (var category in categories){
      print('Load to cloud category ${category.title}');
      await _loadCategoryToCloud(category);

      categoryCount--;
      yield (LoadingState(
        accountCount: accountCount,
        categoryCount: categoryCount,
        operationCount: operationCount,
      ));
    }

    for (var operation in operations){
      print('Load to cloud operation ${operation.id}');
      await _loadOperationToCloud(operation);

      operationCount--;
      yield (LoadingState(
        accountCount: accountCount,
        categoryCount: categoryCount,
        operationCount: operationCount,
      ));
    }
  }

  Future<void> _loadAccountToCloud(Account account) async {
    if (account.cloudId.isNotEmpty) {
      var res = await _remoteSource.accounts.update(_mapToCloudAccount(account));
      if (res.isSuccess()) {
        await _localSource.accountsSync.markAsSynced(account.id, account.cloudId);
      }
    } else {
      var _cloudId =
      await _remoteSource.accounts.add(_mapToCloudAccount(account));
      if (_cloudId.isSuccess()) {
        var res = await _localSource.accountsSync
            .markAsSynced(account.id, _cloudId.getOrDefault(''));
        print('$res');
      }
    }
  }

  Future<void> _loadCategoryToCloud(Category category) async {
    if (category.cloudId.isNotEmpty) {
      var res =
      await _remoteSource.categories.update(_mapToCloudCategory(category));
      if (res.isSuccess()) {
        await _localSource.categoriesSync
            .markAsSynced(category.id, category.cloudId);
      }
    } else {
      var _cloudId =
      await _remoteSource.categories.add(_mapToCloudCategory(category));
      if (_cloudId.isSuccess()) {
        await _localSource.categoriesSync
            .markAsSynced(category.id, _cloudId.getOrDefault(''));
      }
    }
  }

  Future<void> _loadOperationToCloud(Operation operation) async {
    if (operation.cloudId.isNotEmpty) {
      var res =
      await _remoteSource.operations.update(_mapToCloudOperation(operation));
      if (res.isSuccess()) {
        await _localSource.operationsSync
            .markAsSynced(operation.id, operation.cloudId);
      }
    } else {
      var _cloudId =
      await _remoteSource.operations.add(_mapToCloudOperation(operation));
      if (_cloudId.isSuccess()) {
        await _localSource.operationsSync
            .markAsSynced(operation.id, _cloudId.getOrDefault(''));
      }
    }
  }
}