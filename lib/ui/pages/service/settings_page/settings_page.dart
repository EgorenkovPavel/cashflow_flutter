import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/common_blocs/auth/auth_bloc.dart';
import 'package:money_tracker/common_blocs/sync/states.dart';
import 'package:money_tracker/common_blocs/sync/sync_bloc.dart';
import 'package:money_tracker/ui/page_navigator.dart';
import 'package:money_tracker/utils/app_localization.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).itemMenuService,
        ),
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
        final _authState = context.watch<AuthBloc>().state;

        if (_authState is Authenticated) {
          return ListTile(
            title: const Text('Google account'),
            subtitle: const Text('Signed In'),
            trailing: ElevatedButton(
                onPressed: () => context.read<AuthBloc>().add(SignOut()),
                child: const Text('SING OUT' //todo
                    )),
          );
        } else {
          return ListTile(
            title: const Text('Google account'),
            subtitle: const Text('Sign in to backup yout database'),
            trailing: ElevatedButton(
                onPressed: () {
                  context.read<AuthBloc>().add(SignIn());
                },
                child: const Text('SIGN IN' //TODO
                    )),
          );
        }
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
        final _authState = context.watch<AuthBloc>().state;
        final _syncState = context.watch<SyncBloc>().state;

        if (_authState is NotAuthenticated) {
          return const ListTile(
            title: Text('Cloud local'),
            subtitle: Text('No local. Sign in to connect'),
          );
        } else if (_syncState is! SyncStateNoDb) {
          return ListTile(
            title: const Text('Cloud local'),
            subtitle: const Text('Database connected'),
            onTap: () => PageNavigator.openCloudDatabaseSettingsPage(context),
          );
        } else {
          return ListTile(
            title: const Text('Cloud local'),
            subtitle: const Text('Tap to connect'),
            onTap: () => PageNavigator.openCloudDatabaseSettingsPage(context),
          );
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
      final _authState = context.watch<AuthBloc>().state;

      if (_authState is Authenticated) {
        return ListTile(
          title: const Text('Google drive'),
          onTap: () => PageNavigator.openGoogleDriveSettingsPage(context),
        );
      } else {
        return const ListTile(
          title: Text('Google drive'),
        );
      }
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
      title: Text(AppLocalizations.of(context).titleDataControl),
      onTap: () => PageNavigator.openDataControlPage(context),
    );
  }
}
