import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/common_blocs/auth/auth_bloc.dart';
import 'package:money_tracker/data/sources/backup_source.dart';
import 'package:money_tracker/domain/interfaces/auth_repository.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/ui/pages/service/drive_dialog/dialog_drive_bloc.dart';
import 'package:money_tracker/utils/app_localization.dart';

class DriveDialog extends StatefulWidget {
  final DialogMode mode;

  const DriveDialog.chooseFile({Key? key})
      : mode = DialogMode.CHOOSE_FILE,
        super(key: key);

  const DriveDialog.chooseFolder({Key? key})
      : mode = DialogMode.CHOOSE_FOLDER,
        super(key: key);

  @override
  _DriveDialogState createState() => _DriveDialogState();
}

class _DriveDialogState extends State<DriveDialog> {
  final ScrollController _listController = ScrollController();
  late final DialogDriveBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = DialogDriveBloc(
      repository: context.read<AuthRepository>(),
      mode: widget.mode,
    );
    _bloc.loadFolders();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  Future<bool> _onBackpressed() async {
    _bloc.onBackPressed();

    return false;
  }

  void _listenState(BuildContext context, DialogDriveState state){
    if (state.action == DialogDriveAction.JUMP_TO_START) {
      _listController.jumpTo(0);
    } else if (state.action == DialogDriveAction.RETURN_RESULT) {
      Navigator.of(context).pop<DriveFile>(state.result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackpressed,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Google drive'),
        ),
        body: BlocConsumer<DialogDriveBloc, DialogDriveState>(
          bloc: _bloc,
          builder: (context, state) {
            return ListView.separated(
              controller: _listController,
              itemCount: state.folderList.length,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
              itemBuilder: (BuildContext context, int index) {
                var f = state.folderList[index];

                return _DriveFileItem(
                  file: f,
                  onTap: () => _bloc.onFileTap(f),
                );
              },
            );
          },
          listener: _listenState,
        ),
        persistentFooterButtons: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              AppLocalizations.of(context).cancel.toUpperCase(),
            ),
          ),
          ElevatedButton(
            onPressed: () => _bloc.choose(),
            child: Text(
              AppLocalizations.of(context).choose.toUpperCase(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class _DriveFileItem extends StatelessWidget {
  const _DriveFileItem({
    Key? key,
    required this.file,
    required this.onTap,
  }) : super(key: key);

  final DriveFile file;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:
          file.isFolder ? const Icon(Icons.folder) : const Icon(Icons.remove),
      title: Text(file.title),
      subtitle: Text(
        '${AppLocalizations.of(context).lastChanges} ${DateFormat.yMMMd().format(file.lastChanges)}',
      ),
      enabled: file.enabled,
      onTap: onTap,
    );
  }
}
