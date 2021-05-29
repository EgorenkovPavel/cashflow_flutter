import 'package:cashflow/data/database/database.dart';
import 'package:cashflow/data/mappers/account_mapper.dart';
import 'package:cashflow/data/mappers/category_mapper.dart';
import 'package:cashflow/data/mappers/mapper.dart';
import 'package:cashflow/data/objects/operation.dart';

class OperationMapper extends Mapper<Operation, OperationItem> {
  const OperationMapper();

  @override
  OperationItem mapToSql(Operation o) {

    return OperationItem(
        operation: mapToOperationData(o),
        account: const AccountMapper().mapToSql(o.account),
        category: o.category == null ? null : const CategoryMapper().mapToSql(o.category!),
        recAccount: o.recAccount == null ? null : const AccountMapper().mapToSql(o.recAccount!));
  }

  @override
  Operation mapToDart(OperationItem o) {
    return Operation(
        id: o.operationData.id,
        date: o.operationData.date,
        type: o.operationData.operationType,
        account: const AccountMapper().mapToDart(o.account),
        category: o.category == null ? null : const CategoryMapper().mapToDart(o.category!),
        recAccount: o.recAccount == null ? null : const AccountMapper().mapToDart(o.recAccount!),
        sum: o.operationData.sum);
  }

  OperationDB mapToOperationData(Operation o){
    return OperationDB(
        id: o.id,
        date: o.date,
        operationType: o.type,
        account: o.account.id,
        category: o.category?.id,
        recAccount: o.recAccount?.id,
        sum: o.sum);
  }
}
