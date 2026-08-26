// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_dao.dart';

// ignore_for_file: type=lint
mixin _$AccountDaoMixin on DatabaseAccessor<Database> {
  $UsersTable get users => attachedDatabase.users;
  $AccountsTable get accounts => attachedDatabase.accounts;
  $CategoriesTable get categories => attachedDatabase.categories;
  $OperationsTable get operations => attachedDatabase.operations;
  $BalancesTable get balances => attachedDatabase.balances;
  AccountDaoManager get managers => AccountDaoManager(this);
}

class AccountDaoManager {
  final _$AccountDaoMixin _db;
  AccountDaoManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db.attachedDatabase, _db.users);
  $$AccountsTableTableManager get accounts =>
      $$AccountsTableTableManager(_db.attachedDatabase, _db.accounts);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db.attachedDatabase, _db.categories);
  $$OperationsTableTableManager get operations =>
      $$OperationsTableTableManager(_db.attachedDatabase, _db.operations);
  $$BalancesTableTableManager get balances =>
      $$BalancesTableTableManager(_db.attachedDatabase, _db.balances);
}
