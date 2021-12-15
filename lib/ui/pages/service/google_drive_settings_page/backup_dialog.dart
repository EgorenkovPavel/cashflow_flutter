import 'package:flutter/material.dart';
import 'package:money_tracker/data/prefs_repository.dart';
import 'package:money_tracker/domain/models/google_drive_file.dart';
import 'package:money_tracker/ui/page_navigator.dart';
import 'package:money_tracker/utils/app_localization.dart';
import 'package:provider/src/provider.dart';

class BackupDialog extends StatefulWidget {
  final Future<void> Function(String folderId, String title) onBackup;

  BackupDialog({Key? key, required this.onBackup}) : super(key: key);

  @override
  _BackupDialogState createState() => _BackupDialogState();
}

class _BackupDialogState extends State<BackupDialog> {
  final TextEditingController _controller = TextEditingController();

  DriveFile _folder = DriveFile.root();

  @override
  void initState() {
    super.initState();
    _controller.text = context.read<PrefsRepository>().googleDriveFileName;
  }

  Future<void> _save() async {
    if (_folder == null || _controller.text.isEmpty) {
      return;
    }

    await widget.onBackup(_folder.id, _controller.text);
    await context
        .read<PrefsRepository>()
        .setGoogleDriveFileName(_controller.text);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context).backup),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: AppLocalizations.of(context).title,
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 8.0),
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_folder.title),
                  IconButton(
                    icon: Icon(Icons.arrow_drop_down),
                    onPressed: () async {
                      var newFolder = await PageNavigator.chooseFolder(context);
                      if (newFolder != null) {
                        setState(() {
                          _folder = newFolder;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      contentPadding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(AppLocalizations.of(context).cancel.toUpperCase()),
        ),
        ElevatedButton(
          onPressed: () => _save(),
          child: Text(
            AppLocalizations.of(context).backup.toUpperCase(),
          ),
        )
      ],
    );
  }
}
