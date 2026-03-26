import '../models.dart';

/// Repository for managing categories (items and groups).
abstract interface class CategoryRepository {
  /// Watch all categories as a stream.
  Stream<List<Category>> watchAllCategories();

  /// Get all categories.
  Future<List<Category>> getAllCategories();

  /// Get a specific category by id.
  Future<Category> getCategoryById(int id);

  /// Watch a specific category by id as a stream.
  Stream<Category> watchCategoryById(int id);

  /// Insert a new category and return its id.
  Future<int> insertCategory(Category entity);

  /// Update an existing category.
  Future<void> updateCategory(Category entity);

}

