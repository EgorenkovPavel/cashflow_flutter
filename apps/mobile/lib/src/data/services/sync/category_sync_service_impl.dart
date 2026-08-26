import 'package:firebase_api_client/firebase_api_client.dart';

import '../../../domain/models.dart';
import '../../../domain/services/sync_service.dart';
import '../../../utils/logger.dart';
import '../../interfaces/local_sync_source.dart';
import '../../sources/remote/cloud_model_extensions.dart';
import '../../sources/remote/model_mapper.dart';

class CategorySyncServiceImpl implements SyncService {
  final LocalSyncSource _localSource;
  final TableDAO<CloudCategory> _categoryTable;

  CategorySyncServiceImpl({
    required LocalSyncSource localSource,
    required TableDAO<CloudCategory> categoryTable,
  }) : _localSource = localSource,
       _categoryTable = categoryTable;

  @override
  Future<int> uploadToCloud() async {
    final categories = await _localSource.categories.getAllNotSynced();
    final allCategories = await _localSource.getAllCategories();

    for (var category in categories) {
      try {
        final parentId = category.parentId;

        final parent = parentId == null
            ? null
            : allCategories.where((e) => e.id == parentId).first
                  as CategoryGroup;

        await _uploadCategoryToCloud(category, parent);
      } catch (e, stackTrace) {
        AppLogger.error(
          'Failed to upload category ${category.title} to cloud',
          e,
          stackTrace,
        );
        rethrow;
      }
    }

    return categories.length;
  }

  Future<void> _uploadCategoryToCloud(
    Category category,
    CategoryGroup? parent,
  ) async {
    if (category.cloudId.isNotEmpty) {
      await _categoryTable.update(category.toCloudCategory(parent));
      await _localSource.categories.markAsSynced(category.id, category.cloudId);
    } else {
      var cloudId = await _categoryTable.add(category.toCloudCategory(parent));
      await _localSource.categories.markAsSynced(category.id, cloudId);
    }
  }

  @override
  Future<int> downloadFromCloud(DateTime date) async {
    final cloudCategories = await _categoryTable.getAll(date);

    for (final cloudCategory in cloudCategories.where(
      (e) => e.parentId?.isEmpty ?? true,
    )) {
      AppLogger.debug('Load from cloud category ${cloudCategory.title}');
      try {
        await _saveCloudCategoryToLocal(cloudCategory);
      } catch (e, stackTrace) {
        AppLogger.error(
          'Failed to download category ${cloudCategory.title} from cloud',
          e,
          stackTrace,
        );
      }
    }

    for (final cloudCategory in cloudCategories.where(
      (e) => e.parentId?.isNotEmpty ?? false,
    )) {
      AppLogger.debug('Load from cloud category ${cloudCategory.title}');
      try {
        await _saveCloudCategoryToLocal(cloudCategory);
      } catch (e, stackTrace) {
        AppLogger.error(
          'Failed to download category ${cloudCategory.title} from cloud',
          e,
          stackTrace,
        );
      }
    }

    return cloudCategories.length;
  }

  Future<void> _saveCloudCategoryToLocal(CloudCategory cloudCategory) async {
    final category = await _localSource.categories.getByCloudId(
      cloudCategory.id,
    );

    final parent = cloudCategory.parentId?.isEmpty ?? true
        ? null
        : await _localSource.categories.getByCloudId(cloudCategory.parentId!)
              as CategoryGroup;

    if (category == null) {
      await _localSource.categories.insertFromCloud(
        CategoryModelMapper(parent).insertModel(cloudCategory),
      );
    } else {
      await _localSource.categories.updateFromCloud(
        CategoryModelMapper(parent).updateModel(category, cloudCategory),
      );
    }
  }
}
