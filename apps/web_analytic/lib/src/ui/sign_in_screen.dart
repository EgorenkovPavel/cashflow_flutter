import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
