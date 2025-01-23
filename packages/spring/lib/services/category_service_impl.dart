import 'category_service.dart';

import '../models/models.dart';
import 'network_client.dart';

class CategoryServiceImpl implements CategoryService {
  final NetworkClient _connector;

  CategoryServiceImpl(this._connector);

  String get _path => 'user-groups/${_connector.user!.userGroup}/categories';

  @override
  Future<Category> getById(CategoryId id) => _connector.get<Category>(
        '$_path/$id',
        (e) => Category.fromJson(e),
      );

  @override
  Future<List<Category>> getAll() => _connector.get<List<Category>>(
        _path,
        (data) => data.map<Category>((e) => Category.fromJson(e)).toList(),
      );

  @override
  Future<InputCategoryItem> createInputCategoryItem(
    String name,
    int budget,
    CategoryId? parent,
  ) async {
    InputCategoryItem category = InputCategoryItem(
      name: name,
      budget: budget,
      parent: parent,
    );
    final id = await _postCategory(category);
    return category.copyWithId(id);
  }

  @override
  Future<OutputCategoryItem> createOutputCategoryItem(
    String name,
    int budget,
    CategoryId? parent,
  ) async {
    OutputCategoryItem category = OutputCategoryItem(
      name: name,
      budget: budget,
      parent: parent,
    );
    final id = await _postCategory(category);
    return category.copyWithId(id);
  }

  @override
  Future<InputCategoryGroup> createInputCategoryGroup(String name) async {
    InputCategoryGroup category = InputCategoryGroup(
      name: name,
    );
    final id = await _postCategory(category);
    return category.copyWithId(id);
  }

  @override
  Future<OutputCategoryGroup> createOutputCategoryGroup(String name) async {
    OutputCategoryGroup category = OutputCategoryGroup(
      name: name,
    );
    final id = await _postCategory(category);
    return category.copyWithId(id);
  }

  @override
  Future<CategoryItem> updateCategoryItem(
    CategoryItem category,
    String name,
    int budget,
    CategoryId? parent,
  ) =>
      _connector.update(
        path: '$_path/${category.id}',
        body: {
          'name': name,
          'budget': budget,
          'parent': parent,
        },
        mapper: (e) => Category.fromJson(e) as CategoryItem,
      );

  @override
  Future<CategoryGroup> updateCategoryGroup(
    CategoryGroup category,
    String name,
  ) =>
      _connector.update(
        path: '$_path/${category.id}',
        body: {
          'name': name,
          'budget': 0,
          'parent': null,
        },
        mapper: (e) => Category.fromJson(e) as CategoryGroup,
      );

  Future<CategoryId> _postCategory(Category category) async {
    return await _connector.post(_path, category.toJson());
  }
}
