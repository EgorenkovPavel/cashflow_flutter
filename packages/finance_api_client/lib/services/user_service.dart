import '../models/models.dart';

abstract interface class UserService{
  Future<List<UserGroup>> getAllGroups();
  Future<List<User>> getUsersByGroup();
}