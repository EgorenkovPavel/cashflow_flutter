// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'mappers/account_mapper.dart';
import 'mappers/category_mapper.dart';
import 'mappers/operation_mapper.dart';
import 'mappers/user_mapper.dart';
import 'package:money_tracker/src/data/interfaces/remote_data_source.dart';
import 'package:money_tracker/src/data/sources/remote/daos/table_dao.dart';
import 'package:money_tracker/src/domain/models/user.dart';
import 'package:money_tracker/src/utils/exceptions.dart';

import 'models/cloud_models.dart';

class RemoteSourceImpl extends RemoteDataSource {
  final FirebaseFirestore _firestore;

  static const String _DATABASES = 'databases';
  static const String _DATABASES_USERS = 'users';
  static const String _DATABASES_ADMIN = 'admin';
  static const String _ACCOUNTS = 'accounts';
  static const String _CATEGORIES = 'categories';
  static const String _OPERATIONS = 'operations';
  static const String _USERS = 'users';

  DocumentReference<Map<String, dynamic>>? _db;
  bool _isCurrentAdmin = false;

  RemoteSourceImpl(this._firestore);

  @override
  TableDAO<CloudAccount>? get accounts => _db != null
      ? AccountsDAO(
          collection: _db!.collection(_ACCOUNTS),
          key_updated: AccountMapper.KEY_UPDATED,
          mapper: const AccountMapper(),
        )
      : null;

  @override
  TableDAO<CloudCategory>? get categories => _db != null
      ? CategoriesDAO(
          collection: _db!.collection(_CATEGORIES),
          key_updated: CategoryMapper.KEY_UPDATED,
          mapper: const CategoryMapper(),
        )
      : null;

  @override
  TableDAO<CloudOperation>? get operations => _db != null
      ? OperationDAO(
          collection: _db!.collection(_OPERATIONS),
          key_updated: OperationMapper.KEY_UPDATED,
          mapper: const OperationMapper(),
        )
      : null;

  /// Throws [NetworkException] and [NoRemoteDBException]
  Future<DocumentReference<Map<String, dynamic>>> _getDatabase(
    String userId,
  ) async {
    QuerySnapshot querySnapshot;
    querySnapshot = await _firestore
        .collection(_DATABASES)
        .where(_DATABASES_USERS, arrayContains: userId)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      return _firestore.collection(_DATABASES).doc(querySnapshot.docs.first.id);
    } else {
      throw NoRemoteDBException();
    }
  }

  ///Throws [NoRemoteDBException] and [NetworkException]
  @override
  Future<void> deleteAll() async {
    if (_db == null) {
      throw NoRemoteDBException();
    }

    try {
      await operations?.deleteAll();
      await categories?.deleteAll();
      await accounts?.deleteAll();
    } on NoRemoteDBException {
      rethrow;
    } on NetworkException {
      rethrow;
    }
  }

  ///Throws [NoRemoteDBException] and [NetworkException]
  @override
  Future<void> addUserToDatabase(User user) async {
    if (_db != null) {
      throw NoRemoteDBException();
    }

    var doc = await _db!.get();
    var data = doc.data();
    data![_DATABASES_USERS].add(user.id);
    await _db!.set(data);

    await _db!
        .collection(_USERS)
        .doc(user.id)
        .set(const UserMapper().mapToCloud(user));
  }

  /// Throws [NoRemoteDBException] and [NetworkException]
  @override
  Future<List<User>> getAllUsers() async {
    if (_db == null) {
      throw NoRemoteDBException();
    }

    var doc = await _db!.collection(_USERS).get();

    return doc.docs.map((doc) => const UserMapper().mapToDart(doc)).toList();
  }

  /// Throws [NetworkException]
  @override
  Future<void> createDatabase(User user) async {
    _db = await _firestore.collection(_DATABASES).add({
      _DATABASES_ADMIN: user.id,
      _DATABASES_USERS: [user.id],
    });
    await _db!
        .collection(_USERS)
        .doc(user.id)
        .set(const UserMapper().mapToCloud(user));
  }

  /// Throws [NetworkException]
  @override
  Future<bool> databaseExists(User user) async {
    QuerySnapshot querySnapshot = await _firestore
        .collection(_DATABASES)
        .where(_DATABASES_USERS, arrayContains: user.id)
        .get();

    return querySnapshot.docs.isNotEmpty;
  }

  /// Throws [NoRemoteDBException] and [NetworkException]
  @override
  Future<void> connect(User user) async {
    try {
      _db = await _getDatabase(user.id);
      var doc = await _db!.get();

      _isCurrentAdmin = user.id == doc.data()![_DATABASES_ADMIN];
    } on NoRemoteDBException {
      _db = null;
      _isCurrentAdmin = false;
      rethrow;
    } on NetworkException {
      _db = null;
      _isCurrentAdmin = false;
      rethrow;
    } on Object catch (e, stackTrace) {
      _db = null;
      _isCurrentAdmin = false;
    }
  }

  @override
  Future<void> disconnect() async {
    _db = null;
    _isCurrentAdmin = false;
  }

  /// Throws [NoRemoteDBException] and [NetworkException]
  @override
  bool isCurrentAdmin() {
    if (_db == null) {
      throw NoRemoteDBException();
    }

    return _isCurrentAdmin;
  }
}
