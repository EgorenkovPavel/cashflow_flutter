// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_dao.dart';

// ignore_for_file: type=lint
mixin _$CategoryDaoMixin on DatabaseAccessor<Database> {
  $CategoriesTable get categories => attachedDatabase.categories;
  $UsersTable get users => attachedDatabase.users;
  $AccountsTable get accounts => attachedDatabase.accounts;
  $OperationsTable get operations => attachedDatabase.operations;
  $CashflowsTable get cashflows => attachedDatabase.cashflows;
  CategoryDaoManager get managers => CategoryDaoManager(this);
}

class CategoryDaoManager {
  final _$CategoryDaoMixin _db;
  CategoryDaoManager(this._db);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db.attachedDatabase, _db.categories);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db.attachedDatabase, _db.users);
  $$AccountsTableTableManager get accounts =>
      $$AccountsTableTableManager(_db.attachedDatabase, _db.accounts);
  $$OperationsTableTableManager get operations =>
      $$OperationsTableTableManager(_db.attachedDatabase, _db.operations);
  $$CashflowsTableTableManager get cashflows =>
      $$CashflowsTableTableManager(_db.attachedDatabase, _db.cashflows);
}
