import 'package:cloud_firestore/cloud_firestore.dart';

import 'cloud_db.dart';
import 'models/user.dart';

class CloudDbStorage {
  final FirebaseFirestore _firestore;

  CloudDbStorage() : _firestore = FirebaseFirestore.instance {
    _firestore.settings = const Settings(persistenceEnabled: false);
  }

  Future<CloudDb> create(User user) => CloudDb.create(_firestore, user);

  Future<bool> databaseExists(User user) =>
      CloudDb.databaseExists(_firestore, user);

  Future<CloudDb?> findByUserId(User user) =>
      CloudDb.findByUserId(_firestore, user.id);
}
