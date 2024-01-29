import 'package:money_tracker/src/domain/interfaces/data/data_repository.dart';
import 'package:money_tracker/src/domain/models.dart';

class GetOperationByIdUseCase{
  final DataRepository _dataRepository;

  GetOperationByIdUseCase(this._dataRepository);

  Future<Operation> call(int operationId) => _dataRepository.operations.getById(operationId);
}