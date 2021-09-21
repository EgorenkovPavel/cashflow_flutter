import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money_tracker/data/cloud/cloud_account.dart';
import 'package:money_tracker/data/cloud/cloud_category.dart';
import 'package:money_tracker/data/cloud/cloud_operation.dart';

class CloudSource {
  final FirebaseFirestore _firestore;

  static const String _DATABASES = 'databases';
  static const String _DATABASES_USERS = 'users';
  static const String _ACCOUNTS = 'accounts';
  static const String _CATEGORIES = 'categories';
  static const String _OPERATIONS = 'operations';

  DocumentReference<Map<String, dynamic>>? _db;

  CollectionReference? _accounts;
  CollectionReference? _categories;
  CollectionReference? _operations;

  String _userId = '';

  DateTime? _lastSync;

  CloudSource(this._firestore);

  Future<void> logIn(String userId) async {
    _userId = userId;
    _db = await _getDatabase(userId);
    _accounts = _db?.collection(_ACCOUNTS);
    _categories = _db?.collection(_CATEGORIES);
    _operations = _db?.collection(_OPERATIONS);
    _lastSync = await _getLastSyncDate();
  }

  Future<void> logOut() async {
    await _setSyncDate(DateTime.now());
    _userId = '';
    _db = null;
    _accounts = null;
    _categories = null;
    _operations = null;
    _lastSync = null;
  }

  Future<DocumentReference<Map<String, dynamic>>> _getDatabase(
      String userId) async {
    QuerySnapshot querySnapshot = await _firestore
        .collection(_DATABASES)
        .where(_DATABASES_USERS, arrayContains: userId)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      return _firestore.collection(_DATABASES).doc(querySnapshot.docs.first.id);
    } else {
      return await _addDatabase(userId);
    }
  }

  Future<DocumentReference<Map<String, dynamic>>> _addDatabase(String userId) {
    return _firestore.collection(_DATABASES).add({
      'users': [userId],
    });
  }

  Future<DateTime> _getLastSyncDate() async {
    var doc = await _db?.get();
    return DateTime.fromMicrosecondsSinceEpoch(doc?.get('syncDate')[_userId] ?? 0);
  }

  Future<void> _setSyncDate(DateTime date) async {
    return _db?.update({
      'syncDate.$_userId': date,
    });
  }

  Stream<List<CloudAccount>>? get accountChanges => _accounts
      ?.where(CloudAccountConverter.KEY_UPDATED,
          isGreaterThanOrEqualTo: _lastSync!.microsecondsSinceEpoch)
      .snapshots()
      .map((event) => event.docs
          .map((doc) => const CloudAccountConverter().mapToDart(doc))
          .toList());

  Stream<List<CloudCategory>>? get categoryChanges => _categories
      ?.where(CloudAccountConverter.KEY_UPDATED,
          isGreaterThanOrEqualTo: _lastSync!.microsecondsSinceEpoch)
      .snapshots()
      .map((event) => event.docs
          .map((doc) => const CloudCategoryConverter().mapToDart(doc))
          .toList());

  Stream<List<CloudOperation>>? get operationChanges => _operations
      ?.where(CloudAccountConverter.KEY_UPDATED,
          isGreaterThanOrEqualTo: _lastSync!.microsecondsSinceEpoch)
      .snapshots()
      .map((event) => event.docs
          .map((doc) => const CloudOperationConverter().mapToDart(doc))
          .toList());

  Future<String?> _addItem(
    CollectionReference? collection,
    Map<String, dynamic> data,
  ) async {
    if (collection == null) {
      return null;
    }
    var doc = await collection.add(data);
    return doc.id;
  }

  Future<void> _updateItem(
    CollectionReference? collection,
    String id,
    Map<String, dynamic> data,
  ) {
    if (collection == null) {
      return Future.value();
    }
    return collection.doc(id).update(data);
  }

  Future<void> _deleteItem(
    CollectionReference? collection,
    String id,
  ) {
    if (collection == null) {
      return Future.value();
    }
    return collection.doc(id).delete();
  }

  Future<String?> addAccount(CloudAccount account) => _addItem(
        _accounts,
        const CloudAccountConverter().mapToCloud(account),
      );

  Future<void>? updateAccount(CloudAccount account) => _updateItem(
        _accounts,
        account.id,
        const CloudAccountConverter().mapToCloud(account),
      );

  Future<void> deleteAccount(String cloudId) => _deleteItem(
        _accounts,
        cloudId,
      );

  Future<String?> addCategory(CloudCategory category) => _addItem(
        _categories,
        const CloudCategoryConverter().mapToCloud(category),
      );

  Future<void> updateCategory(CloudCategory category) => _updateItem(
        _categories,
        category.id,
        const CloudCategoryConverter().mapToCloud(category),
      );

  Future<void> deleteCategory(String cloudId) => _deleteItem(
        _categories,
        cloudId,
      );

  Future<String?> addOperation(CloudOperation operation) => _addItem(
        _operations,
        const CloudOperationConverter().mapToCloud(operation),
      );

  Future<void> updateOperation(CloudOperation operation) => _updateItem(
        _operations,
        operation.id,
        const CloudOperationConverter().mapToCloud(operation),
      );

  Future<void> deleteOperation(String cloudId) => _deleteItem(
        _operations,
        cloudId,
      );

  Future<void> deleteAll() async {
    if (_operations == null || _accounts == null || _categories == null) {
      return Future.value();
    }

    var queryOperation = await _operations!.get();
    queryOperation.docs.forEach((element) async {
      await deleteOperation(element.id);
    });

    var queryCategory = await _categories!.get();
    queryCategory.docs.forEach((element) async {
      await deleteCategory(element.id);
    });

    var queryAccount = await _accounts!.get();
    queryAccount.docs.forEach((element) async {
      await deleteAccount(element.id);
    });
  }
}
