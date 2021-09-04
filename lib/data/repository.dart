import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/data/account_repository.dart';
import 'package:money_tracker/data/category_repository.dart';
import 'package:money_tracker/data/cloud_source.dart';
import 'package:money_tracker/data/operation_repository.dart';
import 'package:money_tracker/data/service_repository.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/domain/models/sum_on_date.dart';
import 'package:money_tracker/data/google_http_client.dart';

class Repository extends ChangeNotifier {
  final AccountRepository _accountRepo;
  final CategoryRepository _categoryRepo;
  final OperationRepository _operationRepo;
  final ServiceRepository _serviceRepo;
  final CloudSource _cloudSource;

  Repository(this._accountRepo, this._categoryRepo, this._operationRepo,
      this._serviceRepo, this._cloudSource) {
    syncData();
  }

  Future<void> syncData() async {
    await Future.delayed(Duration(seconds: 10));
    _cloudSource.accountChanges.listen((list) => list.forEach((account) async {
          var _account = await _accountRepo.getByCloudId(account.cloudId);
          if (_account == null) {
            await _accountRepo.insert(account);
          } else {
            await _accountRepo.update(account.copyWith(id: _account.id));
          }
        }));

    _cloudSource.categoryChanges
        .listen((list) => list.forEach((category) async {
              var _category =
                  await _categoryRepo.getByCloudId(category.cloudId);
              if (_category == null) {
                await _categoryRepo.insert(category);
              } else {
                await _categoryRepo.update(category.copyWith(id: _category.id));
              }
            }));

    _cloudSource.operationChanges
        .listen((list) => list.forEach((operation) async {
              var _operation =
                  await _operationRepo.getByCloudId(operation.cloudId);
              if (_operation == null) {
                await _operationRepo.insert(operation);
              } else {
                await _operationRepo
                    .update(operation.copyWith(id: _operation.id));
              }
            }));
  }

  //Accounts

  Stream<List<Account>> watchAllAccounts() => _accountRepo.watchAll();

  Future<List<Account>> getAllAccounts() => _accountRepo.getAll();

  Stream<List<AccountBalance>> watchAllAccountsBalance() =>
      _accountRepo.watchAllBalance();

  Future<List<AccountBalance>> getAllAccountsBalance() =>
      _accountRepo.getAllBalance();

  Stream<Account> watchAccountById(int id) => _accountRepo.watchById(id);

  Future<Account> getAccountById(int id) => _accountRepo.getById(id);

  Future<int> insertAccount(Account account) async {
    var _cloudId = await _cloudSource.addAccount(account);
    var _id = await _accountRepo.insert(account.copyWith(cloudId: _cloudId));
    return _id;
  }

  Future updateAccount(Account account) async {
    await _cloudSource.updateAccount(account);
    await _accountRepo.update(account);
  }

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

  Future<int> insertCategory(Category category) async {
    var _cloudId = await _cloudSource.addCategory(category);
    var _id = await _categoryRepo.insert(category.copyWith(cloudId: _cloudId));
    return _id;
  }

  Future updateCategory(Category category) async {
    await _cloudSource.updateCategory(category);
    await _categoryRepo.update(category);
  }

  //Operation

  Stream<List<Operation>> watchAllOperations() => _operationRepo.watchAll();

  Stream<List<Operation>> watchAllOperationsByFilter(
          OperationListFilter filter) =>
      _operationRepo.watchAllByFilter(filter);

  Future<Operation> getOperationById(int id) => _operationRepo.getById(id);

  Stream<List<Operation>> watchAllOperationsByAccount(int accountId) =>
      _operationRepo.watchAllByAccount(accountId);

  Stream<List<Operation>> watchAllOperationsByCategory(int categoryId) =>
      _operationRepo.watchAllByCategory(categoryId);

  Stream<List<Operation>> watchLastOperations(int limit) =>
      _operationRepo.watchLast(limit);

  Future<Operation?> getLastOperation() => _operationRepo.getLast();

  Future<Operation> insertOperation(Operation operation) async {
    var _cloudId = await _cloudSource.addOperation(operation);
    var _id =
        await _operationRepo.insert(operation.copyWith(cloudId: _cloudId));
    return operation.copyWith(id: _id, cloudId: _cloudId);
  }

  Future updateOperation(Operation operation) async {
    await _cloudSource.updateOperation(operation);
    await _operationRepo.update(operation);
  }

  Future duplicateOperation(Operation operation) {
    var newOperation = operation.copyWith(
      id: 0,
      cloudId: '',
      date: DateTime.now(),
    );
    return insertOperation(newOperation);
  }

  Future deleteOperation(Operation operation) async {
    await _cloudSource.deleteOperation(operation.cloudId);
    await _operationRepo.deleteById(operation.id);
  }

  //Backup

  Future deleteAll() async {
    await _cloudSource.deleteAll();
    await _serviceRepo.deleteAll();
  }

  Future backup(
          GoogleHttpClient httpClient, String catalogId, String fileName) =>
      _serviceRepo.backup(httpClient, catalogId, fileName);

  Future restore(GoogleHttpClient httpClient, String fileId) =>
      _serviceRepo.restore(httpClient, fileId);
}
