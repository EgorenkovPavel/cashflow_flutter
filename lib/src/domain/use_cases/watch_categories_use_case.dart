import '../interfaces/data_repository.dart';
import '../models.dart';

class WatchCategoriesUseCase{
  final DataRepository _dataRepository;

  WatchCategoriesUseCase(this._dataRepository);

  Stream<List<Category>> call() => _dataRepository.watchAllCategories();
}