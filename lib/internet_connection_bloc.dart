import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetConnectionState {
  final bool isConnectedToInternet;

  InternetConnectionState({required this.isConnectedToInternet});
}

class InternetConnectionBloc extends Cubit<InternetConnectionState> {
  StreamSubscription? _sub;

  InternetConnectionBloc()
      : super(InternetConnectionState(isConnectedToInternet: false)) {
    _sub = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      emit(InternetConnectionState(
          isConnectedToInternet: result != ConnectivityResult.none));
    });
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }
}
