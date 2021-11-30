import 'package:money_tracker/data/local/data/category_dao.dart';
import 'package:money_tracker/data/local/data/database.dart';
import 'package:money_tracker/data/local/local_source.dart';
import 'package:money_tracker/data/mappers/category_cashflow_mapper.dart';
import 'package:money_tracker/data/mappers/category_mapper.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/domain/models/sum_on_date.dart';
import 'package:drift/drift.dart';

class CategoryRepository extends LocalCategoryRepo{
  final CategoryDao categoryDao;

  CategoryRepository(this.categoryDao);

  final List<Category> Function(List<CategoryDB>) _mapCategoryList =
      (list) => const CategoryMapper().mapListToDart(list);

  final Category Function(CategoryDB) _mapCategory =
      (item) => const CategoryMapper().mapToDart(item);

  final CategoryDB Function(Category) _mapCategoryDB =
      (item) => const CategoryMapper().mapToSql(item);

  final CategoryCashflow Function(CategoryCashflowEntity)
      _mapCategoryCashflowBudget =
      (item) => const CategoryCashflowMapper().mapToDart(item);

  final List<CategoryCashflow> Function(List<CategoryCashflowEntity>)
      _mapCategoryCashflowList =
      (list) => const CategoryCashflowMapper().mapListToDart(list);

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
          DateTime date, OperationType type) =>
      categoryDao
          .watchCategoryCashflowByType(date, type)
          .map(_mapCategoryCashflowList);

  @override
  Future<List<CategoryCashflow>> getCashflowByType(
      DateTime date, OperationType type) async =>
      _mapCategoryCashflowList(await categoryDao
          .getCategoryCashflowByType(date, type));

  @override
  Future<Category> getById(int id) async =>
      _mapCategory(await categoryDao.getCategoryById(id));

  @override
  Future<Category?> getByCloudId(String cloudId) async {
    var _category = await categoryDao.getCategoryByCloudId(cloudId);
    if (_category == null){
      return null;
    }else{
      return _mapCategory(_category);
    }
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
      synced: Value(true),
    ));
  }

  @override
  Future updateFromCloud(Category category) {
    return categoryDao.updateFields(category.id, CategoriesCompanion(
      cloudId: Value(category.cloudId),
      title: Value(category.title),
      operationType: Value(category.operationType),
      budgetType: Value(category.budgetType),
      budget: Value(category.budget),
      synced: Value(true),
    ));
  }
}
