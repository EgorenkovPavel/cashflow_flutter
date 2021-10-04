import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money_tracker/data/cloud/cloud_operation.dart';
import 'package:money_tracker/data/cloud/mappers/account_mapper.dart';
import 'package:money_tracker/data/cloud/mappers/category_mapper.dart';
import 'package:money_tracker/data/cloud/mappers/operation_mapper.dart';
import 'package:money_tracker/domain/models.dart';

class CloudSource {
  final FirebaseFirestore _firestore;

  static const String _DATABASES = 'databases';
  static const String _DATABASES_USERS = 'users';
  static const String _ACCOUNTS = 'accounts';
  static const String _CATEGORIES = 'categories';
  static const String _OPERATIONS = 'operations';

  DocumentReference<Map<String, dynamic>>? _db;

  CollectionDAO get _accounts => CollectionDAO(
        collection: _db?.collection(_ACCOUNTS),
        key_updated: AccountMapper.KEY_UPDATED,
      );

  CollectionDAO get _categories => CollectionDAO(
        collection: _db?.collection(_CATEGORIES),
        key_updated: CategoryMapper.KEY_UPDATED,
      );

  CollectionDAO get _operations => CollectionDAO(
        collection: _db?.collection(_OPERATIONS),
        key_updated: OperationMapper.KEY_UPDATED,
      );

  CloudSource(this._firestore);

  Future<bool> databaseExists(String userId) async {
    QuerySnapshot querySnapshot = await _firestore
        .collection(_DATABASES)
        .where(_DATABASES_USERS, arrayContains: userId)
        .get();

    return querySnapshot.docs.isNotEmpty;
  }

  Future<void> createDatabase(String userId) async {
    _db = await _firestore.collection(_DATABASES).add({
      _DATABASES_USERS: [userId],
    });
  }

  Future<void> logIn(String userId) async {
    _db = await _getDatabase(userId);
  }

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

  Future<Iterable<Account>?> getAccounts(DateTime date) async {
    var docs =
        await _accounts.getItems(date);
    return docs?.docs
        .map((doc) => const AccountMapper().mapToDart(doc));
  }

  Future<Iterable<Category>?> getCategories(DateTime date) async {
    var docs =
        await _categories.getItems(date);
    return docs?.docs
        .map((doc) => const CategoryMapper().mapToDart(doc));
  }

  Future<Iterable<CloudOperation>?> getOperations(DateTime date) async {
    var docs =
        await _operations.getItems(date);
    return docs?.docs
        .map((doc) => const OperationMapper().mapToDart(doc));
  }

  Future<void> refreshAccountSyncDate(Account account) =>
      _accounts.refreshSyncDate(
        account.cloudId,
      );

  Future<void> refreshCategorySyncDate(Category category) =>
      _categories.refreshSyncDate(
        category.cloudId,
      );

  Future<void> refreshOperationSyncDate(CloudOperation operation) =>
      _operations.refreshSyncDate(
        operation.id,
      );

  Future<String?> addAccount(Account account) => _accounts.addItem(
        const AccountMapper().mapToCloud(account),
      );

  Future<void>? updateAccount(Account account) => _accounts.updateItem(
        account.cloudId,
        const AccountMapper().mapToCloud(account),
      );

  Future<void> deleteAccount(String cloudId) => _accounts.deleteItem(
        cloudId,
      );

  Future<String?> addCategory(Category category) => _categories.addItem(
        const CategoryMapper().mapToCloud(category),
      );

  Future<void> updateCategory(Category category) => _categories.updateItem(
        category.cloudId,
        const CategoryMapper().mapToCloud(category),
      );

  Future<void> deleteCategory(String cloudId) => _categories.deleteItem(
        cloudId,
      );

  Future<String?> addOperation(CloudOperation operation) => _operations.addItem(
        const OperationMapper().mapToCloud(operation),
      );

  Future<void> updateOperation(CloudOperation operation) =>
      _operations.updateItem(
        operation.id,
        const OperationMapper().mapToCloud(operation),
      );

  Future<void> deleteOperation(String cloudId) => _operations.deleteItem(
        cloudId,
      );

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


class CollectionDAO {
  final CollectionReference? collection;

  final String key_updated;

  CollectionDAO({required this.key_updated, required this.collection});

  Future<QuerySnapshot<Object?>>? get() => collection?.get();

  Future<QuerySnapshot<Object?>>? getItems(DateTime date) {
    return collection?.where(key_updated, isGreaterThanOrEqualTo: date).get();
  }

  Future<String?> addItem(
    Map<String, dynamic> data,
  ) async {
    var doc = await collection?.add(data);
    return doc?.id;
  }

  Future<void> updateItem(
    String id,
    Map<String, dynamic> data,
  ) {
    return collection?.doc(id).update(data) ?? Future.value();
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
