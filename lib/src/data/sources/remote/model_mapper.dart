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

class AccountModelMapper extends ModelMapper<CloudAccount, BaseAccount> {
  final User? user;

  const AccountModelMapper(this.user);

  @override
  BaseAccount insertModel(CloudAccount cloudAccount) {
    if (cloudAccount.isDebt) {
      return Debt(
          cloudId: cloudAccount.id,
          title: cloudAccount.title,
          userId: user?.id);
    } else {
      return Account(
          cloudId: cloudAccount.id,
          title: cloudAccount.title,
          userId: user?.id);
    }
  }

  @override
  BaseAccount updateModel(BaseAccount account, CloudAccount cloudAccount) {
    if (cloudAccount.isDebt) {
      return Debt(
          id: account.id,
          title: cloudAccount.title,
          cloudId: account.cloudId,
          userId: account.userId);
    } else {
      return Account(
          id: account.id,
          title: cloudAccount.title,
          cloudId: account.cloudId,
          userId: account.userId);
    }
  }
}

class CategoryModelMapper extends ModelMapper<CloudCategory, Category> {
  final CategoryGroup? parent;

  const CategoryModelMapper(this.parent);

  @override
  Category insertModel(CloudCategory cloudCategory) {
    final operationType =
        const OperationTypeConverter().fromSql(cloudCategory.operationType);
    final budgetType =
        const BudgetTypeConverter().fromSql(cloudCategory.budgetType);

    if (cloudCategory.isGroup) {
      if (operationType == OperationType.INPUT) {
        return InputCategoryGroup(
            cloudId: cloudCategory.id, title: cloudCategory.title);
      } else {
        return OutputCategoryGroup(
            cloudId: cloudCategory.id, title: cloudCategory.title);
      }
    } else {
      if (operationType == OperationType.INPUT) {
        return InputCategoryItem(
            cloudId: cloudCategory.id,
            title: cloudCategory.title,
            budget: cloudCategory.budget,
            budgetType: budgetType,
            parentId: parent?.id);
      } else {
        return OutputCategoryItem(
            cloudId: cloudCategory.id,
            title: cloudCategory.title,
            budget: cloudCategory.budget,
            budgetType: budgetType,
            parentId: parent?.id);
      }
    }
  }

  @override
  Category updateModel(Category category, CloudCategory cloudCategory) {
    final operationType =
        const OperationTypeConverter().fromSql(cloudCategory.operationType);
    final budgetType =
        const BudgetTypeConverter().fromSql(cloudCategory.budgetType);

    if (cloudCategory.isGroup) {
      if (operationType == OperationType.INPUT) {
        return InputCategoryGroup(
            id: category.id,
            cloudId: cloudCategory.id,
            title: cloudCategory.title);
      } else {
        return OutputCategoryGroup(
            id: category.id,
            cloudId: cloudCategory.id,
            title: cloudCategory.title);
      }
    } else {
      if (operationType == OperationType.INPUT) {
        return InputCategoryItem(
            id: category.id,
            cloudId: cloudCategory.id,
            title: cloudCategory.title,
            budget: cloudCategory.budget,
            budgetType: budgetType,
            parentId: parent?.id);
      } else {
        return OutputCategoryItem(
            id: category.id,
            cloudId: cloudCategory.id,
            title: cloudCategory.title,
            budget: cloudCategory.budget,
            budgetType: budgetType,
            parentId: parent?.id);
      }
    }
  }
}
