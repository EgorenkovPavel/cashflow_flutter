import 'package:money_tracker/src/domain/interfaces/data/data_repository.dart';
import 'package:money_tracker/src/domain/models.dart';

class GetCategoryByIdUseCase {
  final DataRepository _dataRepository;

  GetCategoryByIdUseCase(this._dataRepository);

  Future<Category> call({required int categoryId}) =>
      _dataRepository.categories.getById(categoryId);
}
