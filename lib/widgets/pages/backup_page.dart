import 'package:bloc/bloc.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/utils/google_http_client.dart';
import 'package:cashflow/widgets/pages/drive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BackupPage extends StatelessWidget {
  static const routeName = '/backup';

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
                  Text(
                      'Google drive',
                      style: Theme.of(context).textTheme.title,
                  ),
                  RaisedButton(
                    child:
                        Text(AppLocalizations.of(context).backup.toUpperCase()),
                    onPressed: () => _backup(context),
                  ),
                  RaisedButton(
                    child:
                        Text(AppLocalizations.of(context).restore.toUpperCase()),
                    onPressed: () => _restore(context),
                  ),
                  RaisedButton(
                    child: Text('DELETE ALL'),
                    onPressed: () => _deleteAll(context),
                  ),
                ],
              ),
            );
          },
        ));
  }

  _backup(BuildContext context) async {
    final httpClient = await GoogleHttpClient.getClient();

    if (httpClient == null) return;

    String catalogId = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => DriveDialog(httpClient)));

    BlocProvider.of<BackupPageBloc>(context).add(Backup(httpClient, catalogId));
  }

  _restore(BuildContext context) async {
    var httpClient;
    try {
      httpClient = await GoogleHttpClient.getClient();
    } catch (e) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('No google play services'),
      ));
      return;
    }
    if (httpClient == null) return;

    String fileId = await DriveDialog.open(context, httpClient);

    BlocProvider.of<BackupPageBloc>(context).add(Restore(httpClient, fileId));
  }

  _deleteAll(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete all'),
        content: Text('Are you sure?'),
        actions: <Widget>[
          FlatButton(
            child: Text('Yes'),
            onPressed: () {
              BlocProvider.of<BackupPageBloc>(context).add(DeleteAll());
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

abstract class BackupPageEvent {}

class Backup extends BackupPageEvent {
  final GoogleHttpClient client;
  final String catalogId;

  Backup(this.client, this.catalogId);
}

class Restore extends BackupPageEvent {
  final GoogleHttpClient client;
  final String fileId;

  Restore(this.client, this.fileId);
}

class DeleteAll extends BackupPageEvent {}

abstract class BackupPageState {}

class BackupPageBloc extends Bloc<BackupPageEvent, BackupPageState> {
  final Repository _repository;

  BackupPageBloc(this._repository);

  @override
  BackupPageState get initialState => null;

  @override
  Stream<BackupPageState> mapEventToState(BackupPageEvent event) async* {
    if (event is Backup) {
      _repository.backup(event.client, event.catalogId);
    } else if (event is Restore) {
      _repository.restore(event.client, event.fileId);
    } else if (event is DeleteAll) {
      _repository.deleteAll();
    }
  }
}
