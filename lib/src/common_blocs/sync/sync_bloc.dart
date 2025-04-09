import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/common_blocs/auth/auth_bloc.dart';
import 'package:money_tracker/src/data/interfaces/settings_source.dart';
import 'package:money_tracker/src/domain/interfaces/sync_repository.dart';
import 'package:money_tracker/src/domain/models/user.dart';

part 'sync_bloc.freezed.dart';

@freezed
class SyncEvent with _$SyncEvent {
  const SyncEvent._();

  const factory SyncEvent.createCloudDatabase() = _CreateCloudDatabaseSyncEvent;

  const factory SyncEvent.refreshConnection() = _RefreshConnectionSyncEvent;

  const factory SyncEvent.syncNow() = _SyncNowSyncEvent;

  const factory SyncEvent.syncLastDay() = _SyncLastDaySyncEvent;

  const factory SyncEvent.syncLastMonth() = _SyncLastMonthSyncEvent;

  const factory SyncEvent.syncAll() = _SyncAllSyncEvent;

  const factory SyncEvent.addUser({required User user}) = _AddUserSyncEvent;

  const factory SyncEvent.authProgress() = _AuthProgressSyncEvent;

  const factory SyncEvent.authAuthenticated({required User user}) =
      _AuthAuthenticatedSyncEvent;

  const factory SyncEvent.notAuth() = _NotAuthSyncEvent;

  const factory SyncEvent.syncData({required DateTime syncDate}) =
      _SyncDataSyncEvent;
}

@freezed
class SyncState with _$SyncState {
  const SyncState._();

  //noDB
  //  notSynced
  //    loadingToCloud
  //    loadingFromCloud
  //      synced

  const factory SyncState.noDB() = _NoDBSyncState;

  const factory SyncState.notSynced({required String message}) =
      _NotSyncedSyncState;

  const factory SyncState.loadingToCloud({
    required int accountCount,
    required int categoryCount,
    required int operationCount,
  }) = _LoadingToCloudSyncState;

  const factory SyncState.loadingFromCloud({
    required int accountCount,
    required int categoryCount,
    required int operationCount,
  }) = _LoadingFromCloudSyncState;

  const factory SyncState.synced({
    required DateTime syncDate,
    required bool isAdmin,
  }) = _SyncedSyncState;

  const factory SyncState.failure() = _FailureSyncState;

  const factory SyncState.inProgress() = _InProgressSyncState;
}

class SyncBloc extends Bloc<SyncEvent, SyncState> {
  final AuthBloc _authBloc;
  final SettingsSource prefsRepository;
  final SyncRepository syncRepo;

  StreamSubscription? _syncSub;

  SyncBloc({
    required AuthBloc authBloc,
    required this.prefsRepository,
    required this.syncRepo,
  })  : _authBloc = authBloc,
        super(const SyncState.notSynced(message: 'Not started yet')) {
    on<SyncEvent>((event, emitter) => event.map(
          createCloudDatabase: (event) => _createCloudDatabase(event, emitter),
          refreshConnection: (event) => _syncNow(event, emitter),
          syncNow: (event) => _syncNow(event, emitter),
          syncLastDay: (event) => _syncLastDay(event, emitter),
          syncLastMonth: (event) => _syncLastMonth(event, emitter),
          syncAll: (event) => _syncAll(event, emitter),
          addUser: (event) => _addUser(event, emitter),
          authProgress: (event) => _authProgress(event, emitter),
          authAuthenticated: (event) => _authAuthenticated(event, emitter),
          notAuth: (event) => _notAuth(event, emitter),
          syncData: (event) => _syncData(event, emitter),
        ));

    _syncSub = _authBloc.stream.listen((event) async {
      final user = event.user;
      if (user != null) {
        add(SyncEvent.authAuthenticated(user: user));
      } else {
        add(const SyncEvent.notAuth());
      }
    });
  }

  FutureOr<void> _authProgress(
    _AuthProgressSyncEvent event,
    Emitter<SyncState> emit,
  ) {
    emit(const SyncState.inProgress());
  }

  FutureOr<void> _authAuthenticated(
    _AuthAuthenticatedSyncEvent event,
    Emitter<SyncState> emit,
  ) async {
    emit(const SyncState.inProgress());

    try {
      if (await syncRepo.databaseExists(admin: event.user)) {
        await syncRepo.logIn(event.user);
        add(const SyncEvent.syncNow());
      } else {
        emit(const SyncState.noDB());
      }
    } catch (e) {
      emit(const SyncState.failure());
      rethrow;
    }
  }

  FutureOr<void> _notAuth(_NotAuthSyncEvent event, Emitter<SyncState> emit) {
    emit(const SyncState.notSynced(message: 'Not authenticated'));
  }

  Future<void> _syncData(
    _SyncDataSyncEvent event,
    Emitter<SyncState> emit,
  ) async {
    if (!_authBloc.state.isAuthenticated) {
      return;
    }

    try {
      await for (var event in syncRepo.uploadToCloud()) {
        emit(SyncState.loadingToCloud(
          accountCount: event.accountCount,
          categoryCount: event.categoryCount,
          operationCount: event.operationCount,
        ));
      }

      var syncDate = DateTime.now();
      await for (var event in syncRepo.downloadFromCloud(event.syncDate)) {
        emit(SyncState.loadingFromCloud(
          accountCount: event.accountCount,
          categoryCount: event.categoryCount,
          operationCount: event.operationCount,
        ));
      }
      await prefsRepository.setSyncDate(syncDate);
      if (syncRepo.isCurrentAdmin()) {
        emit(SyncState.synced(syncDate: syncDate, isAdmin: true));
      } else {
        emit(SyncState.synced(syncDate: syncDate, isAdmin: false));
      }
    } on Object catch (e) {
      emit(SyncState.notSynced(message: e.toString()));
      rethrow;
    }
  }

  FutureOr<void> _createCloudDatabase(
    _CreateCloudDatabaseSyncEvent event,
    Emitter<SyncState> emit,
  ) async {
    final user = _authBloc.state.user;
    if (user == null) {
      return;
    }
    emit(const SyncState.inProgress());
    try {
      await syncRepo.createDatabase(admin: user);
      add(const SyncEvent.syncNow());
    } catch (e) {
      emit(const SyncState.failure());
      rethrow;
    }
  }

  FutureOr<void> _syncNow(SyncEvent event, Emitter<SyncState> emit) {
    add(SyncEvent.syncData(
      syncDate: _beforeLastSyncDate(const Duration(minutes: 30)),
    ));
  }

  FutureOr<void> _syncLastDay(
    _SyncLastDaySyncEvent event,
    Emitter<SyncState> emit,
  ) {
    add(SyncEvent.syncData(
      syncDate: _beforeLastSyncDate(const Duration(days: 1)),
    ));
  }

  FutureOr<void> _syncLastMonth(
    _SyncLastMonthSyncEvent event,
    Emitter<SyncState> emit,
  ) {
    add(SyncEvent.syncData(
      syncDate: _beforeLastSyncDate(const Duration(days: 30)),
    ));
  }

  FutureOr<void> _syncAll(_SyncAllSyncEvent event, Emitter<SyncState> emit) {
    add(SyncEvent.syncData(syncDate: DateTime.utc(1970, 1, 1)));
  }

  DateTime _beforeLastSyncDate(Duration duration) =>
      prefsRepository.syncDate.subtract(duration);

  FutureOr<void> _addUser(
    _AddUserSyncEvent event,
    Emitter<SyncState> emit,
  ) =>
      syncRepo.addToDatabase(event.user);

  @override
  Future<void> close() {
    _syncSub?.cancel();

    return super.close();
  }
}

extension SyncBlocExt on BuildContext {
  SyncBloc _bloc() => read<SyncBloc>();

  void syncNow() => _bloc().add(const SyncEvent.syncNow());

  void syncLastDay() => _bloc().add(const SyncEvent.syncLastDay());

  void syncLastMonth() => _bloc().add(const SyncEvent.syncLastMonth());

  void syncAll() => _bloc().add(const SyncEvent.syncAll());

  void createCloudDatabase() =>
      _bloc().add(const SyncEvent.createCloudDatabase());

  void refreshConnection() => _bloc()
      .add(const SyncEvent.refreshConnection());
}
