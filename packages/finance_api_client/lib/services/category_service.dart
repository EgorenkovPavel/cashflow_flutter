import 'package:uuid/uuid.dart';

import '../models/models.dart';

abstract interface class CategoryService {
  Future<CategoryResponse> getById(UuidValue id);

  Future<List<CategoryResponse>> getAll();

  Future<CategoryResponse> create(CreateCategoryRequest req);

  Future<CategoryResponse> update(UpdateCategoryRequest req);
}
