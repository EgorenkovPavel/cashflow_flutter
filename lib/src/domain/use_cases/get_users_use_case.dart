import 'package:money_tracker/src/domain/interfaces/data_repository.dart';
import '../models.dart';

class GetUsersUseCase{
  final DataRepository _dataRepository;

  GetUsersUseCase(this._dataRepository);

  Future<List<User>> call() => _dataRepository.getAllUsers();
}