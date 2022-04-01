import 'package:money_tracker/domain/models.dart';

abstract class DataRepository {
  AccountDataRepository get accounts;

  CategoryDataRepository get categories;

  OperationDataRepository get operations;

  Future<void> deleteAll();

  Future<Map<String, List<Map<String, dynamic>>>> exportData();

  Future<void> importData(Map<String, dynamic> data);
}

abstract class AccountDataRepository {
  Stream<List<Account>> watchAll();

  Future<List<Account>> getAll();

  Stream<List<AccountBalance>> watchAllBalance();

  Future<List<AccountBalance>> getAllBalance();

  Stream<Account> watchById(int id);

  Future<Account> getById(int id);

  Future<int> insert(Account account);

  Future<void> update(Account account);
}

abstract class CategoryDataRepository {
  Stream<List<Category>> watchAll();

  Future<List<Category>> getAll();

  Stream<List<CategoryCashflow>> watchCashflowByType(
    DateTime date,
    OperationType type,
  );

  Future<List<CategoryCashflow>> getCashflowByType(
    DateTime date,
    OperationType type,
  );

  Future<List<CategoryMonthCashflow>> getCashflowByYear(int year);

  Stream<List<SumOnDate>> watchCashflowByCategoryByMonth(int id);

  Stream<List<SumOnDate>> watchCashflowByCategoryByYear(int id);

  Future<Category> getById(int id);

  Stream<Category> watchById(int id);

  Stream<List<Category>> watchAllByType(OperationType type);

  Future<List<Category>> getAllByType(OperationType type);

  Future<int> insert(Category entity);

  Future<void> update(Category entity);
}

abstract class OperationDataRepository {
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

  Future<void> update(Operation operation);

  Future<void> delete(Operation entity);

  Future<void> deleteById(int operationId);
}
