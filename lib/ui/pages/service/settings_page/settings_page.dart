import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/common_blocs/auth/auth_bloc.dart';
import 'package:money_tracker/common_blocs/sync/sync_bloc.dart';
import 'package:money_tracker/ui/page_navigator.dart';
import 'package:money_tracker/utils/extensions.dart';
import 'package:provider/provider.dart';

import '../../../../injection_container.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

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
              children: const <Widget>[
                AuthListTile(),
                Divider(),
                CloudDatabaseListTile(),
                Divider(),
                GoogleDriveListTile(),
                Divider(),
                DataControlListTile(),
              ],
            ),
          );
        },
      ),
    );
  }
}

class AuthListTile extends StatelessWidget {
  const AuthListTile({Key? key}) : super(key: key);

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
                  onPressed: () => context.read<AuthBloc>().add(AuthEvent.signOut()),
                  child: const Text('SING OUT'),
                ),
              )
            : ListTile(
                title: const Text('Google account'),
                subtitle: const Text('Sign in to backup yout database'),
                trailing: ElevatedButton(
                  onPressed: () => context.read<AuthBloc>().add(AuthEvent.signIn()),
                  child: const Text('SIGN IN'),
                ),
              );
      },
    );
  }
}

class CloudDatabaseListTile extends StatelessWidget {
  const CloudDatabaseListTile({Key? key}) : super(key: key);

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
        } else{
          return syncState.maybeMap(
              noDB: (_) => ListTile(
                title: const Text('Cloud local'),
                subtitle: const Text('Tap to connect'),
                onTap: () => sl<PageNavigator>().openCloudDatabaseSettingsPage(context),
              ),
              orElse: () => ListTile(
                title: const Text('Cloud local'),
                subtitle: const Text('Database connected'),
                onTap: () => sl<PageNavigator>().openCloudDatabaseSettingsPage(context),
              ));
        }
      },
    );
  }
}

class GoogleDriveListTile extends StatelessWidget {
  const GoogleDriveListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final authState = context.watch<AuthBloc>().state;

      return authState.isAuthenticated
          ? ListTile(
              title: const Text('Google drive'),
              onTap: () => sl<PageNavigator>().openGoogleDriveSettingsPage(context),
            )
          : const ListTile(title: Text('Google drive'));
    });
  }
}

class DataControlListTile extends StatelessWidget {
  const DataControlListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(context.loc.titleDataControl),
      onTap: () => sl<PageNavigator>().openDataControlPage(context),
    );
  }
}
