import 'package:money_tracker/src/domain/interfaces/data/data_repository.dart';

import '../models.dart';

class WatchLastOperationsUseCase{
  final DataRepository _dataRepository;

  WatchLastOperationsUseCase(this._dataRepository);

  Stream<List<Operation>> call(int count) => _dataRepository.operations.watchLast(count);
}