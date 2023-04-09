import 'package:cloud_firestore/cloud_firestore.dart';

class CloudDb {

  static const String _DATABASES = 'databases';
  static const String _DATABASES_USERS = 'users';
  static const String _DATABASES_ADMIN = 'admin';
  static const String _ACCOUNTS = 'accounts';
  static const String _CATEGORIES = 'categories';
  static const String _OPERATIONS = 'operations';
  static const String _USERS = 'users';

  DocumentReference<Map<String, dynamic>?> _db;

  CloudDb(this._db);

  static Future<CloudDb?> findByUserId(FirebaseFirestore firestore, String userId) async {
    final db = await _getDatabase(firestore, userId);
    if (db == null){
      return null;
    }else{
      return CloudDb(db);
    }

  }

  static Future<DocumentReference<Map<String, dynamic>?>?> _getDatabase(
      FirebaseFirestore firestore,
      String userId,) async {
    QuerySnapshot querySnapshot;
    querySnapshot = await firestore
        .collection(_DATABASES)
        .where(_DATABASES_USERS, arrayContains: userId)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      return firestore.collection(_DATABASES).doc(querySnapshot.docs.first.id);
    }else{
      return null;
    }
  }
}