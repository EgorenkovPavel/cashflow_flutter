// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_models/finance_models.dart';
import 'package:firebase_api_client/firebase_api_client.dart';
import 'package:money_tracker/src/data/interfaces/remote_data_source.dart';
import 'package:money_tracker/src/data/sources/remote/cloud_model_extensions.dart';
import 'package:money_tracker/src/domain/models/user.dart';

import '../../../utils/exceptions.dart';

class RemoteSourceImpl implements RemoteDataSource {
  final CloudSource _source;

  RemoteSourceImpl(FirebaseFirestore firestore)
      : _source = CloudSource(firestore);

  @override
  Result<TableDAO<CloudAccount>> get accounts => _source.accounts;

  @override
  Result<TableDAO<CloudCategory>> get categories => _source.categories;

  @override
  Result<TableDAO<CloudOperation>> get operations => _source.operations;

  @override
  Future<Result<bool>> deleteAll() => _source.deleteAll();

  @override
  Future<Result<bool>> addUserToDatabase(User user) =>
      _source.addUserToDatabase(user.toCloudUser());

  @override
  Future<Result<List<User>>> getAllUsers() async {
    final result = await _source.getAllUsers();

    return result.map(onSuccess: (cloudUsers) =>
        Result.success(cloudUsers.map((e) =>
            User(
      googleId: e.googleId,
      name: e.name,
      photo: e.photo,
            )).toList()), onFailure: (e) => Result.failure(e));
  }

  @override
  Future<void> createDatabase(User user) => _source.createDatabase(user.toCloudUser());

  @override
  Future<bool> databaseExists(User user) => _source.databaseExists(user.toCloudUser());

  @override
  Future<void> connect(User user) => _source.connect(user.toCloudUser());

  @override
  Future<void> disconnect() => _source.disconnect();

  @override
  Result<bool> isCurrentAdmin() => _source.isCurrentAdmin();

}
