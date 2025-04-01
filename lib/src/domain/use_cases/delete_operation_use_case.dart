import '../interfaces/data_repository.dart';
import '../models.dart';

class DeleteOperationUseCase{
  final DataRepository _dataRepository;

  DeleteOperationUseCase(this._dataRepository);

  Future call(Operation operation) => _dataRepository.deleteOperationById(operation.id);
}