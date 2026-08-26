// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_dao.dart';

// ignore_for_file: type=lint
mixin _$OperationDaoMixin on DatabaseAccessor<Database> {
  $UsersTable get users => attachedDatabase.users;
  $AccountsTable get accounts => attachedDatabase.accounts;
  $CategoriesTable get categories => attachedDatabase.categories;
  $OperationsTable get operations => attachedDatabase.operations;
  $BalancesTable get balances => attachedDatabase.balances;
  $CashflowsTable get cashflows => attachedDatabase.cashflows;
  OperationDaoManager get managers => OperationDaoManager(this);
}

class OperationDaoManager {
  final _$OperationDaoMixin _db;
  OperationDaoManager(this._db);
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
  $$CashflowsTableTableManager get cashflows =>
      $$CashflowsTableTableManager(_db.attachedDatabase, _db.cashflows);
}
