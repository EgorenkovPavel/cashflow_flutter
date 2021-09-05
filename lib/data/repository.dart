import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/data/account_repository.dart';
import 'package:money_tracker/data/category_repository.dart';
import 'package:money_tracker/data/cloud/cloud_account.dart';
import 'package:money_tracker/data/cloud/cloud_category.dart';
import 'package:money_tracker/data/cloud/cloud_operation.dart';
import 'package:money_tracker/data/cloud/cloud_source.dart';
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
    _cloudSource.accountChanges
        .listen((list) => list.forEach((cloudAccount) async {
              var _account = await _accountRepo.getByCloudId(cloudAccount.id);
              if (_account == null) {
                await _accountRepo.insert(Account(
                  cloudId: cloudAccount.id,
                  title: cloudAccount.title,
                ));
              } else {
                await _accountRepo
                    .update(_account.copyWith(title: cloudAccount.title));
              }
            }));

    _cloudSource.categoryChanges
        .listen((list) => list.forEach((cloudCategory) async {
              var _category =
                  await _categoryRepo.getByCloudId(cloudCategory.id);
              if (_category == null) {
                await _categoryRepo.insert(Category(
                  title: cloudCategory.title,
                  cloudId: cloudCategory.id,
                  operationType: cloudCategory.operationType,
                  budgetType: cloudCategory.budgetType,
                  budget: cloudCategory.budget,
                ));
              } else {
                await _categoryRepo.update(_category.copyWith(
                  title: cloudCategory.title,
                  cloudId: cloudCategory.id,
                  type: cloudCategory.operationType,
                  budgetType: cloudCategory.budgetType,
                  budget: cloudCategory.budget,
                ));
              }
            }));

    _cloudSource.operationChanges
        .listen((list) => list.forEach((cloudOperation) async {
              var _operation =
                  await _operationRepo.getByCloudId(cloudOperation.id);

              var _account =
                  await _accountRepo.getByCloudId(cloudOperation.account);
              var _category = cloudOperation.category == null
                  ? null
                  : await _categoryRepo.getByCloudId(cloudOperation.category!);
              var _recAccount = cloudOperation.recAccount == null
                  ? null
                  : await _accountRepo.getByCloudId(cloudOperation.recAccount!);

              if (_operation == null) {
                await _operationRepo.insert(Operation(
                  cloudId: cloudOperation.id,
                  date: cloudOperation.date,
                  type: cloudOperation.operationType,
                  account: _account!,
                  category: _category,
                  recAccount: _recAccount,
                  sum: cloudOperation.sum,
                ));
              } else {
                await _operationRepo.update(_operation.copyWith(
                  cloudId: cloudOperation.id,
                  date: cloudOperation.date,
                  type: cloudOperation.operationType,
                  account: _account!,
                  category: _category,
                  recAccount: _recAccount,
                  sum: cloudOperation.sum,
                ));
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
    var _cloudId = await _cloudSource.addAccount(CloudAccount(
      id: account.cloudId,
      title: account.title,
    ));
    var _id = await _accountRepo.insert(account.copyWith(cloudId: _cloudId));
    return _id;
  }

  Future updateAccount(Account account) async {
    await _cloudSource.updateAccount(CloudAccount(
      id: account.cloudId,
      title: account.title,
    ));
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
    //TODO вызывается запись в облако и сразу подписка об изменении в облаке а уже потом запись в базе. получается 2 копии в базе и 1 в облаке
    var _cloudId = await _cloudSource.addCategory(CloudCategory(
      id: category.cloudId,
      title: category.title,
      operationType: category.operationType,
      budgetType: category.budgetType,
      budget: category.budget,
    ));
    var _id = await _categoryRepo.insert(category.copyWith(cloudId: _cloudId));
    return _id;
  }

  Future updateCategory(Category category) async {
    await _cloudSource.updateCategory(CloudCategory(
      id: category.cloudId,
      title: category.title,
      operationType: category.operationType,
      budgetType: category.budgetType,
      budget: category.budget,
    ));
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
    var _cloudId = await _cloudSource.addOperation(CloudOperation(
      id: operation.cloudId,
      date: operation.date,
      operationType: operation.type,
      account: operation.account.cloudId,
      category: operation.category?.cloudId ?? '',
      recAccount: operation.recAccount?.cloudId ?? '',
      sum: operation.sum,
    ));
    var _id =
        await _operationRepo.insert(operation.copyWith(cloudId: _cloudId));
    return operation.copyWith(id: _id, cloudId: _cloudId);
  }

  Future updateOperation(Operation operation) async {
    await _cloudSource.updateOperation(CloudOperation(
      id: operation.cloudId,
      date: operation.date,
      operationType: operation.type,
      account: operation.account.cloudId,
      category: operation.category?.cloudId ?? '',
      recAccount: operation.recAccount?.cloudId ?? '',
      sum: operation.sum,
    ));
    await _operationRepo.update(operation);
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
