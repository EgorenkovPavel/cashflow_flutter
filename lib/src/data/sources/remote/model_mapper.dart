import 'package:money_tracker/src/data/sources/local/db_converters/currency_converter.dart';

import '../../../domain/models.dart';
import '../local/db_converters/budget_type_converter.dart';
import '../local/db_converters/operation_type_converter.dart';
import 'models/cloud_account.dart';
import 'models/cloud_category.dart';

abstract class ModelMapper<C, M> {
  const ModelMapper();

  M insertModel(C cloudItem);

  M updateModel(M model, C cloudItem);
}

class AccountModelMapper extends ModelMapper<CloudAccount, Account> {
  const AccountModelMapper();

  @override
  Account insertModel(CloudAccount cloudAccount) => Account(
        cloudId: cloudAccount.id,
        title: cloudAccount.title,
        isDebt: cloudAccount.isDebt,
        currency: const CurrencyConverter().fromSql(cloudAccount.currency),
      );

  @override
  Account updateModel(Account account, CloudAccount cloudAccount) =>
      account.copyWith(
        title: cloudAccount.title,
        isDebt: cloudAccount.isDebt,
      );
}

class CategoryModelMapper extends ModelMapper<CloudCategory, Category> {
  const CategoryModelMapper();

  @override
  Category insertModel(CloudCategory cloudCategory) => Category(
        title: cloudCategory.title,
        cloudId: cloudCategory.id,
        operationType:
            const OperationTypeConverter().fromSql(cloudCategory.operationType),
        budgetType:
            const BudgetTypeConverter().fromSql(cloudCategory.budgetType),
        budget: cloudCategory.budget,
        currency: const CurrencyConverter().fromSql(cloudCategory.currency),
      );

  @override
  Category updateModel(Category category, CloudCategory cloudCategory) =>
      category.copyWith(
        title: cloudCategory.title,
        cloudId: cloudCategory.id,
        operationType:
            const OperationTypeConverter().fromSql(cloudCategory.operationType),
        budgetType:
            const BudgetTypeConverter().fromSql(cloudCategory.budgetType),
        budget: cloudCategory.budget,
      );
}