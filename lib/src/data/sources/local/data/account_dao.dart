import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:money_tracker/src/utils/sum.dart';
import '../db_converters/currency_converter.dart';
import 'database.dart';
import '../entities/account_balance_entity.dart';
import '../entities/balance_on_date_entity.dart';

part 'account_dao.g.dart';

@DriftAccessor(tables: [Accounts, Balances, Users])
class AccountDao extends DatabaseAccessor<Database> with _$AccountDaoMixin {
  // Called by the AppDatabase class
  AccountDao(super.db);

  Stream<List<AccountDB>> watchAllAccounts() =>
      (select(accounts)..orderBy([(t) => OrderingTerm(expression: t.title)]))
          .watch();

  Future<List<AccountDB>> getAllAccounts() => select(accounts).get();

  Future<List<AccountDB>> getAllAccountsWithEmptyCloudId() =>
      (select(accounts)..where((tbl) => tbl.cloudId.equals(''))).get();

  Future<List<AccountDB>> getAllAccountsNotSynced() =>
      (select(accounts)..where((tbl) => tbl.synced.equals(false))).get();

  Stream<AccountDB> watchNotSynced() =>
      (select(accounts)..where((tbl) => tbl.synced.equals(false)))
          .watchSingle();

  Stream<AccountDB> watchAccountById(int id) =>
      (select(accounts)..where((c) => c.id.equals(id))).watchSingle();

  Future<AccountDB> getAccountById(int id) =>
      (select(accounts)..where((c) => c.id.equals(id))).getSingle();

  Future<AccountDB?> getAccountByCloudId(String cloudId) =>
      (select(accounts)..where((c) => c.cloudId.equals(cloudId)))
          .getSingleOrNull();

  Future<int> insertAccount(AccountsCompanion entity) =>
      into(accounts).insert(entity);

  Future<int> updateFields(int accountId, AccountsCompanion entity) =>
      (update(accounts)..where((t) => t.id.equals(accountId))).write(entity);

  Future<bool> updateAccount(AccountDB entity) =>
      update(accounts).replace(entity);

  Future<int> markAsSynced(int accountId, String cloudId) {
    return (update(accounts)..where((t) => t.id.equals(accountId))).write(
      AccountsCompanion(
        cloudId: Value(cloudId),
        synced: const Value(true),
      ),
    );
  }

  Stream<int> getTotalBalance() {
    return customSelect(
      'SELECT SUM(sum) as sum FROM balance',
    ).watchSingle().map((row) => row.read<int>('sum'));
  }

  Stream<List<AccountBalanceEntity>> watchAllBalances() {
    final sumBalance = balances.sum.sum().cast<int>();
    final currency = balances.currency.cast<String>();
    final accountId = balances.account.cast<int>();

    final query = db.selectOnly(balances);
    query
      ..addColumns([accountId, currency, sumBalance])
      ..groupBy([accountId, currency]);

    return query.watch().map((list) {
      return list
          .map((c) => AccountBalanceEntity(
                accountId: c.read(accountId)!,
                currency: const CurrencyConverter().fromSql(c.read(currency)!),
                sum: c.read(sumBalance)!,
              ))
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

    return result
        .map((c) => AccountBalanceEntity(
              accountId: c.read(accountId)!,
              currency: const CurrencyConverter().fromSql(c.read(currency)!),
              sum: c.read(sumBalance)!,
            ))
        .toList();
  }

  Future<Balance> getAccountBalance(AccountDB accountDB) async {
    final sumBalance = balances.sum.sum().cast<int>();
    final currency = balances.currency.cast<String>();

    final query = db.selectOnly(balances)
      ..where(balances.account.equals(accountDB.id));
    query
      ..addColumns([currency, sumBalance])
      ..groupBy([currency]);

    var balance = const Balance();

    try {
      final result = await query.get();
      for (var item in result) {
        balance = balance.addSum(Sum(item.read(sumBalance)!,
            const CurrencyConverter().fromSql(item.read(currency)!)));
      }
    } catch (e, stacktrace) {
      if (kDebugMode) {
        print(stacktrace);
      }
    }

    return balance;
  }

  Future<void> batchInsert(List<AccountDB> accountList) async {
    await batch((batch) {
      batch.insertAll(
        accounts,
        accountList
            .map((a) => AccountsCompanion.insert(
                  id: Value(a.id),
                  cloudId: a.cloudId,
                  title: a.title,
                  isDebt: Value(a.isDebt),
                  user: Value(a.user),
                ))
            .toList(),
      );
    });
  }

  Stream<List<BalanceOnDate>> watchBalanceOnPeriod(
    DateTime start,
    DateTime end,
  ) {
    final sumBalance = balances.sum.sum().cast<int>();
    //final date = CustomExpression<DateTime>("DATE(balance.date, 'start of day')");

    final day = balances.date.day.cast<int>();
    final month = balances.date.month.cast<int>();
    final year = balances.date.year.cast<int>();

    final query = db.selectOnly(balances)
      ..where(balances.date.isBiggerOrEqualValue(start) &
          balances.date.isSmallerOrEqualValue(end));

    query
      ..addColumns([day, month, year, sumBalance])
      ..groupBy([day, month, year])
      ..orderBy([
        OrderingTerm(expression: year),
        OrderingTerm(expression: month),
        OrderingTerm(expression: day),
      ]);

    return query.watch().map((list) {
      return list
          .map((c) => BalanceOnDate(
                date: DateTime(c.read(year)!, c.read(month)!, c.read(day)!),
                sum: c.read(sumBalance)!,
              ))
          .toList();
    });
  }

  Stream<BalanceOnDate> watchBalance(DateTime date) {
    final sumBalance = balances.sum.sum();

    final query = db.selectOnly(balances)
      ..where(balances.date.isSmallerOrEqualValue(date))
      ..addColumns([sumBalance]);

    return query
        .watchSingle()
        .map((c) => BalanceOnDate(date: date, sum: c.read(sumBalance) ?? 0));
  }
}
