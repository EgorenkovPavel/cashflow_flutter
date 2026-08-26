import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_api_client/firebase_api_client.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final sl = GetIt.instance;

Future<void> init() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCAXsIBBVuii6rTxLq9EQcF0dCD2EbJn3w",
        appId: "1:764112372488:web:4bc845e17e8afa42f262bd",
        authDomain: "cashflow-flutter.firebaseapp.com",
        databaseURL: "https://cashflow-flutter.firebaseio.com",
        projectId: "cashflow-flutter",
        storageBucket: "cashflow-flutter.appspot.com",
        messagingSenderId: "764112372488",
        measurementId: "G-64JW1FE9M7"
    ),
  );

  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  sl.registerLazySingleton<FirebaseFirestore>(() {
    final firestore = FirebaseFirestore.instance;
    firestore.settings = const Settings(persistenceEnabled: false);

    return firestore;
  });

  sl.registerLazySingleton<CloudSource>(
        () => CloudSource(sl<FirebaseFirestore>()),
  );
}