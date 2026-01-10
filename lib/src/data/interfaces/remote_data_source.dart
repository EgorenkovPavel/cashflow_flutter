
import 'package:money_tracker/src/data/sources/remote/daos/table_dao.dart';
import 'package:money_tracker/src/domain/models/user.dart';

import '../../utils/result.dart';
import '../sources/remote/models/cloud_models.dart';

abstract class RemoteDataSource{

  Result<TableDAO<CloudAccount>> get accounts;
  Result<TableDAO<CloudCategory>> get categories;
  Result<TableDAO<CloudOperation>> get operations;

  Future<Result<bool>> deleteAll();

  Result<bool> isCurrentAdmin();
  Future<Result<List<User>>> getAllUsers();
  Future<void> connect(User user);
  Future<void> disconnect();
  Future<Result<bool>> addUserToDatabase(User user);
  Future<void> createDatabase(User user);
  Future<bool> databaseExists(User user);
}
