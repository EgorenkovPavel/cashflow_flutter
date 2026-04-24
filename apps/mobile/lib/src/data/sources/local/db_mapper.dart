import 'package:money_tracker/src/data/sources/local/data/database.dart';
import 'package:money_tracker/src/data/sources/local/entities/cashflow_entity.dart';

import '../../../domain/models.dart';
import '../../../utils/logger.dart';
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
      account: o.accountSend,
      category: null,
      recAccount: o.accountReceived,
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
      sum: o.sumSend.sum,
      recSum: o.sumReceived.sum,
      synced: false,
      deleted: o.deleted,
      currencySent: o.sumSend.currency,
      currencyReceived: o.sumReceived.currency,
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
        sum: Money(dbo.sum, dbo.currencySent),
      ),
      output: () => OutputOperation(
        id: dbo.id,
        cloudId: dbo.cloudId,
        synced: dbo.synced,
        deleted: dbo.deleted,
        date: dbo.date,
        account: dbo.account,
        category: dbo.category!,
        sum: Money(dbo.sum, dbo.currencySent),
      ),
      transfer: () => TransferOperation(
        id: dbo.id,
        cloudId: dbo.cloudId,
        synced: dbo.synced,
        deleted: dbo.deleted,
        date: dbo.date,
        accountSend: dbo.account,
        accountReceived: dbo.recAccount!,
        sum: Money(dbo.sum, dbo.currencySent),
      ),
      exchange: () => ExchangeOperation(
        id: dbo.id,
        cloudId: dbo.cloudId,
        synced: dbo.synced,
        deleted: dbo.deleted,
        date: dbo.date,
        account: dbo.account,
        sumSend: Money(dbo.sum, dbo.currencySent),
        sumReceived: Money(dbo.recSum, dbo.currencyReceived),
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
      input: () => OperationListItem(
        operation: toModel(entity.operationData),
        user: user,
        accountTitle: entity.account.title,
        analyticTitle: entity.category!.title,
      ),
      output: () => OperationListItem(
        operation: toModel(entity.operationData),
        user: user,
        accountTitle: entity.account.title,
        analyticTitle: entity.category!.title,
      ),
      transfer: () => OperationListItem(
        operation: toModel(entity.operationData),
        user: user,
        accountTitle: entity.account.title,
        analyticTitle: entity.recAccount!.title,
      ),
      exchange: () => OperationListItem(
        operation: toModel(entity.operationData),
        user: user,
        accountTitle: entity.account.title,
        analyticTitle: '',
      ),
    );
  }

  List<OperationListItem> entityListToItem(
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
      operationType: model.type,
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
        operationType: model.type,
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
      return Category.group(
        id: dbo.id,
        type: dbo.operationType,
        title: dbo.title,
        cloudId: dbo.cloudId,
      );
    } else {
      return Category.item(
        id: dbo.id,
        cloudId: dbo.cloudId,
        title: dbo.title,
        budget: dbo.budget,
        budgetType: dbo.budgetType,
        parentId: dbo.parent,
        type: dbo.operationType,
      );
    }
  }

  List<CategoryCashFlow> combineCashFlow(
    List<CategoryDB> categories,
    List<CashflowEntity> monthCashflow,
    List<CashflowEntity> yearCashflow,
  ) {
    return categories.map((category) {
      final month = Balance(
        monthCashflow
            .where((cashflow) => cashflow.categoryId == category.id)
            .map((cashflow) => cashflow.sum)
            .toList(),
      );

      final year = Balance(
        yearCashflow
            .where((cashflow) => cashflow.categoryId == category.id)
            .map((cashflow) => cashflow.sum)
            .toList(),
      );

      return CategoryCashFlow(
        type: category.operationType,
        categoryId: category.id,
        budgetType: category.budgetType,
        budget: category.budget,
        categoryTitle: category.title,
        monthCashFlow: month,
        yearCashFlow: year,
        parentId: category.parent,
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

  List<AccountBalanceItem> combineBalances(
    List<AccountDB> accounts,
    List<UserDB> users,
    List<AccountBalanceEntity> balances,
  ) {
    try {
      return accounts.map((account) {
        final user = account.user == null
            ? null
            : users.where((e) => e.id == account.user).firstOrNull;
        final balance =
          balances
              .where((balance) => balance.accountId == account.id)
              .map((balance) => balance.balance).firstOrNull ?? Balance();

        return AccountBalanceItem(
          account: AccountMapper().toModel(account),
          user: user == null ? null : UserMapper().toModel(user),
          balance: balance,
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
