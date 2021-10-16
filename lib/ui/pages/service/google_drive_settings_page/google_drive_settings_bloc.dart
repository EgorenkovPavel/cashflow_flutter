import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:money_tracker/auth_bloc.dart';
import 'package:money_tracker/data/data_repository.dart';
import 'package:money_tracker/data/drive_repository.dart';

enum DriveState { INITIAL, IN_PROGRESS, SUCCESS_BACKUP, SUCCESS_RESTORE }

class DriveBloc extends Cubit<DriveState> {
  final DataRepository _dataRepository;
  final DriveRepository _driveRepository;
  final AuthBloc _authBloc;

  StreamSubscription? _authSub;

  DriveBloc({
    required DataRepository dataRepository,
    required DriveRepository driveRepository,
    required AuthBloc authBloc,
  })  : _dataRepository = dataRepository,
        _driveRepository = driveRepository,
        _authBloc = authBloc,
        super(DriveState.INITIAL){
    _authState(authBloc.state);
    _authSub = authBloc.stream.listen((event) {
      _authState(event);
    });
  }

  void _authState(AuthState event){
    if (event.inProgress) {
      return;
    } else if (event.isAuthenticated) {
      _driveRepository.logIn(event.client!);
    } else if (!event.isAuthenticated) {
      _driveRepository.logOut();
    }
  }

  Future<void> backup(String catalogId, String fileName) async {
    emit(DriveState.IN_PROGRESS);
    var data = await _dataRepository.exportData();
    await _driveRepository.backup(data, catalogId, fileName);
    emit(DriveState.SUCCESS_BACKUP);
  }

  Future<void> restore(String fileId) async {
    emit(DriveState.IN_PROGRESS);
    var data = await _driveRepository.restore(fileId);
    if (data == null) {
      return null;
      // TODO add bad state emit
    }
    await _dataRepository.importData(data);
    emit(DriveState.SUCCESS_RESTORE);
  }

  @override
  Future<void> close() async {
    _authSub?.cancel();
    return super.close();
  }
}
