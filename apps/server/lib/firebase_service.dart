import 'package:firebase_admin/firebase_admin.dart';

final app = FirebaseAdmin.instance.initializeApp(
  AppOptions(
    credential: FirebaseAdmin.instance.certFromPath(r'C:\Users\Pavel\VSCodeProjects\cashflow-server\src\main\resources\cashflowFlutter.json'),
  ),
);

final auth = app.auth();