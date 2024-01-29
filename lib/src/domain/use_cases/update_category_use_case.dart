import 'package:money_tracker/src/domain/interfaces/data/data_repository.dart';

import '../models.dart';
import '../models/enum/currency.dart';

class UpdateCategoryUseCase{
  final DataRepository _dataRepository;

  UpdateCategoryUseCase(this._dataRepository);

  Future<Category> call({
    required Category category,
    required String title,
    required OperationType operationType,
    required BudgetType budgetType,
    required int budget,
    required Currency currency,
}) async {
    final newCategory = category.copyWith(
      title: title,
      operationType: operationType,
      budgetType: budgetType,
      budget: budget,
      currency: currency,
    );

    await _dataRepository.categories.update(newCategory);

    return newCategory;
  }
}