import '../interfaces/category_repository.dart';
import '../models.dart';
import '../services/cashflow_service.dart';

class CategoryInteractor {
  final CategoryRepository _categoryRepository;
  final CashflowService _cashflowService;

  CategoryInteractor(
    this._categoryRepository,
    this._cashflowService,
  );

  Future<Category> getById({required int categoryId}) =>
      _categoryRepository.getCategoryById(categoryId);

  Stream<Category> watchById(int id) =>
      _categoryRepository.watchCategoryById(id);

  Stream<List<CategoryCashFlow>> watchCashFlows() =>
      _cashflowService.watchCashFlow(DateTime.now());

  Stream<List<Category>> watchAll() =>
      _categoryRepository.watchAllCategories();

  Future<InputCategoryItem> insertInputCategoryItem({
    required String title,
    required BudgetType budgetType,
    required int budget,
    required int? parent,
  }) async {
    final category = InputCategoryItem(
      title: title,
      budgetType: budgetType,
      budget: budget,
      parentId: parent,
    );

    final id = await _categoryRepository.insertCategory(category);

    return category.copyWith(id: id);
  }

  Future<OutputCategoryItem> insertOutputCategoryItem({
    required String title,
    required BudgetType budgetType,
    required int budget,
    required int? parent,
  }) async {
    final category = OutputCategoryItem(
      title: title,
      budgetType: budgetType,
      budget: budget,
      parentId: parent,
    );

    final id = await _categoryRepository.insertCategory(category);

    return category.copyWith(id: id);
  }

  Future<InputCategoryGroup> insertInputCategoryGroup({
    required String title,
  }) async {
    final category = InputCategoryGroup(title: title);

    final id = await _categoryRepository.insertCategory(category);

    return category.copyWith(id: id);
  }

  Future<OutputCategoryGroup> insertOutputCategoryGroup({
    required String title,
  }) async {
    final category = OutputCategoryGroup(title: title);

    final id = await _categoryRepository.insertCategory(category);

    return category.copyWith(id: id);
  }

  Future<InputCategoryItem> updateInputCategoryItem({
    required InputCategoryItem category,
    required String title,
    required BudgetType budgetType,
    required int budget,
    required int? parent,
  }) async {
    final newCategory = category
        .copyWith(title: title, budgetType: budgetType, budget: budget)
        .setParent(parent);

    await _categoryRepository.updateCategory(newCategory);

    return newCategory;
  }

  Future<OutputCategoryItem> updateOutputCategoryItem({
    required OutputCategoryItem category,
    required String title,
    required BudgetType budgetType,
    required int budget,
    required int? parent,
  }) async {
    final newCategory = category
        .copyWith(title: title, budgetType: budgetType, budget: budget)
        .setParent(parent);

    await _categoryRepository.updateCategory(newCategory);

    return newCategory;
  }

  Future<InputCategoryGroup> updateInputCategoryGroup({
    required InputCategoryGroup category,
    required String title,
  }) async {
    final newCategory = category.copyWith(title: title);

    await _categoryRepository.updateCategory(newCategory);

    return newCategory;
  }

  Future<OutputCategoryGroup> updateOutputCategoryGroup({
    required OutputCategoryGroup category,
    required String title,
  }) async {
    final newCategory = category.copyWith(title: title);

    await _categoryRepository.updateCategory(newCategory);

    return newCategory;
  }
}
