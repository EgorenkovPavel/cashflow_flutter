import 'package:money_tracker/domain/models.dart';

abstract class DataSource{

  AccountDataSource get accounts;
  CategoryDataSource get categories;
  OperationDataSource get operations;

  Future deleteAll();
  Future<Map<String, List<Map<String, dynamic>>>> exportData();
  Future importData(Map<String, dynamic> data);

}

abstract class AccountDataSource{
  Stream<List<Account>> watchAll();
  Future<List<Account>> getAll();

  Stream<List<AccountBalance>> watchAllBalance();
  Future<List<AccountBalance>> getAllBalance();

  Stream<Account> watchById(int id);
  Future<Account> getById(int id);

  Future<int> insert(Account account);
  Future update(Account account);
}

abstract class CategoryDataSource{
  Stream<List<Category>> watchAll();
  Future<List<Category>> getAll();

  Stream<List<CategoryCashflow>> watchCashflowByType(
      DateTime date, OperationType type);
  Future<List<CategoryCashflow>> getCashflowByType(
      DateTime date, OperationType type);
  Future<List<CategoryMonthCashflow>> getCashflowByYear(int year);

  Stream<List<SumOnDate>> watchCashflowByCategoryByMonth(int id);
  Stream<List<SumOnDate>> watchCashflowByCategoryByYear(int id);

  Future<Category> getById(int id);
  Stream<Category> watchById(int id);

  Stream<List<Category>> watchAllByType(OperationType type);
  Future<List<Category>> getAllByType(OperationType type);

  Future<int> insert(Category entity);
  Future update(Category entity);
}

abstract class OperationDataSource{
  Future<List<Operation>> getAll();
  Future<List<Operation>> getAllWithEmptyCloudId();
  Stream<List<Operation>> watchAll();
  Stream<List<Operation>> watchAllByFilter(OperationListFilter filter);

  Future<Operation> getById(int id);

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