import '../interfaces/user_repository.dart';
import '../models.dart';

class UserInteractor {
  final UserRepository _userRepository;

  UserInteractor(this._userRepository);

  Future<List<User>> getAll() => _userRepository.getAllUsers();
}