abstract class SyncState {
  const SyncState();
}

class SyncStateInProgress extends SyncState {
  const SyncStateInProgress();
}

class SyncStateLoadingToCloud extends SyncState {
  final int accountCount;
  final int categoryCount;
  final int operationCount;

  const SyncStateLoadingToCloud({
    required this.accountCount,
    required this.categoryCount,
    required this.operationCount,
  });
}

class SyncStateLoadingFromCloud extends SyncState {
  final int accountCount;
  final int categoryCount;
  final int operationCount;

  const SyncStateLoadingFromCloud({
    required this.accountCount,
    required this.categoryCount,
    required this.operationCount,
  });
}

class SyncStateSynced extends SyncState {
  final DateTime syncDate;

  const SyncStateSynced({required this.syncDate});
}

class SyncStateNotSynced extends SyncState {
  const SyncStateNotSynced();
}

class SyncStateFailed extends SyncState {
  const SyncStateFailed();
}

class SyncStateNoDb extends SyncState {
  const SyncStateNoDb();
}
