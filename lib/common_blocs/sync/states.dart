import 'package:equatable/equatable.dart';

abstract class SyncState extends Equatable {
  const SyncState();
}

class SyncStateInProgress extends SyncState {
  const SyncStateInProgress();

  @override
  List<Object?> get props => [];
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

  @override
  List<Object?> get props => [accountCount, categoryCount, operationCount];
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

  @override
  List<Object?> get props => [accountCount, categoryCount, operationCount];
}

class SyncStateSynced extends SyncState {
  final DateTime syncDate;
  final bool isAdmin;

  const SyncStateSynced({
    required this.isAdmin,
    required this.syncDate,
  });

  @override
  List<Object?> get props => [syncDate, isAdmin];
}

class SyncStateNotSynced extends SyncState {
  const SyncStateNotSynced();

  @override
  List<Object?> get props => [];
}

class SyncStateFailed extends SyncState {
  const SyncStateFailed();

  @override
  List<Object?> get props => [];
}

class SyncStateNoDb extends SyncState {
  const SyncStateNoDb();

  @override
  List<Object?> get props => [];
}
