import 'package:money_tracker/src/domain/interfaces/data_repository.dart';
import '../models.dart';

class GetLastOperationUseCase{
  final DataRepository _dataRepository;

  GetLastOperationUseCase(this._dataRepository);

  Future<Operation?> call() => _dataRepository.getLastOperation();
}