import '../../utils/exceptions.dart';
import '../../utils/logger.dart';
import '../../utils/result.dart';
import '../interfaces/category_repository.dart';
import '../models.dart';
import '../services/cashflow_service.dart';

class CategoryInteractor {
  final CategoryRepository _categoryRepository;
  final CashflowService _cashflowService;

  CategoryInteractor(this._categoryRepository, this._cashflowService);

  Future<Result<Category>> getById(int id) async {
    try {
      final category = await _categoryRepository.getCategoryById(id);
      return Result.success(category);
    } on Exception catch (e, stackTrace) {
      AppLogger.error('Failed to get category by id: $id', e, stackTrace);
      return Result.failure(DatabaseException('Failed to get category', e));
    }
  }

  Stream<Category> watchById(int id) =>
      _categoryRepository.watchCategoryById(id);

  Stream<List<CategoryCashFlow>> watchCashFlows() =>
      _cashflowService.watchCashFlow(DateTime.now());

  Stream<List<Category>> watchAll() => _categoryRepository.watchAllCategories();

  Future<Result<CategoryItem>> insertCategoryItem({
    required CategoryType type,
    required String title,
    required BudgetType budgetType,
    required int budget,
    required int? parent,
  }) async {
    try {
      final category = CategoryItem(
        type: type,
        title: title,
        budgetType: budgetType,
        budget: budget,
        parentId: parent,
      );

      final id = await _categoryRepository.insertCategory(category);

      return Result.success(category.copyWith(id: id));
    } on Exception catch (e, stackTrace) {
      AppLogger.error('Failed to insert input category item', e, stackTrace);
      return Result.failure(DatabaseException('Failed to insert category', e));
    }
  }

  Future<Result<CategoryGroup>> insertCategoryGroup({
    required CategoryType type,
    required String title,
  }) async {
    try {
      final category = CategoryGroup(type: type, title: title);

      final id = await _categoryRepository.insertCategory(category);

      return Result.success(category.copyWith(id: id));
    } on Exception catch (e, stackTrace) {
      AppLogger.error('Failed to insert input category group', e, stackTrace);
      return Result.failure(DatabaseException('Failed to insert category', e));
    }
  }

  Future<Result<CategoryItem>> updateCategoryItem({
    required CategoryItem category,
    required String title,
    required BudgetType budgetType,
    required int budget,
    required int? parent,
  }) async {
    try {
      final newCategory = category.copyWith(
        title: title,
        budgetType: budgetType,
        budget: budget,
        parentId: parent,
      );

      await _categoryRepository.updateCategory(newCategory);

      return Result.success(newCategory);
    } on Exception catch (e, stackTrace) {
      AppLogger.error('Failed to update input category item', e, stackTrace);
      return Result.failure(DatabaseException('Failed to update category', e));
    }
  }

  Future<Result<CategoryGroup>> updateCategoryGroup({
    required CategoryGroup category,
    required String title,
  }) async {
    try {
      final newCategory = category.copyWith(title: title);

      await _categoryRepository.updateCategory(newCategory);

      return Result.success(newCategory);
    } on Exception catch (e, stackTrace) {
      AppLogger.error('Failed to update input category group', e, stackTrace);
      return Result.failure(DatabaseException('Failed to update category', e));
    }
  }

  Future<Map<DateTime, Balance>> getMonthlyExpenses(
      int categoryId,
      int monthCount,
      ) => _cashflowService.getMonthlyExpenses(categoryId, monthCount);
}
