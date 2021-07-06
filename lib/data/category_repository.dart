import 'package:money_tracker/data/database/database.dart';
import 'package:money_tracker/data/mappers/category_cashflow_mapper.dart';
import 'package:money_tracker/data/mappers/category_mapper.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:moor/moor.dart';

class CategoryRepository {
  final Database db;

  CategoryRepository(this.db);

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

  Stream<List<Category>> watchAll() =>
      db.categoryDao.watchAllCategories().map(_mapCategoryList);

  Future<List<Category>> getAll() async =>
      _mapCategoryList(await db.categoryDao.getAllCategories());

  Stream<List<CategoryCashflow>> watchCategoryCashflowByType(
          DateTime date, OperationType type) =>
      db.categoryDao
          .watchCategoryCashflowByType(date, type)
          .map(_mapCategoryCashflowList);

  Future<List<CategoryCashflow>> getCategoryCashflowByType(
      DateTime date, OperationType type) async =>
      _mapCategoryCashflowList(await db.categoryDao
          .getCategoryCashflowByType(date, type));

  Future<Category> getById(int id) async =>
      _mapCategory(await db.categoryDao.getCategoryById(id));

  Stream<List<Category>> watchAllByType(OperationType type) =>
      db.categoryDao.watchAllCategoriesByType(type).map(_mapCategoryList);

  Future<List<Category>> getAllByType(OperationType type) async =>
      _mapCategoryList(await db.categoryDao.getAllCategoriesByType(type));

  Future<int> insert(Category entity) =>
      db.categoryDao.insertCategory(CategoriesCompanion(
        title: Value(entity.title),
        operationType: Value(entity.type),
        budgetType: Value(entity.budgetType),
        budget: Value(entity.budget),
      ));

  Future update(Category entity) =>
      db.categoryDao.updateCategory(_mapCategoryDB(entity));
}
