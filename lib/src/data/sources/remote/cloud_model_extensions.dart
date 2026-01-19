import 'package:money_tracker/src/data/sources/local/db_converters/budget_type_converter.dart';
import 'package:money_tracker/src/data/sources/local/db_converters/operation_type_converter.dart';
import 'package:money_tracker/src/data/sources/remote/models/cloud_models.dart';
import 'package:money_tracker/src/domain/models.dart';

extension CloudAccountMapper on BaseAccount {
  CloudAccount toCloudAccount(User? user) => CloudAccount(
    id: cloudId,
    title: title,
    isDebt: this is Debt,
    deleted: false,
    user: user?.googleId ?? '',
  );
}

extension CloudCategoryMapper on Category {
  CloudCategory toCloudCategory(CategoryGroup? parent) => map(
    item: (c) => CloudCategory(
      id: cloudId,
      title: title,
      operationType: const OperationTypeConverter().toSql(c.operationType),
      budgetType: const BudgetTypeConverter().toSql(c.budgetType),
      budget: c.budget,
      isGroup: false,
      parent: parent?.cloudId ?? '',
    ),
    group: (c) => CloudCategory(
      id: cloudId,
      title: title,
      operationType: const OperationTypeConverter().toSql(c.operationType),
      budgetType: const BudgetTypeConverter().toSql(BudgetType.MONTH),
      budget: 0,
      isGroup: true,
      parent: '',
    ),
  );
}

extension CloudOperationMapper on Operation {
  CloudOperation toCloudOperation(
    String accountCloudId,
    String analyticCloudId,
  ) => map(
    input: (o) => CloudOperation(
      id: o.cloudId,
      date: o.date,
      operationType: const OperationTypeConverter().toSql(o.operationType),
      account: accountCloudId,
      category: analyticCloudId,
      sum: o.sum.sum,
      deleted: o.deleted,
      currencySent: o.sum.currency.toString(),
      currencyReceived: o.sum.currency.toString(),
    ),
    output: (o) => CloudOperation(
      id: o.cloudId,
      date: o.date,
      operationType: const OperationTypeConverter().toSql(o.operationType),
      account: accountCloudId,
      category: analyticCloudId,
      sum: o.sum.sum,
      deleted: o.deleted,
      currencySent: o.sum.currency.toString(),
      currencyReceived: o.sum.currency.toString(),
    ),
    transfer: (o) => CloudOperation(
      id: o.cloudId,
      date: o.date,
      operationType: const OperationTypeConverter().toSql(o.operationType),
      account: accountCloudId,
      recAccount: analyticCloudId,
      sum: o.sum.sum,
      deleted: o.deleted,
      currencySent: o.sum.currency.toString(),
      currencyReceived: o.sum.currency.toString(),
    ),
    exchange: (o) => CloudOperation(
      id: o.cloudId,
      date: o.date,
      operationType: const OperationTypeConverter().toSql(o.operationType),
      account: accountCloudId,
      sum: o.sum.sum,
      recSum: o.recSum.sum,
      deleted: o.deleted,
      currencySent: o.sum.currency.toString(),
      currencyReceived: o.recSum.currency.toString(),
    ),
  );
}
