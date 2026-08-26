import 'package:connectivity_plus/connectivity_plus.dart';

import '../interfaces/network_info.dart';

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;

  NetworkInfoImpl(this.connectivity);

  @override
  Stream<bool> connected() {
    return connectivity.onConnectivityChanged
        .map((event) => event != ConnectivityResult.none);
  }
}