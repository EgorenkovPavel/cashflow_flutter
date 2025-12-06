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
    } catch (e) {
      return Result.failure(e is Exception ? e : Exception(e.toString()));
    }
  }

  Stream<Category> watchById(int id) =>
      _categoryRepository.watchCategoryById(id);

  Stream<List<CategoryCashFlow>> watchCashFlows() =>
      _cashflowService.watchCashFlow(DateTime.now());

  Stream<List<Category>> watchAll() => _categoryRepository.watchAllCategories();

  Future<Result<InputCategoryItem>> insertInputCategoryItem({
    required String title,
    required BudgetType budgetType,
    required int budget,
    required int? parent,
  }) async {
    try {
      final category = InputCategoryItem(
        title: title,
        budgetType: budgetType,
        budget: budget,
        parentId: parent,
      );

      final id = await _categoryRepository.insertCategory(category);

      return Result.success(category.copyWith(id: id));
    } catch (e) {
      return Result.failure(e is Exception ? e : Exception(e.toString()));
    }
  }

  Future<Result<OutputCategoryItem>> insertOutputCategoryItem({
    required String title,
    required BudgetType budgetType,
    required int budget,
    required int? parent,
  }) async {
    try {
      final category = OutputCategoryItem(
        title: title,
        budgetType: budgetType,
        budget: budget,
        parentId: parent,
      );

      final id = await _categoryRepository.insertCategory(category);

      return Result.success(category.copyWith(id: id));
    } catch (e) {
      return Result.failure(e is Exception ? e : Exception(e.toString()));
    }
  }

  Future<Result<InputCategoryGroup>> insertInputCategoryGroup({
    required String title,
  }) async {
    try {
      final category = InputCategoryGroup(title: title);

      final id = await _categoryRepository.insertCategory(category);

      return Result.success(category.copyWith(id: id));
    } catch (e) {
      return Result.failure(e is Exception ? e : Exception(e.toString()));
    }
  }

  Future<Result<OutputCategoryGroup>> insertOutputCategoryGroup({
    required String title,
  }) async {
    try {
      final category = OutputCategoryGroup(title: title);

      final id = await _categoryRepository.insertCategory(category);

      return Result.success(category.copyWith(id: id));
    } catch (e) {
      return Result.failure(e is Exception ? e : Exception(e.toString()));
    }
  }

  Future<Result<InputCategoryItem>> updateInputCategoryItem({
    required InputCategoryItem category,
    required String title,
    required BudgetType budgetType,
    required int budget,
    required int? parent,
  }) async {
    try {
      final newCategory = category
          .copyWith(title: title, budgetType: budgetType, budget: budget)
          .setParent(parent);

      await _categoryRepository.updateCategory(newCategory);

      return Result.success(newCategory);
    } catch (e) {
      return Result.failure(e is Exception ? e : Exception(e.toString()));
    }
  }

  Future<Result<OutputCategoryItem>> updateOutputCategoryItem({
    required OutputCategoryItem category,
    required String title,
    required BudgetType budgetType,
    required int budget,
    required int? parent,
  }) async {
    try {
      final newCategory = category
          .copyWith(title: title, budgetType: budgetType, budget: budget)
          .setParent(parent);

      await _categoryRepository.updateCategory(newCategory);

      return Result.success(newCategory);
    } catch (e) {
      return Result.failure(e is Exception ? e : Exception(e.toString()));
    }
  }

  Future<Result<InputCategoryGroup>> updateInputCategoryGroup({
    required InputCategoryGroup category,
    required String title,
  }) async {
    try {
      final newCategory = category.copyWith(title: title);

      await _categoryRepository.updateCategory(newCategory);

      return Result.success(newCategory);
    } catch (e) {
      return Result.failure(e is Exception ? e : Exception(e.toString()));
    }
  }

  Future<Result<OutputCategoryGroup>> updateOutputCategoryGroup({
    required OutputCategoryGroup category,
    required String title,
  }) async {
    try {
      final newCategory = category.copyWith(title: title);

      await _categoryRepository.updateCategory(newCategory);

      return Result.success(newCategory);
    } catch (e) {
      return Result.failure(e is Exception ? e : Exception(e.toString()));
    }
  }
}
