import 'package:spring/services/category_service.dart';

import '../models/models.dart';
import 'network_client.dart';

class CategoryServiceImpl implements CategoryService{
  final NetworkClient _connector;
  final _path = 'categories';

  CategoryServiceImpl(this._connector);

  @override
  Future<List<Category>> getAll() => _connector.get<List<Category>>(_path);

  @override
  Future<Category> createCategory(
      String name, CategoryType type, int budget, CategoryId? parent) =>
      _postCategory(
          name: name,
          type: type,
          budget: budget,
          isGroup: false,
          parent: parent,
          userGroup: _connector.user!.userGroup);

  @override
  Future<Category> createGroup(String name, CategoryType type) =>
      _postCategory(
          name: name,
          type: type,
          budget: 0,
          isGroup: true,
          parent: null,
          userGroup: _connector.user!.userGroup);

  @override
  Future<Category> updateCategory(
      CategoryId categoryId, String name, int budget, CategoryId? parent) =>
      _connector.update('$_path/$categoryId', {
        'name': name,
        'budget': budget,
        'parent': parent,
      });

  @override
  Future<Category> updateGroup(CategoryId categoryId, String name) =>
      _connector.update('$_path/$categoryId', {
        'name': name,
      });

  Future<Category> _postCategory(
      {CategoryId? id,
        required String name,
        required CategoryType type,
        required int budget,
        required bool isGroup,
        required CategoryId? parent,
        required UserGroupId userGroup}) async {
    Category category = Category(
      id: id,
      name: name,
      type: type,
      budget: budget,
      isGroup: isGroup,
      parent: parent,
      userGroup: userGroup,
    );
    Map<String, dynamic> data = await _connector.post(_path, category);
    return Category(
      id: data['id'],
      name: category.name,
      type: category.type,
      budget: category.budget,
      isGroup: category.isGroup,
      parent: category.parent,
      userGroup: category.userGroup,
    );
  }
}