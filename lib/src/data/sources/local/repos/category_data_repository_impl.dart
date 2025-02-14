import 'package:drift/drift.dart';

import '../../../../domain/models.dart';
import '../../../interfaces/local_sync_source.dart';
import '../data/category_dao.dart';
import '../data/database.dart';
import '../mapper_db.dart';

class CategoryDataRepositoryImpl
    implements LocalSyncTable<Category> {
  final CategoryDao categoryDao;

  CategoryDataRepositoryImpl(this.categoryDao);

  @override
  Future<List<Category>> getAllWithEmptyCloudId() async =>
      MapperDB.mapCategoryList(await categoryDao.getAllCategoriesWithEmptyCloudId());

  @override
  Future<Category?> getByCloudId(String cloudId) async {
    var category = await categoryDao.getCategoryByCloudId(cloudId);

    return category == null ? null : MapperDB.mapCategory(category);
  }

  @override
  Future<List<Category>> getAllNotSynced() async {
    return MapperDB.mapCategoryList(await categoryDao.getAllNotSynced());
  }

  @override
  Future markAsSynced(int categoryId, String cloudId) {
    return categoryDao.markAsSynced(categoryId, cloudId);
  }

  @override
  Future insertFromCloud(Category category) {
    return categoryDao.insertCategory(CategoriesCompanion(
      cloudId: Value(category.cloudId),
      title: Value(category.title),
      operationType: Value(category.operationType),
      budgetType: Value(category.budgetType),
      budget: Value(category.budget),
      synced: const Value(true),
    ));
  }

  @override
  Future updateFromCloud(Category category) {
    return categoryDao.updateFields(
      category.id,
      CategoriesCompanion(
        cloudId: Value(category.cloudId),
        title: Value(category.title),
        operationType: Value(category.operationType),
        budgetType: Value(category.budgetType),
        budget: Value(category.budget),
        synced: const Value(true),
      ),
    );
  }
}
