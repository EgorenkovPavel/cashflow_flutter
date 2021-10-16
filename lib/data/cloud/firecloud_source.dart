import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money_tracker/data/cloud/mappers/account_mapper.dart';
import 'package:money_tracker/data/cloud/mappers/category_mapper.dart';
import 'package:money_tracker/data/cloud/mappers/cloud_converter.dart';
import 'package:money_tracker/data/cloud/mappers/operation_mapper.dart';
import 'package:money_tracker/data/cloud/remote_source.dart';

import 'models/cloud_models.dart';

class FirecloudSource extends RemoteSource {
  final FirebaseFirestore _firestore;

  static const String _DATABASES = 'databases';
  static const String _DATABASES_USERS = 'users';
  static const String _DATABASES_ADMIN = 'admin';
  static const String _ACCOUNTS = 'accounts';
  static const String _CATEGORIES = 'categories';
  static const String _OPERATIONS = 'operations';

  DocumentReference<Map<String, dynamic>>? _db;

  CollectionDAO get _accounts => CollectionDAO<CloudAccount>(
        collection: _db?.collection(_ACCOUNTS),
        key_updated: AccountMapper.KEY_UPDATED,
        mapper: const AccountMapper(),
      );

  CollectionDAO get _categories => CollectionDAO<CloudCategory>(
        collection: _db?.collection(_CATEGORIES),
        key_updated: CategoryMapper.KEY_UPDATED,
        mapper: const CategoryMapper(),
      );

  CollectionDAO get _operations => CollectionDAO<CloudOperation>(
        collection: _db?.collection(_OPERATIONS),
        key_updated: OperationMapper.KEY_UPDATED,
        mapper: const OperationMapper(),
      );

  FirecloudSource(this._firestore);

  @override
  Future<bool> isAdmin(String userId) async {
    if (_db == null) {
      return false;
    }
    var doc = await _db!.get();
    return doc.data()![_DATABASES_ADMIN] == userId;
  }

  @override
  Future<void> addNewUser(String newUser) async {
    if (_db == null) {
      return;
    }
    var doc = await _db!.get();
    var data = doc.data();
    data![_DATABASES_USERS].add(newUser);
    await _db!.set(data);
  }

  @override
  Future<bool> databaseExists(String userId) async {
    QuerySnapshot querySnapshot = await _firestore
        .collection(_DATABASES)
        .where(_DATABASES_USERS, arrayContains: userId)
        .get();

    return querySnapshot.docs.isNotEmpty;
  }

  @override
  Future<void> createDatabase(String userId) async {
    _db = await _firestore.collection(_DATABASES).add({
      _DATABASES_ADMIN: userId,
      _DATABASES_USERS: [userId],
    });
  }

  @override
  Future<void> logIn(String userId) async {
    _db = await _getDatabase(userId);
  }

  @override
  Future<void> logOut() async {
    _db = null;
  }

  Future<DocumentReference<Map<String, dynamic>>?> _getDatabase(
      String userId) async {
    QuerySnapshot querySnapshot = await _firestore
        .collection(_DATABASES)
        .where(_DATABASES_USERS, arrayContains: userId)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      return _firestore.collection(_DATABASES).doc(querySnapshot.docs.first.id);
    } else {
      return null;
    }
  }

  @override
  Future<Iterable<CloudAccount>?> getAccounts(DateTime date) async {
    return (await _accounts.getItems(date)) as Iterable<CloudAccount>?;
  }

  @override
  Future<Iterable<CloudCategory>?> getCategories(DateTime date) async {
    return (await _categories.getItems(date)) as Iterable<CloudCategory>?;
  }

  @override
  Future<Iterable<CloudOperation>?> getOperations(DateTime date) async {
    return (await _operations.getItems(date)) as Iterable<CloudOperation>?;
  }

  @override
  Future<void> refreshAccountSyncDate(String accountId) =>
      _accounts.refreshSyncDate(accountId);

  @override
  Future<void> refreshCategorySyncDate(String categoryId) =>
      _categories.refreshSyncDate(categoryId);

  @override
  Future<void> refreshOperationSyncDate(String operationId) =>
      _operations.refreshSyncDate(operationId);

  @override
  Future<String?> addAccount(CloudAccount account) =>
      _accounts.addItem(account);

  @override
  Future<void>? updateAccount(CloudAccount account) =>
      _accounts.updateItem(account.id, account);

  @override
  Future<void> deleteAccount(String accountId) =>
      _accounts.deleteItem(accountId);

  @override
  Future<String?> addCategory(CloudCategory category) =>
      _categories.addItem(category);

  @override
  Future<void> updateCategory(CloudCategory category) =>
      _categories.updateItem(category.id, category);

  @override
  Future<void> deleteCategory(String categoryId) =>
      _categories.deleteItem(categoryId);

  @override
  Future<String?> addOperation(CloudOperation operation) =>
      _operations.addItem(operation);

  @override
  Future<void> updateOperation(CloudOperation operation) =>
      _operations.updateItem(operation.id, operation);

  @override
  Future<void> deleteOperation(String cloudId) =>
      _operations.deleteItem(cloudId);

  @override
  Future<void> deleteAll() async {
    if (_db == null) {
      return Future.value();
    }

    var queryOperation = await _operations.get();
    queryOperation!.docs.forEach((element) async {
      await deleteOperation(element.id);
    });

    var queryCategory = await _categories.get();
    queryCategory!.docs.forEach((element) async {
      await deleteCategory(element.id);
    });

    var queryAccount = await _accounts.get();
    queryAccount!.docs.forEach((element) async {
      await deleteAccount(element.id);
    });
  }
}

class CollectionDAO<T> {
  final CollectionReference? collection;

  final CloudConverter<T> mapper;

  final String key_updated;

  CollectionDAO(
      {required this.mapper,
      required this.key_updated,
      required this.collection});

  Future<QuerySnapshot<Object?>>? get() => collection?.get();

  Future<Iterable<T>?> getItems(DateTime date) async {
    var docs = await collection
        ?.where(key_updated, isGreaterThanOrEqualTo: date)
        .get();
    return docs?.docs.map<T>((doc) => mapper.mapToDart(doc));
  }

  Future<String?> addItem(
    T data,
  ) async {
    try {
      var doc = await collection?.add(mapper.mapToCloud(data));
      return doc?.id;
    }catch (e){
      return null;
    }
  }

  Future<void> updateItem(
    String id,
    T data,
  ) {
    return collection?.doc(id).update(mapper.mapToCloud(data)) ??
        Future.value();
  }

  Future<void> deleteItem(
    String id,
  ) {
    return collection?.doc(id).delete() ?? Future.value();
  }

  Future<void> refreshSyncDate(
    String id,
  ) {
    return collection?.doc(id).update({key_updated: DateTime.now()}) ??
        Future.value();
  }
}