import 'package:money_tracker/src/domain/interfaces/data/data_repository.dart';
import '../models.dart';

class DeleteOperationUseCase{
  final DataRepository _dataRepository;

  DeleteOperationUseCase(this._dataRepository);

  Future call(Operation operation) => _dataRepository.operations.delete(operation);
}