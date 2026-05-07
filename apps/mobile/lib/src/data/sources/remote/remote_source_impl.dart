// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_api_client/firebase_api_client.dart';
import 'package:money_tracker/src/data/interfaces/remote_data_source.dart';
import 'package:money_tracker/src/data/sources/remote/cloud_model_extensions.dart';
import 'package:money_tracker/src/domain/models/user.dart';

import '../../../utils/exceptions.dart';
import '../../../utils/result.dart';

class RemoteSourceImpl implements RemoteDataSource {
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
    final cloudUser =
    await _cloudDb!.addUserToDatabase(user.toCloudUser());

    return Result.success(true);
  }

  @override
  Future<Result<List<User>>> getAllUsers() async {
    if (_cloudDb == null) {
      return Result.failure(NoRemoteDBException());
    }

    final cloudUsers = await _cloudDb!.getAllUsers();

    return Result.success(cloudUsers.map((e) => User(
      googleId: e.googleId,
      name: e.name,
      photo: e.photo,
    )).toList());
  }

  @override
  Future<void> createDatabase(User user) async {
    _cloudDb = await CloudDb.create(_firestore, user.toCloudUser());
  }

  @override
  Future<bool> databaseExists(User user) =>
      CloudDb.databaseExists(_firestore, user.toCloudUser());

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
