import 'package:flutter/material.dart';
import 'package:money_tracker/data/account_repository.dart';
import 'package:money_tracker/data/category_repository.dart';
import 'package:money_tracker/data/operation_repository.dart';
import 'package:money_tracker/data/service_repository.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/domain/models/sum_on_date.dart';
import 'package:money_tracker/utils/google_http_client.dart';

class Repository extends ChangeNotifier {
  final AccountRepository _accountRepo;
  final CategoryRepository _categoryRepo;
  final OperationRepository _operationRepo;
  final ServiceRepository _serviceRepo;

  Repository(this._accountRepo, this._categoryRepo, this._operationRepo,
      this._serviceRepo);

  //Accounts

  Stream<List<Account>> watchAllAccounts() => _accountRepo.watchAll();

  Future<List<Account>> getAllAccounts() => _accountRepo.getAll();

  Stream<List<AccountBalance>> watchAllAccountsBalance() =>
      _accountRepo.watchAllBalance();

  Future<List<AccountBalance>> getAllAccountsBalance() =>
      _accountRepo.getAllBalance();

  Stream<Account> watchAccountById(int id) => _accountRepo.watchById(id);

  Future<Account> getAccountById(int id) => _accountRepo.getById(id);

  Future<int> insertAccount(Account account) => _accountRepo.insert(account);

  Future updateAccount(Account account) => _accountRepo.update(account);

  //Category

  Stream<List<Category>> watchAllCategories() => _categoryRepo.watchAll();

  Future<List<Category>> getAllCategories() => _categoryRepo.getAll();

  Future<Category> getCategoryById(int id) => _categoryRepo.getById(id);

  Stream<Category> watchCategoryById(int id) => _categoryRepo.watchById(id);

  Stream<List<Category>> watchAllCategoriesByType(OperationType type) =>
      _categoryRepo.watchAllByType(type);

  Stream<List<SumOnDate>> watchCashflowByCategoryByMonth(int id) =>
     _categoryRepo.watchCashflowByCategoryByMonth(id);

  Stream<List<SumOnDate>> watchCashflowByCategoryByYear(int id) =>
      _categoryRepo.watchCashflowByCategoryByYear(id);

  Stream<List<CategoryCashflow>> watchCategoryCashflowByType(
          DateTime date, OperationType type) =>
      _categoryRepo.watchCategoryCashflowByType(date, type);

  Future<List<CategoryCashflow>> getCategoryCashflowByType(
          DateTime date, OperationType type) =>
      _categoryRepo.getCategoryCashflowByType(date, type);

  Future<List<Category>> getAllCategoriesByType(OperationType type) =>
      _categoryRepo.getAllByType(type);

  Future<int> insertCategory(Category entity) => _categoryRepo.insert(entity);

  Future updateCategory(Category entity) => _categoryRepo.update(entity);

  //Operation

  Stream<List<Operation>> watchAllOperations() => _operationRepo.watchAll();

  Stream<List<Operation>> watchAllOperationsByFilter(
          OperationListFilter filter) =>
      _operationRepo.watchAllByFilter(filter);

  Stream<Operation> getOperationById(int id) => _operationRepo.getById(id);

  Stream<List<Operation>> watchAllOperationsByAccount(int accountId) =>
      _operationRepo.watchAllByAccount(accountId);

  Stream<List<Operation>> watchAllOperationsByCategory(int categoryId) =>
      _operationRepo.watchAllByCategory(categoryId);

  Stream<List<Operation>> watchLastOperations(int limit) =>
      _operationRepo.watchLast(limit);

  Future<Operation?> getLastOperation() => _operationRepo.getLast();

  Future<int> insertOperation(Operation entity) =>
      _operationRepo.insert(entity);

  Future duplicateOperation(Operation entity) =>
      _operationRepo.duplicate(entity);

  Future deleteOperation(Operation entity) => _operationRepo.delete(entity);

  Future deleteOperationById(int operationId) =>
      _operationRepo.deleteById(operationId);

  //Backup

  Future deleteAll() => _serviceRepo.deleteAll();

  Future backup(
          GoogleHttpClient httpClient, String catalogId, String fileName) =>
      _serviceRepo.backup(httpClient, catalogId, fileName);

  Future restore(GoogleHttpClient httpClient, String fileId) =>
      _serviceRepo.restore(httpClient, fileId);
}
