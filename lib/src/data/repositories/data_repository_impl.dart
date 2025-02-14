import 'package:drift/drift.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/interfaces/data_repository.dart';
import '../sources/local/data/account_dao.dart';
import '../sources/local/data/category_dao.dart';
import '../sources/local/data/database.dart';
import '../sources/local/data/operation_dao.dart';
import '../sources/local/data/user_dao.dart';
import '../sources/local/entities/account_balance_entity.dart';
import '../sources/local/mapper_db.dart';

class DataRepositoryImpl implements DataRepository {
  final AccountDao accountDao;
  final CategoryDao categoryDao;
  final OperationDao operationDao;
  final UserDao userDao;

  DataRepositoryImpl({
    required this.accountDao,
    required this.categoryDao,
    required this.operationDao,
    required this.userDao,
  });

  @override
  Future<void> deleteOperation(Operation entity) =>
      operationDao.deleteOperation(MapperDB.mapOperationDB(entity));

  @override
  Future<void> deleteOperationById(int operationId) =>
      operationDao.deleteOperationById(operationId);

  @override
  Future<Operation> duplicateOperation(Operation entity) {
    var newOperation = entity.copyWith(
      id: 0,
      cloudId: '',
      date: DateTime.now(),
    );

    return insertOperation(newOperation);
  }

  @override
  Future<Account> getAccountById(int id) async {
    final account = await accountDao.getAccountById(id);

    final userId = account.user;
    if (userId == null){
      return MapperDB.createAccount(account, null);
    }else{
      final user = await userDao.getById(userId);
      return MapperDB.createAccount(account, user);
    }
  }

  @override
  Future<List<Account>> getAllAccounts() async {
    final accounts = await accountDao.getAllAccounts();
    final users = await userDao.getAllUsers();
    return MapperDB.combineUsers(accounts, users);
  }

  @override
  Future<List<AccountBalance>> getAllBalance() async {
    final accounts = await accountDao.getAllAccounts();
    final users = await userDao.getAllUsers();
    final balances = await accountDao.getAllBalances();
    return MapperDB.combineBalances(accounts, balances, users);
  }

  @override
  Future<List<Category>> getAllCategories() async =>
      MapperDB.mapCategoryList(await categoryDao.getAllCategories());

  @override
  Future<List<Category>> getAllCategoriesByType(OperationType type) async =>
      MapperDB.mapCategoryList(await categoryDao.getAllCategoriesByType(type));

  @override
  Future<List<Operation>> getAllOperations() async {
    final operations = await operationDao.getAllOperationItems();
    final users = await userDao.getAllUsers();
    return MapperDB.mapOperationList(operations, users);
  }

  @override
  Future<List<Operation>> getAllOperationsWithEmptyCloudId() async {
    final operations =
        await operationDao.getAllOperationItemsWithEmptyCloudId();
    final users = await userDao.getAllUsers();
    return MapperDB.mapOperationList(operations, users);
  }

  @override
  Future<List<CategoryCashflow>> getCashflowByType(
          DateTime date, OperationType type) async =>
      MapperDB.mapCategoryCashflowList(
        await categoryDao.getCategoryCashflowByType(date, type),
      );

  @override
  Future<List<CategoryMonthCashflow>> getCashflowByYear(int year) async =>
      MapperDB.mapCategoryMonthCashflowList(
          await categoryDao.getCashflowByYear(year));

  @override
  Future<Category> getCategoryById(int id) async =>
      MapperDB.mapCategory(await categoryDao.getCategoryById(id));

  @override
  Future<Operation?> getLastOperation() async {
    final operation = await operationDao.getLastOperationItem();

    if (operation == null) {
      return null;
    }

    final users = await userDao.getAllUsers();
    return MapperDB.mapOperation(operation, users);
  }

  @override
  Future<Operation> getOperationById(int id) async {
    final operation = await operationDao.getOperationById(id);
    final users = await userDao.getAllUsers();
    return MapperDB.mapOperation(operation, users);
  }

  @override
  Future<int> insertAccount(BaseAccount account) =>
      accountDao.insertAccount(AccountsCompanion(
        cloudId: Value(account.cloudId),
        title: Value(account.title),
        isDebt: Value(account is Debt),
        user: Value(account.user?.id),
      ));

  @override
  Future<int> insertCategory(Category entity) =>
      categoryDao.insertCategory(CategoriesCompanion(
        cloudId: Value(entity.cloudId),
        title: Value(entity.title),
        operationType: Value(entity.operationType),
        budgetType: Value(entity.budgetType),
        budget: Value(entity.budget),
      ));

  @override
  Future<Operation> insertOperation(Operation entity) async {
    final id = await operationDao.insertOperation(
      entity.map(
        input: (o) => OperationsCompanion(
          cloudId: Value(o.cloudId),
          date: Value(o.date),
          operationType: Value(o.type),
          account: Value(o.account.id),
          category: Value(o.category.id),
          sum: Value(o.sum),
          currencySent: Value(o.currency),
        ),
        output: (o) => OperationsCompanion(
          cloudId: Value(o.cloudId),
          date: Value(o.date),
          operationType: Value(o.type),
          account: Value(o.account.id),
          category: Value(o.category.id),
          sum: Value(o.sum),
          currencySent: Value(o.currency),
        ),
        transfer: (o) => OperationsCompanion(
          cloudId: Value(o.cloudId),
          date: Value(o.date),
          operationType: Value(o.type),
          account: Value(o.account.id),
          recAccount: Value(o.recAccount.id),
          sum: Value(o.sum),
          recSum: Value(o.recSum),
          currencySent: Value(o.currencySent),
          currencyReceived: Value(o.currencyReceived),
        ),
      ),
    );

    return entity.copyWith(id: id);
  }

  @override
  Future<void> recoverOperation(Operation entity) =>
      operationDao.recoverOperation(MapperDB.mapOperationDB(entity));

  @override
  Future<void> updateAccount(Account account) =>
      accountDao.updateAccount(MapperDB.mapAccountDB(account));

  @override
  Future<void> updateCategory(Category entity) =>
      categoryDao.updateCategory(MapperDB.mapCategoryDB(entity));

  @override
  Future<void> updateOperation(Operation operation) =>
      operationDao.updateOperation(MapperDB.mapOperationDB(operation));

  @override
  Stream<Account> watchAccountById(int id) {
    return accountDao.watchAccountById(id).asyncMap((a) async {

      final userId = a.user;
      if (userId == null){
        return MapperDB.createAccount(a, null);
      }else{
        final user = await userDao.getById(userId);
        return MapperDB.createAccount(a, user);
      }
    });
  }

  @override
  Stream<List<Account>> watchAllAccounts() =>
      Rx.combineLatest2<List<AccountDB>, List<UserDB>, List<Account>>(
          accountDao.watchAllAccounts(),
          userDao.watchAllUsers(),
          MapperDB.combineUsers);

  @override
  Stream<List<AccountBalance>> watchAllBalance() => Rx.combineLatest3<
          List<AccountDB>,
          List<AccountBalanceEntity>,
          List<UserDB>,
          List<AccountBalance>>(
      accountDao.watchAllAccounts(),
      accountDao.watchAllBalances(),
      userDao.watchAllUsers(),
      MapperDB.combineBalances);

  @override
  Stream<List<Category>> watchAllCategories() =>
      categoryDao.watchAllCategories().map(MapperDB.mapCategoryList);

  @override
  Stream<List<Category>> watchAllCategoriesByType(OperationType type) =>
      categoryDao.watchAllCategoriesByType(type).map(MapperDB.mapCategoryList);

  @override
  Stream<List<Operation>> watchAllOperations() => Rx.combineLatest2(
      operationDao.watchAllOperationItems(),
      userDao.watchAllUsers(),
      MapperDB.combineOperationWithUser);

  @override
  Stream<List<Operation>> watchAllOperationsByAccount(int accountId) =>
      Rx.combineLatest2(operationDao.watchAllOperationItemsByAccount(accountId),
          userDao.watchAllUsers(), MapperDB.combineOperationWithUser);

  @override
  Stream<List<Operation>> watchAllOperationsByCategory(int categoryId) =>
      Rx.combineLatest2(
          operationDao.watchAllOperationItemsByCategory(categoryId),
          userDao.watchAllUsers(),
          MapperDB.combineOperationWithUser);

  @override
  Stream<List<Operation>> watchAllOperationsByFilter(
          OperationListFilter filter) =>
      Rx.combineLatest2(
          operationDao.watchAllOperationItemsByFilter(
            start: filter.period?.start,
            end: filter.period?.end,
            accountIds: filter.accounts.map((account) => account.id).toSet(),
            categoriesIds:
                filter.categories.map((category) => category.id).toSet(),
          ),
          userDao.watchAllUsers(),
          MapperDB.combineOperationWithUser);

  @override
  Stream<List<CategoryCashflow>> watchCashflow(DateTime date) => categoryDao
      .watchAllCategoryCashflowBudget(date)
      .map(MapperDB.mapCategoryCashflowList);

  @override
  Stream<List<SumOnDate>> watchCashflowByCategoryByMonth(int id) =>
      categoryDao.watchCashflowByCategoryByMonth(id);

  @override
  Stream<List<SumOnDate>> watchCashflowByCategoryByYear(int id) =>
      categoryDao.watchCashflowByCategoryByYear(id);

  @override
  Stream<List<CategoryCashflow>> watchCashflowByType(
          DateTime date, OperationType type) =>
      categoryDao
          .watchCategoryCashflowByType(date, type)
          .map(MapperDB.mapCategoryCashflowList);

  @override
  Stream<Category> watchCategoryById(int id) =>
      categoryDao.watchCategoryById(id).map(MapperDB.mapCategory);

  @override
  Stream<List<Operation>> watchLastOperations(int limit) => Rx.combineLatest2(
      operationDao.watchLastOperationItems(limit),
      userDao.watchAllUsers(),
      MapperDB.combineOperationWithUser);

  @override
  Future<User?> getUserByGoogleId(String googleId) async {
    if (googleId.isEmpty) {
      return null;
    }
    final user = await userDao.getByGoogleId(googleId);
    return user == null ? null : MapperDB.mapUser(user);
  }

  @override
  Future<int> insertUser(User user) {
    return userDao.insert(UsersCompanion(
      googleId: Value(user.googleId),
      name: Value(user.name),
      photo: Value(user.photo),
    ));
  }

  @override
  Future<List<User>> getAllUsers() async {
    final users = await userDao.getAllUsers();
    return MapperDB.mapUserList(users);
  }
}
