import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class InternetConnectionEvent {}

class Init extends InternetConnectionEvent {}

class ChangeConnection extends InternetConnectionEvent {
  final bool isConnected;

  ChangeConnection(this.isConnected);
}

class InternetConnectionState {
  final bool isConnected;

  InternetConnectionState({required this.isConnected});
}

class InternetConnectionBloc
    extends Bloc<InternetConnectionEvent, InternetConnectionState> {
  StreamSubscription? _sub;

  InternetConnectionBloc()
      : super(InternetConnectionState(isConnected: false)) {
    on<Init>(_init);
    on<ChangeConnection>(_changeConnection);
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }

  void _init(Init event, Emitter<InternetConnectionState> emit) {
    _sub = Connectivity().onConnectivityChanged.listen((result) {
      add(ChangeConnection(result != ConnectivityResult.none));
    });
  }

  void _changeConnection(
      ChangeConnection event, Emitter<InternetConnectionState> emit) {
    emit(InternetConnectionState(isConnected: event.isConnected));
  }
}
