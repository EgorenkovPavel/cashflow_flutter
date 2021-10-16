import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/auth_bloc.dart';
import 'package:money_tracker/data/data_repository.dart';
import 'package:money_tracker/data/drive_repository.dart';
import 'package:money_tracker/ui/pages/service/google_drive_settings_page/google_drive_settings_bloc.dart';
import 'package:money_tracker/ui/pages/service/google_drive_settings_page/backup_dialog.dart';
import 'package:money_tracker/ui/pages/service/google_drive_settings_page/restore_dialog.dart';
import 'package:money_tracker/utils/app_localization.dart';
import 'package:provider/src/provider.dart';

class GoogleDriveSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _bloc = DriveBloc(
        dataRepository: context.read<DataRepository>(),
        driveRepository: context.read<DriveRepository>(),
      authBloc: context.read<AuthBloc>(),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Google drive'),
      ),
      body: BlocConsumer<DriveBloc, DriveState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state == DriveState.SUCCESS_BACKUP) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content:
                    Text(AppLocalizations.of(context).mesDatabaseBackuped)));
          } else if (state == DriveState.SUCCESS_RESTORE) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content:
                    Text(AppLocalizations.of(context).mesDatabaseRestored)));
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Flex(
                direction: Axis.horizontal,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () => _backup(context, _bloc.backup),
                    child: Text(
                      AppLocalizations.of(context).backup.toUpperCase(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _restore(context, _bloc.restore),
                    child: Text(
                      AppLocalizations.of(context).restore.toUpperCase(),
                    ),
                  ),
                ],
              ),
              if (state == DriveState.IN_PROGRESS)
                 Center(child: CircularProgressIndicator(),)
            ],
          );
        },
      ),
    );
  }

  Future _backup(BuildContext context,
      Future<void> Function(String, String) onBackup) async {
    await showDialog(
      context: context,
      builder: (context) => BackupDialog(
        onBackup: onBackup,
      ),
    );
  }

  Future _restore(
    BuildContext context,
      Future<void> Function(String) onRestore
  ) async {
    await showDialog(
      context: context,
      builder: (context) => RestoreDialog(
        restore: onRestore,
      ),
    );
  }
}
