// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_models/finance_models.dart';

import 'exceptions.dart';
import 'table_dao.dart';
import 'cloud_db.dart';
import 'models/cloud_models.dart';

class CloudSource{
  //TODO rewrite without result and replace result to mobile from package

  final FirebaseFirestore _firestore;

  CloudDb? _cloudDb;

  CloudSource(this._firestore);

  Result<TableDAO<CloudAccount>> get accounts => _cloudDb == null
      ? Result.failure(NoRemoteDBException())
      : Result.success(_cloudDb!.accounts);

  Result<TableDAO<CloudCategory>> get categories => _cloudDb == null
      ? Result.failure(NoRemoteDBException())
      : Result.success(_cloudDb!.categories);

  Result<TableDAO<CloudOperation>> get operations => _cloudDb == null
      ? Result.failure(NoRemoteDBException())
      : Result.success(_cloudDb!.operations);

  Future<Result<bool>> deleteAll() async {
    try {
      await operations.getOrThrow().deleteAll();
      await categories.getOrThrow().deleteAll();
      await accounts.getOrThrow().deleteAll();

      return Result.success(true);
    } catch (e) {
      return Result.failure(e as Exception);
    }
  }

  Future<Result<bool>> addUserToDatabase(CloudUser user) async {
    if (_cloudDb == null) {
      return Result.failure(NoRemoteDBException());
    }
    await _cloudDb!.addUserToDatabase(user);

    return Result.success(true);
  }

  Future<Result<List<CloudUser>>> getAllUsers() async {
    if (_cloudDb == null) {
      return Result.failure(NoRemoteDBException());
    }

    final cloudUsers = await _cloudDb!.getAllUsers();

    return Result.success(cloudUsers);
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

  Result<bool> isCurrentAdmin() {
    if (_cloudDb == null) {
      return Result.failure(NoRemoteDBException());
    }

    return Result.success(_cloudDb!.isCurrentUserAdmin);
  }
}
