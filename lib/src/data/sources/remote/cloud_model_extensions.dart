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
  CloudOperation toCloudOperation() => CloudOperation(
        id: cloudId,
        date: date,
        operationType: const OperationTypeConverter().toSql(type),
        account: account.cloudId,
        category: category?.cloudId,
        recAccount: recAccount?.cloudId,
        sum: sum,
        recSum: map(
          input: (operation) => 0,
          output: (operation) => 0,
          transfer: (operation) => operation.recSum,
        ),
        deleted: deleted,
      );
}
