import 'package:cashflow/data/operation_type.dart';
import 'package:flutter/material.dart';

import 'database.dart';

class Model extends ChangeNotifier{

  final db;

  Model() : db = Database();

  //Accounts
  Stream<List<AccountData>> watchAllAccounts() => db.accountDao.watchAllAccounts();

  Future insertAccount(AccountData entity) => db.accountDao.insertAccount(entity);
  Future updateAccount(AccountData entity) => db.accountDao.updateAccount(entity);

  //Categories
  Stream<List<CategoryData>> watchAllCategories() => db.categoryDao.watchAllCategories();
  Stream<List<CategoryData>> watchAllCategoriesByType(OperationType type) => db.categoryDao.watchAllCategoriesByType(type);

  Future insertCategory(CategoryData entity) => db.categoryDao.insertCategory(entity);
  Future updateCategory(CategoryData entity) => db.categoryDao.updateCategory(entity);

  //Operations
  Stream<List<OperationItem>> watchAllOperationItems() => db.operationDao.watchAllOperationItems();

  Future insertOperationItem(OperationItem entity) => db.operationDao.insertOperationItem(entity);
  Future insertOperation(OperationData entity) => db.operationDao.insertOperation(entity);
}