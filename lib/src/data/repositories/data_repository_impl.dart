import 'package:drift/drift.dart';
import 'package:money_tracker/src/data/sources/currency_rate_source.dart';
import 'package:money_tracker/src/data/sources/local/db_mapper.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/interfaces/data_repository.dart';
import '../sources/local/data/account_dao.dart';
import '../sources/local/data/category_dao.dart';
import '../sources/local/data/database.dart';
import '../sources/local/data/operation_dao.dart';
import '../sources/local/data/user_dao.dart';
import '../sources/local/entities/account_balance_entity.dart';

class DataRepositoryImpl implements DataRepository {
  final AccountDao accountDao;
  final CategoryDao categoryDao;
  final OperationDao operationDao;
  final UserDao userDao;
  final CurrencyRateSource currencyRateSource;

  DataRepositoryImpl({
    required this.accountDao,
    required this.categoryDao,
    required this.operationDao,
    required this.userDao,
    required this.currencyRateSource
  });

  @override
  Future<void> deleteOperationById(int operationId) =>
      operationDao.deleteOperationById(operationId);

  @override
  Future<Operation> duplicateOperation(int operationId) async {
    final entity = await getOperationById(operationId);
    var newOperation = entity.copyWith(
      id: 0,
      cloudId: '',
      date: DateTime.now(),
    );

    return insertOperation(newOperation);
  }

  @override
  Future<BaseAccount> getAccountById(int id) async {
    final account = await accountDao.getAccountById(id);
    return AccountMapper().toModel(account);
  }

  @override
  Future<List<BaseAccount>> getAllAccounts() async {
    final accounts = await accountDao.getAllAccounts();
    return AccountMapper().listToModel(accounts);
  }

  @override
  Future<List<BaseAccountBalanceListItem>> getAllBalance() async {
    final accounts = await accountDao.getAllAccounts();
    final users = await userDao.getAllUsers();
    final balances = await accountDao.getAllBalances();
    return AccountMapper().combineBalances(accounts, users, balances);
  }

  @override
  Future<List<Category>> getAllCategories() async =>
      CategoryMapper().listToModel(await categoryDao.getAllCategories());

  @override
  Future<List<Category>> getAllCategoriesByType(OperationType type) async =>
      CategoryMapper()
          .listToModel(await categoryDao.getAllCategoriesByType(type));

  @override
  Future<List<Operation>> getAllOperations() async {
    final operations = await operationDao.getAllOperations();
    return OperationMapper().listToModel(operations);
  }

  @override
  Future<List<Operation>> getAllOperationsWithEmptyCloudId() async {
    final operations =
        await operationDao.getAllOperationItemsWithEmptyCloudId();
    return OperationMapper().entityListToModel(operations);
  }

  @override
  Future<List<CategoryCashFlow>> getCashFlowByType(
      DateTime date, OperationType type) async {
    final categories = await categoryDao.getAllCategoriesByType(type);
    final ids = categories.map((e) => e.id).toSet();
    final monthCashFlow = await categoryDao.getMonthCashFlow(date, ids);
    final yearCashFlow = await categoryDao.getYearCashFlow(date, ids);

    return CategoryMapper()
        .combineCashFlow(categories, monthCashFlow, yearCashFlow);
  }

  @override
  Future<Category> getCategoryById(int id) async =>
      CategoryMapper().toModel(await categoryDao.getCategoryById(id));

  @override
  Future<Operation?> getLastOperation() async {
    final operation = await operationDao.getLastOperationItem();

    if (operation == null) {
      return null;
    }

    return OperationMapper().entityToModel(operation);
  }

  @override
  Future<Operation> getOperationById(int id) async {
    final operation = await operationDao.getOperationById(id);
    return OperationMapper().entityToModel(operation);
  }

  @override
  Future<int> insertAccount(BaseAccount account) =>
      accountDao.insertAccount(AccountsCompanion(
        cloudId: Value(account.cloudId),
        title: Value(account.title),
        isDebt: Value(account is Debt),
        user: Value(account.userId),
      ));

  @override
  Future<int> insertCategory(Category entity) =>
      categoryDao.insertCategory(entity.map(
        inputItem: (item) => CategoriesCompanion(
          cloudId: Value(item.cloudId),
          title: Value(item.title),
          operationType: Value(OperationType.INPUT),
          budgetType: Value(item.budgetType),
          budget: Value(item.budget),
          isGroup: Value(false),
          parent: Value(item.parentId),
        ),
        outputItem: (item) => CategoriesCompanion(
          cloudId: Value(item.cloudId),
          title: Value(item.title),
          operationType: Value(OperationType.OUTPUT),
          budgetType: Value(item.budgetType),
          budget: Value(item.budget),
          isGroup: Value(false),
          parent: Value(item.parentId),
        ),
        inputGroup: (item) => CategoriesCompanion(
          cloudId: Value(item.cloudId),
          title: Value(item.title),
          operationType: Value(OperationType.INPUT),
          budgetType: Value(BudgetType.MONTH),
          budget: Value(0),
          isGroup: Value(true),
          parent: Value(null),
        ),
        outputGroup: (item) => CategoriesCompanion(
          cloudId: Value(item.cloudId),
          title: Value(item.title),
          operationType: Value(OperationType.OUTPUT),
          budgetType: Value(BudgetType.MONTH),
          budget: Value(0),
          isGroup: Value(true),
          parent: Value(null),
        ),
      ));

  @override
  Future<Operation> insertOperation(Operation entity) async {
    final id = await operationDao.insertOperation(
      entity.map(
        input: (o) => OperationsCompanion(
          cloudId: Value(o.cloudId),
          date: Value(o.date),
          operationType: Value(o.type),
          account: Value(o.account),
          category: Value(o.analytic),
          sum: Value(o.sum.sum),
          currencySent: Value(o.sum.currency),
        ),
        output: (o) => OperationsCompanion(
          cloudId: Value(o.cloudId),
          date: Value(o.date),
          operationType: Value(o.type),
          account: Value(o.account),
          category: Value(o.analytic),
          sum: Value(o.sum.sum),
          currencySent: Value(o.sum.currency),
        ),
        transfer: (o) => OperationsCompanion(
          cloudId: Value(o.cloudId),
          date: Value(o.date),
          operationType: Value(o.type),
          account: Value(o.account),
          recAccount: Value(o.analytic),
          sum: Value(o.sum.sum),
          recSum: Value(o.recSum.sum),
          currencySent: Value(o.sum.currency),
          currencyReceived: Value(o.recSum.currency),
        ),
      ),
    );

    return entity.copyWith(id: id);
  }

  @override
  Future<void> recoverOperation(int operationId) async {
    final entity = await getOperationById(operationId);
    await operationDao.recoverOperation(OperationMapper().toDBO(entity));
  }

  @override
  Future<void> updateAccount(BaseAccount account) =>
      accountDao.updateAccount(AccountMapper().toDBO(account));

  @override
  Future<void> updateCategory(Category entity) =>
      categoryDao.updateCategory(CategoryMapper().toDBO(entity));

  @override
  Future<void> updateOperation(Operation operation) =>
      operationDao.updateOperation(OperationMapper().toDBO(operation));

  @override
  Stream<BaseAccount> watchAccountById(int id) {
    return accountDao.watchAccountById(id).map(AccountMapper().toModel);
  }

  @override
  Stream<List<BaseAccount>> watchAllAccounts() =>
      accountDao.watchAllAccounts().map(AccountMapper().listToModel);

  @override
  Stream<List<BaseAccountBalanceListItem>> watchAllBalance() =>
      Rx.combineLatest3<List<AccountDB>, List<UserDB>,
              List<AccountBalanceEntity>, List<BaseAccountBalanceListItem>>(
          accountDao.watchAllAccounts(),
          userDao.watchAllUsers(),
          accountDao.watchAllBalances(),
          AccountMapper().combineBalances);

  @override
  Stream<List<Category>> watchAllCategories() =>
      categoryDao.watchAllCategories().map(CategoryMapper().listToModel);

  @override
  Stream<List<Category>> watchAllCategoriesByType(OperationType type) =>
      categoryDao
          .watchAllCategoriesByType(type)
          .map(CategoryMapper().listToModel);

  @override
  Stream<List<Operation>> watchAllOperations() => operationDao
      .watchAllOperationItems()
      .map(OperationMapper().entityListToModel);

  @override
  Stream<List<OperationListItem>> watchAllOperationsByAccount(int accountId) {
    return Rx.combineLatest2(
        operationDao.watchAllOperationItemsByAccount(accountId),
        userDao.watchAllUsers().map(UserMapper().listToModel),
        (operations, users) {
      return OperationMapper().entityListToItem(operations, users);
    });
  }

  @override
  Stream<List<OperationListItem>> watchAllOperationsByCategory(int categoryId) {
    return Rx.combineLatest2(
        operationDao.watchAllOperationItemsByCategory(categoryId),
        userDao.watchAllUsers().map(UserMapper().listToModel),
        (operations, users) {
      return OperationMapper().entityListToItem(operations, users);
    });
  }

  @override
  Stream<List<OperationListItem>> watchAllOperationsByFilter(
      OperationListFilter filter) {
    return Rx.combineLatest2(
        operationDao.watchAllOperationItemsByFilter(
          start: filter.period?.start,
          end: filter.period?.end,
          accountIds: filter.accountIds,
          categoriesIds: filter.categoryIds,
        ),
        userDao.watchAllUsers().map(UserMapper().listToModel),
        (operations, users) {
      return OperationMapper().entityListToItem(operations, users);
    });
  }

  @override
  Stream<List<CategoryCashFlow>> watchCashFlow(DateTime date) {
    return Rx.combineLatest3(
        categoryDao.watchAllCategories(),
        categoryDao.watchMonthCashFlow(date, {}),
        categoryDao.watchYearCashFlow(date, {}),
        CategoryMapper().combineCashFlow);
  }

  @override
  Stream<List<SumOnDate>> watchCashFlowByCategoryByMonth(int id) =>
      categoryDao.watchCashflowByCategoryByMonth(id);

  @override
  Stream<List<SumOnDate>> watchCashFlowByCategoryByYear(int id) =>
      categoryDao.watchCashflowByCategoryByYear(id);

  @override
  Stream<List<CategoryCashFlow>> watchCashFlowByType(
          DateTime date, CategoryType type) {

    final operationType = switch(type){
      CategoryType.INPUT => OperationType.INPUT,
      CategoryType.OUTPUT => OperationType.OUTPUT,
    };

    return Rx.combineLatest3(
        categoryDao.watchAllCategoriesByType(operationType), // TODO rewrite to CategoryType
        categoryDao.watchMonthCashFlow(date, {}),
        categoryDao.watchYearCashFlow(date, {}),
        CategoryMapper().combineCashFlow);
  }

  @override
  Stream<Category> watchCategoryById(int id) =>
      categoryDao.watchCategoryById(id).map(CategoryMapper().toModel);

  @override
  Stream<List<OperationListItem>> watchLastOperations(int limit) {
    return Rx.combineLatest2(operationDao.watchLastOperationItems(limit),
        userDao.watchAllUsers().map(UserMapper().listToModel),
        (operations, users) {
      return OperationMapper().entityListToItem(operations, users);
    });
  }

  @override
  Future<User?> getUserByGoogleId(String googleId) async {
    if (googleId.isEmpty) {
      return null;
    }
    final user = await userDao.getByGoogleId(googleId);
    return user == null ? null : UserMapper().toModel(user);
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
    return UserMapper().listToModel(users);
  }

  @override
  Future<double> eurRate() {
    return currencyRateSource.getEUR();
  }

  @override
  Future<double> usdRate() {
    return currencyRateSource.getUSD();
  }
}
