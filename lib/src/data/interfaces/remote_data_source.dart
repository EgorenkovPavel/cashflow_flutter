
import 'package:money_tracker/src/data/sources/remote/daos/table_dao.dart';
import 'package:money_tracker/src/domain/models/user.dart';

import '../sources/remote/models/cloud_models.dart';

abstract class RemoteDataSource{

  TableDAO<CloudAccount>? get accounts;
  TableDAO<CloudCategory>? get categories;
  TableDAO<CloudOperation>? get operations;

  Future<void> deleteAll();

  bool isCurrentAdmin();
  Future<List<User>> getAllUsers();
  Future<void> connect(User user);
  Future<void> disconnect();
  Future<void> addUserToDatabase(User user);
  Future<void> createDatabase(User user);
  Future<bool> databaseExists(User user);
}
