import '../../../domain/models.dart';
import '../../../utils/sum.dart';
import 'data/database.dart';
import 'entities/account_balance_entity.dart';
import 'entities/category_cashflow_entity.dart';
import 'entities/category_month_cashflow_entity.dart';
import 'entities/operation_entity.dart';

class MapperDB {
  // User

  static User mapUser(UserDB c) => User(
        id: c.id,
        googleId: c.googleId,
        name: c.name,
        photo: c.photo,
      );

  static List<User> mapUserList(List<UserDB> list) => list.map((e) => mapUser(e)).toList();

  static UserDB mapUserDB(User c) => UserDB(
        id: c.id,
        name: c.name,
        photo: c.photo,
        googleId: c.googleId,
      );

  static UserDB? _findUser(int? userId, List<UserDB> users) {
    if (userId == null){
      return null;
    }
    return users.where((e) => e.id == userId).firstOrNull;
  }

  //Accounts

  static Account _mapAccountWithUsers(AccountDB account, List<UserDB> users) {
    return createAccount(account, _findUser(account.user, users));
  }

  static Account createAccount(AccountDB account, UserDB? user) {
    return Account(
      id: account.id,
      cloudId: account.cloudId,
      title: account.title,
      isDebt: account.isDebt,
      user: user == null
          ? null
          : mapUser(user),
    );
  }

  static AccountDB mapAccountDB(Account a) {
    return AccountDB(
      id: a.id,
      cloudId: a.cloudId,
      title: a.title,
      isDebt: a.isDebt,
      synced: false,
      user: a.user?.id,
    );
  }

  static List<Account> combineUsers(
      List<AccountDB> accounts, List<UserDB> users) {
    return accounts.map((a) => _mapAccountWithUsers(a, users)).toList();
  }

  static List<AccountBalance> combineBalances(List<AccountDB> accounts,
      List<AccountBalanceEntity> balances, List<UserDB> users) {
    return combineUsers(accounts, users)
        .map((account) => AccountBalance(
            account: account,
            balance: Balance.fromSums(balances
                .where((balance) => balance.accountId == account.id)
                .map((balance) => Sum(balance.sum, balance.currency))
                .toList())))
        .toList();
  }

  //Categories

  static CategoryDB mapCategoryDB(Category item) => CategoryDB(
        id: item.id,
        cloudId: item.cloudId,
        title: item.title,
        operationType: item.operationType,
        budgetType: item.budgetType,
        budget: item.budget,
        synced: false,
      );

  static Category mapCategory(CategoryDB item) => Category(
        id: item.id,
        cloudId: item.cloudId,
        title: item.title,
        operationType: item.operationType,
        budgetType: item.budgetType,
        budget: item.budget,
      );

  static List<Category> mapCategoryList(List<CategoryDB> list) =>
      list.map(mapCategory).toList();

  // Cashflow

  static CategoryCashflowEntity _mapCashflowDB(CategoryCashflow c) {
    return CategoryCashflowEntity(
      category: mapCategoryDB(c.category),
      monthCashflow: c.monthCashflow,
      yearCashflow: c.yearCashflow,
    );
  }

  static CategoryCashflow _mapCashflow(CategoryCashflowEntity c) {
    return CategoryCashflow(
      category: mapCategory(c.category),
      monthCashflow: c.monthCashflow,
      yearCashflow: c.yearCashflow,
    );
  }

  static List<CategoryCashflow> mapCategoryCashflowList(
    List<CategoryCashflowEntity> list,
  ) =>
      list.map(_mapCashflow).toList();

  static CategoryMonthCashflowEntity _mapMonthCashflowDB(
      CategoryMonthCashflow c) {
    return CategoryMonthCashflowEntity(
      category: mapCategoryDB(c.category),
      month: c.month,
      cashflow: c.cashflow,
    );
  }

  static CategoryMonthCashflow _mapMonthCashflow(
      CategoryMonthCashflowEntity c) {
    return CategoryMonthCashflow(
      category: mapCategory(c.category),
      month: c.month,
      cashflow: c.cashflow,
    );
  }

  static List<CategoryMonthCashflow> mapCategoryMonthCashflowList(
    List<CategoryMonthCashflowEntity> list,
  ) =>
      list.map(_mapMonthCashflow).toList();

  // Operations

  static OperationDB mapOperationDB(Operation o) => o.map(
        input: (o) => OperationDB(
          id: o.id,
          cloudId: o.cloudId,
          date: o.date,
          operationType: o.type,
          account: o.account.id,
          category: o.category.id,
          recAccount: null,
          sum: o.sum,
          recSum: 0,
          synced: false,
          deleted: o.deleted,
          currencySent: o.currency,
          currencyReceived: o.currency,
        ),
        output: (o) => OperationDB(
          id: o.id,
          cloudId: o.cloudId,
          date: o.date,
          operationType: o.type,
          account: o.account.id,
          category: o.category.id,
          recAccount: null,
          sum: o.sum,
          recSum: 0,
          synced: false,
          deleted: o.deleted,
          currencySent: o.currency,
          currencyReceived: o.currency,
        ),
        transfer: (o) => OperationDB(
          id: o.id,
          cloudId: o.cloudId,
          date: o.date,
          operationType: o.type,
          account: o.account.id,
          category: null,
          recAccount: o.recAccount.id,
          sum: o.sum,
          recSum: o.recSum,
          synced: false,
          deleted: o.deleted,
          currencySent: o.currencySent,
          currencyReceived: o.currencyReceived,
        ),
      );

  static Operation mapOperation(OperationDbEntity o, List<UserDB> users) {
    return o.operationData.operationType.map(
      INPUT: () => Operation.input(
        id: o.operationData.id,
        cloudId: o.operation.cloudId,
        synced: o.synced,
        deleted: o.operation.deleted,
        date: o.operationData.date,
        account: _mapAccountWithUsers(o.account, users),
        category: mapCategory(o.category!),
        sum: o.operationData.sum,
        currency: o.operationData.currencySent,
      ),
      OUTPUT: () => Operation.output(
        id: o.operationData.id,
        cloudId: o.operation.cloudId,
        synced: o.synced,
        deleted: o.operation.deleted,
        date: o.operationData.date,
        account: _mapAccountWithUsers(o.account, users),
        category: mapCategory(o.category!),
        sum: o.operationData.sum,
        currency: o.operationData.currencySent,
      ),
      TRANSFER: () => Operation.transfer(
        id: o.operationData.id,
        cloudId: o.operation.cloudId,
        synced: o.synced,
        deleted: o.operation.deleted,
        date: o.operationData.date,
        account: _mapAccountWithUsers(o.account, users),
        recAccount: _mapAccountWithUsers(o.recAccount!, users),
        sum: o.operationData.sum,
        recSum: o.operationData.recSum,
        currencySent: o.operationData.currencySent,
        currencyReceived: o.operationData.currencyReceived,
      ),
    );
  }

  static List<Operation> combineOperationWithUser(
    List<OperationDbEntity> operations,
    List<UserDB> users,
  ) {
    return operations.map((a) => mapOperation(a, users)).toList();
  }

  static Account findAccount(int id, List<Account> accounts) =>
      accounts.where((e) => e.id == id).first;

  static Category findCategory(int id, List<Category> categories) =>
      categories.where((e) => e.id == id).first;

  static List<Operation> mapOperationList(
    List<OperationDbEntity> list,
    List<UserDB> users,
  ) =>
      list.map((e) => mapOperation(e, users)).toList();
}
