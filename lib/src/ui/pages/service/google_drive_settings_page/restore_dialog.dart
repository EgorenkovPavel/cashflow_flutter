import 'package:flutter/material.dart';
import 'package:money_tracker/src/domain/models/google_drive_file.dart';
import 'package:money_tracker/src/ui/app.dart';
import 'package:money_tracker/src/utils/extensions.dart';

class RestoreDialog extends StatefulWidget {
  final void Function(String fileId) restore;

  const RestoreDialog({Key? key, required this.restore}) : super(key: key);

  @override
  _RestoreDialogState createState() => _RestoreDialogState();
}

class _RestoreDialogState extends State<RestoreDialog> {
  DriveFile? _file;

  Future<void> _chooseFile(BuildContext context) async {
    var newFile = await context.chooseFileDialog();
    if (newFile != null) {
      setState(
        () {
          _file = newFile;
        },
      );
    }
  }

  void _onRestore() {
    if (_file == null) {
      return;
    }

    widget.restore(_file!.id);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(context.loc.restore),
      content: Container(
        padding: const EdgeInsets.only(left: 8.0),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_file?.title ?? ''),
            IconButton(
              icon: const Icon(Icons.arrow_drop_down),
              onPressed: () => _chooseFile(context),
            ),
          ],
        ),
      ),
      contentPadding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(context.loc.cancel.toUpperCase()),
        ),
        ElevatedButton(
          onPressed: _onRestore,
          child: Text(context.loc.restore.toUpperCase()),
        ),
      ],
    );
  }
}
