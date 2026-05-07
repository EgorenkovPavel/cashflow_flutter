import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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

/// Экран входа
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _isLoading = false;

  Future<void> _login() async {
    setState(() => _isLoading = true);
    try {
      await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);

      GoogleAuthProvider googleProvider = GoogleAuthProvider();

      // Используем Popup для Web (отдельное окно)
      // Если хотите в этой же вкладке, замените на signInWithRedirect
      await FirebaseAuth.instance.signInWithPopup(googleProvider);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Ошибка входа: $e")),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.lock_outline, size: 80, color: Colors.blue),
            const SizedBox(height: 20),
            const Text("Добро пожаловать", style: TextStyle(fontSize: 24)),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: _login,
              icon: const Icon(Icons.login),
              label: const Text("Войти через Google"),
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16)),
            ),
          ],
        ),
      ),
    );
  }
}

/// Главный экран (доступен только после входа)
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Личный кабинет"),
        actions: [
          IconButton(
            onPressed: () => FirebaseAuth.instance.signOut(),
            icon: const Icon(Icons.exit_to_app),
            tooltip: "Выйти",
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (user?.photoURL != null)
              CircleAvatar(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18.0),
                  child: CachedNetworkImage(
                    imageUrl: user!.photoURL!,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        Text(user?.displayName ?? 'Пользователь'.substring(0, 1).toUpperCase()),
                  ),
                ),
              ),
            const SizedBox(height: 20),
            Text("Привет, ${user?.displayName ?? 'Пользователь'}!",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("${user?.email}"),
            const SizedBox(height: 10),
            Text("UID: ${user?.uid}", style: const TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}


