import 'package:firebase_api_client/firebase_api_client.dart';

import '../../../domain/models.dart';
import '../../../domain/services/sync_service.dart';
import '../../../utils/exceptions.dart';
import '../../../utils/logger.dart';
import '../../interfaces/local_sync_source.dart';
import '../../sources/remote/cloud_model_extensions.dart';

class OperationSyncServiceImpl implements SyncService {
  final LocalSyncSource _localSource;
  final TableDAO<CloudOperation> _operationTable;

  OperationSyncServiceImpl({
    required LocalSyncSource localSource,
    required TableDAO<CloudOperation> operationTable,
  }) : _localSource = localSource,
       _operationTable = operationTable;

  @override
  Future<int> uploadToCloud() async {
    final operations = await _localSource.operations.getAllNotSynced();
    final allAccounts = await _localSource.getAllAccounts();
    final allCategories = await _localSource.getAllCategories();

    for (var operation in operations) {
      AppLogger.debug('Load to cloud operation ${operation.id}');

      try {
        final accountCloudId = allAccounts
            .where((e) =>
        e.id == operation.map(input: (op) => op.account,
            output: (op) => op.account,
            transfer: (op) => op.accountSend,
          exchange: (op) => op.account,))
            .first
            .cloudId;

        final analyticCloudId = operation.map(
          input: (op) =>
              allCategories.where((e) => e.id == op.category).first.cloudId,
          output: (op) =>
              allCategories.where((e) => e.id == op.category).first.cloudId,
          transfer: (op) =>
              allAccounts.where((e) => e.id == op.accountReceived).first.cloudId,
          exchange: (op) => '', // no analytic
        );

        await _uploadOperationToCloud(
          operation,
          accountCloudId,
          analyticCloudId,
        );
      } catch (e, stackTrace) {
        AppLogger.error(
          'Failed to upload operation ${operation.id} to cloud',
          e,
          stackTrace,
        );
        rethrow;
      }
    }

    return operations.length;
  }

  Future<void> _uploadOperationToCloud(
    Operation operation,
    String accountCloudId,
    String analyticCloudId,
  ) async {
    if (operation.cloudId.isNotEmpty) {
      await _operationTable.update(
        operation.toCloudOperation(accountCloudId, analyticCloudId),
      );
      await _localSource.operations.markAsSynced(
        operation.id,
        operation.cloudId,
      );
    } else {
      var cloudId = await _operationTable.add(
        operation.toCloudOperation(accountCloudId, analyticCloudId),
      );
      await _localSource.operations.markAsSynced(operation.id, cloudId);
    }
  }

  @override
  Future<int> downloadFromCloud(DateTime date) async {
    final cloudOperations = await _operationTable.getAll(date);

    for (final cloudOperation in cloudOperations) {
      AppLogger.debug('Load from cloud operation ${cloudOperation.id}');
      try {
        await _saveCloudOperationToLocal(cloudOperation);
      } catch (e, stackTrace) {
        AppLogger.error(
          'Failed to download operation ${cloudOperation.id} from cloud',
          e,
          stackTrace,
        );
      }
    }

    return cloudOperations.length;
  }

  Future<void> _saveCloudOperationToLocal(CloudOperation cloudOperation) async {
    final operation = await _localSource.operations.getByCloudId(
      cloudOperation.id,
    );

    if (operation == null) {
      final newOperation = await cloudOperation.operationType.map(
        input: () async => InputOperation(
          cloudId: cloudOperation.id,
          synced: true,
          deleted: cloudOperation.deleted,
          date: cloudOperation.date,
          account: (await _getAccountByCloudOperation(cloudOperation)).id,
          category: (await _getCategoryByCloudOperation(cloudOperation)).id,
          sum: cloudOperation.sum,
        ),
        output: () async => OutputOperation(
          cloudId: cloudOperation.id,
          synced: true,
          deleted: cloudOperation.deleted,
          date: cloudOperation.date,
          account: (await _getAccountByCloudOperation(cloudOperation)).id,
          category: (await _getCategoryByCloudOperation(cloudOperation)).id,
          sum: cloudOperation.sum,
        ),
        transfer: () async => TransferOperation(
          cloudId: cloudOperation.id,
          synced: true,
          deleted: cloudOperation.deleted,
          date: cloudOperation.date,
          accountSend: (await _getAccountByCloudOperation(cloudOperation)).id,
          accountReceived: (await _getRecAccountByCloudOperation(cloudOperation)).id,
          sum: cloudOperation.sum,
        ),
        exchange: () async => ExchangeOperation(
          cloudId: cloudOperation.id,
          synced: true,
          deleted: cloudOperation.deleted,
          date: cloudOperation.date,
          account: (await _getAccountByCloudOperation(cloudOperation)).id,
          sumSend: cloudOperation.sum,
          sumReceived: cloudOperation.recSum ?? Money(0, .RUB),
        ),
      );

      await _localSource.operations.insertFromCloud(newOperation);
    } else {
      final newOperation = await cloudOperation.operationType.map(
        input: () async => InputOperation(
          id: operation.id,
          cloudId: cloudOperation.id,
          synced: true,
          deleted: cloudOperation.deleted,
          date: cloudOperation.date,
          account: (await _getAccountByCloudOperation(cloudOperation)).id,
          category: (await _getCategoryByCloudOperation(cloudOperation)).id,
          sum: cloudOperation.sum,
        ),
        output: () async => OutputOperation(
          id: operation.id,
          cloudId: cloudOperation.id,
          synced: true,
          deleted: cloudOperation.deleted,
          date: cloudOperation.date,
          account: (await _getAccountByCloudOperation(cloudOperation)).id,
          category: (await _getCategoryByCloudOperation(cloudOperation)).id,
          sum: cloudOperation.sum,
        ),
        transfer: () async => TransferOperation(
          id: operation.id,
          cloudId: cloudOperation.id,
          synced: true,
          deleted: cloudOperation.deleted,
          date: cloudOperation.date,
          accountSend: (await _getAccountByCloudOperation(cloudOperation)).id,
          accountReceived: (await _getRecAccountByCloudOperation(cloudOperation)).id,
          sum: cloudOperation.sum,
        ),
        exchange: () async => ExchangeOperation(
          id: operation.id,
          cloudId: cloudOperation.id,
          synced: true,
          deleted: cloudOperation.deleted,
          date: cloudOperation.date,
          account: (await _getAccountByCloudOperation(cloudOperation)).id,
          sumSend: cloudOperation.sum,
          sumReceived: cloudOperation.recSum ?? Money(0, .RUB),
        ),
      );
      await _localSource.operations.updateFromCloud(newOperation);
    }
  }

  Future<BaseAccount> _getAccountByCloudOperation(
      CloudOperation cloudOperation,
      ) async {
    final account = await _localSource.accounts.getByCloudId(
      cloudOperation.account,
    );
    if (account == null) {
      throw NetworkException(
        'Can\'t find account by cloudId ${cloudOperation.account} in operation ${cloudOperation.id}',
      );
    } else {
      return account;
    }
  }

  Future<Category> _getCategoryByCloudOperation(
      CloudOperation cloudOperation,
      ) async {
    if (cloudOperation.category == null) {
      throw NetworkException(
        'Try to fetch category on null value in operation ${cloudOperation.id}',
      );
    } else {
      final category = await _localSource.categories.getByCloudId(
        cloudOperation.category!,
      );
      if (category == null) {
        throw NetworkException(
          'Can\'t find category by cloudId ${cloudOperation.category} in operation ${cloudOperation.id}',
        );
      } else {
        return category;
      }
    }
  }

  Future<BaseAccount> _getRecAccountByCloudOperation(
      CloudOperation cloudOperation,
      ) async {
    if (cloudOperation.recAccount == null) {
      throw NetworkException(
        'Try to fetch rec account on null value in operation ${cloudOperation.id}',
      );
    } else {
      final account = await _localSource.accounts.getByCloudId(
        cloudOperation.recAccount!,
      );
      if (account == null) {
        throw NetworkException(
          'Can\'t find rec account by cloudId ${cloudOperation.recAccount} in operation ${cloudOperation.id}',
        );
      } else {
        return account;
      }
    }
  }

}
