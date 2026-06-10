import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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


