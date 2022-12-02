import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/common_blocs/auth/auth_bloc.dart';
import 'package:money_tracker/data/interfaces/settings_source.dart';
import 'package:money_tracker/domain/interfaces/sync_repository.dart';
import 'package:money_tracker/domain/models/user.dart';

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

  const factory SyncState.inProgress() = _InProgressSyncState;

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

  const factory SyncState.synced(
      {required DateTime syncDate, required bool isAdmin}) = _SyncedSyncState;

  const factory SyncState.notSynced() = _NotSyncedSyncState;

  const factory SyncState.failure() = _FailureSyncState;

  const factory SyncState.noDB() = _NoDBSyncState;
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
        super(const SyncState.notSynced()) {
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
        add(SyncEvent.notAuth());
      }
    });
  }

  FutureOr<void> _authProgress(
      _AuthProgressSyncEvent event, Emitter<SyncState> emit) {
    emit(const SyncState.inProgress());
  }

  FutureOr<void> _authAuthenticated(
    _AuthAuthenticatedSyncEvent event,
    Emitter<SyncState> emit,
  ) async {
    emit(const SyncState.inProgress());
    var res = await syncRepo.databaseExists(admin: event.user);

    return res.fold(
      (success) async {
        if (success) {
          var resLogIn = await syncRepo.logIn(event.user);

          return resLogIn.fold((success) => add(SyncEvent.syncNow()),
              (failure) {
            emit(const SyncState.failure());
          });
        } else {
          emit(const SyncState.noDB());
        }
      },
      (failure) {
        emit(const SyncState.failure());
      },
    );
  }

  FutureOr<void> _notAuth(_NotAuthSyncEvent event, Emitter<SyncState> emit) {
    emit(const SyncState.notSynced());
  }

  Future<void> _syncData(
      _SyncDataSyncEvent event, Emitter<SyncState> emit) async {
    if (!_authBloc.state.isAuthenticated) {
      return;
    }

    try {
      await for (var event in syncRepo.loadToCloud()) {
        emit(SyncState.loadingToCloud(
          accountCount: event.accountCount,
          categoryCount: event.categoryCount,
          operationCount: event.operationCount,
        ));
      }

      var syncDate = DateTime.now();
      await for (var event in syncRepo.loadFromCloud(event.syncDate)) {
        emit(SyncState.loadingFromCloud(
          accountCount: event.accountCount,
          categoryCount: event.categoryCount,
          operationCount: event.operationCount,
        ));
      }
      await prefsRepository.setSyncDate(syncDate);
      syncRepo.isCurrentAdmin().fold(
            (success) =>
                emit(SyncState.synced(syncDate: syncDate, isAdmin: success)),
            (failure) =>
                emit(SyncState.synced(syncDate: syncDate, isAdmin: false)),
          );
    } on Object catch (e, stackTrace) {
      emit(const SyncState.notSynced());
      Error.throwWithStackTrace(
        Exception('Error when sync data in sync bloc'),
        stackTrace,
      );
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
    var res = await syncRepo.createDatabase(admin: user);
    if (res.isFailure()) {
      emit(const SyncState.failure());

      return;
    }

    add(SyncEvent.syncNow());
  }

  FutureOr<void> _syncNow(SyncEvent event, Emitter<SyncState> emit) {
    add(SyncEvent.syncData(
      syncDate: prefsRepository.syncDate.subtract(const Duration(minutes: 30)),
    ));
  }

  FutureOr<void> _syncLastDay(
      _SyncLastDaySyncEvent event, Emitter<SyncState> emit) {
    add(SyncEvent.syncData(
        syncDate: prefsRepository.syncDate.subtract(const Duration(days: 1))));
  }

  FutureOr<void> _syncLastMonth(_SyncLastMonthSyncEvent event, Emitter<SyncState> emit) {
    add(SyncEvent.syncData(syncDate: prefsRepository.syncDate.subtract(const Duration(days: 30))));
  }

  FutureOr<void> _syncAll(_SyncAllSyncEvent event, Emitter<SyncState> emit) {
    add(SyncEvent.syncData(syncDate: DateTime.utc(1970, 1, 1)));
  }

  FutureOr<void> _addUser(_AddUserSyncEvent event, Emitter<SyncState> emit) async {
    final res = await syncRepo.addToDatabase(event.user);
  }

  @override
  Future<void> close() {
    _syncSub?.cancel();

    return super.close();
  }
}
