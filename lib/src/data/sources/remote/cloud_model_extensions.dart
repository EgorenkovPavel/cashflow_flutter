import 'package:money_tracker/src/data/sources/local/db_converters/budget_type_converter.dart';
import 'package:money_tracker/src/data/sources/local/db_converters/operation_type_converter.dart';
import 'package:money_tracker/src/data/sources/remote/models/cloud_models.dart';
import 'package:money_tracker/src/domain/models.dart';

extension CloudAccountMapper on Account {
  CloudAccount toCloudAccount() => CloudAccount(
        id: cloudId,
        title: title,
        isDebt: isDebt,
        deleted: false,
      );
}

extension CloudCategoryMapper on Category {
  CloudCategory toCloudCategory() => CloudCategory(
        id: cloudId,
        title: title,
        operationType:
            const OperationTypeConverter().toSql(operationType),
        budgetType: const BudgetTypeConverter().toSql(budgetType),
        budget: budget,
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
        deleted: deleted,
      );
}
