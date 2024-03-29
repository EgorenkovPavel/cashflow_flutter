abstract class SyncState {
  const SyncState();
}

class SyncState_InProgress extends SyncState {
  const SyncState_InProgress();
}

class SyncState_LoadingToCloud extends SyncState {
  final int accountCount;
  final int categoryCount;
  final int operationCount;

  const SyncState_LoadingToCloud({
    required this.accountCount,
    required this.categoryCount,
    required this.operationCount,
  });
}

class SyncState_LoadingFromCloud extends SyncState {
  final int accountCount;
  final int categoryCount;
  final int operationCount;

  const SyncState_LoadingFromCloud({
    required this.accountCount,
    required this.categoryCount,
    required this.operationCount,
  });
}

class SyncState_Synced extends SyncState {
  final bool isAdmin;
  final DateTime syncDate;

  const SyncState_Synced({required this.isAdmin, required this.syncDate});
}

class SyncState_NotSynced extends SyncState {
  final bool isAdmin;

  const SyncState_NotSynced({required this.isAdmin});
}

class SyncState_Failed extends SyncState {
  final bool isAdmin;

  const SyncState_Failed({required this.isAdmin});
}

class SyncState_NoDb extends SyncState {

  const SyncState_NoDb();
}
