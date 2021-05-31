import 'dart:convert';
import 'dart:io';

import 'package:cashflow/data/database/database.dart';
import 'package:cashflow/data/mappers/account_mapper.dart';
import 'package:cashflow/data/mappers/budget_mapper.dart';
import 'package:cashflow/data/mappers/operation_mapper.dart';
import 'package:cashflow/data/objects/budget.dart';
import 'package:cashflow/data/objects/budget_type.dart';
import 'package:cashflow/data/objects/category.dart';
import 'package:cashflow/data/objects/operation.dart';
import 'package:cashflow/data/objects/operation_list_filter.dart';
import 'package:cashflow/data/objects/operation_type.dart';
import 'package:cashflow/utils/google_http_client.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:path_provider/path_provider.dart';

import 'database/database.dart';
import 'mappers/account_balance_mapper.dart';
import 'mappers/category_mapper.dart';
import 'objects/account.dart';
import 'objects/account_balance.dart';

class Repository extends ChangeNotifier {
  final _AccountRepo _accountRepo;
  final _CategoryRepo _categoryRepo;
  final _OperationRepo _operationRepo;
  final _BudgetRepo _budgetRepo;
  final _Backuper _backuper;

  Repository(Database db)
      : _accountRepo = _AccountRepo(db),
        _categoryRepo = _CategoryRepo(db),
        _operationRepo = _OperationRepo(db),
        _budgetRepo = _BudgetRepo(db),
        _backuper = _Backuper(db);

  //Accounts

  Stream<List<Account>> watchAllAccounts() => _accountRepo.watchAllAccounts();

  Stream<List<AccountBalance>> watchAllAccountsBalance() =>
      _accountRepo.watchAllAccountsBalance();

  Future<List<AccountBalance>> getAllAccountsBalance() =>
      _accountRepo.getAllAccountsBalance();

  Stream<Account> watchAccountById(int id) => _accountRepo.watchAccountById(id);

  Future<Account> getAccountById(int id) => _accountRepo.getAccountById(id);

  Future<int> insertAccount(Account account) =>
      _accountRepo.insertAccount(account);

  Future updateAccount(Account account) => _accountRepo.updateAccount(account);

  //Category

  Stream<List<Category>> watchAllCategories() =>
      _categoryRepo.watchAllCategories();

  Future<List<Category>> getAllCategories() =>
      _categoryRepo.getAllCategories();

  Future<Category> getCategoryById(int id) => _categoryRepo.getCategoryById(id);

  Stream<List<Category>> watchAllCategoriesByType(OperationType type) =>
      _categoryRepo.watchAllCategoriesByType(type);

  Future<int> insertCategory(Category entity) =>
      _categoryRepo.insertCategory(entity);

  Future updateCategory(Category entity) =>
      _categoryRepo.updateCategory(entity);

  //Operation

  Stream<List<Operation>> watchAllOperations() => _operationRepo.watchAllOperations();

  Stream<List<Operation>> watchAllOperationsByFilter(
      OperationListFilter filter) => _operationRepo.watchAllOperationsByFilter(filter);

  Stream<Operation> getOperationById(int id) => _operationRepo.getOperationById(id);

  Stream<List<Operation>> watchAllOperationsByAccount(int accountId) =>
  _operationRepo.watchAllOperationsByAccount(accountId);

  Stream<List<Operation>> watchAllOperationsByCategory(int categoryId) =>
  _operationRepo.watchAllOperationsByCategory(categoryId);

  Stream<List<Operation>> watchLastOperations(int limit) =>
  _operationRepo.watchLastOperations(limit);

  Future<Operation?> getLastOperation() => _operationRepo.getLastOperation();

  Future<int> insertOperation(Operation entity) => _operationRepo.insertOperation(entity);

  Future duplicateOperation(Operation entity) => _operationRepo.duplicateOperation(entity);

  Future deleteOperation(Operation entity) => _operationRepo.deleteOperation(entity);

  Future deleteOperationById(int operationId) => _operationRepo.deleteOperationById(operationId);

  //Budget

  Future<Budget> getBudget(int categoryId, BudgetType type, int month, int year) =>
  _budgetRepo.getBudget(categoryId, type, month, year);

  Stream<List<Budget>> watchBudgetByCategory(int categoryId) =>
  _budgetRepo.watchBudgetByCategory(categoryId);

  Stream<List<Budget>> watchBudgetByType(BudgetType type) => _budgetRepo.watchBudgetByType(type);

  Future<void> insertBudget(BudgetDB entity) => _budgetRepo.insertBudget(entity);

  Future<void> updateBudget(BudgetDB entity) => _budgetRepo.updateBudget(entity);

  Future<void> deleteBudget(Budget entity) => _budgetRepo.deleteBudget(entity);

  //Backup

  Future deleteAll() => _backuper.deleteAll();

  Future backup(
      GoogleHttpClient httpClient, String catalogId, String fileName) =>
      _backuper.backup(httpClient, catalogId, fileName);

  Future restore(GoogleHttpClient httpClient, String fileId) =>
      _backuper.restore(httpClient, fileId);
}

class _AccountRepo {
  final Database db;

  _AccountRepo(this.db);

  final List<Account> Function(List<AccountDB>) _mapAccountList =
      (list) => const AccountMapper().mapListToDart(list);

  final Account Function(AccountDB) _mapAccount =
      (item) => const AccountMapper().mapToDart(item);

  final AccountDB Function(Account) _mapAccountDB =
      (item) => const AccountMapper().mapToSql(item);

  final List<AccountBalance> Function(List<AccountBalanceEntity>)
      _mapAccountBalanceList =
      (list) => const AccountBalanceMapper().mapListToDart(list);

  Stream<List<Account>> watchAllAccounts() =>
      db.accountDao.watchAllAccounts().map(_mapAccountList);

  Stream<List<AccountBalance>> watchAllAccountsBalance() =>
      db.accountDao.watchAllAccountsWithBalance().map(_mapAccountBalanceList);

  Future<List<AccountBalance>> getAllAccountsBalance() async =>
      _mapAccountBalanceList(await db.accountDao.getAllAccountsBalance());

  Stream<Account> watchAccountById(int id) =>
      db.accountDao.watchAccountById(id).map(_mapAccount);

  Future<Account> getAccountById(int id) async =>
      _mapAccount(await db.accountDao.getAccountById(id));

  Future<int> insertAccount(Account account) =>
      db.accountDao.insertAccount(_mapAccountDB(account));

  Future updateAccount(Account account) =>
      db.accountDao.updateAccount(_mapAccountDB(account));
}

class _CategoryRepo {
  final Database db;

  _CategoryRepo(this.db);

  final List<Category> Function(List<CategoryDB>) _mapCategoryList =
      (list) => const CategoryMapper().mapListToDart(list);

  final Category Function(CategoryDB) _mapCategory =
      (item) => const CategoryMapper().mapToDart(item);

  final CategoryDB Function(Category) _mapCategoryDB =
      (item) => const CategoryMapper().mapToSql(item);

  Stream<List<Category>> watchAllCategories() =>
      db.categoryDao.watchAllCategories().map(_mapCategoryList);

  Future<List<Category>> getAllCategories() async =>
      _mapCategoryList(await db.categoryDao.getAllCategories());

  Future<Category> getCategoryById(int id) async =>
      _mapCategory(await db.categoryDao.getCategoryById(id));

  Stream<List<Category>> watchAllCategoriesByType(OperationType type) =>
      db.categoryDao.watchAllCategoriesByType(type).map(_mapCategoryList);

  Future<int> insertCategory(Category entity) =>
      db.categoryDao.insertCategory(_mapCategoryDB(entity));

  Future updateCategory(Category entity) =>
      db.categoryDao.updateCategory(_mapCategoryDB(entity));
}

class _OperationRepo {
  final Database db;

  _OperationRepo(this.db);

  final List<Operation> Function(List<OperationItem>) _mapOperationList =
      (list) => const OperationMapper().mapListToDart(list);

  final Operation Function(OperationItem) _mapOperation =
      (item) => const OperationMapper().mapToDart(item);

  final OperationDB Function(Operation) _mapOperationDB =
      (item) => const OperationMapper().mapToOperationData(item);

  Stream<List<Operation>> watchAllOperations() =>
      db.operationDao.watchAllOperationItems().map(_mapOperationList);

  Stream<List<Operation>> watchAllOperationsByFilter(
          OperationListFilter filter) =>
      db.operationDao
          .watchAllOperationItemsByFilter(
              start: filter.date?.start,
              end: filter.date?.end,
              accountIds: filter.accountsIds,
              categoriesIds: filter.categoriesIds)
          .map(_mapOperationList);

  Stream<Operation> getOperationById(int id) =>
      db.operationDao.getOperationById(id).map(_mapOperation);

  Stream<List<Operation>> watchAllOperationsByAccount(int accountId) =>
      db.operationDao
          .watchAllOperationItemsByAccount(accountId)
          .map(_mapOperationList);

  Stream<List<Operation>> watchAllOperationsByCategory(int categoryId) =>
      db.operationDao
          .watchAllOperationItemsByCategory(categoryId)
          .map(_mapOperationList);

  Stream<List<Operation>> watchLastOperations(int limit) =>
      db.operationDao.watchLastOperationItems(limit).map(_mapOperationList);

  Future<Operation?> getLastOperation() => db.operationDao
      .getLastOperationItem()
      .then((value) => value == null ? null : _mapOperation(value));

  Future<int> insertOperation(Operation entity) {
    if ((entity.id) == 0) {
      return db.operationDao.insertOperation(_mapOperationDB(entity));
    } else {
      return db.operationDao.updateOperation(_mapOperationDB(entity));
    }
  }

  Future duplicateOperation(Operation entity) {
    var newOperation = Operation(
      id: 0,
      date: DateTime.now(),
      type: entity.type,
      account: entity.account,
      category: entity.category,
      recAccount: entity.recAccount,
      sum: entity.sum,
    );
    return db.operationDao.insertOperation(_mapOperationDB(newOperation));
  }

  Future deleteOperation(Operation entity) =>
      db.operationDao.deleteOperation(_mapOperationDB(entity));

  Future deleteOperationById(int operationId) =>
      db.operationDao.deleteOperationById(operationId);
}

class _BudgetRepo {
  final Database db;

  _BudgetRepo(this.db);

  final List<Budget> Function(List<BudgetItem>) _mapBudgetList =
  (list) => const BudgetMapper().mapListToDart(list);

  final Budget Function(BudgetItem) _mapBudget =
      (list) => const BudgetMapper().mapToDart(list);

  final BudgetDB Function(Budget) _mapBudgetDB =
  (item) => BudgetDB(year: item.year, month: item.month, category: item.category.id, budgetType: item.type, sum: item.sum);

  Future<Budget> getBudget(int categoryId, BudgetType type, int month, int year) async =>
      _mapBudget(await db.budgetDao.getBudget(categoryId, type, month, year));

  //
  // Stream<List<BalanceOnDate>> watchMonthBudget() =>
  //     db.budgetDao.watchMonthBudget();
  //
  Stream<List<Budget>> watchBudgetByCategory(int categoryId) =>
      db.budgetDao.watchBudgetByCategory(categoryId).map(_mapBudgetList);

  Stream<List<Budget>> watchBudgetByType(BudgetType type) =>
      db.budgetDao.watchBudgetByType(type).map(_mapBudgetList);

  //
  // Stream<List<BudgetData>> watchBudget(DateTime date) =>
  //     db.budgetDao.watchBudget(date);
  //
  Future<void> insertBudget(BudgetDB entity) =>
      db.budgetDao.insertBudget(entity);

  Future<void> updateBudget(BudgetDB entity) =>
      db.budgetDao.updateBudget(entity);

  Future<void> deleteBudget(Budget entity) =>
      db.budgetDao.deleteBudget(_mapBudgetDB(entity));
}

class _Backuper {
  final Database db;

  _Backuper(this.db);

  Future deleteAll() => db.deleteAll();

  Future<Map<String, List<Map<String, dynamic>>>> _getDbData() => db.getDbData();

  Future _loadData(Map<String, dynamic> data) => db.loadData(data);

  Future backup(
      GoogleHttpClient httpClient, String catalogId, String fileName) async {
    final directory = await getTemporaryDirectory();
    var localFile = File('${directory.path}/$fileName.txt');
    await localFile.writeAsString(jsonEncode(await _getDbData()));

    var media = drive.Media(localFile.openRead(), localFile.lengthSync());

    var file = drive.File();
    file.name = fileName;
    file.parents = [catalogId];
    file.mimeType = 'application/json';

    try {
      var response = await drive.DriveApi(httpClient)
          .files
          .create(file, uploadMedia: media);
      print(response);
    } catch (e) {
      print(e);
    }
  }

  Future restore(GoogleHttpClient httpClient, String fileId) async {
    try {
      var file = await drive.DriveApi(httpClient).files.get(fileId,
          downloadOptions: drive.DownloadOptions.fullMedia) as drive.Media;

      final directory = await getTemporaryDirectory();
      var saveFile = File('${directory.path}/test.json');

      var dataStore = <int>[];
      file.stream.listen((data) {
        print('DataReceived: ${data.length}');
        dataStore.insertAll(dataStore.length, data);
      }, onDone: () async {
        print('Task Done');
        await saveFile.writeAsBytes(dataStore);
        print('File saved at ${saveFile.path}');

        await deleteAll();

        Map<String, dynamic> data = jsonDecode(saveFile.readAsStringSync());
        print(data.toString());

        await _loadData(data);
      }, onError: (error) {
        print('Some Error');
      });
    } catch (e) {
      print(e);
    }
  }
}
