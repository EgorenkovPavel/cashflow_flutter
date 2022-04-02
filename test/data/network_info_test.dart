import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:money_tracker/data/sources/network_info.dart';

import 'network_info_test.mocks.dart';

@GenerateMocks([Connectivity])
void main() {
  late NetworkInfoImpl networkInfo;
  late MockConnectivity mockConnectivity;

  setUp(() {
    mockConnectivity = MockConnectivity();
    networkInfo = NetworkInfoImpl(mockConnectivity);
  });

  test('should forward call to Connectivity', () async {
    when(mockConnectivity.onConnectivityChanged)
        .thenAnswer((_) => Stream.fromIterable([
              ConnectivityResult.none,
              ConnectivityResult.wifi,
              ConnectivityResult.none,
            ]));

    var states = [];
    await for (bool state in networkInfo.connected()){
      states.add(state);
    }

    expect(states, [false, true, false]);
  });
}
