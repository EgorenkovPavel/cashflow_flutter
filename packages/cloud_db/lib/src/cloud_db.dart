import 'package:cloud_firestore/cloud_firestore.dart';

import 'mappers/account_mapper.dart';
import 'mappers/category_mapper.dart';
import 'mappers/operation_mapper.dart';
import 'mappers/user_mapper.dart';
import 'models/account.dart';
import 'models/category.dart';
import 'models/operation.dart';
import 'models/user.dart';
import 'table_dao.dart';

class CloudDb {
  static const String _DATABASES = 'databases';
  static const String _DATABASES_USERS = 'users';
  static const String _DATABASES_ADMIN = 'admin';
  static const String _ACCOUNTS = 'accounts';
  static const String _CATEGORIES = 'categories';
  static const String _OPERATIONS = 'operations';
  static const String _USERS = 'users';

  final DocumentReference<Map<String, dynamic>?> _db;
  final bool _isCurrentUserAdmin;

  CloudDb(this._db, this._isCurrentUserAdmin);

  bool get isCurrentUserAdmin => _isCurrentUserAdmin;

  static Future<CloudDb?> findByUserId(
    FirebaseFirestore firestore,
    String userId,
  ) async {
    final db = await _getDatabase(firestore, userId);
    if (db == null) {
      return null;
    } else {
      var doc = await db.get();

      final isUserAdmin = userId == doc.data()?[_DATABASES_ADMIN];

      return CloudDb(db, isUserAdmin);
    }
  }

  static Future<CloudDb> create(
    FirebaseFirestore firestore,
    User user,
  ) async {
    final db = await firestore.collection(_DATABASES).add({
      _DATABASES_ADMIN: user.id,
      _DATABASES_USERS: [user.id],
    });

    return CloudDb(db, true)..users.add(user);
  }

  static Future<DocumentReference<Map<String, dynamic>?>?> _getDatabase(
    FirebaseFirestore firestore,
    String userId,
  ) async {
    final querySnapshot = await firestore
        .collection(_DATABASES)
        .where(_DATABASES_USERS, arrayContains: userId)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      return firestore.collection(_DATABASES).doc(querySnapshot.docs.first.id);
    } else {
      return null;
    }
  }

  static Future<bool> databaseExists(
      FirebaseFirestore firestore, User user) async {
    final querySnapshot = await firestore
        .collection(_DATABASES)
        .where(_DATABASES_USERS, arrayContains: user.id)
        .get();

    return querySnapshot.docs.isNotEmpty;
  }

  TableDAO<Account>? get accounts => AccountsDAO(
        collection: _db.collection(_ACCOUNTS),
        mapper: const AccountMapper(),
      );

  TableDAO<Category>? get categories => CategoriesDAO(
        collection: _db.collection(_CATEGORIES),
        mapper: const CategoryMapper(),
      );

  TableDAO<Operation>? get operations => OperationDAO(
        collection: _db.collection(_OPERATIONS),
        mapper: const OperationMapper(),
      );

  UserDao get users => UserDao(
        _db.collection(_USERS),
        const UserMapper(),
      );

  Future<void> addUserToDatabase(User user) async {
    final doc = await _db.get();
    final data = doc.data();
    data?[_DATABASES_USERS].add(user.id);
    await _db.set(data);

    await users.add(user);
  }

  Future<void> deleteAll() async {
    await operations?.deleteAll();
    await categories?.deleteAll();
    await accounts?.deleteAll();
  }
}
