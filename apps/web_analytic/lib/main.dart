import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:web_analytic/src/ui/home_screen.dart';
import 'package:web_analytic/src/ui/sign_in_screen.dart';

void main() async {
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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth Google Web',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const AuthGate(), // Точка входа, которая проверяет состояние
    );
  }
}

/// Виджет-контроллер: решает, показывать экран входа или главный экран
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Пока ждем ответа от Firebase (проверка сессии)
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        // Если пользователь уже вошел
        if (snapshot.hasData) {
          return const HomeScreen();
        }

        // Если пользователь не авторизован
        return const SignInScreen();
      },
    );
  }
}

