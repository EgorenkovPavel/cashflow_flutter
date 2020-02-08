import 'package:cashflow/data/operation_type.dart';
import 'package:flutter/material.dart';

import 'database.dart';

class Model extends ChangeNotifier {
  final db;

  Model() : db = Database();

  Future deleteAll() => db.deleteAll();

  //Accounts
  Stream<List<AccountData>> watchAllAccounts({bool archive = false}) =>
      db.accountDao.watchAllAccounts(archive: archive);

  Future<List<AccountData>> getAllAccounts() => db.accountDao.getAllAccounts();

  Stream<List<AccountWithBalance>> watchAllAccountsWithBalance(
          {bool archive = false}) =>
      db.accountDao.watchAllAccountsWithBalance(archive: archive);

  Future insertAccount(AccountData entity) =>
      db.accountDao.insertAccount(entity);

  Future updateAccount(AccountData entity) =>
      db.accountDao.updateAccount(entity);

  Stream<int> getTotalBalance() => db.accountDao.getTotalBalance();

  Future<void> batchInsertAccounts(List<AccountData> accounts) => db.accountDao.batchInsert(accounts);

  //Categories
  Stream<List<CategoryData>> watchAllCategories({bool archive = false}) =>
      db.categoryDao.watchAllCategories(archive: archive);

  Future<List<CategoryData>> getAllCategories() => db.categoryDao.getAllCategories();

  Stream<List<CategoryData>> watchAllCategoriesByType(OperationType type,
          {bool archive = false}) =>
      db.categoryDao.watchAllCategoriesByType(type, archive: archive);

  Stream<List<CategoryCashflowBudget>> watchAllCategoryCashflowBudget(
          DateTime date) =>
      db.categoryDao.watchAllCategoryCashflowBudget(date);

  Future insertCategory(CategoryData entity) =>
      db.categoryDao.insertCategory(entity);

  Future updateCategory(CategoryData entity) =>
      db.categoryDao.updateCategory(entity);

  Future<void> batchInsertCategories(List<CategoryData> data) => db.categoryDao.batchInsert(data);

  //Operations
  Stream<List<OperationItem>> watchAllOperationItems() =>
      db.operationDao.watchAllOperationItems();

  Future<List<OperationData>> getAllOperations() => db.operationDao.getAllOperations();

  Future insertOperationItem(OperationItem entity) =>
      db.operationDao.insertOperationItem(entity);

  Future insertOperation(OperationData entity) {
    if (entity.id == 0) {
      db.operationDao.insertOperation(entity);
    } else {
      db.operationDao.updateOperation(entity);
    }
  }

  Future deleteOperation(OperationData entity) =>
      db.operationDao.deleteOperation(entity);

  Future<void> batchInsertOperations(List<OperationData> data) => db.operationDao.batchInsert(data);

  //Budget

  Stream<List<MonthBudget>> watchMonthBudget() =>
      db.budgetDao.watchMonthBudget();

  Stream<List<BudgetData>> watchBudget(DateTime date) =>
      db.budgetDao.watchBudget(date);

  Future<void> insertBudget(BudgetData entity) =>
      db.budgetDao.insertBudget(entity);

  Future<void> updateBudget(BudgetData entity) =>
      db.budgetDao.updateBudget(entity);
}
