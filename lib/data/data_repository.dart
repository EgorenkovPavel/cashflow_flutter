import 'package:money_tracker/data/cloud/remote_source.dart';
import 'package:money_tracker/data/local/converters/budget_type_converter.dart';
import 'package:money_tracker/data/local/converters/operation_type_converter.dart';
import 'package:money_tracker/data/local/local_source.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/domain/models/sum_on_date.dart';
import 'package:money_tracker/domain/models/user.dart';
import 'package:money_tracker/utils/try.dart';

import 'cloud/models/cloud_models.dart';

class DataRepository {
  final LocalSource _databaseSource;
  final RemoteSource _remoteSource;

  DataRepository({
    required databaseSource,
    required cloudSource,
  })  : _databaseSource = databaseSource,
        _remoteSource = cloudSource;

  Future<Try<void>> logIn(String userId) => _remoteSource.logIn(userId);

  Future<Try<bool>> cloudDbExists(String userId) =>
      _remoteSource.databaseExists(userId);

  Stream<bool> isAdmin() => _remoteSource.isAdmin();

  Future<Try<void>> addNewUser(User user) => _remoteSource.addNewUser(user);

  Future<Try<Iterable<User>>> getUsers() => _remoteSource.getUsers();

  Future<Try<void>> createCloudDatabase(User user) =>
      _remoteSource.createDatabase(user);

  void logOut() => _remoteSource.logOut();

  Future<void> _loadCloudAccounts(Iterable<CloudAccount> list) async {
    await Future.forEach(list, (CloudAccount cloudAccount) async {
      var _account =
          await _databaseSource.accounts.getByCloudId(cloudAccount.id);
      if (_account == null) {
        await _databaseSource.accounts.insert(Account(
          cloudId: cloudAccount.id,
          title: cloudAccount.title,
          isDebt: cloudAccount.isDebt,
        ));
      } else {
        await _databaseSource.accounts.update(_account.copyWith(
          title: cloudAccount.title,
          isDebt: cloudAccount.isDebt,
        ));
      }
      await _remoteSource.refreshAccountSyncDate(cloudAccount.id);
    });
  }

  Future<void> _loadCloudCategories(Iterable<CloudCategory> list) async {
    await Future.forEach(list, (CloudCategory cloudCategory) async {
      var _category =
          await _databaseSource.categories.getByCloudId(cloudCategory.id);
      if (_category == null) {
        await _databaseSource.categories.insert(Category(
          title: cloudCategory.title,
          cloudId: cloudCategory.id,
          operationType: const OperationTypeConverter()
              .mapToDart(cloudCategory.operationType)!,
          budgetType:
              const BudgetTypeConverter().mapToDart(cloudCategory.budgetType)!,
          budget: cloudCategory.budget,
        ));
      } else {
        await _databaseSource.categories.update(_category.copyWith(
          title: cloudCategory.title,
          cloudId: cloudCategory.id,
          operationType: const OperationTypeConverter()
              .mapToDart(cloudCategory.operationType),
          budgetType:
              const BudgetTypeConverter().mapToDart(cloudCategory.budgetType),
          budget: cloudCategory.budget,
        ));
      }
      await _remoteSource.refreshCategorySyncDate(cloudCategory.id);
    });
  }

  Future<void> _loadCloudOperations(Iterable<CloudOperation> list) async {
    await Future.forEach(list, (CloudOperation cloudOperation) async {
      var _operation =
          await _databaseSource.operations.getByCloudId(cloudOperation.id);

      var _account =
          await _databaseSource.accounts.getByCloudId(cloudOperation.account);
      var _category = cloudOperation.category == null
          ? null
          : await _databaseSource.categories
              .getByCloudId(cloudOperation.category!);
      var _recAccount = cloudOperation.recAccount == null
          ? null
          : await _databaseSource.accounts
              .getByCloudId(cloudOperation.recAccount!);

      if (_operation == null && !cloudOperation.deleted) {
        await _databaseSource.operations.insert(Operation(
          cloudId: cloudOperation.id,
          date: cloudOperation.date,
          type: const OperationTypeConverter()
              .mapToDart(cloudOperation.operationType)!,
          account: _account!,
          category: _category,
          recAccount: _recAccount,
          sum: cloudOperation.sum,
        ));
      } else if(_operation != null && !cloudOperation.deleted){
        await _databaseSource.operations.update(_operation.copyWith(
          cloudId: cloudOperation.id,
          date: cloudOperation.date,
          type: const OperationTypeConverter()
              .mapToDart(cloudOperation.operationType),
          account: _account!,
          category: _category,
          recAccount: _recAccount,
          sum: cloudOperation.sum,
        ));
      }else if(_operation != null && cloudOperation.deleted){
        await _databaseSource.operations.deleteById(_operation.id);
      }
      await _remoteSource.refreshOperationSyncDate(cloudOperation.id);
    });
  }

  Future<bool> loadFromCloud(DateTime date) async {
    var accounts = await _remoteSource.getAccounts(date);
    var categories = await _remoteSource.getCategories(date);
    var operations = await _remoteSource.getOperations(date);

    if (accounts.isFailure() ||
        categories.isFailure() ||
        operations.isFailure()) {
      return false;
    }

    await _loadCloudAccounts(accounts.getOrDefault([]));
    await _loadCloudCategories(categories.getOrDefault([]));
    await _loadCloudOperations(operations.getOrDefault([]));

    return true;
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

  Future<void> loadToCloud() async {
    await _loadAccountsToCloud();
    await _loadCategoriesToCloud();
    await _loadOperationsToCloud();
  }

  Future<void> _loadAccountsToCloud() async {
    var accounts = await getAllAccountsWithEmptyCloudId();
    await Future.forEach(accounts, (Account account) async {
      var _cloudId =
          await _remoteSource.addAccount(_mapToCloudAccount(account));
      if (_cloudId.isSuccess()) {
        await _databaseSource.accounts
            .update(account.copyWith(cloudId: _cloudId.getOrDefault('')));
      }
    });
  }

  Future<void> _loadCategoriesToCloud() async {
    var categories = await getAllCategoriesWithEmptyCloudId();
    await Future.forEach(categories, (Category category) async {
      var _cloudId =
          await _remoteSource.addCategory(_mapToCloudCategory(category));
      if (_cloudId.isSuccess()) {
        await _databaseSource.categories
            .update(category.copyWith(cloudId: _cloudId.getOrDefault('')));
      }
    });
  }

  Future<void> _loadOperationsToCloud() async {
    var operations = await getAllOperationsWithEmptyCloudId();
    await Future.forEach(operations, (Operation operation) async {
      var _cloudId =
          await _remoteSource.addOperation(_mapToCloudOperation(operation));
      if (_cloudId.isSuccess()) {
        await _databaseSource.operations
            .update(operation.copyWith(cloudId: _cloudId.getOrDefault('')));
      }
    });
  }

  //Accounts

  Stream<List<Account>> watchAllAccounts() =>
      _databaseSource.accounts.watchAll();

  Future<List<Account>> getAllAccounts() => _databaseSource.accounts.getAll();

  Future<List<Account>> getAllAccountsWithEmptyCloudId() =>
      _databaseSource.accounts.getAllWithEmptyCloudId();

  Stream<List<AccountBalance>> watchAllAccountsBalance() =>
      _databaseSource.accounts.watchAllBalance();

  Future<List<AccountBalance>> getAllAccountsBalance() =>
      _databaseSource.accounts.getAllBalance();

  Stream<Account> watchAccountById(int id) =>
      _databaseSource.accounts.watchById(id);

  Future<Account> getAccountById(int id) =>
      _databaseSource.accounts.getById(id);

  Future<int> insertAccount(Account account) async {
    var _cloudId = await _remoteSource.addAccount(_mapToCloudAccount(account));
    return _cloudId.fold((success) async {
      return await _databaseSource.accounts
          .insert(account.copyWith(cloudId: success));
    }, (failure) async {
      return await _databaseSource.accounts.insert(account);
    });
  }

  Future updateAccount(Account account) async {
    await _remoteSource.updateAccount(_mapToCloudAccount(account));
    await _databaseSource.accounts.update(account);
  }

  //Category

  Stream<List<Category>> watchAllCategories() =>
      _databaseSource.categories.watchAll();

  Future<List<Category>> getAllCategories() =>
      _databaseSource.categories.getAll();

  Future<List<Category>> getAllCategoriesWithEmptyCloudId() =>
      _databaseSource.categories.getAllWithEmptyCloudId();

  Future<Category> getCategoryById(int id) =>
      _databaseSource.categories.getById(id);

  Stream<Category> watchCategoryById(int id) =>
      _databaseSource.categories.watchById(id);

  Stream<List<Category>> watchAllCategoriesByType(OperationType type) =>
      _databaseSource.categories.watchAllByType(type);

  Stream<List<SumOnDate>> watchCashflowByCategoryByMonth(int id) =>
      _databaseSource.categories.watchCashflowByCategoryByMonth(id);

  Stream<List<SumOnDate>> watchCashflowByCategoryByYear(int id) =>
      _databaseSource.categories.watchCashflowByCategoryByYear(id);

  Stream<List<CategoryCashflow>> watchCategoryCashflowByType(
          DateTime date, OperationType type) =>
      _databaseSource.categories.watchCategoryCashflowByType(date, type);

  Future<List<CategoryCashflow>> getCategoryCashflowByType(
          DateTime date, OperationType type) =>
      _databaseSource.categories.getCategoryCashflowByType(date, type);

  Future<List<Category>> getAllCategoriesByType(OperationType type) =>
      _databaseSource.categories.getAllByType(type);

  Future<int> insertCategory(Category category) async {
    var _cloudId =
        await _remoteSource.addCategory(_mapToCloudCategory(category));
    return _cloudId.fold((success) async {
      return await _databaseSource.categories
          .insert(category.copyWith(cloudId: success));
    }, (failure) async {
      return await _databaseSource.categories.insert(category);
    });
  }

  Future updateCategory(Category category) async {
    await _remoteSource.updateCategory(_mapToCloudCategory(category));
    await _databaseSource.categories.update(category);
  }

  //Operation
  Future<List<Operation>> getAllOperations() =>
      _databaseSource.operations.getAll();

  Future<List<Operation>> getAllOperationsWithEmptyCloudId() =>
      _databaseSource.operations.getAllWithEmptyCloudId();

  Stream<List<Operation>> watchAllOperations() =>
      _databaseSource.operations.watchAll();

  Stream<List<Operation>> watchAllOperationsByFilter(
          OperationListFilter filter) =>
      _databaseSource.operations.watchAllByFilter(filter);

  Future<Operation> getOperationById(int id) =>
      _databaseSource.operations.getById(id);

  Stream<List<Operation>> watchAllOperationsByAccount(int accountId) =>
      _databaseSource.operations.watchAllByAccount(accountId);

  Stream<List<Operation>> watchAllOperationsByCategory(int categoryId) =>
      _databaseSource.operations.watchAllByCategory(categoryId);

  Stream<List<Operation>> watchLastOperations(int limit) =>
      _databaseSource.operations.watchLast(limit);

  Future<Operation?> getLastOperation() => _databaseSource.operations.getLast();

  Future<Operation> insertOperation(Operation operation) async {
    var _cloudId =
        await _remoteSource.addOperation(_mapToCloudOperation(operation));
    return _cloudId.fold((success) async {
      var _id = await _databaseSource.operations
          .insert(operation.copyWith(cloudId: success));
      return operation.copyWith(id: _id, cloudId: success);
    }, (failure) async {
      var _id = await _databaseSource.operations.insert(operation);
      return operation.copyWith(id: _id);
    });
  }

  Future updateOperation(Operation operation) async {
    await _remoteSource.updateOperation(_mapToCloudOperation(operation));
    await _databaseSource.operations.update(operation);
  }

  Future<Operation> duplicateOperation(Operation operation) {
    var newOperation = operation.copyWith(
      id: 0,
      cloudId: '',
      date: DateTime.now(),
    );
    return insertOperation(newOperation);
  }

  Future deleteOperation(Operation operation) async {
    await _remoteSource.deleteOperation(_mapToCloudOperation(operation));
    await _databaseSource.operations.deleteById(operation.id);
  }

  //Backup

  Future deleteAll() async {
    await _remoteSource.deleteAll();
    await _databaseSource.deleteAll();
  }

  Future<Map<String, List<Map<String, dynamic>>>> exportData() {
    return _databaseSource.exportData();
  }

  Future<void> importData(Map<String, dynamic> data) async {
    await _databaseSource.deleteAll();
    await _databaseSource.importData(data);
  }
}
