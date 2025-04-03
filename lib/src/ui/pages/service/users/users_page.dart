import 'package:flutter/material.dart';
import 'package:money_tracker/src/domain/interfaces/data_repository.dart';
import 'package:money_tracker/src/ui/widgets/user_avatar.dart';
import '../../../../domain/models.dart';
import '../../../../injection_container.dart';

class UsersPage extends StatelessWidget {
  const UsersPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Users'),//TODO
        ),
        body: FutureBuilder<List<User>>(
            future: sl<DataRepository>().getAllUsers(),
            initialData: [],
            builder: (context, snapshot) {
              return ListView(
                children: snapshot.data!
                    .map((e) => ListTile(
                          title: Text(e.name),
                          subtitle: Text(e.googleId),
                          leading: UserAvatar(photoUrl: e.photo, name: e.name),
                        ))
                    .toList(),
              );
            }));
  }
}
