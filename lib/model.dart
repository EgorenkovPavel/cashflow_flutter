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

  Future insertCategory(CategoryData entity) => db.categoryDao.insertCategory(entity);
  Future updateCategory(CategoryData entity) => db.categoryDao.updateCategory(entity);

}