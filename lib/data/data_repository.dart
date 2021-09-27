import 'package:money_tracker/data/cloud/cloud_account.dart';
import 'package:money_tracker/data/cloud/cloud_category.dart';
import 'package:money_tracker/data/cloud/cloud_operation.dart';
import 'package:money_tracker/data/cloud/cloud_source.dart';
import 'package:money_tracker/data/database/database_source.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/domain/models/sum_on_date.dart';

class DataRepository {
  final DatabaseSource _databaseSource;
  final CloudSource _cloudSource;

  DataRepository({
    required databaseSource,
    required cloudSource,
  })  : _databaseSource = databaseSource,
        _cloudSource = cloudSource;

  Future<void> logIn(String userId) async {
    await _cloudSource.logIn(userId);
  }

  Future<bool> cloudDbExists(String userId) {
    return _cloudSource.databaseExists(userId);
  }

  Future<void> createCloudDatabase(String userId) async {
    await _cloudSource.createDatabase(userId);
  }

  Future<void> logOut() async {
    await _cloudSource.logOut();
  }

  void _loadCloudAccounts(Iterable<CloudAccount> list) {
    list.forEach((cloudAccount) async {
      var _account =
          await _databaseSource.accounts.getByCloudId(cloudAccount.id);
      if (_account == null) {
        await _databaseSource.accounts.insert(Account(
          cloudId: cloudAccount.id,
          title: cloudAccount.title,
        ));
      } else {
        await _databaseSource.accounts
            .update(_account.copyWith(title: cloudAccount.title));
      }
      await _cloudSource.refreshAccountSyncDate(cloudAccount);
    });
  }

  void _loadCloudCategories(Iterable<CloudCategory> list) {
    list.forEach((cloudCategory) async {
      var _category =
          await _databaseSource.categories.getByCloudId(cloudCategory.id);
      if (_category == null) {
        await _databaseSource.categories.insert(Category(
          title: cloudCategory.title,
          cloudId: cloudCategory.id,
          operationType: cloudCategory.operationType,
          budgetType: cloudCategory.budgetType,
          budget: cloudCategory.budget,
        ));
      } else {
        await _databaseSource.categories.update(_category.copyWith(
          title: cloudCategory.title,
          cloudId: cloudCategory.id,
          operationType: cloudCategory.operationType,
          budgetType: cloudCategory.budgetType,
          budget: cloudCategory.budget,
        ));
      }
      await _cloudSource.refreshCategorySyncDate(cloudCategory);
    });
  }

  void _loadCloudOperations(Iterable<CloudOperation> list) {
    list.forEach((cloudOperation) async {
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

      if (_operation == null) {
        await _databaseSource.operations.insert(Operation(
          cloudId: cloudOperation.id,
          date: cloudOperation.date,
          type: cloudOperation.operationType,
          account: _account!,
          category: _category,
          recAccount: _recAccount,
          sum: cloudOperation.sum,
        ));
      } else {
        await _databaseSource.operations.update(_operation.copyWith(
          cloudId: cloudOperation.id,
          date: cloudOperation.date,
          type: cloudOperation.operationType,
          account: _account!,
          category: _category,
          recAccount: _recAccount,
          sum: cloudOperation.sum,
        ));
      }
      await _cloudSource.refreshOperationSyncDate(cloudOperation);
    });
  }

  Future<bool> syncData(DateTime date) async {
    var accouns = await _cloudSource.getAccounts(date);
    var categories = await _cloudSource.getCategories(date);
    var operations = await _cloudSource.getOperations(date);

    if (accouns == null || categories == null || operations == null){
      return false;
    }

    _loadCloudAccounts(accouns);
    _loadCloudCategories(categories);
    _loadCloudOperations(operations);

    return true;
  }

  Future<void> loadAllDataToCloud() async {
    var accounts = await getAllAccounts();
    accounts.forEach((account) async {
      var _cloudId = await _cloudSource.addAccount(
        CloudAccount(
          id: '',
          title: account.title,
        ),
      );
      await _databaseSource.accounts
          .update(account.copyWith(cloudId: _cloudId));
    });

    var categories = await getAllCategories();
    categories.forEach((category) async {
      var _cloudId = await _cloudSource.addCategory(CloudCategory(
        id: category.cloudId ?? '',
        title: category.title,
        operationType: category.operationType,
        budgetType: category.budgetType,
        budget: category.budget,
      ));
      await _databaseSource.categories
          .update(category.copyWith(cloudId: _cloudId));
    });

    var operations = await getAllOperations();
    operations.forEach((operation) async {
      var _cloudId = await _cloudSource.addOperation(CloudOperation(
        id: operation.cloudId ?? '',
        date: operation.date,
        operationType: operation.type,
        account: operation.account.cloudId!,
        category: operation.category?.cloudId ?? '',
        recAccount: operation.recAccount?.cloudId ?? '',
        sum: operation.sum,
      ));
      await _databaseSource.operations
          .update(operation.copyWith(cloudId: _cloudId));
    });
  }

  //Accounts

  Stream<List<Account>> watchAllAccounts() =>
      _databaseSource.accounts.watchAll();

  Future<List<Account>> getAllAccounts() => _databaseSource.accounts.getAll();

  Stream<List<AccountBalance>> watchAllAccountsBalance() =>
      _databaseSource.accounts.watchAllBalance();

  Future<List<AccountBalance>> getAllAccountsBalance() =>
      _databaseSource.accounts.getAllBalance();

  Stream<Account> watchAccountById(int id) =>
      _databaseSource.accounts.watchById(id);

  Future<Account> getAccountById(int id) =>
      _databaseSource.accounts.getById(id);

  Future<int> insertAccount(Account account) async {
    var _cloudId = await _cloudSource.addAccount(
      CloudAccount(
        id: account.cloudId ?? '',
        title: account.title,
      ),
    );
    var _id = await _databaseSource.accounts
        .insert(account.copyWith(cloudId: _cloudId));
    return _id;
  }

  Future updateAccount(Account account) async {
    await _cloudSource.updateAccount(CloudAccount(
      id: account.cloudId ?? '',
      title: account.title,
    ));
    await _databaseSource.accounts.update(account);
  }

  //Category

  Stream<List<Category>> watchAllCategories() =>
      _databaseSource.categories.watchAll();

  Future<List<Category>> getAllCategories() =>
      _databaseSource.categories.getAll();

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
    //TODO вызывается запись в облако и сразу подписка об изменении в облаке а уже потом запись в базе. получается 2 копии в базе и 1 в облаке
    var _cloudId = await _cloudSource.addCategory(CloudCategory(
      id: category.cloudId ?? '',
      title: category.title,
      operationType: category.operationType,
      budgetType: category.budgetType,
      budget: category.budget,
    ));
    var _id = await _databaseSource.categories
        .insert(category.copyWith(cloudId: _cloudId));
    return _id;
  }

  Future updateCategory(Category category) async {
    await _cloudSource.updateCategory(CloudCategory(
      id: category.cloudId ?? '',
      title: category.title,
      operationType: category.operationType,
      budgetType: category.budgetType,
      budget: category.budget,
    ));
    await _databaseSource.categories.update(category);
  }

  //Operation
  Future<List<Operation>> getAllOperations() =>
      _databaseSource.operations.getAll();

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
    var _cloudId = await _cloudSource.addOperation(CloudOperation(
      id: operation.cloudId ?? '',
      date: operation.date,
      operationType: operation.type,
      account: operation.account.cloudId!,
      category: operation.category?.cloudId ?? '',
      recAccount: operation.recAccount?.cloudId ?? '',
      sum: operation.sum,
    ));
    var _id = await _databaseSource.operations
        .insert(operation.copyWith(cloudId: _cloudId));
    return operation.copyWith(id: _id, cloudId: _cloudId);
  }

  Future updateOperation(Operation operation) async {
    await _cloudSource.updateOperation(CloudOperation(
      id: operation.cloudId ?? '',
      date: operation.date,
      operationType: operation.type,
      account: operation.account.cloudId!,
      category: operation.category?.cloudId ?? '',
      recAccount: operation.recAccount?.cloudId ?? '',
      sum: operation.sum,
    ));
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
    await _cloudSource.deleteOperation(operation.cloudId!);
    await _databaseSource.operations.deleteById(operation.id);
  }

  //Backup

  Future deleteAll() async {
    await _cloudSource.deleteAll();
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
