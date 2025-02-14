import 'package:money_tracker/src/domain/interfaces/data_repository.dart';

import '../models.dart';

class WatchCategoryByIdUseCase {
  final DataRepository _dataRepository;

  WatchCategoryByIdUseCase(this._dataRepository);

  Stream<Category> call({required int categoryId}) =>
      _dataRepository.watchCategoryById(categoryId);
}
