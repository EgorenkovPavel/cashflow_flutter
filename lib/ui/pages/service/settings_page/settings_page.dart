import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/auth_bloc.dart';
import 'package:money_tracker/data/data_repository.dart';
import 'package:money_tracker/data/drive_repository.dart';
import 'package:money_tracker/sync_bloc.dart';
import 'package:money_tracker/ui/page_navigator.dart';
import 'package:money_tracker/ui/pages/service/settings_page/backup_dialog.dart';
import 'package:money_tracker/ui/pages/service/settings_page/restore_dialog.dart';
import 'package:money_tracker/ui/pages/service/settings_page/settings_page_bloc.dart';
import 'package:money_tracker/utils/app_localization.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late SettingsPageBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = SettingsPageBloc(
      context.read<DataRepository>(),
      context.read<DriveRepository>(),
      context.read<AuthBloc>(),
      context.read<SyncBloc>(),
    );
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  Widget sectionTitle(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
      ),
    );
  }

  void _showMessage(BuildContext context, BackupPageAction action) {
    if (action == BackupPageAction.SUCCESS_BACKUP) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(AppLocalizations.of(context).mesDatabaseBackuped)));
    } else if (action == BackupPageAction.SUCCESS_RESTORE) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(AppLocalizations.of(context).mesDatabaseRestored)));
    } else if (action == BackupPageAction.SUCCESS_DELETE) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(AppLocalizations.of(context).mesDatabaseDeleted)));
    } else if (action == BackupPageAction.ERROR_GET_HTTP_CLIENT) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context).errorNoGPServices)),
      );
    }
  }

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
              children: <Widget>[
                BlocConsumer<SettingsPageBloc, BackupPageState>(
                    bloc: _bloc,
                    listener: (context, state) {
                      _showMessage(context, state.action);
                    },
                    builder: (context, state) {
                      return SizedBox();
                    }),
                BlocBuilder<SettingsPageBloc, BackupPageState>(
                    bloc: _bloc,
                    builder: (context, state) {
                      if (state.isAuthenticated) {
                        return ListTile(
                          title: Text('Google account'),
                          subtitle: Text('UserId ${state.userId}'),
                          trailing: ElevatedButton(
                              onPressed: () => _bloc.signOut(),
                              child: Text('SING OUT' //todo
                              )),
                        );
                      } else {
                        return ListTile(
                          title: Text('Google account'),
                          subtitle: Text(''),
                          trailing: ElevatedButton(
                              onPressed: () {
                                _bloc.signIn();
                              },
                              child: Text('SIGN IN' //TODO
                              )),
                        );
                      }
                    }),
                Divider(),
                BlocBuilder<SettingsPageBloc, BackupPageState>(
                    bloc: _bloc,
                    builder: (context, state) {
                      if (!state.isAuthenticated) {
                        return ListTile(
                          title: Text('Cloud database'),
                          subtitle: Text('No database'),
                        );
                      } else if (state.isConnected) {
                        return ListTile(
                          title: Text('Cloud database'),
                          subtitle: Text('Database connected'),
                        );
                        return Row(// TODO add detail screen
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Database connected'),
                            state.isAdmin
                                ? ElevatedButton(
                                    onPressed: () => _addUser(),
                                    child: Text('Add user'))
                                : SizedBox(),
                          ],
                        ); //TODO
                      } else {
                        return ListTile(
                          title: Text('Cloud database'),
                          subtitle: Text('Tap to connect'),
                        );
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () => _bloc.createCloudDatabase(),
                              child: Text('Create database'),
                            ),
                            Text('or send UserId to admin user'),
                            ElevatedButton(
                                onPressed: () => _bloc.resresh(),
                                child: Text('Refresh')),
                          ],
                        );
                      }
                    }),
                Divider(),
                BlocBuilder<SettingsPageBloc, BackupPageState>(
                  bloc: _bloc,
                  builder: (context, state) {
                    if (state.isAuthenticated) {
                      return ListTile(
                        title: Text('Google drive'),
                      );
                      return Flex(
                        direction: Axis.horizontal,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () => _backup(context),
                            child: Text(
                              AppLocalizations.of(context)
                                  .backup
                                  .toUpperCase(),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => _restore(context),
                            child: Text(
                              AppLocalizations.of(context)
                                  .restore
                                  .toUpperCase(),
                            ),
                          ),
                        ],
                      );
                    }
                    else {
                      return SizedBox();
                    }
                  },
                ),
                Divider(),
                ListTile(
                  title: Text(AppLocalizations.of(context).titleDataControl),
                  onTap: ()=> PageNavigator.openDataControlPage(context),
                ),
                 // ElevatedButton(
                //   onPressed: () => _deleteAll(context),
                //   child: Text(
                //     AppLocalizations.of(context).btnDeleteAll.toUpperCase(),
                //   ),
                // ),
                // BlocBuilder<SettingsPageBloc, BackupPageState>(
                //   bloc: _bloc,
                //   builder: (BuildContext context, BackupPageState state) {
                //     if (state.inProgress) {
                //       return Center(
                //         child: CircularProgressIndicator(),
                //       );
                //     } else {
                //       return SizedBox();
                //     }
                //   },
                // )
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _addUser() async {
    var _controller = TextEditingController();
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add user'),
        content: TextField(
          controller: _controller,
        ),
        actions: [
          TextButton(
              onPressed: () {
                _bloc.addUser(_controller.text);
                Navigator.of(context).pop();
              },
              child: Text('OK'))
        ],
      ),
    );
  }

  Future _backup(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => BackupDialog(
        onBackup: _bloc.backup,
      ),
    );
  }

  Future _restore(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => RestoreDialog(
        restore: _bloc.restore,
      ),
    );
  }

  Future _deleteAll(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context).btnDeleteAll),
        content: Text(AppLocalizations.of(context).mesAreYouSure),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              _bloc.deleteAll();
              Navigator.of(context).pop();
            },
            child: Text(AppLocalizations.of(context).yes),
          ),
        ],
      ),
    );
  }
}
