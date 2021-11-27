import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/domain/models/sum_on_date.dart';

abstract class LocalSource{

  LocalAccountRepo get accounts;
  LocalCategoryRepo get categories;
  LocalOperationsRepo get operations;

  Future deleteAll();
  Future<Map<String, List<Map<String, dynamic>>>> exportData();
  Future importData(Map<String, dynamic> data);

}

abstract class LocalAccountRepo{

  Stream<List<Account>> watchAll();
  Future<List<Account>> getAll();
  Future<List<Account>> getAllWithEmptyCloudId();

  Stream<List<AccountBalance>> watchAllBalance();
  Future<List<AccountBalance>> getAllBalance();

  Stream<Account> watchById(int id);
  Future<Account> getById(int id);

  Future<Account?> getByCloudId(String cloudId);
  Stream<Account> watchNotSynced();
  Future<List<Account>> getAllNotSynced();
  Future markAsSynced(int accountId, String cloudId);

  Future<int> insert(Account account);
  Future update(Account account);

}

abstract class LocalCategoryRepo{

  Stream<List<Category>> watchAll();
  Future<List<Category>> getAll();
  Future<List<Category>> getAllWithEmptyCloudId();

  Stream<List<CategoryCashflow>> watchCashflowByType(
      DateTime date, OperationType type);
  Future<List<CategoryCashflow>> getCashflowByType(
      DateTime date, OperationType type);

  Stream<List<SumOnDate>> watchCashflowByCategoryByMonth(int id);
  Stream<List<SumOnDate>> watchCashflowByCategoryByYear(int id);

  Future<Category> getById(int id);
  Stream<Category> watchById(int id);

  Future<Category?> getByCloudId(String cloudId);
  Stream<Category> watchNotSynced();
  Future<List<Category>> getAllNotSynced();
  Future markAsSynced(int categoryId, String cloudId);

  Stream<List<Category>> watchAllByType(OperationType type);
  Future<List<Category>> getAllByType(OperationType type);

  Future<int> insert(Category entity);
  Future update(Category entity);
}

abstract class LocalOperationsRepo{

  Future<List<Operation>> getAll();
  Future<List<Operation>> getAllWithEmptyCloudId();
  Stream<List<Operation>> watchAll();
  Stream<List<Operation>> watchAllByFilter(OperationListFilter filter);

  Future<Operation> getById(int id);

  Future<Operation?> getByCloudId(String cloudId);
  Stream<Operation> watchNotSynced();
  Future<List<Operation>> getAllNotSynced();
  Future markAsSynced(int operationId, String cloudId);

  Stream<List<Operation>> watchAllByAccount(int accountId);
  Stream<List<Operation>> watchAllByCategory(int categoryId);
  Stream<List<Operation>> watchLast(int limit);

  Future<Operation?> getLast();
  Future<Operation> insert(Operation entity);
  Future<Operation> duplicate(Operation entity);
  Future update(Operation operation);
  Future delete(Operation entity);
  Future deleteById(int operationId);
}