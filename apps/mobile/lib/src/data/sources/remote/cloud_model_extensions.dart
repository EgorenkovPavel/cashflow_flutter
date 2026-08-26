import 'package:firebase_api_client/firebase_api_client.dart';
import 'package:money_tracker/src/domain/models.dart';

extension CloudAccountMapper on BaseAccount {
  CloudAccount toCloudAccount(User? user) => CloudAccount(
    id: cloudId,
    title: title,
    isDebt: this is Debt,
    deleted: false,
    userGoogleId: user?.googleId,
  );
}

extension CloudCategoryMapper on Category {
  CloudCategory toCloudCategory(CategoryGroup? parent) => map(
    item: (c) => CloudCategory(
      id: cloudId,
      title: title,
      type: c.type,
      budgetType: c.budgetType,
      budget: c.budget,
      isGroup: false,
      parentId: parent?.cloudId,
    ),
    group: (c) => CloudCategory(
      id: cloudId,
      title: title,
      type: c.type,
      budgetType: BudgetType.MONTH,
      budget: 0,
      isGroup: true,
      parentId: '',
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
      operationType: o.operationType,
      account: accountCloudId,
      category: analyticCloudId,
      sum: o.sum,
      deleted: o.deleted,
    ),
    output: (o) => CloudOperation(
      id: o.cloudId,
      date: o.date,
      operationType: o.operationType,
      account: accountCloudId,
      category: analyticCloudId,
      sum: o.sum,
      deleted: o.deleted,
    ),
    transfer: (o) => CloudOperation(
      id: o.cloudId,
      date: o.date,
      operationType: o.operationType,
      account: accountCloudId,
      recAccount: analyticCloudId,
      sum: o.sum,
      deleted: o.deleted,
    ),
    exchange: (o) => CloudOperation(
      id: o.cloudId,
      date: o.date,
      operationType: o.operationType,
      account: accountCloudId,
      sum: o.sumSend,
      recSum: o.sumReceived,
      deleted: o.deleted,
    ),
  );
}

extension CloudUserMapper on User{
  CloudUser toCloudUser(){
    return CloudUser(googleId: googleId, name: name, photo: photo);
  }
}