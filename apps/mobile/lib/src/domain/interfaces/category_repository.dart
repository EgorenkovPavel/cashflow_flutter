import '../models.dart';

abstract interface class CategoryRepository {

  Stream<List<Category>> watchAll();

  Future<List<Category>> getAll();

  Future<Category> getById(int id);

  Stream<Category> watchById(int id);

  Future<int> insert(Category entity);

  Future<void> update(Category entity);

}

