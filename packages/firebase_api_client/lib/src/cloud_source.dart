// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'exceptions.dart';
import 'table_dao.dart';
import 'cloud_db.dart';
import 'models/cloud_models.dart';

class CloudSource{
  //TODO rewrite without result and replace result to mobile from package

  final FirebaseFirestore _firestore;

  CloudDb? _cloudDb;

  CloudSource(this._firestore);

  TableDAO<CloudAccount> get accounts => _cloudDb == null
      ? throw NoRemoteDBException()
      : _cloudDb!.accounts;

  TableDAO<CloudCategory> get categories => _cloudDb == null
      ? throw NoRemoteDBException()
      : _cloudDb!.categories;

  TableDAO<CloudOperation> get operations => _cloudDb == null
      ? throw NoRemoteDBException()
      : _cloudDb!.operations;

  Future<bool> deleteAll() async {
      await operations.deleteAll();
      await categories.deleteAll();
      await accounts.deleteAll();

      return true;
  }

  Future<bool> addUserToDatabase(CloudUser user) async {
    if (_cloudDb == null) {
      throw NoRemoteDBException();
    }
    await _cloudDb!.addUserToDatabase(user);

    return true;
  }

  Future<List<CloudUser>> getAllUsers() async {
    if (_cloudDb == null) {
      throw NoRemoteDBException();
    }

    final cloudUsers = await _cloudDb!.getAllUsers();

    return cloudUsers;
  }

  Future<void> createDatabase(CloudUser user) async {
    _cloudDb = await CloudDb.create(_firestore, user);
  }

  Future<bool> databaseExists(CloudUser user) =>
      CloudDb.databaseExists(_firestore, user);

  Future<void> connect(CloudUser user) async {
    _cloudDb = await CloudDb.findByUserId(_firestore, user.googleId);
  }

  Future<void> disconnect() async {
    _cloudDb = null;
  }

  bool isCurrentAdmin() {
    if (_cloudDb == null) {
      throw NoRemoteDBException();
    }

    return _cloudDb!.isCurrentUserAdmin;
  }
}
