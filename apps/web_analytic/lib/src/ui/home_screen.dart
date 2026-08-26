import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:finance_api_client/finance_api_client.dart';
import 'package:finance_api_client/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../injection_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = sl<FirebaseAuth>().currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Личный кабинет"),
        actions: [
          IconButton(
            onPressed: () => sl<FirebaseAuth>().signOut(),
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
            // if (user != null)
            //   FutureBuilder(future: sl<CloudSource>().connect(CloudUser(
            //       googleId: user.uid,
            //       name: user.displayName ?? 'Noname',
            //       photo: user.photoURL ?? '')),
            //     builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            //       if (snapshot.hasError) {
            //         return Text('Auth error');
            //       }
            //
            //       return FutureBuilder(
            //         future: sl<CloudSource>().accounts.getAll(DateTime(2000)),
            //         builder: (BuildContext context,
            //             AsyncSnapshot<Iterable<CloudAccount>> snapshot) {
            //           if (snapshot.hasData) {
            //             return Expanded(child: Column(
            //               children: snapshot.data!.map((e) =>
            //                   ListTile(title: Text(e.title),)).toList(),),);
            //           }
            //
            //           return Text('NO DATA');
            //         },);
            //     },),
            if (user != null)
              FutureBuilder(future: _register(user),
                builder: (BuildContext context,
                    AsyncSnapshot<String> snapshot) {
                  if (snapshot.hasError) {
                    return Text(
                        'Registration failed: ${snapshot.error.toString()} ');
                  }

                  if (snapshot.hasData){
                    return Text(snapshot.data!);
                  }

                  return Text('UNKNOWN');

                },),

          ],
        ),
      ),
    );
  }
}

Future<String> _register(User user) async {
  final idToken = await _getIdToken(user);
  if (idToken.isEmpty) {
    return 'NO TOKEN';
  }
  final dio = Dio();
  final client = FinanceApiClient(dio);
  final userResponce =  await client.register('Bearer $idToken');
  return userResponce.name;
}

Future<String> _getIdToken(User user) async {
  var idToken = '';
  try {
    idToken = await user.getIdToken(true) ?? '';
  } catch (e) {}

  print('IDTOKEN: $idToken');

  return idToken;
}

