import 'package:uuid/uuid.dart';

import '../models/models.dart';
import 'category_service.dart';
import 'network_client.dart';

class CategoryServiceImpl implements CategoryService {
  final NetworkClient _connector;

  CategoryServiceImpl(this._connector);

  String get _path => 'user-groups/${_connector.user!.groupId}/categories';

  @override
  Future<CategoryResponse> getById(UuidValue id) => _connector
      .get<CategoryResponse>('$_path/$id', (e) => CategoryResponse.fromJson(e));

  @override
  Future<List<CategoryResponse>> getAll() =>
      _connector.get<List<CategoryResponse>>(
        _path,
        (data) => data
            .map<CategoryResponse>((e) => CategoryResponse.fromJson(e))
            .toList(),
      );

  @override
  Future<CategoryResponse> create(CreateCategoryRequest req) {
    return _postCategory(req);
  }

  @override
  Future<CategoryResponse> update(UpdateCategoryRequest req) =>
      _connector.update(path: '$_path/${req.id}', body: req.toJson());

  Future<CategoryResponse> _postCategory(CreateCategoryRequest req) async {
    return await _connector.post(_path, req.toJson());
  }
}
