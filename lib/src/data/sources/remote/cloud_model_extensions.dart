import 'package:money_tracker/src/data/sources/local/db_converters/budget_type_converter.dart';
import 'package:money_tracker/src/data/sources/local/db_converters/currency_converter.dart';
import 'package:money_tracker/src/data/sources/local/db_converters/operation_type_converter.dart';
import 'package:money_tracker/src/data/sources/remote/models/cloud_models.dart';
import 'package:money_tracker/src/domain/models.dart';

extension CloudAccountMapper on Account {
  CloudAccount toCloudAccount() => CloudAccount(
        id: cloudId,
        title: title,
        isDebt: isDebt,
        deleted: false,
        currency: const CurrencyConverter().toSql(currency),
      );
}

extension CloudCategoryMapper on Category {
  CloudCategory toCloudCategory() => CloudCategory(
        id: cloudId,
        title: title,
        operationType: const OperationTypeConverter().toSql(operationType),
        budgetType: const BudgetTypeConverter().toSql(budgetType),
        budget: budget,
        currency: const CurrencyConverter().toSql(currency),
        deleted: false,
      );
}

extension CloudOperationMapper on Operation {
  CloudOperation toCloudOperation() => map(
        input: (o) => CloudOperation(
          id: o.cloudId,
          date: o.date,
          operationType: const OperationTypeConverter().toSql(o.type),
          account: o.account.cloudId,
          category: o.category.cloudId,
          sum: o.sum,
          deleted: o.deleted,
        ),
        output: (o) => CloudOperation(
          id: o.cloudId,
          date: o.date,
          operationType: const OperationTypeConverter().toSql(o.type),
          account: o.account.cloudId,
          category: o.category.cloudId,
          sum: o.sum,
          deleted: o.deleted,
        ),
        transfer: (o) => CloudOperation(
          id: o.cloudId,
          date: o.date,
          operationType: const OperationTypeConverter().toSql(o.type),
          account: o.account.cloudId,
          recAccount: o.recAccount.cloudId,
          sum: o.sum,
          recSum: o.recSum,
          deleted: o.deleted,
        ),
      );
}
