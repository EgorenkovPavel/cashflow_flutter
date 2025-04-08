import '../interfaces/data_repository.dart';
import '../models.dart';

class UserInteractor{
  final DataRepository _dataRepository;

  UserInteractor(this._dataRepository);

  Future<List<User>> getAll() => _dataRepository.getAllUsers();
}