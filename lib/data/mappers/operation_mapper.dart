import 'package:cashflow/data/database.dart';
import 'package:cashflow/data/mappers/account_mapper.dart';
import 'package:cashflow/data/mappers/category_mapper.dart';
import 'package:cashflow/data/mappers/mapper.dart';
import 'package:cashflow/data/objects/account.dart';
import 'package:cashflow/data/objects/category.dart';
import 'package:cashflow/data/objects/operation.dart';

class OperationMapper extends Mapper<Operation, OperationItem> {
  const OperationMapper();

  OperationItem mapToSql(Operation o) {
    return OperationItem(
        mapToOperationData(o),
        const AccountMapper().mapToSql(o.account),
        const CategoryMapper().mapToSql(o.category),
        const AccountMapper().mapToSql(o.recAccount));
  }

  Operation mapToDart(OperationItem o) {
    return Operation(
        id: o.operationData.id,
        date: o.operationData.date,
        type: o.operationData.operationType,
        account: const AccountMapper().mapToDart(o.account),
        category: const CategoryMapper().mapToDart(o.category),
        recAccount: const AccountMapper().mapToDart(o.recAccount),
        sum: o.operationData.sum);
  }

  OperationData mapToOperationData(Operation o){
    return OperationData(
        id: o.id,
        date: o.date,
        operationType: o.type,
        account: o.account.id,
        category: o.category.id,
        recAccount: o.recAccount.id,
        sum: o.sum);
  }
}
