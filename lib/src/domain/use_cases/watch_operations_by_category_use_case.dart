import 'package:money_tracker/src/domain/interfaces/data_repository.dart';

import '../models.dart';

class WatchOperationsByCategoryUseCase {
  final DataRepository _dataRepository;

  WatchOperationsByCategoryUseCase(this._dataRepository);

  Stream<List<Operation>> call({required int categoryId}) =>
      _dataRepository.watchAllOperationsByCategory(categoryId);
}
