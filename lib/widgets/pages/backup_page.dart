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
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Flex(
                    direction: Axis.horizontal,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        child: Text(
                            AppLocalizations.of(context).backup.toUpperCase()),
                        // onPressed: () {
                        //   showDialog(
                        //     context: context,
                        //     builder: (context) {
                        //       return Dialog(
                        //         child: Text('TEST!!'),
                        //       );
                        //     },
                        //   );
                        // },
                        onPressed: () => _backup(context),
                      ),
                      RaisedButton(
                        child: Text(
                            AppLocalizations.of(context).restore.toUpperCase()),
                        onPressed: () => _restore(context),
                      ),
                    ],
                  ),
                  Text(
                    AppLocalizations.of(context).titleDataControl,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  RaisedButton(
                    child: Text(AppLocalizations.of(context)
                        .btnDeleteAll
                        .toUpperCase()),
                    onPressed: () => _deleteAll(context),
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
                      Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(AppLocalizations.of(context)
                              .mesDatabaseBackuped)));
                    } else if (state is RestoreSuccessState) {
                      Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(AppLocalizations.of(context)
                              .mesDatabaseRestored)));
                    } else if (state is DeleteSuccessState) {
                      Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(AppLocalizations.of(context)
                              .mesDatabaseDeleted)));
                    }
                  })
                ],
              ),
            );
          },
        ));
  }

  _backup(BuildContext context) async {
    var httpClient;
    try {
      httpClient = await GoogleHttpClient.getClient();
    } catch (e) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(AppLocalizations.of(context).errorNoGPServices),
      ));
      print(e.toString());
      return;
    }
    if (httpClient == null) return;

    String catalogId = await DriveDialog.chooseFolder(context, httpClient);

    if (catalogId == null){
      return;
    }

    BlocProvider.of<BackupPageBloc>(context).add(Backup(httpClient, catalogId));
  }

  _restore(BuildContext context) async {
    var httpClient;
    try {
      httpClient = await GoogleHttpClient.getClient();
    } catch (e) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(AppLocalizations.of(context).errorNoGPServices),
      ));
      print(e.toString());
      return;
    }
    if (httpClient == null) return;

    String fileId = await DriveDialog.chooseFile(context, httpClient);

    if(fileId == null){
      return;
    }

    BlocProvider.of<BackupPageBloc>(context).add(Restore(httpClient, fileId));
  }

  _deleteAll(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context).btnDeleteAll),
        content: Text(AppLocalizations.of(context).mesAreYouSure),
        actions: <Widget>[
          FlatButton(
            child: Text(AppLocalizations.of(context).yes),
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

class InitialState extends BackupPageState {}

class ProgressState extends BackupPageState {}

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
      await _repository.backup(event.client, event.catalogId);
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
}
