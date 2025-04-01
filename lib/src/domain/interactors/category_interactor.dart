import '../interfaces/data_repository.dart';
import '../models.dart';

class CategoryInteractor {
  final DataRepository _dataRepository;

  CategoryInteractor(this._dataRepository);

  Future<Category> getById({required int categoryId}) =>
      _dataRepository.getCategoryById(categoryId);

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

    final id = await _dataRepository.insertCategory(category);

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

    final id = await _dataRepository.insertCategory(category);

    return category.copyWith(id: id);
  }

  Future<InputCategoryGroup> insertInputCategoryGroup({
    required String title,
  }) async {
    final category = InputCategoryGroup(
      title: title,
    );

    final id = await _dataRepository.insertCategory(category);

    return category.copyWith(id: id);
  }

  Future<OutputCategoryGroup> insertOutputCategoryGroup({
    required String title,
  }) async {
    final category = OutputCategoryGroup(
      title: title,
    );

    final id = await _dataRepository.insertCategory(category);

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
        .copyWith(
          title: title,
          budgetType: budgetType,
          budget: budget,
        )
        .setParent(parent);

    await _dataRepository.updateCategory(newCategory);

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
        .copyWith(
          title: title,
          budgetType: budgetType,
          budget: budget,
        )
        .setParent(parent);

    await _dataRepository.updateCategory(newCategory);

    return newCategory;
  }

  Future<InputCategoryGroup> updateInputCategoryGroup({
    required InputCategoryGroup category,
    required String title,
  }) async {
    final newCategory = category.copyWith(
      title: title,
    );

    await _dataRepository.updateCategory(newCategory);

    return newCategory;
  }

  Future<OutputCategoryGroup> updateOutputCategoryGroup({
    required OutputCategoryGroup category,
    required String title,
  }) async {
    final newCategory = category.copyWith(
      title: title,
    );

    await _dataRepository.updateCategory(newCategory);

    return newCategory;
  }
}
