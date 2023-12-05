import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/injection_container.dart';
import 'package:money_tracker/src/ui/pages/service/drive_dialog/drive_dialog_bloc.dart';
import 'package:money_tracker/src/utils/extensions.dart';

class DriveDialog extends StatefulWidget {
  final DialogMode mode;

  const DriveDialog.chooseFile({super.key})
      : mode = DialogMode.CHOOSE_FILE;

  const DriveDialog.chooseFolder({super.key})
      : mode = DialogMode.CHOOSE_FOLDER;

  @override
  _DriveDialogState createState() => _DriveDialogState();
}

class _DriveDialogState extends State<DriveDialog> {
  final ScrollController _listController = ScrollController();
  late final DriveDialogBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = sl(param1: widget.mode);
    _bloc.add(const DialogDriveEvent.loadFolders());
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  Future<bool> _onBackPressed() async {
    _bloc.add(const DialogDriveEvent.backPressed());

    return false;
  }

  void _listenState(BuildContext context, DialogDriveState state) {
    state.mapOrNull(success: (state) {
      if (state.action == DialogDriveAction.JUMP_TO_START) {
        _listController.jumpTo(0);
      } else if (state.action == DialogDriveAction.RETURN_RESULT) {
        Navigator.of(context).pop<DriveFile>(state.result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Google drive'),
        ),
        body: BlocConsumer<DriveDialogBloc, DialogDriveState>(
          bloc: _bloc,
          builder: (context, state) {
            return state.map(
              success: (state) {
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
                      onTap: () =>
                          _bloc.add(DialogDriveEvent.onFileTap(file: f)),
                    );
                  },
                );
              },
              failure: (state) {
                return const Center(
                  child: Text('ERROR'),
                );
              },
              inProgress: (state) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          },
          listener: _listenState,
        ),
        persistentFooterButtons: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(context.loc.cancel.toUpperCase()),
          ),
          ElevatedButton(
            onPressed: () => _bloc.add(const DialogDriveEvent.choose()),
            child: Text(
              context.loc.choose.toUpperCase(),
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
    super.key,
    required this.file,
    required this.onTap,
  });

  final DriveFile file;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:
          file.isFolder ? const Icon(Icons.folder) : const Icon(Icons.remove),
      title: Text(file.title),
      subtitle: Text(
        '${context.loc.lastChanges} ${DateFormat.yMMMd().format(file.lastChanges)}',
      ),
      enabled: file.enabled,
      onTap: onTap,
    );
  }
}
