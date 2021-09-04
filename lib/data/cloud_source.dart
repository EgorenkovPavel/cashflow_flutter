import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money_tracker/data/database/budget_type_converter.dart';
import 'package:money_tracker/data/database/operation_type_converter.dart';
import 'package:money_tracker/domain/models.dart';

class CloudSource {
  final FirebaseFirestore _firestore;

  static const String _userId = 'userId';

  static const String _DATABASES = 'databases';
  static const String _DATABASES_USERS = 'users';
  static const String _ACCOUNTS = 'accounts';
  static const String _CATEGORIES = 'categories';
  static const String _OPERATIONS = 'operations';

  late final CollectionReference _accounts;
  late final CollectionReference _categories;
  late final CollectionReference _operations;

  CloudSource(this._firestore) {
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

  Map<String, dynamic> _accountData(Account account) {
    return {
      'title': account.title,
    };
  }

  Map<String, dynamic> _categoryData(Category category) {
    return {
      'title': category.title,
      'operation_type':
          const OperationTypeConverter().mapToSql(category.operationType),
      'budget_type': const BudgetTypeConverter().mapToSql(category.budgetType),
      'budget': category.budget,
    };
  }

  Map<String, dynamic> _operationData(Operation operation) {
    return {
      'date': operation.date,
      'operation_type': const OperationTypeConverter().mapToSql(operation.type),
      'account': operation.account,
      'category': operation.category,
      'rec_account': operation.recAccount,
      'sum': operation.sum,
    };
  }

  Account _accountFromDoc(QueryDocumentSnapshot<Object?> doc) {
    return Account(
      cloudId: doc.id,
      title: doc.get('title'),
    );
  }

  Category _categoryFromDoc(QueryDocumentSnapshot<Object?> doc) {
    return Category(
      cloudId: doc.id,
      budgetType:
          const BudgetTypeConverter().mapToDart(doc.get('budget_type'))!,
      budget: doc.get('budget'),
      title: doc.get('title'),
      operationType:
          const OperationTypeConverter().mapToDart(doc.get('operation_type'))!,
    );
  }

  Operation _operationFromDoc(QueryDocumentSnapshot<Object?> doc) {
    return Operation(
      cloudId: doc.id,
      date: doc.get('date'),
      type:
          const OperationTypeConverter().mapToDart(doc.get('operation_type'))!,
      account: doc.get('account'),
      category: doc.get('category'),
      recAccount: doc.get('rec_account'),
      sum: doc.get('sum'),
    );
  }

  Stream<List<Account>> get accountChanges => _accounts
      //.where('users', arrayContains: _userId)
      .snapshots()
      .map((event) => event.docs.map((doc) => _accountFromDoc(doc)).toList());

  Stream<List<Category>> get categoryChanges => _categories
      .snapshots()
      .map((event) => event.docs.map((doc) => _categoryFromDoc(doc)).toList());

  Stream<List<Operation>> get operationChanges => _operations
      .snapshots()
      .map((event) => event.docs.map((doc) => _operationFromDoc(doc)).toList());

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

  Future<String> addAccount(Account account) =>
      _addItem(_accounts, _accountData(account));

  Future<void> updateAccount(Account account) =>
      _updateItem(_accounts, account.cloudId, _accountData(account));

  Future<void> deleteAccount(String cloudId) => _deleteItem(_accounts, cloudId);

  Future<String> addCategory(Category category) =>
      _addItem(_categories, _categoryData(category));

  Future<void> updateCategory(Category category) =>
      _updateItem(_categories, category.cloudId, _categoryData(category));

  Future<void> deleteCategory(String cloudId) =>
      _deleteItem(_categories, cloudId);

  Future<String> addOperation(Operation operation) =>
      _addItem(_operations, _operationData(operation));

  Future<void> updateOperation(Operation operation) =>
      _updateItem(_operations, operation.cloudId, _operationData(operation));

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
