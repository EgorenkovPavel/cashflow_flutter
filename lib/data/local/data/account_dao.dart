import 'package:money_tracker/data/local/data/database.dart';
import 'package:drift/drift.dart';

part 'account_dao.g.dart';

@DriftAccessor(tables: [Accounts, Balances])
class AccountDao extends DatabaseAccessor<Database> with _$AccountDaoMixin {
  // Called by the AppDatabase class
  AccountDao(Database db) : super(db);

  Stream<List<AccountDB>> watchAllAccounts() =>
      (select(accounts)..orderBy([(t) => OrderingTerm(expression: t.title)]))
          .watch();

  Future<List<AccountDB>> getAllAccounts() =>
      select(accounts).get();

  Future<List<AccountDB>> getAllAccountsWithEmptyCloudId() =>
      (select(accounts)..where((tbl) => tbl.cloudId.equals(''))).get();

  Future<List<AccountDB>> getAllAccountsNotSynced() =>
      (select(accounts)..where((tbl) => tbl.synced.equals(false))).get();

  Stream<AccountDB> watchNotSynced() =>
      (select(accounts)..where((tbl) => tbl.synced.equals(false))).watchSingle();

  Stream<AccountDB> watchAccountById(int id) =>
      (select(accounts)..where((c) => c.id.equals(id))).watchSingle();

  Future<AccountDB> getAccountById(int id) =>
      (select(accounts)..where((c) => c.id.equals(id))).getSingle();

  Future<AccountDB?> getAccountByCloudId(String cloudId) =>
      (select(accounts)..where((c) => c.cloudId.equals(cloudId)))
          .getSingleOrNull();

  Future<int> insertAccount(AccountsCompanion entity) =>
      into(accounts).insert(entity);

  Future<bool> updateAccount(AccountDB entity) =>
      update(accounts).replace(entity);

  Future<int> markAsSynced(int accountId, String cloudId) {
    return (update(accounts)
      ..where((t) => t.id.equals(accountId))
    ).write(AccountsCompanion(
      cloudId: Value(cloudId),
      synced: Value(true),
    ),
    );
  }

  Stream<int> getTotalBalance() {
    return customSelect(
      'SELECT SUM(sum) as sum FROM balance',
    ).watchSingle().map((row) => row.read<int>('sum'));
  }

  Stream<List<AccountBalanceEntity>> watchAllAccountsWithBalance(
      {bool archive = false}) {
    final sumBalance = balances.sum.sum();

    final query = db.select(accounts).join([
      leftOuterJoin(
        balances,
        balances.account.equalsExp(accounts.id),
        useColumns: false,
      )
    ]);
    query
      ..addColumns([sumBalance])
      ..groupBy([accounts.id])
      ..orderBy([OrderingTerm(expression: accounts.title)]);

    return query.watch().map((rows) {
      return rows
          .map((row) => AccountBalanceEntity(
              row.readTable(accounts), row.read(sumBalance) ?? 0))
          .toList();
    });
  }

  Future<List<AccountBalanceEntity>> getAllAccountsBalance() async {
    final sumBalance = balances.sum.sum();

    final query = db.select(accounts).join([
      leftOuterJoin(
        balances,
        balances.account.equalsExp(accounts.id),
        useColumns: false,
      )
    ]);
    query
      ..addColumns([sumBalance])
      ..groupBy([accounts.id])
      ..orderBy([OrderingTerm(expression: accounts.title)]);

    var result = await query.get();
    return result
        .map((row) => AccountBalanceEntity(
            row.readTable(accounts), row.read(sumBalance) ?? 0))
        .toList();
  }

  Future<void> batchInsert(List<AccountDB> _accounts) async {
    await batch((batch) {
      batch.insertAll(
        accounts,
        _accounts
            .map((a) => AccountsCompanion.insert(
                  id: Value(a.id),
                  cloudId: a.cloudId,
                  title: a.title,
                  isDebt: Value(a.isDebt),
                ))
            .toList(),
      );
    });
  }

  Stream<List<BalanceOnDate>> watchBalanceOnPeriod(
      DateTime start, DateTime end) {
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
        OrderingTerm(expression: day)
      ]);

    return query.watch().map((list) {
      return list
          .map((c) => BalanceOnDate(
              DateTime(c.read(year), c.read(month), c.read(day)),
              c.read(sumBalance)))
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
        .map((c) => BalanceOnDate(date, c.read(sumBalance) ?? 0));
  }
}

class BalanceOnDate {
  DateTime date;
  int sum;

  BalanceOnDate(this.date, this.sum);
}

class AccountBalanceEntity {
  AccountDB account;
  int sum;

  AccountBalanceEntity(this.account, this.sum);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountBalanceEntity &&
          runtimeType == other.runtimeType &&
          account == other.account;

  @override
  int get hashCode => account.hashCode;
}
