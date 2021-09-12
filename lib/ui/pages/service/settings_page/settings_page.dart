import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/ui/page_navigator.dart';
import 'package:money_tracker/ui/pages/service/settings_page/settings_page_bloc.dart';
import 'package:money_tracker/utils/app_localization.dart';

class SettingsPage extends StatelessWidget {
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
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                sectionTitle(context, 'Google drive'),
                Flex(
                  direction: Axis.horizontal,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () => _backup(context),
                      child: Text(
                        AppLocalizations.of(context).backup.toUpperCase(),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => _restore(context),
                      child: Text(
                        AppLocalizations.of(context).restore.toUpperCase(),
                      ),
                    ),
                  ],
                ),
                sectionTitle(
                    context, AppLocalizations.of(context).titleDataControl),
                ElevatedButton(
                  onPressed: () => _deleteAll(context),
                  child: Text(
                    AppLocalizations.of(context).btnDeleteAll.toUpperCase(),
                  ),
                ),
                BlocConsumer<SettingsPageBloc, BackupPageState>(
                  builder: (BuildContext context, BackupPageState state) {
                    if (state.inProgress) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                  listener: (BuildContext context, BackupPageState state) {
                    _showMessage(context, state.action);
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Future _backup(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => BackupDialog(),
    );
  }

  Future _restore(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => RestoreDialog(),
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
              BlocProvider.of<SettingsPageBloc>(context).deleteAll();
              Navigator.of(context).pop();
            },
            child: Text(AppLocalizations.of(context).yes),
          ),
        ],
      ),
    );
  }
}

class BackupDialog extends StatefulWidget {
  BackupDialog({Key? key}) : super(key: key);

  @override
  _BackupDialogState createState() => _BackupDialogState();
}

class _BackupDialogState extends State<BackupDialog> {
  final TextEditingController _controller =
      TextEditingController(text: 'Cashflow backup');

  DriveFile _folder = DriveFile.root();

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
          onPressed: () async {
            if (_folder == null || _controller.text.isEmpty) {
              return;
            }

            BlocProvider.of<SettingsPageBloc>(context)
                .backup(_folder.id, _controller.text);

            Navigator.of(context).pop();
          },
          child: Text(
            AppLocalizations.of(context).backup.toUpperCase(),
          ),
        )
      ],
    );
  }
}

class RestoreDialog extends StatefulWidget {
  const RestoreDialog({Key? key}) : super(key: key);

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
        padding: EdgeInsets.only(left: 8.0),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_file?.title ?? ''),
            IconButton(
              icon: Icon(Icons.arrow_drop_down),
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
      contentPadding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
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

            BlocProvider.of<SettingsPageBloc>(context).restore(_file!.id);

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
