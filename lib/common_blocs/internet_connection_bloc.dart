import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/sources/network_info.dart';

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

  final NetworkInfo networkInfo;
  StreamSubscription? _sub;

  InternetConnectionBloc(this.networkInfo)
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
    _sub = networkInfo.connected().listen((connected) {
      add(ChangeConnection(connected));
    });
  }

  void _changeConnection(
      ChangeConnection event, Emitter<InternetConnectionState> emit) {
    emit(InternetConnectionState(isConnected: event.isConnected));
  }
}
