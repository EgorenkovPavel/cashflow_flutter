import '../models/models.dart';

abstract interface class CategoryService {

  Future<Category> getById(CategoryId id);

  Future<List<Category>> getAll();

  Future<InputCategoryItem> createInputCategoryItem(
    String name,
    int budget,
    CategoryId? parent,
  );

  Future<OutputCategoryItem> createOutputCategoryItem(
    String name,
    int budget,
    CategoryId? parent,
  );

  Future<CategoryItem> updateCategoryItem(
    CategoryItem category,
    String name,
    int budget,
    CategoryId? parent,
  );

  Future<InputCategoryGroup> createInputCategoryGroup(String name);

  Future<OutputCategoryGroup> createOutputCategoryGroup(String name);

  Future<CategoryGroup> updateCategoryGroup(
    CategoryGroup category,
    String name,
  );
}
