import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/src/common_blocs/auth/auth_bloc.dart';
import 'package:money_tracker/src/common_blocs/sync/sync_bloc.dart';
import 'package:money_tracker/src/ui/app.dart';
import 'package:money_tracker/src/utils/extensions.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.itemMenuService),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const AuthListTile(),
                const Divider(thickness: 0.2,),
                const CloudDatabaseListTile(),
                const Divider(thickness: 0.2,),
                const GoogleDriveListTile(),
                const Divider(thickness: 0.2,),
                const DataControlListTile(),
                const Divider(thickness: 0.2,),
                ListTile(
                  title: const Text('Spring'),
                  onTap: () => context.openSpringPage(),
                ),
                const Divider(thickness: 0.2,),
                ListTile(
                  title: const Text('Users'), //TODO
                  onTap: () => context.openUsersPage(),
                ),
                const Divider(thickness: 0.2,),
              ],
            ),
          );
        },
      ),
    );
  }
}

class AuthListTile extends StatelessWidget {
  const AuthListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final authState = context.watch<AuthBloc>().state;

        return authState.isAuthenticated
            ? ListTile(
                title: const Text('Google account'),
                subtitle: const Text('Signed In'),
                trailing: ElevatedButton(
                  onPressed: () =>
                      context.read<AuthBloc>().add(const AuthEvent.signOut()),
                  child: const Text('SING OUT'),
                ),
              )
            : ListTile(
                title: const Text('Google account'),
                subtitle: const Text('Sign in to backup your database'),
                trailing: ElevatedButton(
                  onPressed: () =>
                      context.read<AuthBloc>().add(const AuthEvent.signIn()),
                  child: const Text('SIGN IN'),
                ),
              );
      },
    );
  }
}

class CloudDatabaseListTile extends StatelessWidget {
  const CloudDatabaseListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final authState = context.watch<AuthBloc>().state;
        final syncState = context.watch<SyncBloc>().state;

        if (!authState.isAuthenticated) {
          return const ListTile(
            title: Text('Cloud local'),
            subtitle: Text('No local. Sign in to connect'),
          );
        } else {
          return syncState.maybeMap(
            noDB: (_) => ListTile(
              title: const Text('Cloud local'),
              subtitle: const Text('Tap to connect'),
              onTap: () => context.openCloudDatabaseSettingsPage(),
            ),
            orElse: () => ListTile(
              title: const Text('Cloud local'),
              subtitle: const Text('Database connected'),
              onTap: () => context.openCloudDatabaseSettingsPage(),
            ),
          );
        }
      },
    );
  }
}

class GoogleDriveListTile extends StatelessWidget {
  const GoogleDriveListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final authState = context.watch<AuthBloc>().state;

      return authState.isAuthenticated
          ? ListTile(
              title: const Text('Google drive'),
              onTap: () => context.openGoogleDriveSettingsPage(),
            )
          : const ListTile(title: Text('Google drive'));
    });
  }
}

class DataControlListTile extends StatelessWidget {
  const DataControlListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(context.loc.titleDataControl),
      onTap: () => context.openDataControlPage(),
    );
  }
}
