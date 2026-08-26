import 'package:firebase_api_client/firebase_api_client.dart';

import '../../../domain/models.dart';

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
        userId: user?.id,
      );
    } else {
      return Account(
        cloudId: cloudAccount.id,
        title: cloudAccount.title,
        userId: user?.id,
      );
    }
  }

  @override
  BaseAccount updateModel(BaseAccount account, CloudAccount cloudAccount) {
    if (cloudAccount.isDebt) {
      return Debt(
        id: account.id,
        title: cloudAccount.title,
        cloudId: account.cloudId,
        userId: account.userId,
      );
    } else {
      return Account(
        id: account.id,
        title: cloudAccount.title,
        cloudId: account.cloudId,
        userId: account.userId,
      );
    }
  }
}

class CategoryModelMapper extends ModelMapper<CloudCategory, Category> {
  final CategoryGroup? parent;

  const CategoryModelMapper(this.parent);

  @override
  Category insertModel(CloudCategory cloudCategory) {

    if (cloudCategory.isGroup) {
      return Category.group(
        type: cloudCategory.type,
        cloudId: cloudCategory.id,
        title: cloudCategory.title,
      );
    } else {
      return Category.item(
        cloudId: cloudCategory.id,
        title: cloudCategory.title,
        budget: cloudCategory.budget,
        budgetType: cloudCategory.budgetType,
        parentId: parent?.id,
        type: cloudCategory.type,
      );
    }
  }

  @override
  Category updateModel(Category category, CloudCategory cloudCategory) {

    if (cloudCategory.isGroup) {
      return Category.group(
        id: category.id,
        cloudId: cloudCategory.id,
        title: cloudCategory.title,
        type: cloudCategory.type,
      );
    } else {
      return Category.item(
        id: category.id,
        cloudId: cloudCategory.id,
        title: cloudCategory.title,
        budget: cloudCategory.budget,
        budgetType: cloudCategory.budgetType,
        parentId: parent?.id,
        type: cloudCategory.type,
      );
    }
  }
}
