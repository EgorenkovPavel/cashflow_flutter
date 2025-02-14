// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'cloud_db.dart';
import 'package:money_tracker/src/data/interfaces/remote_data_source.dart';
import 'package:money_tracker/src/data/sources/remote/daos/table_dao.dart';
import 'package:money_tracker/src/domain/models/user.dart';

import 'models/cloud_models.dart';

class RemoteSourceImpl extends RemoteDataSource {
  final FirebaseFirestore _firestore;

  CloudDb? _cloudDb;

  RemoteSourceImpl(this._firestore);

  @override
  TableDAO<CloudAccount>? get accounts => _cloudDb?.accounts;

  @override
  TableDAO<CloudCategory>? get categories => _cloudDb?.categories;

  @override
  TableDAO<CloudOperation>? get operations => _cloudDb?.operations;

  @override
  Future<void> deleteAll() async {
    await operations?.deleteAll();
    await categories?.deleteAll();
    await accounts?.deleteAll();
  }

  @override
  Future<void> addUserToDatabase(User user) =>
      _cloudDb?.addUserToDatabase(user) ?? Future(() => {});

  @override
  Future<List<User>> getAllUsers() =>
      _cloudDb?.getAllUsers() ?? Future.value([]);

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
  bool isCurrentAdmin() => _cloudDb?.isCurrentUserAdmin ?? false;
}
