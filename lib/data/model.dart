import 'package:cashflow/data/operation_type.dart';
import 'package:flutter/material.dart';

import 'database.dart';

class Model extends ChangeNotifier{

  final db;

  Model() : db = Database();

  Future deleteAll() => db.deleteAll();

  //Accounts
  Stream<List<AccountData>> watchAllAccounts({bool archive = false}) => db.accountDao.watchAllAccounts(archive: archive);
  Stream<List<AccountWithBalance>> watchAllAccountsWithBalance({bool archive = false}) => db.accountDao.watchAllAccountsWithBalance(archive: archive);

  Future insertAccount(AccountData entity) => db.accountDao.insertAccount(entity);
  Future updateAccount(AccountData entity) => db.accountDao.updateAccount(entity);

  Stream<int> getTotalBalance() => db.accountDao.getTotalBalance();

  //Categories
  Stream<List<CategoryData>> watchAllCategories({bool archive = false}) => db.categoryDao.watchAllCategories(archive: archive);
  Stream<List<CategoryData>> watchAllCategoriesByType(OperationType type, {bool archive = false}) => db.categoryDao.watchAllCategoriesByType(type, archive: archive);

  Future insertCategory(CategoryData entity) => db.categoryDao.insertCategory(entity);
  Future updateCategory(CategoryData entity) => db.categoryDao.updateCategory(entity);

  //Operations
  Stream<List<OperationItem>> watchAllOperationItems() => db.operationDao.watchAllOperationItems();

  Future insertOperationItem(OperationItem entity) => db.operationDao.insertOperationItem(entity);
  Future insertOperation(OperationData entity) {
    if(entity.id == 0) {
      db.operationDao.insertOperation(entity);
    }
    else {
      db.operationDao.updateOperation(entity);
    }
  }

  Future deleteOperation(OperationData entity) => db.operationDao.deleteOperation(entity);
}