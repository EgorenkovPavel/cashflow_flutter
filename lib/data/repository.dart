import 'dart:convert';
import 'dart:io';

import 'package:cashflow/data/mappers/account_mapper.dart';
import 'package:cashflow/data/mappers/category_cashflow_budget_mapper.dart';
import 'package:cashflow/data/mappers/operation_mapper.dart';
import 'package:cashflow/data/objects/category.dart';
import 'package:cashflow/data/objects/category_cashflow_budget.dart';
import 'package:cashflow/data/objects/operation.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/utils/google_http_client.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:googleapis/drive/v3.dart' as drive;

import 'database.dart';
import 'mappers/account_balance_mapper.dart';
import 'mappers/category_mapper.dart';
import 'objects/account.dart';
import 'objects/account_balance.dart';

class Repository extends ChangeNotifier {
  final Database db;

  Repository() : db = Database();

  Future deleteAll() => db.deleteAll();

  Future<Map<String, List<Map<String, dynamic>>>> getDbData() => db.getDbData();

  Future loadData(Map<String, dynamic> data) => db.loadData(data);

  Future loadOldData(Map<String, dynamic> data) => db.loadOldData(data);

  //Accounts
  Stream<List<Account>> watchAllAccounts({bool archive = false}) =>
      db.accountDao
          .watchAllAccounts(archive: archive)
          .map((list) => const AccountMapper().mapListToDart(list));

  Stream<List<AccountBalance>> watchAllAccountsBalance(
          {bool archive = false}) =>
      db.accountDao
          .watchAllAccountsWithBalance(archive: archive)
          .map((list) => const AccountBalanceMapper().mapListToDart(list));

  Stream<Account> getAccountById(int id) => db.accountDao
      .getAccountById(id)
      .map((a) => const AccountMapper().mapToDart(a));

  Future insertAccount(Account account) =>
      db.accountDao.insertAccount(const AccountMapper().mapToSql(account));

  Future updateAccount(Account account) =>
      db.accountDao.updateAccount(const AccountMapper().mapToSql(account));

  //Categories
  Stream<List<Category>> watchAllCategories({bool archive = false}) =>
      db.categoryDao
          .watchAllCategories(archive: archive)
          .map((list) => const CategoryMapper().mapListToDart(list));

  Stream<Category> getCategoryById(int id) => db.categoryDao
      .getCategoryById(id)
      .map((a) => const CategoryMapper().mapToDart(a));

  Stream<List<Category>> watchAllCategoriesByType(OperationType type,
          {bool archive = false}) =>
      db.categoryDao
          .watchAllCategoriesByType(type, archive: archive)
          .map((list) => const CategoryMapper().mapListToDart(list));

  Stream<List<CategoryCashflowBudget>> watchAllCategoryCashflowBudget(
          DateTime date) =>
      db.categoryDao.watchAllCategoryCashflowBudget(date).map(
          (list) => const CategoryCashflowBudgetMapper().mapListToDart(list));

  Stream<List<CategoryCashflowBudget>> watchCashflowBudgetByCategory(
          int categoryId) =>
      db.categoryDao.watchCashflowBudgetByCategory(categoryId).map(
          (list) => const CategoryCashflowBudgetMapper().mapListToDart(list));

  Future insertCategory(Category entity) =>
      db.categoryDao.insertCategory(const CategoryMapper().mapToSql(entity));

  Future updateCategory(Category entity) =>
      db.categoryDao.updateCategory(const CategoryMapper().mapToSql(entity));

  //Operations
  Stream<List<Operation>> watchAllOperations() => db.operationDao
      .watchAllOperationItems()
      .map((list) => const OperationMapper().mapListToDart(list));

  Stream<List<Operation>> watchAllOperationsByCategory(int categoryId) =>
      db.operationDao
          .watchAllOperationItemsByCategory(categoryId)
          .map((list) => const OperationMapper().mapListToDart(list));

  Stream<List<Operation>> watchLastOperations(int limit) =>
      db.operationDao
          .watchLastOperationItems(limit)
          .map((list) => const OperationMapper().mapListToDart(list));

  Future insertOperation(Operation entity) {
    if (entity.id == 0) {
      return db.operationDao
          .insertOperation(const OperationMapper().mapToOperationData(entity));
    } else {
      return db.operationDao
          .updateOperation(const OperationMapper().mapToOperationData(entity));
    }
  }

  Future deleteOperation(Operation entity) => db.operationDao
      .deleteOperation(const OperationMapper().mapToOperationData(entity));

  //Budget

  Stream<List<MonthBudget>> watchMonthBudget() =>
      db.budgetDao.watchMonthBudget();

  Stream<List<BudgetData>> watchBudgetByCategory(int categoryId) =>
      db.budgetDao.watchBudgetByCategory(categoryId);

  Stream<List<BudgetData>> watchBudget(DateTime date) =>
      db.budgetDao.watchBudget(date);

  Future<void> insertBudget(BudgetData entity) =>
      db.budgetDao.insertBudget(entity);

  Future<void> updateBudget(BudgetData entity) =>
      db.budgetDao.updateBudget(entity);

  Future<void> deleteBudget(BudgetData entity) =>
      db.budgetDao.deleteBudget(entity);

  //INTERNAL operations backup

  Future backup(GoogleHttpClient httpClient, String catalogId) async {
    final directory = await getTemporaryDirectory();
    var localFile = new File('${directory.path}/Cashflow backup.txt');
    await localFile.writeAsString(jsonEncode(await getDbData()));

    var media = new drive.Media(localFile.openRead(), localFile.lengthSync());

    drive.File file = drive.File();
    file.name = 'Cashflow backup';
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
      drive.Media file = await drive.DriveApi(httpClient)
          .files
          .get(fileId, downloadOptions: drive.DownloadOptions.FullMedia);

      final directory = await getTemporaryDirectory();
      var saveFile = new File('${directory.path}/test.json');

      List<int> dataStore = [];
      file.stream.listen((data) {
        print("DataReceived: ${data.length}");
        dataStore.insertAll(dataStore.length, data);
      }, onDone: () async {
        print("Task Done");
        await saveFile.writeAsBytes(dataStore);
        print("File saved at ${saveFile.path}");

        await deleteAll();

        Map<String, dynamic> data = jsonDecode(saveFile.readAsStringSync());
        print(data.toString());

        await loadData(data);
      }, onError: (error) {
        print("Some Error");
      });
    } catch (e) {
      print(e);
    }
  }

  void restoreOld(GoogleHttpClient httpClient, String fileId) async {
    try {
      drive.Media file = await drive.DriveApi(httpClient)
          .files
          .get(fileId, downloadOptions: drive.DownloadOptions.FullMedia);

      final directory = await getTemporaryDirectory();
      var saveFile = new File('${directory.path}/test.json');

      List<int> dataStore = [];
      file.stream.listen((data) {
        print("DataReceived: ${data.length}");
        dataStore.insertAll(dataStore.length, data);
      }, onDone: () async {
        print("Task Done");
        await saveFile.writeAsBytes(dataStore);
        print("File saved at ${saveFile.path}");

        await deleteAll();

        Map<String, dynamic> data = jsonDecode(saveFile.readAsStringSync());
        print(data.toString());

        await loadOldData(data);
      }, onError: (error) {
        print("Some Error");
      });
    } catch (e) {
      print(e);
    }
  }
}
