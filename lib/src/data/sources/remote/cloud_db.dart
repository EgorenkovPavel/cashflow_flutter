import 'package:cloud_firestore/cloud_firestore.dart';

import 'daos/table_dao.dart';
import 'mappers/account_mapper.dart';
import 'mappers/category_mapper.dart';
import 'mappers/operation_mapper.dart';
import 'mappers/user_mapper.dart';
import 'package:money_tracker/src/domain/models.dart';

import 'models/cloud_models.dart';

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
    await db
        .collection(_USERS)
        .doc(user.id)
        .set(const UserMapper().mapToCloud(user));

    return CloudDb(db, true);
  }

  static Future<DocumentReference<Map<String, dynamic>?>?> _getDatabase(
    FirebaseFirestore firestore,
    String userId,
  ) async {
    QuerySnapshot querySnapshot;
    querySnapshot = await firestore
        .collection(_DATABASES)
        .where(_DATABASES_USERS, arrayContains: userId)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      return firestore.collection(_DATABASES).doc(querySnapshot.docs.first.id);
    } else {
      return null;
    }
  }

  static Future<bool> databaseExists(FirebaseFirestore firestore, User user) async {
    QuerySnapshot querySnapshot = await firestore
        .collection(_DATABASES)
        .where(_DATABASES_USERS, arrayContains: user.id)
        .get();

    return querySnapshot.docs.isNotEmpty;
  }

  @override
  TableDAO<CloudAccount>? get accounts =>
      AccountsDAO(
    collection: _db.collection(_ACCOUNTS),
    key_updated: AccountMapper.KEY_UPDATED,
    mapper: const AccountMapper(),
  );

  @override
  TableDAO<CloudCategory>? get categories => CategoriesDAO(
    collection: _db.collection(_CATEGORIES),
    key_updated: CategoryMapper.KEY_UPDATED,
    mapper: const CategoryMapper(),
  );

  @override
  TableDAO<CloudOperation>? get operations => OperationDAO(
    collection: _db.collection(_OPERATIONS),
    key_updated: OperationMapper.KEY_UPDATED,
    mapper: const OperationMapper(),
  );

  Future<void> addUserToDatabase(User user) async {
    var doc = await _db.get();
    var data = doc.data();
    data?[_DATABASES_USERS].add(user.id);
    await _db.set(data);

    await _db
        .collection(_USERS)
        .doc(user.id)
        .set(const UserMapper().mapToCloud(user));
  }

  Future<List<User>> getAllUsers() async {

    var doc = await _db.collection(_USERS).get();

    return doc.docs.map((doc) => const UserMapper().mapToDart(doc)).toList();
  }
}