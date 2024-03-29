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

  CollectionDAO get _accounts =>
      CollectionDAO<CloudAccount>(
        collection: _db?.collection(_ACCOUNTS),
        key_updated: AccountMapper.KEY_UPDATED,
        mapper: const AccountMapper(),
      );

  CollectionDAO get _categories =>
      CollectionDAO<CloudCategory>(
        collection: _db?.collection(_CATEGORIES),
        key_updated: CategoryMapper.KEY_UPDATED,
        mapper: const CategoryMapper(),
      );

  CollectionDAO get _operations =>
      CollectionDAO<CloudOperation>(
        collection: _db?.collection(_OPERATIONS),
        key_updated: OperationMapper.KEY_UPDATED,
        mapper: const OperationMapper(),
      );

  FirecloudSource(this._firestore);

  final StreamController<bool> _adminController = StreamController<bool>()
    ..add(false);

  @override
  Stream<bool> isAdmin() => _adminController.stream;

  @override
  Future<Try<void>> addNewUser(User user) async {
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
  Future<Try<Iterable<User>>> getUsers() async {
    try {
      if (_db == null) {
        return Success(<User>[]);
      }
      var doc = await _db!.collection(_USERS).get();
      return Success(doc.docs.map((doc) => const UserMapper().mapToDart(doc)));
    } catch (e) {
      return Failure(e.toString());
    }
  }

  @override
  Future<Try<bool>> databaseExists(String userId) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection(_DATABASES)
          .where(_DATABASES_USERS, arrayContains: userId)
          .get();

      return Success(querySnapshot.docs.isNotEmpty);
    } catch (e) {
      return Future.value(Failure(e.toString()));
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

      _adminController.add(true);
      return Success(null);
    } catch (e) {
      _adminController.add(false);
      return Future.value(Failure(e.toString()));
    }
  }

  @override
  Future<Try<void>> logIn(String userId) async {
    var res = await _getDatabase(userId);
    return res.fold((success) async {
      _db = success;
      try {
        var doc = await _db!.get();
        _adminController.add(doc.data()![_DATABASES_ADMIN] == userId);
        return Success(null);
      } catch (e) {
        return Failure(e.toString());
      }
    }, (failure) {
      _db = null;
      _adminController.add(false);
      return Failure(failure);
    });
  }

  @override
  void logOut() {
    _db = null;
    _adminController.add(false);
  }

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
  Future<Try<Iterable<CloudAccount>>> getAccounts(DateTime date) async {
    return (await _accounts.getItems(date)) as Try<Iterable<CloudAccount>>;
  }

  @override
  Future<Try<Iterable<CloudCategory>>> getCategories(DateTime date) async {
    return (await _categories.getItems(date)) as Try<Iterable<CloudCategory>>;
  }

  @override
  Future<Try<Iterable<CloudOperation>>> getOperations(DateTime date) async {
    return (await _operations.getItems(date)) as Try<Iterable<CloudOperation>>;
  }

  @override
  Future<Try<void>> refreshAccountSyncDate(String accountId) =>
      _accounts.refreshSyncDate(accountId);

  @override
  Future<Try<void>> refreshCategorySyncDate(String categoryId) =>
      _categories.refreshSyncDate(categoryId);

  @override
  Future<Try<void>> refreshOperationSyncDate(String operationId) =>
      _operations.refreshSyncDate(operationId);

  @override
  Future<Try<String>> addAccount(CloudAccount account) =>
      _accounts.addItem(account);

  @override
  Future<Try<void>> updateAccount(CloudAccount account) =>
      _accounts.updateItem(account.id, account);

  @override
  Future<Try<void>> deleteAccount(CloudAccount account) =>
      _accounts.deleteItem(account.id, account.copyWith(deleted: true));

  @override
  Future<Try<String>> addCategory(CloudCategory category) =>
      _categories.addItem(category);

  @override
  Future<Try<void>> updateCategory(CloudCategory category) =>
      _categories.updateItem(category.id, category);

  @override
  Future<Try<void>> deleteCategory(CloudCategory category) =>
      _categories.deleteItem(category.id, category.copyWith(deleted: true));

  @override
  Future<Try<String>> addOperation(CloudOperation operation) =>
      _operations.addItem(operation);

  @override
  Future<Try<void>> updateOperation(CloudOperation operation) =>
      _operations.updateItem(operation.id, operation);

  @override
  Future<Try<void>> deleteOperation(CloudOperation operation) =>
      _operations.deleteItem(operation.id, operation.copyWith(deleted: true));

  @override
  Future<Try<void>> deleteAll() async {
    if (_db == null) {
      return Failure('No db');
    }

    var queryOperation;
    try {
      queryOperation = await _operations.get();
    } catch (e) {
      return Failure(e.toString());
    }

    await Future.forEach<CloudOperation>(queryOperation, (element) async {
      var res = await deleteOperation(element);
      if (res.isFailure()) {
        return res;
      }
    });

    var queryCategory;
    try {
      queryCategory = await _categories.get();
    } catch (e) {
      return Failure(e.toString());
    }

    await Future.forEach<CloudCategory>(queryCategory, (element) async {
      var res = await deleteCategory(element);
      if (res.isFailure()) {
        return res;
      }
    });

    var queryAccount;
    try {
      queryAccount = await _accounts.get();
    } catch (e) {
      return Failure(e.toString());
    }

    await Future.forEach<CloudAccount>(queryAccount, (element) async {
      var res = await deleteAccount(element);
      if (res.isFailure()) {
        return res;
      }
    });

    return Success(null);
  }
}

class CollectionDAO<T> {
  final CollectionReference? collection;

  final CloudConverter<T> mapper;

  final String key_updated;

  CollectionDAO({required this.mapper,
    required this.key_updated,
    required this.collection});

  Future<QuerySnapshot<Object?>>? get() => collection?.get();

  Future<Try<Iterable<T>>> getItems(DateTime date) async {
    if (collection == null) {
      return Success([]);
    }
    try {
      var docs = await collection!
          .where(key_updated, isGreaterThanOrEqualTo: date)
          .get();
      return Success(docs.docs.map<T>((doc) => mapper.mapToDart(doc)));
    } catch (e) {
      return Failure(e.toString());
    }
  }

  Future<Try<String>> addItem(T data,) async {
    try {
      var doc = await collection?.add(mapper.mapToCloud(data));
      if (doc == null) {
        return Failure('Error');
      } else {
        return Success(doc.id);
      }
    } catch (e) {
      return Failure(e.toString());
    }
  }

  Future<Try<void>> updateItem(String id,
      T data,) async {
    if (collection == null) {
      return Failure('Collection is null');
    }
    try {
      await collection!.doc(id).update(mapper.mapToCloud(data));
      return Success(null);
    } catch (e) {
      return Failure(e.toString());
    }
  }

  Future<Try<void>> deleteItem(String id, T data, ) async {
    if (collection == null) {
      return Failure('Collection is null');
    }
    try {
      await updateItem(id, data);
      //await collection!.doc(id).delete();
      return Success(null);
    } catch (e) {
      return Failure(e.toString());
    }
  }

  Future<Try<void>> refreshSyncDate(String id,) async {
    if (collection == null) {
      return Failure('Collection is null');
    }
    try {
      await collection!.doc(id).update({key_updated: DateTime.now()});
      return Success(null);
    } catch (e) {
      return Failure(e.toString());
    }
  }
}
