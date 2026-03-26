// dart format width=80
// ignore_for_file: unused_local_variable, unused_import
import 'package:drift/drift.dart';
import 'package:drift_dev/api/migrations_native.dart';
import 'package:money_tracker/src/data/sources/local/data/database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'generated/schema.dart';

import 'generated/schema_v12.dart' as v12;
import 'generated/schema_v13.dart' as v13;

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  late SchemaVerifier verifier;

  setUpAll(() {
    verifier = SchemaVerifier(GeneratedHelper());
  });

  group('simple database migrations', () {
    // These simple tests verify all possible schema updates with a simple (no
    // data) migration. This is a quick way to ensure that written database
    // migrations properly alter the schema.
    const versions = GeneratedHelper.versions;
    for (final (i, fromVersion) in versions.indexed) {
      group('from $fromVersion', () {
        for (final toVersion in versions.skip(i + 1)) {
          test('to $toVersion', () async {
            final schema = await verifier.schemaAt(fromVersion);
            final db = Database(schema.newConnection());
            await verifier.migrateAndValidate(db, toVersion);
            await db.close();
          });
        }
      });
    }
  });

  // The following template shows how to write tests ensuring your migrations
  // preserve existing data.
  // Testing this can be useful for migrations that change existing columns
  // (e.g. by alterating their type or constraints). Migrations that only add
  // tables or columns typically don't need these advanced tests. For more
  // information, see https://drift.simonbinder.eu/migrations/tests/#verifying-data-integrity
  // TODO: This generated template shows how these tests could be written. Adopt
  // it to your own needs when testing migrations with data integrity.
  test('migration from v12 to v13 does not corrupt data', () async {
    // Add data to insert into the old database, and the expected rows after the
    // migration.
    // TODO: Fill these lists
    final oldUsersData = <v12.UsersData>[];
    final expectedNewUsersData = <v13.UsersData>[];

    final oldAccountsData = <v12.AccountsData>[];
    final expectedNewAccountsData = <v13.AccountsData>[];

    final oldCategoriesData = <v12.CategoriesData>[];
    final expectedNewCategoriesData = <v13.CategoriesData>[];

    final oldOperationsData = <v12.OperationsData>[];
    final expectedNewOperationsData = <v13.OperationsData>[];

    final oldBalanceData = <v12.BalanceData>[];
    final expectedNewBalanceData = <v13.BalanceData>[];

    final oldCashflowData = <v12.CashflowData>[];
    final expectedNewCashflowData = <v13.CashflowData>[];

    await verifier.testWithDataIntegrity(
      oldVersion: 12,
      newVersion: 13,
      createOld: v12.DatabaseAtV12.new,
      createNew: v13.DatabaseAtV13.new,
      openTestedDatabase: Database.new,
      createItems: (batch, oldDb) {
        batch.insertAll(oldDb.users, oldUsersData);
        batch.insertAll(oldDb.accounts, oldAccountsData);
        batch.insertAll(oldDb.categories, oldCategoriesData);
        batch.insertAll(oldDb.operations, oldOperationsData);
        batch.insertAll(oldDb.balance, oldBalanceData);
        batch.insertAll(oldDb.cashflow, oldCashflowData);
      },
      validateItems: (newDb) async {
        expect(expectedNewUsersData, await newDb.select(newDb.users).get());
        expect(
          expectedNewAccountsData,
          await newDb.select(newDb.accounts).get(),
        );
        expect(
          expectedNewCategoriesData,
          await newDb.select(newDb.categories).get(),
        );
        expect(
          expectedNewOperationsData,
          await newDb.select(newDb.operations).get(),
        );
        expect(expectedNewBalanceData, await newDb.select(newDb.balance).get());
        expect(
          expectedNewCashflowData,
          await newDb.select(newDb.cashflow).get(),
        );
      },
    );
  });
}
