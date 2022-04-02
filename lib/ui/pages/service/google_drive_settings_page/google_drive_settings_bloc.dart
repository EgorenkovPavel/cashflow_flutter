// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:money_tracker/common_blocs/auth/auth_bloc.dart';
import 'package:money_tracker/data/sources/auth_source.dart';
import 'package:money_tracker/data/sources/backup_source.dart';
import 'package:money_tracker/domain/interfaces/auth_repository.dart';
import 'package:money_tracker/domain/interfaces/data_repository.dart';

enum DriveState { INITIAL, IN_PROGRESS, SUCCESS_BACKUP, SUCCESS_RESTORE }

class DriveBloc extends Cubit<DriveState> {
  final DataRepository _dataRepository;
  GoogleDrive? _driveRepository;

  //final AuthBloc _authBloc;
  final AuthRepository authRepository;

  StreamSubscription? _authSub;

  DriveBloc({
    required DataRepository dataRepository,
    required AuthBloc authBloc,
    required this.authRepository,
  })  : _dataRepository = dataRepository,
        //_authBloc = authBloc,
        super(DriveState.INITIAL) {
    _authState(authBloc.state);
    _authSub = authBloc.stream.listen((event) {
      _authState(event);
    });
  }

  Future<void> _authState(AuthState event) async {
    if (event is Authenticated) {
      final client = await authRepository.getClient();
      _driveRepository = client != null ? GoogleDrive(client) : null;
    } else if (event is NotAuthenticated) {
      _driveRepository = null;
    }
  }

  Future<void> backup(String catalogId, String fileName) async {
    if (_driveRepository == null) {
      return;
    }
    emit(DriveState.IN_PROGRESS);
    var data = await _dataRepository.exportData();
    await _driveRepository!.backup(data, catalogId, fileName);
    emit(DriveState.SUCCESS_BACKUP);
  }

  Future<void> restore(String fileId) async {
    if (_driveRepository == null) {
      return;
    }
    emit(DriveState.IN_PROGRESS);
    var data = await _driveRepository!.restore(fileId);
    if (data == null) {
      return;
      // TODO add bad state emit
    }
    await _dataRepository.importData(data);
    emit(DriveState.SUCCESS_RESTORE);
  }

  @override
  Future<void> close() async {
    await _authSub?.cancel();

    return super.close();
  }
}
