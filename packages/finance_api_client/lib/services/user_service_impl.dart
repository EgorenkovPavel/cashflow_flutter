import 'user_service.dart';
import 'network_client.dart';
import '../models/models.dart';

class UserServiceImpl implements UserService {
  final NetworkClient _connector;

  UserServiceImpl(this._connector);

  @override
  Future<List<UserResponce>> getUsersByGroup() {
    return _connector.get<List<UserResponce>>(
        'user-groups/${_connector.user!.userGroup}/users',
        (data) => data.map<UserResponce>((e) => UserResponce.fromJson(e)).toList());
  }
}
