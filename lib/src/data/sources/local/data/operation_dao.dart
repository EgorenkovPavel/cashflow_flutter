import 'package:drift/drift.dart';

import '../../../../domain/models/enum/operation_type.dart';
import '../entities/operation_entity.dart';
import 'database.dart';

part 'operation_dao.g.dart';

@DriftAccessor(tables: [
  Accounts,
  Categories,
  Operations,
  Balances,
  Cashflows,
])
class OperationDao extends DatabaseAccessor<Database> with _$OperationDaoMixin {
  // Called by the AppDatabase class
  OperationDao(super.db);

  Future<List<OperationDbEntity>> getAllOperationItems() {
    final acc = alias(accounts, 'a');
    final rec = alias(accounts, 'rec');

    return (select(operations)
          ..orderBy([
            (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc),
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
        .get()
        .then((rows) => rows.map(
              (row) {
                var op = row.readTable(operations);

                return OperationDbEntity(
                  operation: op,
                  account: row.readTable(acc),
                  category: op.operationType == OperationType.TRANSFER
                      ? null
                      : row.readTable(categories),
                  recAccount: op.operationType == OperationType.TRANSFER
                      ? row.readTable(rec)
                      : null,
                );
              },
            ).toList());
  }

  Future<List<OperationDbEntity>> getAllOperationItemsWithEmptyCloudId() {
    final acc = alias(accounts, 'a');
    final rec = alias(accounts, 'rec');

    return (select(operations)
          ..where((tbl) => tbl.cloudId.equals(''))
          ..orderBy([
            (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc),
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
        .get()
        .then((rows) => rows.map(
              (row) {
                var op = row.readTable(operations);

                return OperationDbEntity(
                  operation: op,
                  account: row.readTable(acc),
                  category: op.operationType == OperationType.TRANSFER
                      ? null
                      : row.readTable(categories),
                  recAccount: op.operationType == OperationType.TRANSFER
                      ? row.readTable(rec)
                      : null,
                );
              },
            ).toList());
  }

  Future<List<OperationDbEntity>> getAllOperationItemsNotSynced() {
    final acc = alias(accounts, 'a');
    final rec = alias(accounts, 'rec');

    return (select(operations)
          ..where((tbl) => tbl.synced.equals(false))
          ..orderBy([
            (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc),
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
        .get()
        .then((rows) => rows.map(
              (row) {
                var op = row.readTable(operations);

                return OperationDbEntity(
                  operation: op,
                  account: row.readTable(acc),
                  category: op.operationType == OperationType.TRANSFER
                      ? null
                      : row.readTable(categories),
                  recAccount: op.operationType == OperationType.TRANSFER
                      ? row.readTable(rec)
                      : null,
                );
              },
            ).toList());
  }

  Stream<OperationDbEntity> watchOperationItemsNotSynced() {
    final acc = alias(accounts, 'a');
    final rec = alias(accounts, 'rec');

    return (select(operations)
          ..where((tbl) => tbl.synced.equals(false))
          ..orderBy([
            (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc),
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
        .watchSingle()
        .map(
          (row) {
            var op = row.readTable(operations);

            return OperationDbEntity(
              operation: op,
              account: row.readTable(acc),
              category: op.operationType == OperationType.TRANSFER
                  ? null
                  : row.readTable(categories),
              recAccount: op.operationType == OperationType.TRANSFER
                  ? row.readTable(rec)
                  : null,
            );
          },
        );
  }

  Stream<List<OperationDbEntity>> watchAllOperationItems() {
    final acc = alias(accounts, 'a');
    final rec = alias(accounts, 'rec');

    return (select(operations)
          ..orderBy([
            (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc),
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

              return OperationDbEntity(
                operation: op,
                account: row.readTable(acc),
                category: op.operationType == OperationType.TRANSFER
                    ? null
                    : row.readTable(categories),
                recAccount: op.operationType == OperationType.TRANSFER
                    ? row.readTable(rec)
                    : null,
              );
            },
          ).toList(),
        );
  }

  Stream<List<OperationDbEntity>> watchAllOperationItemsByFilter({
    required DateTime? start,
    required DateTime? end,
    required Set<int> accountIds,
    required Set<int> categoriesIds,
  }) {
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
        (t) => t.account.isIn(accountIds) | t.recAccount.isIn(accountIds),
      );
    }

    if (categoriesIds.isNotEmpty) {
      sel.where((t) => t.category.isIn(categoriesIds));
    }

    return (sel
          ..orderBy([
            (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc),
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

              return OperationDbEntity(
                operation: op,
                account: row.readTable(acc),
                category: op.operationType == OperationType.TRANSFER
                    ? null
                    : row.readTable(categories),
                recAccount: op.operationType == OperationType.TRANSFER
                    ? row.readTable(rec)
                    : null,
              );
            },
          ).toList(),
        );
  }

  Stream<List<OperationDbEntity>> watchAllOperationItemsByCategory(
    int categoryId,
  ) {
    final acc = alias(accounts, 'a');
    final rec = alias(accounts, 'rec');

    return (select(operations)
          ..where((t) => t.category.equals(categoryId))
          ..orderBy([
            (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc),
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

              return OperationDbEntity(
                operation: op,
                account: row.readTable(acc),
                category: op.operationType == OperationType.TRANSFER
                    ? null
                    : row.readTable(categories),
                recAccount: op.operationType == OperationType.TRANSFER
                    ? row.readTable(rec)
                    : null,
              );
            },
          ).toList(),
        );
  }

  Stream<List<OperationDbEntity>> watchAllOperationItemsByAccount(
    int accountId,
  ) {
    final acc = alias(accounts, 'a');
    final rec = alias(accounts, 'rec');

    return (select(operations)
          ..where((t) =>
              t.account.equals(accountId) | t.recAccount.equals(accountId))
          ..orderBy([
            (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc),
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

              return OperationDbEntity(
                operation: op,
                account: row.readTable(acc),
                category: op.operationType == OperationType.TRANSFER
                    ? null
                    : row.readTable(categories),
                recAccount: op.operationType == OperationType.TRANSFER
                    ? row.readTable(rec)
                    : null,
              );
            },
          ).toList(),
        );
  }

  Stream<List<OperationDbEntity>> watchLastOperationItems(int limit) {
    final acc = alias(accounts, 'a');
    final rec = alias(accounts, 'rec');

    return (select(operations)
          ..orderBy([
            (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc),
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

              return OperationDbEntity(
                operation: op,
                account: row.readTable(acc),
                category: op.operationType == OperationType.TRANSFER
                    ? null
                    : row.readTable(categories),
                recAccount: op.operationType == OperationType.TRANSFER
                    ? row.readTable(rec)
                    : null,
              );
            },
          ).toList(),
        );
  }

  Future<OperationDbEntity?> getLastOperationItem() {
    final acc = alias(accounts, 'a');
    final rec = alias(accounts, 'rec');

    return (select(operations)
          ..orderBy([
            (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc),
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
        .then(
          (row) {
            var op = row.readTable(operations);

            return OperationDbEntity(
              operation: op,
              account: row.readTable(acc),
              category: op.operationType == OperationType.TRANSFER
                  ? null
                  : row.readTable(categories),
              recAccount: op.operationType == OperationType.TRANSFER
                  ? row.readTable(rec)
                  : null,
            );
          },
          onError: (e) {
            return null;
          },
        );
  }

  Future<List<OperationDB>> getAllOperations() => select(operations).get();

  Future<OperationDbEntity> getOperationById(int id) {
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

          return OperationDbEntity(
            operation: op,
            account: row.readTable(acc),
            category: op.operationType == OperationType.TRANSFER
                ? null
                : row.readTable(categories),
            recAccount: op.operationType == OperationType.TRANSFER
                ? row.readTable(rec)
                : null,
          );
        });
  }

  Future<OperationDbEntity?> getOperationByCloudId(String cloudId) {
    final acc = alias(accounts, 'a');
    final rec = alias(accounts, 'rec');

    return (select(operations)
          ..where((o) => o.cloudId.equals(cloudId))
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
        .getSingleOrNull()
        .then((row) {
          if (row == null) {
            return null;
          }
          var op = row.readTable(operations);

          return OperationDbEntity(
            operation: op,
            account: row.readTable(acc),
            category: op.operationType == OperationType.TRANSFER
                ? null
                : row.readTable(categories),
            recAccount: op.operationType == OperationType.TRANSFER
                ? row.readTable(rec)
                : null,
          );
        });
  }

  Future<int> markAsSynced(int operationId, String cloudId) {
    return (update(operations)..where((t) => t.id.equals(operationId))).write(
      OperationsCompanion(
        cloudId: Value(cloudId),
        synced: const Value(true),
      ),
    );
  }

  Future<int> insertOperation(OperationsCompanion entity) {
    return transaction(() async {
      var id = await into(operations).insert(entity);

      var operationData = entity.copyWith(id: Value(id));

      if (!operationData.deleted.present || !operationData.deleted.value) {
        await _insertAnalytic(operationData);
      }

      return id;
    });
  }

  Future<int> updateFields(int operationId, OperationsCompanion entity) async {
    return transaction(() async {
      var id = await (update(operations)
            ..where((t) => t.id.equals(operationId)))
          .write(entity);

      if (entity.deleted.present) {
        if (!entity.deleted.value) {
          var operation = await getOperationById(operationId);
          var operationData = OperationsCompanion(
            id: Value(operationId),
            cloudId: Value(operation.operation.cloudId),
            date: Value(operation.date),
            operationType: Value(operation.type),
            account: Value(operation.account.id),
            category: Value(operation.category?.id),
            recAccount: Value(operation.recAccount?.id),
            sum: Value(operation.sum),
            recSum: Value(operation.recSum),
            deleted: Value(operation.operation.deleted),
          );
          await _deleteAnalyticByOperationId(operationId);
          await _insertAnalytic(operationData);
        } else {
          await _deleteAnalyticByOperationId(operationId);
        }
      }

      return id;
    });
  }

  Future<int> updateOperation(OperationDB entity) async {
    return await updateFields(
      entity.id,
      OperationsCompanion(
        id: Value(entity.id),
        synced: Value(entity.synced),
        cloudId: Value(entity.cloudId),
        date: Value(entity.date),
        operationType: Value(entity.operationType),
        account: Value(entity.account),
        category: Value(entity.category),
        recAccount: Value(entity.recAccount),
        sum: Value(entity.sum),
        recSum: Value(entity.recSum),
        deleted: Value(entity.deleted),
      ),
    );
    // });
  }

  Future deleteOperation(OperationDB entity) {
    return transaction(() async {
      await (update(operations)..where((tbl) => tbl.id.equals(entity.id)))
          .write(const OperationsCompanion(
        deleted: Value(true),
        synced: Value(false),
      ));
      await _deleteAnalytic(entity);
    });
  }

  Future deleteOperationById(int operationId) async {
    return transaction(() async {
      await (update(operations)..where((tbl) => tbl.id.equals(operationId)))
          .write(const OperationsCompanion(
        deleted: Value(true),
        synced: Value(false),
      ));
      await _deleteAnalyticByOperationId(operationId);
    });
  }

  Future recoverOperation(OperationDB entity) {
    return updateOperation(entity.copyWith(deleted: false, synced: false));
  }

  Future<void> batchInsert(List<OperationDB> operationData) async {
    var cashflowData = <CashflowDB>[];
    var balanceData = <BalanceDB>[];

    for (var operation in operationData) {
      if (operation.deleted) {
        continue;
      }

      switch (operation.operationType) {
        case OperationType.INPUT:
          {
            balanceData.add(BalanceDB(
              date: operation.date,
              operation: operation.id,
              account: operation.account,
              sum: operation.sum,
            ));
            cashflowData.add(CashflowDB(
              date: operation.date,
              operation: operation.id,
              category: operation.category!,
              sum: operation.sum,
            ));
            break;
          }
        case OperationType.OUTPUT:
          {
            balanceData.add(BalanceDB(
              date: operation.date,
              operation: operation.id,
              account: operation.account,
              sum: -1 * operation.sum,
            ));
            cashflowData.add(CashflowDB(
              date: operation.date,
              operation: operation.id,
              category: operation.category!,
              sum: operation.sum,
            ));
            break;
          }
        case OperationType.TRANSFER:
          {
            balanceData.add(BalanceDB(
              date: operation.date,
              operation: operation.id,
              account: operation.account,
              sum: -1 * operation.sum,
            ));
            balanceData.add(BalanceDB(
              date: operation.date,
              operation: operation.id,
              account: operation.recAccount!,
              sum: operation.recSum != 0 ? operation.recSum : operation.sum,
            ));
            break;
          }
      }
    }

    await batch((batch) {
      batch.insertAll(
        operations,
        operationData
            .map((p) => OperationsCompanion.insert(
                  id: Value(p.id),
                  cloudId: p.cloudId,
                  date: p.date,
                  operationType: p.operationType,
                  account: p.account,
                  category: Value(p.category),
                  recAccount: Value(p.recAccount),
                  sum: p.sum,
                  recSum: Value(p.recSum),
                  deleted: Value(p.deleted),
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
                  sum: p.sum,
                ))
            .toList(),
      );
      batch.insertAll(
        balances,
        balanceData
            .map((p) => BalancesCompanion.insert(
                  date: p.date,
                  operation: p.operation,
                  account: p.account,
                  sum: p.sum,
                ))
            .toList(),
      );
    });
  }

  Future<void> _insertAnalyticInput(
    DateTime date,
    int operationId,
    int accountId,
    int categoryId,
    int sum,
  ) async {
    await into(balances).insert(BalanceDB(
      date: date,
      operation: operationId,
      account: accountId,
      sum: sum,
    ));
    await into(cashflows).insert(CashflowDB(
      date: date,
      operation: operationId,
      category: categoryId,
      sum: sum,
    ));
  }

  Future<void> _insertAnalyticOutput(
    DateTime date,
    int operationId,
    int accountId,
    int categoryId,
    int sum,
  ) async {
    await into(balances).insert(BalanceDB(
      date: date,
      operation: operationId,
      account: accountId,
      sum: -1 * sum,
    ));
    await into(cashflows).insert(CashflowDB(
      date: date,
      operation: operationId,
      category: categoryId,
      sum: sum,
    ));
  }

  Future<void> _insertAnalyticTransfer(
    DateTime date,
    int operationId,
    int accountId,
    int recAccountId,
    int sum,
    int recSum,
  ) async {
    await into(balances).insert(BalanceDB(
      date: date,
      operation: operationId,
      account: accountId,
      sum: -1 * sum,
    ));
    await into(balances).insert(BalanceDB(
      date: date,
      operation: operationId,
      account: recAccountId,
      sum: recSum,
    ));
  }

  Future _insertAnalytic(OperationsCompanion operation) async {
    switch (operation.operationType.value) {
      case OperationType.INPUT:
        {
          await _insertAnalyticInput(
            operation.date.value,
            operation.id.value,
            operation.account.value,
            operation.category.value!,
            operation.sum.value,
          );
          break;
        }
      case OperationType.OUTPUT:
        {
          await _insertAnalyticOutput(
            operation.date.value,
            operation.id.value,
            operation.account.value,
            operation.category.value!,
            operation.sum.value,
          );
          break;
        }
      case OperationType.TRANSFER:
        {
          await _insertAnalyticTransfer(
            operation.date.value,
            operation.id.value,
            operation.account.value,
            operation.recAccount.value!,
            operation.sum.value,
            (operation.recSum.value ?? 0) != 0 ? (operation.recSum.value ?? 0) : operation.sum.value,
          );
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