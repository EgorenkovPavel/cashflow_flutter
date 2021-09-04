import 'package:money_tracker/data/database/database.dart';
import 'package:money_tracker/domain/models/operation_type.dart';
import 'package:moor/moor.dart';

part 'operation_dao.g.dart';

@UseDao(tables: [Accounts, Categories, Operations, Balances, Cashflows])
class OperationDao extends DatabaseAccessor<Database> with _$OperationDaoMixin {
  // Called by the AppDatabase class
  OperationDao(Database db) : super(db);

  Stream<List<OperationItem>> watchAllOperationItems() {
    final acc = alias(accounts, 'a');
    final rec = alias(accounts, 'rec');

    return (select(operations)
          ..orderBy([
            (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc)
          ]))
        .join(
          [
            innerJoin(
              acc,
              acc.id.equalsExp(operations.account),
            ),
            leftOuterJoin(
              categories,
              categories.id.equalsExp(operations.category),
            ),
            leftOuterJoin(
              rec,
              rec.id.equalsExp(operations.recAccount),
            ),
          ],
        )
        .watch()
        .map(
          (rows) => rows.map(
            (row) {
              var op = row.readTable(operations);
              return OperationItem(
                  operation: op,
                  account: row.readTable(acc),
                  category: op.operationType == OperationType.TRANSFER
                      ? null
                      : row.readTable(categories),
                  recAccount: op.operationType == OperationType.TRANSFER
                      ? row.readTable(rec)
                      : null);
            },
          ).toList(),
        );
  }

  Stream<List<OperationItem>> watchAllOperationItemsByFilter(
      {required DateTime? start,
      required DateTime? end,
      required Set<int> accountIds,
      required Set<int> categoriesIds}) {
    final acc = alias(accounts, 'aсс');
    final rec = alias(accounts, 'rec');

    var sel = select(operations);
    if (start != null) {
      sel.where((t) => t.date.isBiggerOrEqualValue(start));
    }

    if (end != null) {
      sel.where((t) => t.date.isSmallerOrEqualValue(end));
    }

    if (accountIds.isNotEmpty) {
      sel.where(
          (t) => t.account.isIn(accountIds) | t.recAccount.isIn(accountIds));
    }

    if (categoriesIds.isNotEmpty) {
      sel.where((t) => t.category.isIn(categoriesIds));
    }

    return (sel
          ..orderBy([
            (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc)
          ]))
        .join(
          [
            innerJoin(
              acc,
              acc.id.equalsExp(operations.account),
            ),
            leftOuterJoin(
              categories,
              categories.id.equalsExp(operations.category),
            ),
            leftOuterJoin(
              rec,
              rec.id.equalsExp(operations.recAccount),
            ),
          ],
        )
        .watch()
        .map(
          (rows) => rows.map(
            (row) {
              var op = row.readTable(operations);
              return OperationItem(
                  operation: op,
                  account: row.readTable(acc),
                  category: op.operationType == OperationType.TRANSFER
                      ? null
                      : row.readTable(categories),
                  recAccount: op.operationType == OperationType.TRANSFER
                      ? row.readTable(rec)
                      : null);
            },
          ).toList(),
        );
  }

  Stream<List<OperationItem>> watchAllOperationItemsByCategory(int categoryId) {
    final acc = alias(accounts, 'a');
    final rec = alias(accounts, 'rec');

    return (select(operations)
          ..where((t) => t.category.equals(categoryId))
          ..orderBy([
            (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc)
          ]))
        .join(
          [
            innerJoin(
              acc,
              acc.id.equalsExp(operations.account),
            ),
            leftOuterJoin(
              categories,
              categories.id.equalsExp(operations.category),
            ),
            leftOuterJoin(
              rec,
              rec.id.equalsExp(operations.recAccount),
            ),
          ],
        )
        .watch()
        .map(
          (rows) => rows.map(
            (row) {
              var op = row.readTable(operations);
              return OperationItem(
                  operation: op,
                  account: row.readTable(acc),
                  category: op.operationType == OperationType.TRANSFER
                      ? null
                      : row.readTable(categories),
                  recAccount: op.operationType == OperationType.TRANSFER
                      ? row.readTable(rec)
                      : null);
            },
          ).toList(),
        );
  }

  Stream<List<OperationItem>> watchAllOperationItemsByAccount(int accountId) {
    final acc = alias(accounts, 'a');
    final rec = alias(accounts, 'rec');

    return (select(operations)
          ..where((t) =>
              t.account.equals(accountId) | t.recAccount.equals(accountId))
          ..orderBy([
            (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc)
          ]))
        .join(
          [
            innerJoin(
              acc,
              acc.id.equalsExp(operations.account),
            ),
            leftOuterJoin(
              categories,
              categories.id.equalsExp(operations.category),
            ),
            leftOuterJoin(
              rec,
              rec.id.equalsExp(operations.recAccount),
            ),
          ],
        )
        .watch()
        .map(
          (rows) => rows.map(
            (row) {
              var op = row.readTable(operations);
              return OperationItem(
                  operation: op,
                  account: row.readTable(acc),
                  category: op.operationType == OperationType.TRANSFER
                      ? null
                      : row.readTable(categories),
                  recAccount: op.operationType == OperationType.TRANSFER
                      ? row.readTable(rec)
                      : null);
            },
          ).toList(),
        );
  }

  Stream<List<OperationItem>> watchLastOperationItems(int limit) {
    final acc = alias(accounts, 'a');
    final rec = alias(accounts, 'rec');

    return (select(operations)
          ..orderBy([
            (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc)
          ])
          ..limit(limit))
        .join(
          [
            innerJoin(
              acc,
              acc.id.equalsExp(operations.account),
            ),
            leftOuterJoin(
              categories,
              categories.id.equalsExp(operations.category),
            ),
            leftOuterJoin(
              rec,
              rec.id.equalsExp(operations.recAccount),
            ),
          ],
        )
        .watch()
        .map(
          (rows) => rows.map(
            (row) {
              var op = row.readTable(operations);
              return OperationItem(
                  operation: op,
                  account: row.readTable(acc),
                  category: op.operationType == OperationType.TRANSFER
                      ? null
                      : row.readTable(categories),
                  recAccount: op.operationType == OperationType.TRANSFER
                      ? row.readTable(rec)
                      : null);
            },
          ).toList(),
        );
  }

  Future<OperationItem?> getLastOperationItem() {
    final acc = alias(accounts, 'a');
    final rec = alias(accounts, 'rec');

    return (select(operations)
          ..orderBy([
            (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc)
          ])
          ..limit(1))
        .join(
          [
            innerJoin(
              acc,
              acc.id.equalsExp(operations.account),
            ),
            leftOuterJoin(
              categories,
              categories.id.equalsExp(operations.category),
            ),
            leftOuterJoin(
              rec,
              rec.id.equalsExp(operations.recAccount),
            ),
          ],
        )
        .getSingle()
        .then((row) {
          var op = row.readTable(operations);
          return OperationItem(
              operation: op,
              account: row.readTable(acc),
              category: op.operationType == OperationType.TRANSFER
                  ? null
                  : row.readTable(categories),
              recAccount: op.operationType == OperationType.TRANSFER
                  ? row.readTable(rec)
                  : null);
        }, onError: (e) {
          return null;
        });
  }

  Future<List<OperationDB>> getAllOperations() => select(operations).get();

  Future<OperationItem> getOperationById(int id) {
    final acc = alias(accounts, 'a');
    final rec = alias(accounts, 'rec');

    return (select(operations)..where((o) => o.id.equals(id)))
        .join(
          [
            innerJoin(
              acc,
              acc.id.equalsExp(operations.account),
            ),
            leftOuterJoin(
              categories,
              categories.id.equalsExp(operations.category),
            ),
            leftOuterJoin(
              rec,
              rec.id.equalsExp(operations.recAccount),
            ),
          ],
        )
        .getSingle()
        .then((row) {
          var op = row.readTable(operations);
          return OperationItem(
              operation: op,
              account: row.readTable(acc),
              category: op.operationType == OperationType.TRANSFER
                  ? null
                  : row.readTable(categories),
              recAccount: op.operationType == OperationType.TRANSFER
                  ? row.readTable(rec)
                  : null);
        });
  }

  Future<OperationItem?> getOperationByCloudId(String cloudId) {
    final acc = alias(accounts, 'a');
    final rec = alias(accounts, 'rec');

    return (select(operations)..where((o) => o.cloudId.equals(cloudId)))
        .join(
          [
            innerJoin(
              acc,
              acc.id.equalsExp(operations.account),
            ),
            leftOuterJoin(
              categories,
              categories.id.equalsExp(operations.category),
            ),
            leftOuterJoin(
              rec,
              rec.id.equalsExp(operations.recAccount),
            ),
          ],
        )
        .getSingleOrNull()
        .then((row) {
          if (row == null) {
            return null;
          }
          var op = row.readTable(operations);
          return OperationItem(
              operation: op,
              account: row.readTable(acc),
              category: op.operationType == OperationType.TRANSFER
                  ? null
                  : row.readTable(categories),
              recAccount: op.operationType == OperationType.TRANSFER
                  ? row.readTable(rec)
                  : null);
        });
  }

  Future insertOperationItem(OperationItem entity) {
    return transaction(() async {
      var operationData = OperationsCompanion(
        date: Value(entity.date),
        operationType: Value(entity.type),
        account: Value(entity.account.id),
        category: Value(entity.category?.id),
        recAccount: Value(entity.recAccount?.id),
        sum: Value(entity.sum),
      );

      var id = await into(operations).insert(operationData);

      operationData = operationData.copyWith(id: Value(id));

      await _insertAnalytic(operationData);
    });
  }

  Future<int> insertOperation(OperationsCompanion entity) {
    return transaction(() async {
      var id = await into(operations).insert(entity);

      var operationData = entity.copyWith(id: Value(id));
      await _insertAnalytic(operationData);
      return id;
    });
  }

  Future<int> updateOperation(OperationDB entity) {
    return transaction(() async {
      await deleteOperation(entity);
      return await insertOperation(OperationsCompanion(
        id: Value(entity.id),
        date: Value(entity.date),
        operationType: Value(entity.operationType),
        account: Value(entity.account),
        category: Value(entity.category),
        recAccount: Value(entity.recAccount),
        sum: Value(entity.sum),
      ));
    });
  }

  Future deleteOperation(OperationDB entity) {
    return transaction(() async {
      await delete(operations).delete(entity);
      await _deleteAnalytic(entity);
    });
  }

  Future deleteOperationById(int operationId) {
    return transaction(() async {
      await (delete(operations)..where((tbl) => tbl.id.equals(operationId)))
          .go();
      await _deleteAnalyticByOperationId(operationId);
    });
  }

  Future<void> batchInsert(List<OperationDB> operationData) async {
    var cashflowData = <CashflowDB>[];
    var balanceData = <BalanceDB>[];

    operationData.forEach((operation) {
      switch (operation.operationType) {
        case OperationType.INPUT:
          {
            balanceData.add(BalanceDB(
                date: operation.date,
                operation: operation.id,
                account: operation.account,
                sum: operation.sum));
            cashflowData.add(CashflowDB(
                date: operation.date,
                operation: operation.id,
                category: operation.category!,
                sum: operation.sum));
            break;
          }
        case OperationType.OUTPUT:
          {
            balanceData.add(BalanceDB(
                date: operation.date,
                operation: operation.id,
                account: operation.account,
                sum: -1 * operation.sum));
            cashflowData.add(CashflowDB(
                date: operation.date,
                operation: operation.id,
                category: operation.category!,
                sum: operation.sum));
            break;
          }
        case OperationType.TRANSFER:
          {
            balanceData.add(BalanceDB(
                date: operation.date,
                operation: operation.id,
                account: operation.account,
                sum: -1 * operation.sum));
            balanceData.add(BalanceDB(
                date: operation.date,
                operation: operation.id,
                account: operation.recAccount!,
                sum: operation.sum));
            break;
          }
      }
    });

    await batch((batch) {
      batch.insertAll(
        operations,
        operationData
            .map((p) => OperationsCompanion.insert(
                  id: Value(p.id),
                  date: p.date,
                  operationType: p.operationType,
                  account: p.account,
                  category: Value(p.category),
                  recAccount: Value(p.recAccount),
                  sum: p.sum,
                ))
            .toList(),
      );
      batch.insertAll(
        cashflows,
        cashflowData
            .map((p) => CashflowsCompanion.insert(
                date: p.date,
                operation: p.operation,
                category: p.category,
                sum: p.sum))
            .toList(),
      );
      batch.insertAll(
          balances,
          balanceData
              .map((p) => BalancesCompanion.insert(
                  date: p.date,
                  operation: p.operation,
                  account: p.account,
                  sum: p.sum))
              .toList());
    });
  }

  Future _insertAnalytic(OperationsCompanion operation) async {
    switch (operation.operationType.value) {
      case OperationType.INPUT:
        {
          await into(balances).insert(BalanceDB(
              date: operation.date.value,
              operation: operation.id.value,
              account: operation.account.value,
              sum: operation.sum.value));
          await into(cashflows).insert(CashflowDB(
              date: operation.date.value,
              operation: operation.id.value,
              category: operation.category.value!,
              sum: operation.sum.value));
          break;
        }
      case OperationType.OUTPUT:
        {
          await into(balances).insert(BalanceDB(
              date: operation.date.value,
              operation: operation.id.value,
              account: operation.account.value,
              sum: -1 * operation.sum.value));
          await into(cashflows).insert(CashflowDB(
              date: operation.date.value,
              operation: operation.id.value,
              category: operation.category.value!,
              sum: operation.sum.value));
          break;
        }
      case OperationType.TRANSFER:
        {
          await into(balances).insert(BalanceDB(
              date: operation.date.value,
              operation: operation.id.value,
              account: operation.account.value,
              sum: -1 * operation.sum.value));
          await into(balances).insert(BalanceDB(
              date: operation.date.value,
              operation: operation.id.value,
              account: operation.recAccount.value!,
              sum: operation.sum.value));
          break;
        }
    }
  }

  Future _deleteAnalytic(OperationDB operation) async {
    await _deleteAnalyticByOperationId(operation.id);
  }

  Future _deleteAnalyticByOperationId(int operationId) async {
    await (delete(balances)
          ..where((entry) => entry.operation.equals(operationId)))
        .go();
    await (delete(cashflows)
          ..where((entry) => entry.operation.equals(operationId)))
        .go();
  }
}
