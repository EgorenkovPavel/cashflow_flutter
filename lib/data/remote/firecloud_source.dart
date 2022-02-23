// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money_tracker/data/remote/mappers/account_mapper.dart';
import 'package:money_tracker/data/remote/mappers/category_mapper.dart';
import 'package:money_tracker/data/remote/mappers/cloud_converter.dart';
import 'package:money_tracker/data/remote/mappers/operation_mapper.dart';
import 'package:money_tracker/data/remote/mappers/user_mapper.dart';
import 'package:money_tracker/data/remote/remote_source.dart';
import 'package:money_tracker/domain/models/user.dart';
import 'package:money_tracker/utils/try.dart';

import 'models/cloud_models.dart';

class FirecloudSource extends RemoteSource {

  final FirebaseFirestore _firestore;

  static const String _DATABASES = 'databases';
  static const String _DATABASES_USERS = 'users';
  static const String _DATABASES_ADMIN = 'admin';
  static const String _ACCOUNTS = 'accounts';
  static const String _CATEGORIES = 'categories';
  static const String _OPERATIONS = 'operations';
  static const String _USERS = 'users';

  DocumentReference<Map<String, dynamic>>? _db;

  FirecloudSource(this._firestore);

  @override
  CloudTable<CloudAccount> get accounts => AccountsDAO(
        collection: _db?.collection(_ACCOUNTS),
        key_updated: AccountMapper.KEY_UPDATED,
        mapper: const AccountMapper(),
      );

  @override
  CloudTable<CloudCategory> get categories => CategoriesDAO(
        collection: _db?.collection(_CATEGORIES),
        key_updated: CategoryMapper.KEY_UPDATED,
        mapper: const CategoryMapper(),
      );

  @override
  CloudTable<CloudOperation> get operations => OperationDAO(
        collection: _db?.collection(_OPERATIONS),
        key_updated: OperationMapper.KEY_UPDATED,
        mapper: const OperationMapper(),
      );


  Future<Try<DocumentReference<Map<String, dynamic>>>> _getDatabase(
      String userId) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection(_DATABASES)
          .where(_DATABASES_USERS, arrayContains: userId)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        return Success(
            _firestore.collection(_DATABASES).doc(querySnapshot.docs.first.id));
      } else {
        return Failure('No local found');
      }
    } catch (e) {
      return Future.value(Failure(e.toString()));
    }
  }

  @override
  Future<Try<void>> deleteAll() async {
    if (_db == null) {
      return Failure('No db');
    }

    var resOperations = await operations.deleteAll();
    if (resOperations.isFailure()) {
      return resOperations;
    }

    var resCategories = await categories.deleteAll();
    if (resCategories.isFailure()) {
      return resCategories;
    }
    var resAccounts = await accounts.deleteAll();
    if (resAccounts.isFailure()) {
      return resAccounts;
    }

    return Success(null);
  }

  @override
  Future<Try<void>> addToDatabase(User user) async {
    if (_db == null) {
      return Future.value(Failure('No connected cloud database'));
    }
    try {
      var doc = await _db!.get();
      var data = doc.data();
      data![_DATABASES_USERS].add(user.id);
      await _db!.set(data);

      await _db!
          .collection(_USERS)
          .doc(user.id)
          .set(const UserMapper().mapToCloud(user));
      return Success(null);
    } catch (e) {
      return Future.value(Failure(e.toString()));
    }
  }

  @override
  Future<Try<List<User>>> getAll() async {
    try {
      if (_db == null) {
        return Success(<User>[]);
      }
      var doc = await _db!.collection(_USERS).get();
      return Success(
          doc.docs.map((doc) => const UserMapper().mapToDart(doc)).toList());
    } catch (e) {
      return Failure(e.toString());
    }
  }

  @override
  Future<Try<void>> createDatabase(User user) async {
    try {
      _db = await _firestore.collection(_DATABASES).add({
        _DATABASES_ADMIN: user.id,
        _DATABASES_USERS: [user.id],
      });
      await _db!
        .collection(_USERS)
        .doc(user.id)
        .set(const UserMapper().mapToCloud(user));

      return Success(null);
    } catch (e) {
      return Future.value(Failure(e.toString()));
    }
  }

  @override
  Future<Try<bool>> databaseExists(User user) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection(_DATABASES)
          .where(_DATABASES_USERS, arrayContains: user.id)
          .get();

      return Success(querySnapshot.docs.isNotEmpty);
    } catch (e) {
      return Future.value(Failure(e.toString()));
    }
  }

  @override
  Future<Try<void>> logIn(User user) async {
    var res = await _getDatabase(user.id);
      return res.fold((success) async {
        _db = success;
        try {
          var doc = await _db!.get();
          return Success(null);
        } catch (e) {
          return Failure(e.toString());
        }
      }, (failure) {
        _db = null;
        return Failure(failure);
      });
  }

  @override
  Future<void> logOut() async {
    _db = null;
  }

  @override
  Future<bool> isAdmin(User user) async {
    if (_db == null){
      return false;
    }
    var res = await _db!.get();
    return user.id == res.data()![_DATABASES_ADMIN];
  }
}

abstract class TableDAO<T> implements CloudTable<T> {
  final CollectionReference<Map<String, dynamic>>? collection;

  final CloudConverter<T> mapper;

  final String key_updated;

  TableDAO(
      {required this.collection,
      required this.mapper,
      required this.key_updated});

  @override
  Future<Try<String>> add(T entity) async {
    if (collection == null) {
      return Failure('No cloud db');
    }

    var doc = await collection!.add(mapper.mapToCloud(entity));
    if (doc == null) {
      return Failure('Error');
    } else {
      return Success(doc.id);
    }
  }

  @override
  Future<Try<void>> delete(String cloudId) async {
    if (collection == null) {
      return Failure('No cloud db');
    }

    try {
      await collection!.doc(cloudId).update(mapper.deletionMark());
      return Success(null);
    } catch (e) {
      return Failure(e.toString());
    }
  }

  @override
  Future<Try<Iterable<T>>> getAll(DateTime dateSince) async {
    if (collection == null) {
      return Failure('No cloud db');
    }

    try {
      var docs = await collection!
          .where(key_updated, isGreaterThanOrEqualTo: dateSince)
          .get();
      return Success(docs.docs.map<T>((doc) => mapper.mapToDart(doc)));
    } catch (e) {
      return Failure(e.toString());
    }
  }

  @override
  Future<Try<void>> refreshEntitySyncDate(String entityId) async {
    if (collection == null) {
      return Failure('No cloud db');
    }

    try {
      await collection!.doc(entityId).update({key_updated: DateTime.now()});
      return Success(null);
    } catch (e) {
      return Failure(e.toString());
    }
  }

  @override
  Future<Try<void>> update(T entity) async {
    if (collection == null) {
      return Failure('No cloud db');
    }

    try {
      await collection!.doc(getId(entity)).update(mapper.mapToCloud(entity));
      return Success(null);
    } catch (e) {
      return Failure(e.toString());
    }
  }

  @override
  Future<Try<void>> deleteAll() async {
    if (collection == null) {
      return Failure('No cloud db');
    }

    var queryOperation;
    try {
      queryOperation = await collection!.get();
    } catch (e) {
      return Failure(e.toString());
    }

    await Future.forEach<T>(queryOperation, (element) async {
      var res = await delete(getId(element));
      if (res.isFailure()) {
        return res;
      }
    });

    return Success(null);
  }

  String getId(T entity);

}

class AccountsDAO extends TableDAO<CloudAccount> {
  AccountsDAO({
    required CollectionReference<Map<String, dynamic>>? collection,
    required CloudConverter<CloudAccount> mapper,
    required String key_updated,
  }) : super(
          collection: collection,
          mapper: mapper,
          key_updated: key_updated,
        );

  @override
  String getId(CloudAccount entity) {
    return entity.id;
  }

}

class CategoriesDAO extends TableDAO<CloudCategory> {
  CategoriesDAO({
    required CollectionReference<Map<String, dynamic>>? collection,
    required CloudConverter<CloudCategory> mapper,
    required String key_updated,
  }) : super(
          collection: collection,
          mapper: mapper,
          key_updated: key_updated,
        );

  @override
  String getId(CloudCategory entity) {
    return entity.id;
  }
}

class OperationDAO extends TableDAO<CloudOperation> {
  OperationDAO({
    required CollectionReference<Map<String, dynamic>>? collection,
    required CloudConverter<CloudOperation> mapper,
    required String key_updated,
  }) : super(
          collection: collection,
          mapper: mapper,
          key_updated: key_updated,
        );

  @override
  String getId(CloudOperation entity) {
    return entity.id;
  }
}
