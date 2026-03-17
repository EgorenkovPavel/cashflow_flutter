import 'package:collection/collection.dart';
import 'package:drift/drift.dart';
import 'package:money_tracker/src/utils/balance.dart';
import 'package:money_tracker/src/utils/logger.dart';
import 'package:money_tracker/src/utils/sum.dart';

import '../db_converters/currency_converter.dart';
import '../entities/account_balance_entity.dart';
import 'database.dart';

part 'account_dao.g.dart';

@DriftAccessor(tables: [Accounts, Balances, Users])
class AccountDao extends DatabaseAccessor<Database> with _$AccountDaoMixin {
  // Called by the AppDatabase class
  AccountDao(super.db);

  Stream<List<AccountDB>> watchAllAccounts() => (select(
    accounts,
  )..orderBy([(t) => OrderingTerm(expression: t.title)])).watch();

  Future<List<AccountDB>> getAllAccounts() => select(accounts).get();

  Future<List<AccountDB>> getAllAccountsWithEmptyCloudId() =>
      (select(accounts)..where((tbl) => tbl.cloudId.equals(''))).get();

  Future<List<AccountDB>> getAllAccountsNotSynced() =>
      (select(accounts)..where((tbl) => tbl.synced.equals(false))).get();

  Stream<AccountDB> watchAccountById(int id) =>
      (select(accounts)..where((c) => c.id.equals(id))).watchSingle();

  Future<AccountDB> getAccountById(int id) =>
      (select(accounts)..where((c) => c.id.equals(id))).getSingle();

  Future<AccountDB?> getAccountByCloudId(String cloudId) => (select(
    accounts,
  )..where((c) => c.cloudId.equals(cloudId))).getSingleOrNull();

  Future<int> insertAccount(AccountsCompanion entity) =>
      into(accounts).insert(entity);

  Future<int> updateFields(int accountId, AccountsCompanion entity) =>
      (update(accounts)..where((t) => t.id.equals(accountId))).write(entity);

  Future<bool> updateAccount(AccountDB entity) =>
      update(accounts).replace(entity);

  Future<int> markAsSynced(int accountId, String cloudId) {
    return (update(accounts)..where((t) => t.id.equals(accountId))).write(
      AccountsCompanion(cloudId: Value(cloudId), synced: const Value(true)),
    );
  }

  Stream<List<AccountBalanceEntity>> watchAllBalances() {
    final sumBalance = balances.sum.sum().cast<int>();
    final currency = balances.currency.cast<String>();
    final accountId = balances.account.cast<int>();

    final query = db.selectOnly(balances);
    query
      ..addColumns([accountId, currency, sumBalance])
      ..groupBy([accountId, currency]);

    return query.watch().map((result) {
      final groupedMap = groupBy(result, (item) => item.read(accountId)!);

      return groupedMap.entries
          .map(
            (c) => AccountBalanceEntity(
              accountId: c.key,
              balance: Balance(
                c.value
                    .map(
                      (s) => Sum(
                        s.read(sumBalance)!,
                        const CurrencyConverter().fromSql(s.read(currency)!),
                      ),
                    )
                    .toList(),
              ),
            ),
          )
          .toList();
    });
  }

  Future<List<AccountBalanceEntity>> getAllBalances() async {
    final sumBalance = balances.sum.sum().cast<int>();
    final currency = balances.currency.cast<String>();
    final accountId = balances.account.cast<int>();

    final query = db.selectOnly(balances);
    query
      ..addColumns([accountId, currency, sumBalance])
      ..groupBy([accountId, currency]);

    final result = await query.get();

    final groupedMap = groupBy(result, (item) => item.read(accountId)!);

    return groupedMap.entries
        .map(
          (c) => AccountBalanceEntity(
            accountId: c.key,
            balance: Balance(
              c.value
                  .map(
                    (s) => Sum(
                      s.read(sumBalance)!,
                      const CurrencyConverter().fromSql(s.read(currency)!),
                    ),
                  )
                  .toList(),
            ),
          ),
        )
        .toList();
  }

  Future<void> batchInsert(List<AccountDB> accountList) async {
    await batch((batch) {
      batch.insertAll(
        accounts,
        accountList
            .map(
              (a) => AccountsCompanion.insert(
                id: Value(a.id),
                cloudId: a.cloudId,
                title: a.title,
                isDebt: Value(a.isDebt),
                user: Value(a.user),
              ),
            )
            .toList(),
      );
    });
  }
}
