import '../models/models.dart';

abstract interface class CategoryService {
  Future<List<Category>> getAll();

  Future<Category> createCategory(
    String name,
    CategoryType type,
    int budget,
    CategoryId? parent,
  );

  Future<Category> updateCategory(
    CategoryId categoryId,
    String name,
    int budget,
    CategoryId? parent,
  );

  Future<Category> createGroup(String name, CategoryType type);

  Future<Category> updateGroup(CategoryId categoryId, String name);
}
