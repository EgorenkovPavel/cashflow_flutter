import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:web_analytic/src/injection_container.dart';
import 'package:web_analytic/src/ui/home_screen.dart';
import 'package:web_analytic/src/ui/sign_in_screen.dart';

void main() async {
  runZonedGuarded<Future<void>>(() async {
    await init();

    runApp(const MyApp());
  }, (error, stack) {});
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
      stream: sl<FirebaseAuth>().authStateChanges(),
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

