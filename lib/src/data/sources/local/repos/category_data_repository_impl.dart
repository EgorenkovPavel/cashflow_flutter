import 'package:drift/drift.dart';

import '../../../../domain/models.dart';
import '../../../interfaces/local_sync_source.dart';
import '../data/category_dao.dart';
import '../data/database.dart';
import '../db_mapper.dart';

class CategoryDataRepositoryImpl implements LocalSyncTable<Category> {
  final CategoryDao categoryDao;

  CategoryDataRepositoryImpl(this.categoryDao);

  @override
  Future<List<Category>> getAllWithEmptyCloudId() async => CategoryMapper()
      .listToModel(await categoryDao.getAllCategoriesWithEmptyCloudId());

  @override
  Future<Category?> getByCloudId(String cloudId) async {
    var category = await categoryDao.getCategoryByCloudId(cloudId);

    return category == null ? null : CategoryMapper().toModel(category);
  }

  @override
  Future<List<Category>> getAllNotSynced() async {
    return CategoryMapper().listToModel(await categoryDao.getAllNotSynced());
  }

  @override
  Future markAsSynced(int categoryId, String cloudId) {
    return categoryDao.markAsSynced(categoryId, cloudId);
  }

  @override
  Future insertFromCloud(Category category) {
    return categoryDao.insertCategory(
      category.map(
        item: (c) => CategoriesCompanion(
          cloudId: Value(c.cloudId),
          title: Value(c.title),
          operationType: Value(c.operationType),
          budgetType: Value(c.budgetType),
          budget: Value(c.budget),
          synced: const Value(true),
          isGroup: Value(false),
          parent: Value(c.parentId),
        ),
        group: (c) => CategoriesCompanion(
          cloudId: Value(c.cloudId),
          title: Value(c.title),
          operationType: Value(c.operationType),
          budgetType: Value(BudgetType.MONTH),
          budget: Value(0),
          synced: const Value(true),
          isGroup: Value(true),
        ),
      ),
    );
  }

  @override
  Future updateFromCloud(Category category) {
    return categoryDao.updateFields(
      category.id,
      category.map(
        item: (c) => CategoriesCompanion(
          cloudId: Value(c.cloudId),
          title: Value(c.title),
          operationType: Value(c.operationType),
          budgetType: Value(c.budgetType),
          budget: Value(c.budget),
          synced: const Value(true),
          isGroup: Value(false),
          parent: Value(c.parentId),
        ),
        group: (c) => CategoriesCompanion(
          cloudId: Value(c.cloudId),
          title: Value(c.title),
          operationType: Value(c.operationType),
          budgetType: Value(BudgetType.MONTH),
          budget: Value(0),
          synced: const Value(true),
          isGroup: Value(true),
        ),
      ),
    );
  }
}
