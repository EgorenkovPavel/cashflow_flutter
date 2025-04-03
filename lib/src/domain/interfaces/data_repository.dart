
import '../models.dart';

abstract class DataRepository {

  Future<double> usdRate();
  Future<double> eurRate();

  // Users

  Future<User?> getUserByGoogleId(String googleId);

  Future<int> insertUser(User user);

  Future<List<User>> getAllUsers();

  //Accounts
  Stream<List<BaseAccount>> watchAllAccounts();
  Future<List<BaseAccount>> getAllAccounts();

  Stream<List<BaseAccountBalanceListItem>> watchAllBalance();
  Future<List<BaseAccountBalanceListItem>> getAllBalance();

  Stream<BaseAccount> watchAccountById(int id);
  Future<BaseAccount> getAccountById(int id);

  Future<int> insertAccount(BaseAccount account);
  Future<void> updateAccount(BaseAccount account);

  //Categories
  Stream<List<Category>> watchAllCategories();
  Future<List<Category>> getAllCategories();

  Stream<List<CategoryCashFlow>> watchCashFlow(DateTime date);
  Stream<List<CategoryCashFlow>> watchCashFlowByType(
      DateTime date,
      CategoryType type,
      );
  Future<List<CategoryCashFlow>> getCashFlowByType(
      DateTime date,
      OperationType type,
      );

  // Future<List<CategoryMonthCashflow>> getCashflowByYear(int year);
  Stream<List<SumOnDate>> watchCashFlowByCategoryByMonth(int id);
  Stream<List<SumOnDate>> watchCashFlowByCategoryByYear(int id);

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
  Stream<List<OperationListItem>> watchAllOperationsByFilter(OperationListFilter filter);

  Future<Operation> getOperationById(int id);

  Stream<List<OperationListItem>> watchAllOperationsByAccount(int accountId);
  Stream<List<OperationListItem>> watchAllOperationsByCategory(int categoryId);
  Stream<List<OperationListItem>> watchLastOperations(int limit);
  Future<Operation?> getLastOperation();

  Future<Operation> insertOperation(Operation entity);
  Future<Operation> duplicateOperation(int operationId);
  Future<void> updateOperation(Operation operation);
  Future<void> recoverOperation(int operationId);
  Future<void> deleteOperationById(int operationId);

}






