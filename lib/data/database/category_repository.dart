import 'package:money_tracker/data/database/category_dao.dart';
import 'package:money_tracker/data/database/database.dart';
import 'package:money_tracker/data/mappers/category_cashflow_mapper.dart';
import 'package:money_tracker/data/mappers/category_mapper.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/domain/models/sum_on_date.dart';
import 'package:moor/moor.dart';

class CategoryRepository {
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

  Stream<List<SumOnDate>> watchCashflowByCategoryByMonth(int id) =>
      categoryDao.watchCashflowByCategoryByMonth(id);

  Stream<List<SumOnDate>> watchCashflowByCategoryByYear(int id) =>
      categoryDao.watchCashflowByCategoryByYear(id);

  Stream<List<Category>> watchAll() =>
      categoryDao.watchAllCategories().map(_mapCategoryList);

  Future<List<Category>> getAll() async =>
      _mapCategoryList(await categoryDao.getAllCategories());

  Stream<List<CategoryCashflow>> watchCategoryCashflowByType(
          DateTime date, OperationType type) =>
      categoryDao
          .watchCategoryCashflowByType(date, type)
          .map(_mapCategoryCashflowList);

  Future<List<CategoryCashflow>> getCategoryCashflowByType(
      DateTime date, OperationType type) async =>
      _mapCategoryCashflowList(await categoryDao
          .getCategoryCashflowByType(date, type));

  Future<Category> getById(int id) async =>
      _mapCategory(await categoryDao.getCategoryById(id));

  Future<Category?> getByCloudId(String cloudId) async {
    var _category = await categoryDao.getCategoryByCloudId(cloudId);
    if (_category == null){
      return null;
    }else{
      return _mapCategory(_category);
    }
  }

  Stream<Category> watchById(int id) =>
      categoryDao.watchCategoryById(id).map(_mapCategory);

  Stream<List<Category>> watchAllByType(OperationType type) =>
      categoryDao.watchAllCategoriesByType(type).map(_mapCategoryList);

  Future<List<Category>> getAllByType(OperationType type) async =>
      _mapCategoryList(await categoryDao.getAllCategoriesByType(type));

  Future<int> insert(Category entity) =>
      categoryDao.insertCategory(CategoriesCompanion(
        cloudId: Value(entity.cloudId),
        title: Value(entity.title),
        operationType: Value(entity.operationType),
        budgetType: Value(entity.budgetType),
        budget: Value(entity.budget),
      ));

  Future update(Category entity) =>
      categoryDao.updateCategory(_mapCategoryDB(entity));
}
