import 'package:cashflow/data/mappers/account_mapper.dart';
import 'package:cashflow/data/objects/category.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:flutter/material.dart';

import 'database.dart';
import 'mappers/account_balance_mapper.dart';
import 'mappers/category_mapper.dart';
import 'objects/account.dart';
import 'objects/account_balance.dart';

class Repository extends ChangeNotifier {
  final Database db;

  Repository() : db = Database();

  Future deleteAll() => db.deleteAll();

  //Accounts
  Stream<List<Account>> watchAllAccounts({bool archive = false}) =>
      db.accountDao
          .watchAllAccounts(archive: archive)
          .map((list) => list.map((a) => const AccountMapper().mapToDart(a)));

  Stream<List<AccountBalance>> watchAllAccountsBalance(
          {bool archive = false}) =>
      db.accountDao.watchAllAccountsWithBalance(archive: archive).map(
          (list) => list.map((a) => const AccountBalanceMapper().mapToDart(a)));

  Future insertAccount(Account account) =>
      db.accountDao.insertAccount(const AccountMapper().mapToSql(account));

  Future updateAccount(Account account) =>
      db.accountDao.updateAccount(const AccountMapper().mapToSql(account));

  //Categories
  Stream<List<Category>> watchAllCategories({bool archive = false}) =>
      db.categoryDao
          .watchAllCategories(archive: archive)
          .map((list) => list.map((a) => const CategoryMapper().mapToDart(a)));

  Stream<Category> getCategoryById(int id) => db.categoryDao
      .getCategoryById(id)
      .map((a) => const CategoryMapper().mapToDart(a));

  Stream<List<Category>> watchAllCategoriesByType(OperationType type,
          {bool archive = false}) =>
      db.categoryDao
          .watchAllCategoriesByType(type, archive: archive)
          .map((list) => list.map((a) => const CategoryMapper().mapToDart(a)));

  Stream<List<CategoryCashflowBudget>> watchAllCategoryCashflowBudget(
          DateTime date) =>
      db.categoryDao.watchAllCategoryCashflowBudget(date);

  Stream<List<CategoryCashflowBudget>> watchCashflowBudgetByCatergory(
          int categoryId) =>
      db.categoryDao.watchCashflowBudgetByCatergory(categoryId);

  Future insertCategory(Category entity) =>
      db.categoryDao.insertCategory(const CategoryMapper().mapToSql(entity));

  Future updateCategory(Category entity) =>
      db.categoryDao.updateCategory(const CategoryMapper().mapToSql(entity));

  //Operations
  Stream<List<OperationItem>> watchAllOperationItems() =>
      db.operationDao.watchAllOperationItems();

  Stream<List<OperationItem>> watchAllOperationItemsByCategory(
          int categoryId) =>
      db.operationDao.watchAllOperationItemsByCategory(categoryId);

  Future<List<OperationData>> getAllOperations() =>
      db.operationDao.getAllOperations();

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

  Future<void> batchInsertOperations(List<OperationData> data) =>
      db.operationDao.batchInsert(data);

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

  Future<void> batchInsertAccounts(List<AccountData> accounts) =>
      db.accountDao.batchInsert(accounts);

  Future<List<AccountData>> getAllAccounts() => db.accountDao.getAllAccounts();

  Future<List<CategoryData>> getAllCategories() =>
      db.categoryDao.getAllCategories();

  Future<void> batchInsertCategories(List<CategoryData> data) =>
      db.categoryDao.batchInsert(data);

}
