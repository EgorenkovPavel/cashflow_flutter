import 'package:flutter/material.dart';
import 'package:money_tracker/src/domain/interactors/user_interactor.dart';
import 'package:money_tracker/src/ui/widgets/user_avatar.dart';
import 'package:money_tracker/src/utils/extensions.dart';

import '../../../../domain/models.dart';
import '../../../../injection_container.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(context.loc.users),
        ),
        body: FutureBuilder<List<User>>(
            future: sl<UserInteractor>().getAll(),
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
