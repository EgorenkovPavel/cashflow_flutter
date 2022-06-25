import 'package:drift/drift.dart';

import '../../../../domain/interfaces/data/category_data_repository.dart';
import '../../../../domain/models.dart';
import '../entities/category_cashflow_entity.dart';
import '../entities/category_month_cashflow_entity.dart';
import '../data/category_dao.dart';
import '../data/database.dart';
import '../../../interfaces/local_sync_source.dart';
import '../mappers/category_cashflow_mapper.dart';
import '../mappers/category_mapper.dart';
import '../mappers/category_month_cashflow_mapper.dart';

class CategoryDataRepositoryImpl
    implements LocalSyncTable<Category>, CategoryDataRepository {
  final CategoryDao categoryDao;

  CategoryDataRepositoryImpl(this.categoryDao);

  List<Category> _mapCategoryList(List<CategoryDB> list) =>
      const CategoryMapper().mapListToDart(list);

  Category _mapCategory(CategoryDB item) =>
      const CategoryMapper().mapToDart(item);

  CategoryDB _mapCategoryDB(Category item) =>
      const CategoryMapper().mapToSql(item);

  List<CategoryCashflow> _mapCategoryCashflowList(
    List<CategoryCashflowEntity> list,
  ) =>
      const CategoryCashflowMapper().mapListToDart(list);

  List<CategoryMonthCashflow> _mapCategoryMonthCashflowList(
    List<CategoryMonthCashflowEntity> list,
  ) =>
      const CategoryMonthCashflowMapper().mapListToDart(list);

  @override
  Stream<List<SumOnDate>> watchCashflowByCategoryByMonth(int id) =>
      categoryDao.watchCashflowByCategoryByMonth(id);

  @override
  Stream<List<SumOnDate>> watchCashflowByCategoryByYear(int id) =>
      categoryDao.watchCashflowByCategoryByYear(id);

  @override
  Stream<List<Category>> watchAll() =>
      categoryDao.watchAllCategories().map(_mapCategoryList);

  @override
  Future<List<Category>> getAll() async =>
      _mapCategoryList(await categoryDao.getAllCategories());

  @override
  Future<List<Category>> getAllWithEmptyCloudId() async =>
      _mapCategoryList(await categoryDao.getAllCategoriesWithEmptyCloudId());

  @override
  Stream<List<CategoryCashflow>> watchCashflowByType(
    DateTime date,
    OperationType type,
  ) =>
      categoryDao
          .watchCategoryCashflowByType(date, type)
          .map(_mapCategoryCashflowList);

  @override
  Future<List<CategoryMonthCashflow>> getCashflowByYear(int year) async =>
      _mapCategoryMonthCashflowList(await categoryDao.getCashflowByYear(year));

  @override
  Future<List<CategoryCashflow>> getCashflowByType(
    DateTime date,
    OperationType type,
  ) async =>
      _mapCategoryCashflowList(
        await categoryDao.getCategoryCashflowByType(date, type),
      );

  @override
  Future<Category> getById(int id) async =>
      _mapCategory(await categoryDao.getCategoryById(id));

  @override
  Future<Category?> getByCloudId(String cloudId) async {
    var category = await categoryDao.getCategoryByCloudId(cloudId);

    return category == null ? null : _mapCategory(category);
  }

  @override
  Stream<Category> watchById(int id) =>
      categoryDao.watchCategoryById(id).map(_mapCategory);

  @override
  Stream<List<Category>> watchAllByType(OperationType type) =>
      categoryDao.watchAllCategoriesByType(type).map(_mapCategoryList);

  @override
  Future<List<Category>> getAllByType(OperationType type) async =>
      _mapCategoryList(await categoryDao.getAllCategoriesByType(type));

  @override
  Future<int> insert(Category entity) =>
      categoryDao.insertCategory(CategoriesCompanion(
        cloudId: Value(entity.cloudId),
        title: Value(entity.title),
        operationType: Value(entity.operationType),
        budgetType: Value(entity.budgetType),
        budget: Value(entity.budget),
      ));

  @override
  Future update(Category entity) =>
      categoryDao.updateCategory(_mapCategoryDB(entity));

  @override
  Future<List<Category>> getAllNotSynced() async {
    return _mapCategoryList(await categoryDao.getAllNotSynced());
  }

  @override
  Future markAsSynced(int categoryId, String cloudId) {
    return categoryDao.markAsSynced(categoryId, cloudId);
  }

  @override
  Stream<Category> watchNotSynced() {
    return categoryDao.watchNotSynced().map((event) => _mapCategory(event));
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
