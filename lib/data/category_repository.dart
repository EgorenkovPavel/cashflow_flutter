import 'package:money_tracker/data/database/database.dart';
import 'package:money_tracker/data/mappers/category_mapper.dart';
import 'package:money_tracker/domain/models.dart';

class CategoryRepository {
  final Database db;

  CategoryRepository(this.db);

  final List<Category> Function(List<CategoryDB>) _mapCategoryList =
      (list) => const CategoryMapper().mapListToDart(list);

  final Category Function(CategoryDB) _mapCategory =
      (item) => const CategoryMapper().mapToDart(item);

  final CategoryDB Function(Category) _mapCategoryDB =
      (item) => const CategoryMapper().mapToSql(item);

  Stream<List<Category>> watchAll() =>
      db.categoryDao.watchAllCategories().map(_mapCategoryList);

  Future<List<Category>> getAll() async =>
      _mapCategoryList(await db.categoryDao.getAllCategories());

  Future<Category> getById(int id) async =>
      _mapCategory(await db.categoryDao.getCategoryById(id));

  Stream<List<Category>> watchAllByType(OperationType type) =>
      db.categoryDao.watchAllCategoriesByType(type).map(_mapCategoryList);

  Future<int> insert(Category entity) =>
      db.categoryDao.insertCategory(_mapCategoryDB(entity));

  Future update(Category entity) =>
      db.categoryDao.updateCategory(_mapCategoryDB(entity));
}