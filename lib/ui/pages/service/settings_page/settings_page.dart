import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/ui/page_navigator.dart';
import 'package:money_tracker/ui/pages/service/settings_page/settings_page_bloc.dart';
import 'package:money_tracker/ui/widgets/mode_toggle_button.dart';
import 'package:money_tracker/utils/app_localization.dart';
import 'package:money_tracker/utils/google_http_client.dart';

class SettingsPage extends StatelessWidget {
  Widget sectionTitle(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        // style: Theme.of(context).textTheme.headline6,
      ),
    );
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
                        //style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
                        onPressed: () => _backup(context),
                        child: Text(
                          AppLocalizations.of(context).backup.toUpperCase(),
                          //style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        //style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
                        onPressed: () => _restore(context),
                        child: Text(
                          AppLocalizations.of(context).restore.toUpperCase(),
                          //style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  sectionTitle(
                      context, AppLocalizations.of(context).titleDataControl),
                  ElevatedButton(
                    //style: ElevatedButton.styleFrom(primary: Theme.of(context).accentColor),
                    onPressed: () => _deleteAll(context),
                    child: Text(
                      AppLocalizations.of(context).btnDeleteAll.toUpperCase(),
                      //style: TextStyle(color: Colors.white),
                    ),
                  ),
                  BlocConsumer<BackupPageBloc, BackupPageState>(buildWhen:
                      (BackupPageState previousState,
                          BackupPageState currentState) {
                    return currentState is InitialState ||
                        currentState is ProgressState;
                  }, builder: (BuildContext context, BackupPageState state) {
                    if (state is InitialState) {
                      return SizedBox();
                    } else if (state is ProgressState) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return SizedBox();
                    }
                  }, listener: (BuildContext context, BackupPageState state) {
                    if (state is BackupSuccessState) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(AppLocalizations.of(context)
                              .mesDatabaseBackuped)));
                    } else if (state is RestoreSuccessState) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(AppLocalizations.of(context)
                              .mesDatabaseRestored)));
                    } else if (state is DeleteSuccessState) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(AppLocalizations.of(context)
                              .mesDatabaseDeleted)));
                    } else if (state is GetHttpClientError) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            AppLocalizations.of(context).errorNoGPServices),
                      ));
                    }
                  })
                ],
              ),
            );
          },
        ));
  }

  Future _backup(BuildContext context) async {
    var httpClient;
    try {
      httpClient = await GoogleHttpClient.getClient();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(AppLocalizations.of(context).errorNoGPServices),
      ));
      print(e.toString());
      return;
    }
    if (httpClient == null) return;

    await showDialog(
      context: context,
      builder: (context) => BackupDialog(
        httpClient: httpClient,
      ),
    );
  }

  Future _restore(BuildContext context) async {
    var httpClient;
    try {
      httpClient = await GoogleHttpClient.getClient();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context).errorNoGPServices),
        ),
      );
      print(
        e.toString(),
      );
      return;
    }
    if (httpClient == null) return;

    await showDialog(
      context: context,
      builder: (context) => RestoreDialog(
        httpClient: httpClient,
      ),
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
              BlocProvider.of<BackupPageBloc>(context).deleteAll();
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
  final GoogleHttpClient httpClient;

  BackupDialog({Key? key, required this.httpClient}) : super(key: key);

  @override
  _BackupDialogState createState() => _BackupDialogState();
}

class _BackupDialogState extends State<BackupDialog> {
  final TextEditingController _controller =
      TextEditingController(text: 'Cashflow backup');

  DriveFile _folder = DriveFile(id: 'root', title: 'Root', isFolder: true);

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
                      var newFolder = await PageNavigator.chooseFolder(
                          context, widget.httpClient);
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
          //style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
          onPressed: () async {
            if (_folder == null || _controller.text.isEmpty) {
              return;
            }

            BlocProvider.of<BackupPageBloc>(context)
                .backup(widget.httpClient, _folder.id, _controller.text);

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
  final GoogleHttpClient httpClient;

  const RestoreDialog({Key? key, required this.httpClient}) : super(key: key);

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
                var newFile =
                    await PageNavigator.chooseFile(context, widget.httpClient);
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
          //style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
          onPressed: () {
            if (_file == null) {
              return;
            }

            BlocProvider.of<BackupPageBloc>(context)
                .restore(widget.httpClient, _file!.id);

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
