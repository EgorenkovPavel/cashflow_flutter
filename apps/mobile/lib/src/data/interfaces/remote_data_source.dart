
import 'package:firebase_api_client/firebase_api_client.dart';
import 'package:money_tracker/src/domain/models/user.dart';
import '../../domain/models.dart';

abstract interface class RemoteDataSource{

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
