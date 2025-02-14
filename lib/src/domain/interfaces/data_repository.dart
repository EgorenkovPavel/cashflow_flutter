
import '../models.dart';

abstract class DataRepository {

  // Users

  Future<User?> getUserByGoogleId(String googleId);

  Future<int> insertUser(User user);

  Future<List<User>> getAllUsers();

  //Accounts
  Stream<List<BaseAccount>> watchAllAccounts();
  Future<List<BaseAccount>> getAllAccounts();

  Stream<List<BaseAccountBalance>> watchAllBalance();
  Future<List<BaseAccountBalance>> getAllBalance();

  Stream<BaseAccount> watchAccountById(int id);
  Future<BaseAccount> getAccountById(int id);

  Future<int> insertAccount(BaseAccount account);
  Future<void> updateAccount(BaseAccount account);

  //Categories
  Stream<List<Category>> watchAllCategories();
  Future<List<Category>> getAllCategories();

  Stream<List<CategoryCashflow>> watchCashflow(DateTime date);
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

  Future<Category> getCategoryById(int id);
  Stream<Category> watchCategoryById(int id);

  Stream<List<Category>> watchAllCategoriesByType(OperationType type);
  Future<List<Category>> getAllCategoriesByType(OperationType type);

  Future<int> insertCategory(Category entity);
  Future<void> updateCategory(Category entity);

  //Operations
  Future<List<Operation>> getAllOperations();
  Stream<List<Operation>> watchAllOperations();

  Future<List<Operation>> getAllOperationsWithEmptyCloudId();
  Stream<List<Operation>> watchAllOperationsByFilter(OperationListFilter filter);

  Future<Operation> getOperationById(int id);

  Stream<List<Operation>> watchAllOperationsByAccount(int accountId);
  Stream<List<Operation>> watchAllOperationsByCategory(int categoryId);
  Stream<List<Operation>> watchLastOperations(int limit);
  Future<Operation?> getLastOperation();

  Future<Operation> insertOperation(Operation entity);
  Future<Operation> duplicateOperation(Operation entity);
  Future<void> updateOperation(Operation operation);
  Future<void> deleteOperation(Operation entity);
  Future<void> recoverOperation(Operation entity);
  Future<void> deleteOperationById(int operationId);

}






