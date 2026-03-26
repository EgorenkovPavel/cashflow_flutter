import 'package:drift/drift.dart';
import 'package:drift_postgres/drift_postgres.dart';
import 'package:postgres/postgres.dart' as pg;

part 'database.g.dart';

@DataClassName('UserDBO')
class Users extends Table {

  UuidColumn get id => customType(PgTypes.uuid).withDefault(genRandomUuid())();
  TextColumn get name => text()();
  TextColumn get googleId => text().unique()();
  TextColumn get email => text()();
  TextColumn get photo => text()();
  UuidColumn get groupId => customType(PgTypes.uuid).references(UserGroups, #id)();

  @override
  String get tableName => 'users';

// Column<PgDateTime> get birthDate => customType(PgTypes.timestampNoTimezone).nullable()();
}

@DataClassName('UserGroupDBO')
class UserGroups extends Table {

  UuidColumn get id => customType(PgTypes.uuid).withDefault(genRandomUuid()).unique()();

  @override
  String get tableName => 'user_groups';
}

@DataClassName('AccountDBO')
class Accounts extends Table{

  UuidColumn get id => customType(PgTypes.uuid).withDefault(genRandomUuid()).unique()();
  TextColumn get name => text()();
  UuidColumn get userId => customType(PgTypes.uuid).references(Users, #id)();
  BoolColumn get isDebt => boolean()();
  UuidColumn get groupId => customType(PgTypes.uuid).references(UserGroups, #id)();

  @override
  String get tableName => 'accounts';
}

@DriftDatabase(tables: [Users, UserGroups, Accounts])
class AppDatabase extends _$AppDatabase {
  // After generating code, this class needs to define a `schemaVersion` getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/setup/

  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  // AppDatabase(super.e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) {
      return m.createAll(); // This is the key method
    },
    onUpgrade: (Migrator m, int from, int to) async {
      // Handle schema upgrades here if schemaVersion changes
    },
  );

  static QueryExecutor _openConnection() {
    return PgDatabase(
      endpoint: pg.Endpoint(
        host: 'localhost',
        database: 'mydatabase',
        username: 'myuser',
        password: 'mysecretpassword',
      ),
      settings: const pg.ConnectionSettings(
        // If you expect to talk to a Postgres database over a public connection,
        // please use SslMode.verifyFull instead.
        sslMode: pg.SslMode.disable,
      ),
      logStatements: true,
    );
  }
}