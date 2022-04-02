import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/common_blocs/auth/auth_bloc.dart';
import 'package:money_tracker/domain/interfaces/auth_repository.dart';
import 'package:money_tracker/domain/interfaces/data_repository.dart';
import 'package:money_tracker/ui/pages/service/google_drive_settings_page/backup_dialog.dart';
import 'package:money_tracker/ui/pages/service/google_drive_settings_page/google_drive_settings_bloc.dart';
import 'package:money_tracker/ui/pages/service/google_drive_settings_page/restore_dialog.dart';
import 'package:money_tracker/utils/app_localization.dart';

class GoogleDriveSettingsPage extends StatelessWidget {
  const GoogleDriveSettingsPage({Key? key}) : super(key: key);

  void _listenState(BuildContext context, DriveState state){
    if (state == DriveState.SUCCESS_BACKUP) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(AppLocalizations.of(context).mesDatabaseBackuped),
      ));
    } else if (state == DriveState.SUCCESS_RESTORE) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(AppLocalizations.of(context).mesDatabaseRestored),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    var _bloc = DriveBloc(
      dataRepository: context.read<DataRepository>(),
      authBloc: context.read<AuthBloc>(),
      authRepository: context.read<AuthRepository>(),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Google drive'),
      ),
      body: BlocConsumer<DriveBloc, DriveState>(
        bloc: _bloc,
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
    Future<void> Function(String, String) onBackup,
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
    Future<void> Function(String) onRestore,
  ) async {
    await showDialog<void>(
      context: context,
      builder: (context) => RestoreDialog(
        restore: onRestore,
      ),
    );
  }
}
