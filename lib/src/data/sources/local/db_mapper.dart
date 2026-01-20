import 'package:money_tracker/src/data/sources/local/data/database.dart';
import 'package:money_tracker/src/data/sources/local/entities/cashflow_entity.dart';

import '../../../domain/models.dart';
import '../../../domain/view_models.dart';
import '../../../utils/balance.dart';
import '../../../utils/logger.dart';
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
      operationType: o.operationType,
      account: o.account,
      category: o.category,
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
      operationType: o.operationType,
      account: o.account,
      category: o.category,
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
      operationType: o.operationType,
      account: o.account,
      category: null,
      recAccount: o.recAccount,
      sum: o.sum.sum,
      recSum: 0,
      synced: false,
      deleted: o.deleted,
      currencySent: o.sum.currency,
      currencyReceived: o.sum.currency,
    ),
    exchange: (o) => OperationDB(
      id: o.id,
      cloudId: o.cloudId,
      date: o.date,
      operationType: o.operationType,
      account: o.account,
      category: null,
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
      input: () => InputOperation(
        id: dbo.id,
        cloudId: dbo.cloudId,
        synced: dbo.synced,
        deleted: dbo.deleted,
        date: dbo.date,
        account: dbo.account,
        category: dbo.category!,
        sum: Sum(dbo.sum, dbo.currencySent),
      ),
      output: () => OutputOperation(
        id: dbo.id,
        cloudId: dbo.cloudId,
        synced: dbo.synced,
        deleted: dbo.deleted,
        date: dbo.date,
        account: dbo.account,
        category: dbo.category!,
        sum: Sum(dbo.sum, dbo.currencySent),
      ),
      transfer: () => TransferOperation(
        id: dbo.id,
        cloudId: dbo.cloudId,
        synced: dbo.synced,
        deleted: dbo.deleted,
        date: dbo.date,
        account: dbo.account,
        recAccount: dbo.recAccount!,
        sum: Sum(dbo.sum, dbo.currencySent),
      ),
      exchange: () => ExchangeOperation(
        id: dbo.id,
        cloudId: dbo.cloudId,
        synced: dbo.synced,
        deleted: dbo.deleted,
        date: dbo.date,
        account: dbo.account,
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

  OperationView toListItem(OperationDbEntity entity, User? user) {
    final dbo = entity.operationData;
    return dbo.operationType.map(
      input: () => InputOperationView(
        id: dbo.id,
        date: dbo.date,
        synced: dbo.synced,
        deleted: dbo.deleted,
        account: entity.account.title,
        category: entity.category!.title,
        sum: Sum(dbo.sum, dbo.currencySent),
        userPhotoUrl: user?.photo ?? '',
        userName: user?.name ?? '',
      ),
      output: () => OutputOperationView(
        id: dbo.id,
        date: dbo.date,
        synced: dbo.synced,
        deleted: dbo.deleted,
        account: entity.account.title,
        category: entity.category!.title,
        sum: Sum(dbo.sum, dbo.currencySent),
        userPhotoUrl: user?.photo ?? '',
        userName: user?.name ?? '',
      ),
      transfer: () => TransferOperationView(
        id: dbo.id,
        date: dbo.date,
        synced: dbo.synced,
        deleted: dbo.deleted,
        account: entity.account.title,
        recAccount: entity.recAccount!.title,
        sum: Sum(dbo.sum, dbo.currencySent),
        userPhotoUrl: user?.photo ?? '',
        userName: user?.name ?? '',
      ),
      exchange: () => ExchangeOperationView(
        id: dbo.id,
        date: dbo.date,
        synced: dbo.synced,
        deleted: dbo.deleted,
        account: entity.account.title,
        sendSum: Sum(dbo.sum, dbo.currencySent),
        receivedSum: Sum(dbo.recSum, dbo.currencyReceived),
        userPhotoUrl: user?.photo ?? '',
        userName: user?.name ?? '',
      ),
    );
  }

  List<OperationView> entityListToItem(
    List<OperationDbEntity> list,
    List<User> users,
  ) => list
      .map(
        (e) => toListItem(
          e,
          users.where((u) => u.id == e.account.user).firstOrNull,
        ),
      )
      .toList();
}

class CategoryMapper extends DBMapper<Category, CategoryDB> {
  const CategoryMapper();

  @override
  CategoryDB toDBO(Category model) => switch (model) {
    CategoryGroup(:final id, :final cloudId, :final title) => CategoryDB(
      id: id,
      cloudId: cloudId,
      title: title,
      operationType: model.operationType,
      budgetType: BudgetType.MONTH,
      budget: 0,
      synced: false,
      isGroup: true,
    ),

    CategoryItem(
      :final id,
      :final cloudId,
      :final title,
      :final budgetType,
      :final budget,
      :final parentId,
    ) =>
      CategoryDB(
        id: id,
        cloudId: cloudId,
        title: title,
        operationType: model.operationType,
        budgetType: budgetType,
        budget: budget,
        synced: false,
        isGroup: false,
        parent: parentId,
      ),
  };

  @override
  Category toModel(CategoryDB dbo) {
    if (dbo.isGroup) {
      if (dbo.operationType == OperationType.INPUT) {
        return Category.group(
          id: dbo.id,
          type: CategoryType.INPUT,
          title: dbo.title,
          cloudId: dbo.cloudId,
        );
      } else {
        return Category.group(
          id: dbo.id,
          type: CategoryType.OUTPUT,
          title: dbo.title,
          cloudId: dbo.cloudId,
        );
      }
    } else {
      if (dbo.operationType == OperationType.INPUT) {
        return Category.item(
          id: dbo.id,
          cloudId: dbo.cloudId,
          title: dbo.title,
          budget: dbo.budget,
          budgetType: dbo.budgetType,
          parentId: dbo.parent,
          type: CategoryType.INPUT,
        );
      } else {
        return Category.item(
          id: dbo.id,
          cloudId: dbo.cloudId,
          title: dbo.title,
          budget: dbo.budget,
          budgetType: dbo.budgetType,
          parentId: dbo.parent,
          type: CategoryType.OUTPUT,
        );
      }
    }
  }

  List<CategoryCashFlow> combineCashFlow(
    List<CategoryDB> categories,
    List<CashflowEntity> monthCashflow,
    List<CashflowEntity> yearCashflow,
  ) {
    return categories.map((category) {
      final month = Balance.fromSums(
        monthCashflow
            .where((cashflow) => cashflow.categoryId == category.id)
            .map((cashflow) => cashflow.sum)
            .toList(),
      );

      final year = Balance.fromSums(
        yearCashflow
            .where((cashflow) => cashflow.categoryId == category.id)
            .map((cashflow) => cashflow.sum)
            .toList(),
      );

      final CategoryType type = switch (category.operationType) {
        .INPUT => .INPUT,
        _ => .OUTPUT,
      };

      return CategoryCashFlow(
        type: type,
        categoryId: category.id,
        budgetType: category.budgetType,
        budget: category.budget,
        categoryTitle: category.title,
        monthCashFlow: month,
        yearCashFlow: year,
      );
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

  List<AccountBalanceView> combineBalances(
    List<AccountDB> accounts,
    List<UserDB> users,
    List<AccountBalanceEntity> balances,
  ) {
    try {
      return accounts.map((account) {
        final user = account.user == null
            ? null
            : users.where((e) => e.id == account.user).firstOrNull;
        final balance = Balance.fromSums(
          balances
              .where((balance) => balance.accountId == account.id)
              .map((balance) => Sum(balance.sum, balance.currency))
              .toList(),
        );

        return AccountBalanceView(
          accountId: account.id,
          userId: account.user,
          accountTitle: account.title,
          userName: user?.name ?? '',
          userPhoto: user?.photo ?? '',
          balance: balance,
          isDebt: account.isDebt,
        );
      }).toList();
    } catch (e, stacktrace) {
      AppLogger.error('Failed to combine balances', e, stacktrace);
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
