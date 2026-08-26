import 'package:drift/drift.dart';

import '../../domain/interfaces/category_repository.dart';
import '../../domain/models.dart';
import '../sources/local/data/category_dao.dart';
import '../sources/local/data/database.dart';
import '../sources/local/db_mapper.dart';

/// Implementation of [CategoryRepository] using [CategoryDao] and [CategoryMapper].
class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryDao _categoryDao;

  CategoryRepositoryImpl(this._categoryDao);

  @override
  Future<List<Category>> getAll() async =>
      CategoryMapper().listToModel(await _categoryDao.getAllCategories());

  @override
  Future<Category> getById(int id) async =>
      CategoryMapper().toModel(await _categoryDao.getCategoryById(id));

  @override
  Future<int> insert(Category entity) =>
      _categoryDao.insertCategory(switch (entity) {
        CategoryItem(
          :final cloudId,
          :final title,
          :final budgetType,
          :final budget,
          :final parentId,
        ) =>
          CategoriesCompanion(
            cloudId: Value(cloudId),
            title: Value(title),
            operationType: Value(entity.type),
            budgetType: Value(budgetType),
            budget: Value(budget),
            isGroup: Value(false),
            parent: Value(parentId),
          ),
        CategoryGroup(:var cloudId, :var title) => CategoriesCompanion(
          cloudId: Value(cloudId),
          title: Value(title),
          operationType: Value(entity.type),
          budgetType: Value(BudgetType.MONTH),
          budget: Value(0),
          isGroup: Value(true),
          parent: Value(null),
        ),
      });

  @override
  Future<void> update(Category entity) =>
      _categoryDao.updateCategory(CategoryMapper().toDBO(entity));

  @override
  Stream<List<Category>> watchAll() =>
      _categoryDao.watchAllCategories().map(CategoryMapper().listToModel);

  @override
  Stream<Category> watchById(int id) =>
      _categoryDao.watchCategoryById(id).map(CategoryMapper().toModel);

}
