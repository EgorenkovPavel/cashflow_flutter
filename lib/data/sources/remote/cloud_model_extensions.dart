import 'package:money_tracker/data/sources/local/db_converters/budget_type_converter.dart';
import 'package:money_tracker/data/sources/local/db_converters/operation_type_converter.dart';
import 'package:money_tracker/data/sources/remote/models/cloud_account.dart';
import 'package:money_tracker/data/sources/remote/models/cloud_category.dart';
import 'package:money_tracker/data/sources/remote/models/cloud_models.dart';
import 'package:money_tracker/domain/models.dart';

extension CloudAccountMapper on Account {
  CloudAccount toCloudAccount() => CloudAccount(
        id: this.cloudId,
        title: this.title,
        isDebt: this.isDebt,
        deleted: false,
      );
}

extension CloudCategoryMapper on Category {
  CloudCategory toCloudCategory() => CloudCategory(
        id: this.cloudId,
        title: this.title,
        operationType:
            const OperationTypeConverter().mapToSql(this.operationType)!,
        budgetType: const BudgetTypeConverter().mapToSql(this.budgetType)!,
        budget: this.budget,
        deleted: false,
      );


}

extension CloudOperationMapper on Operation {
  CloudOperation toCloudOperation() => CloudOperation(
        id: this.cloudId,
        date: this.date,
        operationType: const OperationTypeConverter().mapToSql(this.type)!,
        account: this.account.cloudId,
        category: this.category?.cloudId,
        recAccount: this.recAccount?.cloudId,
        sum: this.sum,
        deleted: this.deleted,
      );
}
