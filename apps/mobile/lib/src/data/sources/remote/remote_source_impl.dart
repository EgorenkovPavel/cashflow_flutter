// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_api_client/firebase_api_client.dart';
import 'package:money_tracker/src/data/interfaces/remote_data_source.dart';
import 'package:money_tracker/src/data/sources/remote/cloud_model_extensions.dart';
import 'package:money_tracker/src/domain/models/user.dart';

import '../../../utils/result.dart';

class RemoteSourceImpl implements RemoteDataSource {
  final CloudSource _source;

  RemoteSourceImpl(FirebaseFirestore firestore)
      : _source = CloudSource(firestore);

  @override
  Result<TableDAO<CloudAccount>> get accounts =>
      Result.maybe(() => _source.accounts);

  @override
  Result<TableDAO<CloudCategory>> get categories =>
      Result.maybe(() => _source.categories);

  @override
  Result<TableDAO<CloudOperation>> get operations =>
      Result.maybe(() => _source.operations);

  @override
  Future<Result<bool>> deleteAll() =>
      Result.maybeAsync(() => _source.deleteAll());

  @override
  Future<Result<bool>> addUserToDatabase(User user) =>
      Result.maybeAsync(() => _source.addUserToDatabase(user.toCloudUser()));

  @override
  Future<Result<List<User>>> getAllUsers() async {
    try {
      final cloudUsers = await _source.getAllUsers();

      return
        Result.success(cloudUsers.map((e) =>
            User(
              googleId: e.googleId,
              name: e.name,
              photo: e.photo,
            )).toList());
    } on Exception catch (e) {
      return Result.failure(e);
    }

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
  Result<bool> isCurrentAdmin() => Result.maybe(() => _source.isCurrentAdmin());

}
