import '../../../domain/models/account/account.dart';
import '../../../domain/models/user.dart';
import '../../../domain/services/sync_service.dart';
import '../../../utils/logger.dart';
import '../../interfaces/local_sync_source.dart';
import '../../sources/remote/cloud_model_extensions.dart';
import '../../sources/remote/daos/table_dao.dart';
import '../../sources/remote/model_mapper.dart';
import '../../sources/remote/models/cloud_models.dart';

class AccountSyncServiceImpl implements SyncService {
  final LocalSyncSource _localSource;
  final TableDAO<CloudAccount> _accountTable;

  AccountSyncServiceImpl({
    required LocalSyncSource localSource,
    required TableDAO<CloudAccount> accountTable,
  }) : _localSource = localSource,
       _accountTable = accountTable;

  @override
  Future<int> uploadToCloud() async {
    final accounts = await _localSource.accounts.getAllNotSynced();
    final allUsers = await _localSource.getAllUsers();

    for (final account in accounts) {
      try {
        final user = account.userId != null
            ? allUsers.where((e) => e.id == account.userId).firstOrNull
            : null;
        await _uploadAccount(account, user);
      } catch (e, stackTrace) {
        AppLogger.error(
          'Failed to upload account ${account.title} to cloud',
          e,
          stackTrace,
        );
        rethrow;
      }
    }

    return accounts.length;
  }

  Future<void> _uploadAccount(BaseAccount account, User? user) async {
    try {
      if (account.cloudId.isNotEmpty) {
        await _accountTable.update(account.toCloudAccount(user));
        await _localSource.accounts.markAsSynced(account.id, account.cloudId);
      } else {
        var cloudId = await _accountTable.add(account.toCloudAccount(user));
        await _localSource.accounts.markAsSynced(account.id, cloudId);
      }
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to upload account ${account.title} to cloud',
        e,
        stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<int> downloadFromCloud(DateTime date) async {
    final cloudAccounts = await _accountTable.getAll(date);

    for (final cloudAccount in cloudAccounts) {
      try {
        await _saveFromCloud(cloudAccount);
      } catch (e, stackTrace) {
        AppLogger.error(
          'Failed to download account ${cloudAccount.title} from cloud',
          e,
          stackTrace,
        );
      }
    }

    return cloudAccounts.length;
  }

  Future<void> _saveFromCloud(CloudAccount cloudAccount) async {
    final account = await _localSource.accounts.getByCloudId(cloudAccount.id);
    final user = await _localSource.getUserByGoogleId(cloudAccount.user);
    if (account == null) {
      await _localSource.accounts.insertFromCloud(
        AccountModelMapper(user).insertModel(cloudAccount),
      );
    } else {
      await _localSource.accounts.updateFromCloud(
        AccountModelMapper(user).updateModel(account, cloudAccount),
      );
    }
  }
}
