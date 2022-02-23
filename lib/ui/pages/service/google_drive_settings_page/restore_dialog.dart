import 'package:flutter/material.dart';
import 'package:money_tracker/domain/models/google_drive_file.dart';
import 'package:money_tracker/ui/page_navigator.dart';
import 'package:money_tracker/utils/app_localization.dart';

class RestoreDialog extends StatefulWidget {
  final void Function(String fileId) restore;

  const RestoreDialog({Key? key, required this.restore}) : super(key: key);

  @override
  _RestoreDialogState createState() => _RestoreDialogState();
}

class _RestoreDialogState extends State<RestoreDialog> {
  DriveFile? _file;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context).restore),
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
              onPressed: () async {
                var newFile = await PageNavigator.chooseFile(context);
                if (newFile != null) {
                  setState(
                        () {
                      _file = newFile;
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
      contentPadding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            AppLocalizations.of(context).cancel.toUpperCase(),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (_file == null) {
              return;
            }

            widget.restore(_file!.id);

            Navigator.of(context).pop();
          },
          child: Text(
            AppLocalizations.of(context).restore.toUpperCase(),
          ),
        )
      ],
    );
  }
}
