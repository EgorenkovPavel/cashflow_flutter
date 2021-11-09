
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/domain/models/user.dart';
import 'package:money_tracker/utils/try.dart';

abstract class DataSource{

  Future<Try<void>> logIn(String userId);
  Future<Try<bool>> cloudDbExists(String userId);
  Stream<bool> isAdmin();
  Future<Try<void>> addNewUser(User user);
  Future<Try<Iterable<User>>> getUsers();
  Future<Try<void>> createCloudDatabase(User user);
  void logOut();

  Future<bool> loadFromCloud(DateTime date);
  Future<void> loadToCloud();

  //Accounts
  Stream<List<Account>> watchAllAccounts();
  Future<List<Account>> getAllAccounts();
  Stream<List<AccountBalance>> watchAllAccountsBalance();
  Future<List<AccountBalance>> getAllAccountsBalance();
  Stream<Account> watchAccountById(int id);
  Future<Account> getAccountById(int id);
  Future<int> insertAccount(Account account);
  Future updateAccount(Account account);

  //Categories
  Stream<List<Category>> watchAllCategories();
  Future<List<Category>> getAllCategories();
  Future<Category> getCategoryById(int id);
  Stream<Category> watchCategoryById(int id);
  Stream<List<Category>> watchAllCategoriesByType(OperationType type);
  Stream<List<SumOnDate>> watchCashflowByCategoryByMonth(int id);
  Stream<List<SumOnDate>> watchCashflowByCategoryByYear(int id);
  Stream<List<CategoryCashflow>> watchCategoryCashflowByType(
      DateTime date, OperationType type);
  Future<List<CategoryCashflow>> getCategoryCashflowByType(
      DateTime date, OperationType type);
  Future<List<Category>> getAllCategoriesByType(OperationType type);
  Future<int> insertCategory(Category category);
  Future updateCategory(Category category);

  //Operations
  Future<List<Operation>> getAllOperations();
  Future<List<Operation>> _getAllOperationsWithEmptyCloudId();
  Stream<List<Operation>> watchAllOperations();
  Stream<List<Operation>> watchAllOperationsByFilter(
      OperationListFilter filter);
  Future<Operation> getOperationById(int id);
  Stream<List<Operation>> watchAllOperationsByAccount(int accountId);
  Stream<List<Operation>> watchAllOperationsByCategory(int categoryId);
  Stream<List<Operation>> watchLastOperations(int limit);
  Future<Operation?> getLastOperation();
  Future<Operation> insertOperation(Operation operation);
  Future updateOperation(Operation operation);
  Future<Operation> duplicateOperation(Operation operation);
  Future deleteOperation(Operation operation);

  //Backup
  Future deleteAll();
  Future<Map<String, List<Map<String, dynamic>>>> exportData();
  Future<void> importData(Map<String, dynamic> data);

}