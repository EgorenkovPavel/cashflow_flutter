import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money_tracker/data/cloud/cloud_account.dart';
import 'package:money_tracker/data/cloud/cloud_category.dart';
import 'package:money_tracker/data/cloud/cloud_operation.dart';

class CloudSource {
  final FirebaseFirestore _firestore;

  final String _userId;

  static const String _DATABASES = 'databases';
  static const String _DATABASES_USERS = 'users';
  static const String _ACCOUNTS = 'accounts';
  static const String _CATEGORIES = 'categories';
  static const String _OPERATIONS = 'operations';

  late final CollectionReference _accounts;
  late final CollectionReference _categories;
  late final CollectionReference _operations;

  CloudSource(this._firestore, this._userId) {
    _getDatabase().then((db) {
      _accounts = db.collection(_ACCOUNTS);
      _categories = db.collection(_CATEGORIES);
      _operations = db.collection(_OPERATIONS);
    });
  }

  Future<DocumentReference<Map<String, dynamic>>> _getDatabase() async {
    QuerySnapshot querySnapshot = await _firestore
        .collection(_DATABASES)
        .where(_DATABASES_USERS, arrayContains: _userId)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      return _firestore.collection(_DATABASES).doc(querySnapshot.docs.first.id);
    } else {
      return await _addDatabase();
    }
  }

  Future<DocumentReference<Map<String, dynamic>>> _addDatabase() {
    return _firestore.collection(_DATABASES).add({
      'users': [_userId],
    });
  }

  Stream<List<CloudAccount>> get accountChanges => _accounts
      //.where('users', arrayContains: _userId)
      .snapshots()
      .map((event) => event.docs
          .map((doc) => const CloudAccountConverter().mapToDart(doc))
          .toList());

  Stream<List<CloudCategory>> get categoryChanges =>
      _categories.snapshots().map((event) => event.docs
          .map((doc) => const CloudCategoryConverter().mapToDart(doc))
          .toList());

  Stream<List<CloudOperation>> get operationChanges =>
      _operations.snapshots().map((event) => event.docs
          .map((doc) => const CloudOperationConverter().mapToDart(doc))
          .toList());

  Future<String> _addItem(
      CollectionReference collection, Map<String, dynamic> data) async {
    var doc = await collection.add(data);
    return doc.id;
  }

  Future<void> _updateItem(CollectionReference collection, String id,
          Map<String, dynamic> data) =>
      collection.doc(id).update(data);

  Future<void> _deleteItem(CollectionReference collection, String id) =>
      collection.doc(id).delete();

  Future<String> addAccount(CloudAccount account) =>
      _addItem(_accounts, const CloudAccountConverter().mapToCloud(account));

  Future<void> updateAccount(CloudAccount account) => _updateItem(
      _accounts, account.id, const CloudAccountConverter().mapToCloud(account));

  Future<void> deleteAccount(String cloudId) => _deleteItem(_accounts, cloudId);

  Future<String> addCategory(CloudCategory category) => _addItem(
      _categories, const CloudCategoryConverter().mapToCloud(category));

  Future<void> updateCategory(CloudCategory category) => _updateItem(
      _categories,
      category.id,
      const CloudCategoryConverter().mapToCloud(category));

  Future<void> deleteCategory(String cloudId) =>
      _deleteItem(_categories, cloudId);

  Future<String> addOperation(CloudOperation operation) => _addItem(
      _operations, const CloudOperationConverter().mapToCloud(operation));

  Future<void> updateOperation(CloudOperation operation) => _updateItem(
      _operations,
      operation.id,
      const CloudOperationConverter().mapToCloud(operation));

  Future<void> deleteOperation(String cloudId) =>
      _deleteItem(_operations, cloudId);

  Future<void> deleteAll() async {
    var queryOperation = await _operations.get();
    queryOperation.docs.forEach((element) async {
      await deleteOperation(element.id);
    });

    var queryCategory = await _categories.get();
    queryCategory.docs.forEach((element) async {
      await deleteCategory(element.id);
    });

    var queryAccount = await _accounts.get();
    queryAccount.docs.forEach((element) async {
      await deleteAccount(element.id);
    });
  }
}
