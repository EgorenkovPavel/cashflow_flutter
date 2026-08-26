import '../models/models.dart';

abstract interface class UserService{
  Future<List<UserResponce>> getUsersByGroup();
}