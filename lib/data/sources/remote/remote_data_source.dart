
import 'package:money_tracker/data/sources/remote/table_dao.dart';
import 'package:money_tracker/domain/models/user.dart';

import 'models/cloud_models.dart';

abstract class RemoteDataSource{

  TableDAO<CloudAccount>? get accounts;
  TableDAO<CloudCategory>? get categories;
  TableDAO<CloudOperation>? get operations;

  Future<void> deleteAll();

  Future<bool> isAdmin(User user);
  Future<List<User>> getAllUsers();
  Future<void> connect(User user);
  Future<void> disconnect();
  Future<void> addUserToDatabase(User user);
  Future<void> createDatabase(User user);
  Future<bool> databaseExists(User user);
}
