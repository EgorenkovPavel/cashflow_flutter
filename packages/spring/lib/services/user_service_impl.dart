import 'user_service.dart';
import 'network_client.dart';
import '../models/models.dart';

class UserServiceImpl implements UserService {
  final NetworkClient _connector;

  UserServiceImpl(this._connector);

  @override
  Future<List<UserGroup>> getAllGroups() {
    return _connector.get<List<UserGroup>>('user-groups',
        (data) => data.map<UserGroup>((e) => UserGroup.fromJson(e)).toList());
  }

  @override
  Future<List<User>> getUsersByGroup() {
    return _connector.get<List<User>>(
        'user-groups/${_connector.user!.userGroup}/users',
        (data) => data.map<User>((e) => User.fromJson(e)).toList());
  }
}
