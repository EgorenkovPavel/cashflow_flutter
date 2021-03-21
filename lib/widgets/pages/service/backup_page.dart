import 'package:bloc/bloc.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/utils/google_http_client.dart';
import 'package:cashflow/widgets/pages/service/drive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BackupPage extends StatelessWidget {
  static const routeName = '/backup';

  static void open(BuildContext context) {
    Navigator.of(context).pushNamed(routeName);
  }

  Widget sectionTitle(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline6,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).itemMenuService),
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
                        style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
                        onPressed: () => _backup(context),
                        child: Text(
                          AppLocalizations.of(context).backup.toUpperCase(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
                        onPressed: () => _restore(context),
                        child: Text(
                          AppLocalizations.of(context).restore.toUpperCase(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  sectionTitle(
                      context, AppLocalizations.of(context).titleDataControl),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Theme.of(context).accentColor),
                    onPressed: () => _deleteAll(context),
                    child: Text(
                      AppLocalizations.of(context).btnDeleteAll.toUpperCase(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  BlocConsumer<BackupPageBloc, BackupPageState>(buildWhen:
                      (BackupPageState previosState,
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
            ));
  }

  Future _restore(BuildContext context) async {
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
        builder: (context) => RestoreDialog(
              httpClient: httpClient,
            ));
  }

  Future _deleteAll(BuildContext context) async{
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context).btnDeleteAll),
        content: Text(AppLocalizations.of(context).mesAreYouSure),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              BlocProvider.of<BackupPageBloc>(context).add(DeleteAll());
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

  BackupDialog({Key key, this.httpClient}) : super(key: key);

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
              decoration: BoxDecoration(border: Border.all(width: 1), borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_folder.title),
                  IconButton(
                    icon: Icon(Icons.arrow_drop_down),
                    onPressed: () async {
                      var newFolder = await DriveDialog.chooseFolder(
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
          style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
          onPressed: () async {
            if (_folder == null || _controller.text.isEmpty) {
              return;
            }

            BlocProvider.of<BackupPageBloc>(context)
                .add(Backup(widget.httpClient, _folder.id, _controller.text));

            Navigator.of(context).pop();
          },
          child: Text(AppLocalizations.of(context).backup.toUpperCase(),),
        )
      ],
    );
  }
}

class RestoreDialog extends StatefulWidget {
  final GoogleHttpClient httpClient;

  const RestoreDialog({Key key, this.httpClient}) : super(key: key);

  @override
  _RestoreDialogState createState() => _RestoreDialogState();
}

class _RestoreDialogState extends State<RestoreDialog> {
  DriveFile _file;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context).restore),
      content: Container(
        padding: EdgeInsets.only(left: 8.0),
        width: double.infinity,
        decoration: BoxDecoration(border: Border.all(width: 1), borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_file?.title ?? ''),
            IconButton(
              icon: Icon(Icons.arrow_drop_down),
              onPressed: () async {
                var newFile =
                    await DriveDialog.chooseFile(context, widget.httpClient);
                if (newFile != null) {
                  setState(() {
                    _file = newFile;
                  });
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
          child: Text(AppLocalizations.of(context).cancel.toUpperCase()),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
          onPressed: () {
            if (_file == null) {
              return;
            }

            BlocProvider.of<BackupPageBloc>(context)
                .add(Restore(widget.httpClient, _file.id));

            Navigator.of(context).pop();
          },
          child: Text(AppLocalizations.of(context).restore.toUpperCase()),
        )
      ],
    );
  }
}

abstract class BackupPageEvent {}

class Backup extends BackupPageEvent {
  final GoogleHttpClient client;
  final String catalogId;
  final String fileName;

  Backup(this.client, this.catalogId, this.fileName);
}

class Restore extends BackupPageEvent {
  final GoogleHttpClient client;
  final String fileId;

  Restore(this.client, this.fileId);
}

class DeleteAll extends BackupPageEvent {}

abstract class BackupPageState {}

class InitialState extends BackupPageState {}

class ProgressState extends BackupPageState {}

class GetHttpClientError extends BackupPageState {}

class BackupSuccessState extends BackupPageState {}

class RestoreSuccessState extends BackupPageState {}

class DeleteSuccessState extends BackupPageState {}

class BackupPageBloc extends Bloc<BackupPageEvent, BackupPageState> {
  final Repository _repository;

  BackupPageBloc(this._repository) : super(InitialState());

  @override
  Stream<BackupPageState> mapEventToState(BackupPageEvent event) async* {
    if (event is Backup) {
      yield ProgressState();
      await _repository.backup(event.client, event.catalogId, event.fileName);
      yield BackupSuccessState();
      yield InitialState();
    } else if (event is Restore) {
      yield ProgressState();
      await _repository.restore(event.client, event.fileId);
      yield RestoreSuccessState();
      yield InitialState();
    } else if (event is DeleteAll) {
      yield ProgressState();
      await _repository.deleteAll();
      yield DeleteSuccessState();
      yield InitialState();
    }
  }

  Future<GoogleHttpClient> getHttpClient() async {
    GoogleHttpClient httpClient;
    try {
      httpClient = await GoogleHttpClient.getClient();
    } catch (e) {
      return null;
    }
    return httpClient;
  }
}
