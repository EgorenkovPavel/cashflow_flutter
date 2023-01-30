import 'package:flutter/material.dart';
import 'package:money_tracker/src/data/interfaces/settings_source.dart';
import 'package:money_tracker/src/domain/models/google_drive_file.dart';
import 'package:money_tracker/src/injection_container.dart';
import 'package:money_tracker/src/ui/app.dart';
import 'package:money_tracker/src/utils/extensions.dart';

class BackupDialog extends StatefulWidget {
  final void Function(String folderId, String title) onBackup;

  const BackupDialog({Key? key, required this.onBackup}) : super(key: key);

  @override
  _BackupDialogState createState() => _BackupDialogState();
}

class _BackupDialogState extends State<BackupDialog> {
  final TextEditingController _controller = TextEditingController();

  DriveFile _folder = DriveFile.root();

  @override
  void initState() {
    super.initState();
    _controller.text = sl<SettingsSource>().googleDriveFileName;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_controller.text.isEmpty) {
      return;
    }

    widget.onBackup(_folder.id, _controller.text);
    await sl<SettingsSource>().setGoogleDriveFileName(_controller.text);

    Navigator.of(context).pop();
  }

  Future _chooseFolder(BuildContext context) async {
    var newFolder = await context.chooseFolderDialog();
    if (newFolder != null) {
      setState(() {
        _folder = newFolder;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(context.loc.backup),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: context.loc.title,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Container(
              padding: const EdgeInsets.only(left: 8.0),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_folder.title),
                  IconButton(
                    icon: const Icon(Icons.arrow_drop_down),
                    onPressed: () => _chooseFolder(context),
                  ),
                ],
              ),
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
          onPressed: () => _save(),
          child: Text(context.loc.backup.toUpperCase()),
        ),
      ],
    );
  }
}
