import 'package:money_tracker/src/domain/interfaces/data/data_repository.dart';
import 'package:money_tracker/src/domain/models/enum/currency.dart';

import '../models.dart';

class InsertCategoryUseCase{
  final DataRepository _dataRepository;

  InsertCategoryUseCase(this._dataRepository);

  Future<Category> call({
    required String title,
    required OperationType operationType,
    required BudgetType budgetType,
    required int budget,
    required Currency currency,
}) async {
    final category = Category(
      title: title,
      operationType: operationType,
      budgetType: budgetType,
      budget: budget,
      currency: currency,
    );

    final id = await _dataRepository.categories.insert(category);

    return category.copyWith(id: id);
  }
}