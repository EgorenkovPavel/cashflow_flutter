import 'package:money_tracker/src/data/sources/local/data/database.dart';
import 'package:money_tracker/src/data/sources/local/entities/cashflow_entity.dart';
import '../../../domain/models.dart';
import '../../../utils/sum.dart';
import 'entities/account_balance_entity.dart';
import 'entities/operation_entity.dart';

class OperationMapper extends DBMapper<Operation, OperationDB> {
  const OperationMapper();

  @override
  OperationDB toDBO(Operation model) => model.map(
        input: (o) => OperationDB(
          id: o.id,
          cloudId: o.cloudId,
          date: o.date,
          operationType: o.type,
          account: o.account,
          category: o.analytic,
          recAccount: null,
          sum: o.sum.sum,
          recSum: 0,
          synced: false,
          deleted: o.deleted,
          currencySent: o.sum.currency,
          currencyReceived: o.sum.currency,
        ),
        output: (o) => OperationDB(
          id: o.id,
          cloudId: o.cloudId,
          date: o.date,
          operationType: o.type,
          account: o.account,
          category: o.analytic,
          recAccount: null,
          sum: o.sum.sum,
          recSum: 0,
          synced: false,
          deleted: o.deleted,
          currencySent: o.sum.currency,
          currencyReceived: o.sum.currency,
        ),
        transfer: (o) => OperationDB(
          id: o.id,
          cloudId: o.cloudId,
          date: o.date,
          operationType: o.type,
          account: o.account,
          category: null,
          recAccount: o.analytic,
          sum: o.sum.sum,
          recSum: o.recSum.sum,
          synced: false,
          deleted: o.deleted,
          currencySent: o.sum.currency,
          currencyReceived: o.recSum.currency,
        ),
      );

  @override
  Operation toModel(OperationDB dbo) {
    return dbo.operationType.map(
      INPUT: () => InputOperation(
        id: dbo.id,
        cloudId: dbo.cloudId,
        synced: dbo.synced,
        deleted: dbo.deleted,
        date: dbo.date,
        account: dbo.account,
        category: dbo.category!,
        sum: Sum(dbo.sum, dbo.currencySent),
      ),
      OUTPUT: () => OutputOperation(
        id: dbo.id,
        cloudId: dbo.cloudId,
        synced: dbo.synced,
        deleted: dbo.deleted,
        date: dbo.date,
        account: dbo.account,
        category: dbo.category!,
        sum: Sum(dbo.sum, dbo.currencySent),
      ),
      TRANSFER: () => TransferOperation(
        id: dbo.id,
        cloudId: dbo.cloudId,
        synced: dbo.synced,
        deleted: dbo.deleted,
        date: dbo.date,
        account: dbo.account,
        recAccount: dbo.recAccount!,
        sum: Sum(dbo.sum, dbo.currencySent),
        recSum: Sum(dbo.recSum, dbo.currencyReceived),
      ),
    );
  }

  Operation entityToModel(OperationDbEntity dbo) {
    return toModel(dbo.operationData);
  }

  List<Operation> entityListToModel(List<OperationDbEntity> list) =>
      list.map((e) => entityToModel(e)).toList();

  OperationListItem toListItem(OperationDbEntity entity, User? user) {
    final dbo = entity.operationData;
    return dbo.operationType.map(
      INPUT: () => OperationListItem(
        id: dbo.id,
        date: dbo.date,
        synced: dbo.synced,
        deleted: dbo.deleted,
        account: entity.account.title,
        analytic: entity.category!.title,
        sum: Sum(dbo.sum, dbo.currencySent),
        type: OperationType.INPUT,
        userPhotoUrl: user?.photo ?? '',
      ),
      OUTPUT: () => OperationListItem(
        id: dbo.id,
        date: dbo.date,
        synced: dbo.synced,
        deleted: dbo.deleted,
        account: entity.account.title,
        analytic: entity.category!.title,
        sum: Sum(dbo.sum, dbo.currencySent),
        type: OperationType.OUTPUT,
        userPhotoUrl: user?.photo ?? '',
      ),
      TRANSFER: () => OperationListItem(
        id: dbo.id,
        date: dbo.date,
        synced: dbo.synced,
        deleted: dbo.deleted,
        account: entity.account.title,
        analytic: entity.recAccount!.title,
        sum: Sum(dbo.sum, dbo.currencySent),
        type: OperationType.TRANSFER,
        userPhotoUrl: user?.photo ?? '',
      ),
    );
  }

  List<OperationListItem> entityListToItem(
          List<OperationDbEntity> list, List<User> users) =>
      list
          .map((e) => toListItem(
              e, users.where((u) => u.id == e.account.user).firstOrNull))
          .toList();
}

class CategoryMapper extends DBMapper<Category, CategoryDB> {
  const CategoryMapper();

  @override
  CategoryDB toDBO(Category model) => model.map(
        inputItem: (item) => CategoryDB(
          id: item.id,
          cloudId: item.cloudId,
          title: item.title,
          operationType: OperationType.INPUT,
          budgetType: item.budgetType,
          budget: item.budget,
          synced: false,
          isGroup: false,
          parent: item.parentId,
        ),
        outputItem: (item) => CategoryDB(
          id: item.id,
          cloudId: item.cloudId,
          title: item.title,
          operationType: OperationType.OUTPUT,
          budgetType: item.budgetType,
          budget: item.budget,
          synced: false,
          isGroup: false,
          parent: item.parentId,
        ),
        inputGroup: (group) => CategoryDB(
          id: group.id,
          cloudId: group.cloudId,
          title: group.title,
          operationType: OperationType.INPUT,
          budgetType: BudgetType.MONTH,
          budget: 0,
          synced: false,
          isGroup: true,
        ),
        outputGroup: (group) => CategoryDB(
          id: group.id,
          cloudId: group.cloudId,
          title: group.title,
          operationType: OperationType.OUTPUT,
          budgetType: BudgetType.MONTH,
          budget: 0,
          synced: false,
          isGroup: true,
        ),
      );

  @override
  Category toModel(CategoryDB dbo) {
    if (dbo.isGroup) {
      if (dbo.operationType == OperationType.INPUT) {
        return InputCategoryGroup(
            id: dbo.id, title: dbo.title, cloudId: dbo.cloudId);
      } else {
        return OutputCategoryGroup(
            id: dbo.id, title: dbo.title, cloudId: dbo.cloudId);
      }
    } else {
      if (dbo.operationType == OperationType.INPUT) {
        return InputCategoryItem(
            id: dbo.id,
            cloudId: dbo.cloudId,
            title: dbo.title,
            budget: dbo.budget,
            budgetType: dbo.budgetType,
            parentId: dbo.parent);
      } else {
        return OutputCategoryItem(
            id: dbo.id,
            cloudId: dbo.cloudId,
            title: dbo.title,
            budget: dbo.budget,
            budgetType: dbo.budgetType,
            parentId: dbo.parent);
      }
    }
  }

  List<CategoryCashFlow> combineCashFlow(
    List<CategoryDB> categories,
    List<CashflowEntity> monthCashflow,
    List<CashflowEntity> yearCashflow,
  ) {
    return categories.map((category) {
      final month = Balance.fromSums(monthCashflow
          .where((cashflow) => cashflow.categoryId == category.id)
          .map((cashflow) => cashflow.sum)
          .toList());

      final year = Balance.fromSums(yearCashflow
          .where((cashflow) => cashflow.categoryId == category.id)
          .map((cashflow) => cashflow.sum)
          .toList());

      if (category.operationType == OperationType.INPUT) {
        return InputCategoryCashFlow(
          categoryId: category.id,
          budgetType: category.budgetType,
          budget: category.budget,
          categoryTitle: category.title,
          monthCashFlow: month,
          yearCashFlow: year,
        );
      } else {
        return OutputCategoryCashFlow(
          categoryId: category.id,
          budgetType: category.budgetType,
          budget: category.budget,
          categoryTitle: category.title,
          monthCashFlow: month,
          yearCashFlow: year,
        );
      }
    }).toList();
  }
}

class AccountMapper extends DBMapper<BaseAccount, AccountDB> {
  const AccountMapper();

  @override
  AccountDB toDBO(BaseAccount model) => AccountDB(
        id: model.id,
        cloudId: model.cloudId,
        title: model.title,
        isDebt: model is Debt,
        synced: false,
        user: model.userId,
      );

  @override
  BaseAccount toModel(AccountDB dbo) {
    if (dbo.isDebt) {
      return Debt(
        id: dbo.id,
        cloudId: dbo.cloudId,
        title: dbo.title,
        userId: dbo.user,
      );
    } else {
      return Account(
        id: dbo.id,
        cloudId: dbo.cloudId,
        title: dbo.title,
        userId: dbo.user,
      );
    }
  }

  List<BaseAccountBalanceListItem> combineBalances(List<AccountDB> accounts,
      List<UserDB> users, List<AccountBalanceEntity> balances) {
    try {
      return accounts.map((account) {
        final user = account.user == null
            ? null
            : users.where((e) => e.id == account.user).firstOrNull;
        final balance = Balance.fromSums(balances
            .where((balance) => balance.accountId == account.id)
            .map((balance) => Sum(balance.sum, balance.currency))
            .toList());
        if (account.isDebt) {
          return DebtBalanceListItem(
              accountId: account.id,
              userId: account.user,
              accountTitle: account.title,
              userName: user?.name ?? '',
              userPhoto: user?.photo ?? '',
              balance: balance);
        } else {
          return AccountBalanceListItem(
              accountId: account.id,
              userId: account.user,
              accountTitle: account.title,
              userName: user?.name ?? '',
              userPhoto: user?.photo ?? '',
              balance: balance);
        }
      }).toList();
    } catch (e, stacktrace) {
      print(stacktrace);
      rethrow;
    }
  }
}

class UserMapper extends DBMapper<User, UserDB> {
  const UserMapper();

  @override
  UserDB toDBO(User model) => UserDB(
        id: model.id,
        name: model.name,
        photo: model.photo,
        googleId: model.googleId,
      );

  @override
  User toModel(UserDB dbo) => User(
        id: dbo.id,
        googleId: dbo.googleId,
        name: dbo.name,
        photo: dbo.photo,
      );
}

abstract class DBMapper<Model, DBO> {
  const DBMapper();

  Model toModel(DBO dbo);

  DBO toDBO(Model model);

  List<Model> listToModel(List<DBO> list) =>
      list.map((e) => toModel(e)).toList();

  List<DBO> listToDBO(List<Model> list) => list.map((e) => toDBO(e)).toList();
}
