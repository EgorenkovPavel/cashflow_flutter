import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/src/utils/extensions.dart';

import '../../../../injection_container.dart';
import 'backup_dialog.dart';
import 'google_drive_settings_bloc.dart';
import 'restore_dialog.dart';

class GoogleDriveSettingsPage extends StatelessWidget {
  const GoogleDriveSettingsPage({super.key});

  void _listenState(BuildContext context, DriveState state) {
    state.mapOrNull(
      successBackup: (state) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(context.loc.mesDatabaseBackuped),
        ));
      },
      successRestore: (state) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(context.loc.mesDatabaseRestored),
        ));
      },
      failure: (state) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('ERROR'),
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var bloc = sl<DriveBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Google drive'),
      ),
      body: BlocConsumer<DriveBloc, DriveState>(
        bloc: bloc,
        listener: _listenState,
        builder: (context, state) {
          return Stack(
            children: [
              Flex(
                direction: Axis.horizontal,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () => _backup(
                      context,
                      (catalogId, fileName) => bloc.add(DriveEvent.backup(
                        catalogId: catalogId,
                        fileName: fileName,
                      )),
                    ),
                    child: Text(context.loc.backup.toUpperCase()),
                  ),
                  ElevatedButton(
                    onPressed: () => _restore(
                      context,
                      (fileId) => bloc.add(DriveEvent.restore(fileId: fileId)),
                    ),
                    child: Text(context.loc.restore.toUpperCase()),
                  ),
                ],
              ),
              if (state.inProgress)
                const Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          );
        },
      ),
    );
  }

  Future _backup(
    BuildContext context,
    void Function(String, String) onBackup,
  ) async {
    await showDialog<void>(
      context: context,
      builder: (context) => BackupDialog(
        onBackup: onBackup,
      ),
    );
  }

  Future _restore(
    BuildContext context,
    void Function(String) onRestore,
  ) async {
    await showDialog<void>(
      context: context,
      builder: (context) => RestoreDialog(
        restore: onRestore,
      ),
    );
  }
}
