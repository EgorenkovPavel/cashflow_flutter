// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money_tracker/src/data/interfaces/remote_data_source.dart';
import 'package:money_tracker/src/data/sources/remote/daos/table_dao.dart';
import 'package:money_tracker/src/domain/models/user.dart';

import '../../../utils/exceptions.dart';
import '../../../utils/result.dart';
import 'cloud_db.dart';
import 'models/cloud_models.dart';

class RemoteSourceImpl extends RemoteDataSource {
  final FirebaseFirestore _firestore;

  CloudDb? _cloudDb;

  RemoteSourceImpl(this._firestore);

  @override
  Result<TableDAO<CloudAccount>> get accounts => _cloudDb == null
      ? Result.failure(NoRemoteDBException())
      : Result.success(_cloudDb!.accounts);

  @override
  Result<TableDAO<CloudCategory>> get categories => _cloudDb == null
      ? Result.failure(NoRemoteDBException())
      : Result.success(_cloudDb!.categories);

  @override
  Result<TableDAO<CloudOperation>> get operations => _cloudDb == null
      ? Result.failure(NoRemoteDBException())
      : Result.success(_cloudDb!.operations);

  @override
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

  @override
  Future<Result<bool>> addUserToDatabase(User user) async {
    if (_cloudDb == null) {
      return Result.failure(NoRemoteDBException());
    }
    await _cloudDb!.addUserToDatabase(user);

    return Result.success(true);
  }

  @override
  Future<Result<List<User>>> getAllUsers() async {
    if (_cloudDb == null) {
      return Result.failure(NoRemoteDBException());
    }

    return Result.success(await _cloudDb!.getAllUsers());
  }

  @override
  Future<void> createDatabase(User user) async {
    _cloudDb = await CloudDb.create(_firestore, user);
  }

  @override
  Future<bool> databaseExists(User user) =>
      CloudDb.databaseExists(_firestore, user);

  @override
  Future<void> connect(User user) async {
    _cloudDb = await CloudDb.findByUserId(_firestore, user.googleId);
  }

  @override
  Future<void> disconnect() async {
    _cloudDb = null;
  }

  @override
  Result<bool> isCurrentAdmin() {
    if (_cloudDb == null) {
      return Result.failure(NoRemoteDBException());
    }
    return Result.success(_cloudDb!.isCurrentUserAdmin);
  }
}
