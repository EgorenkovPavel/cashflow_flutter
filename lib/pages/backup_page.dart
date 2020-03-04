import 'package:cashflow/data/backuper.dart';
import 'package:cashflow/data/model.dart';
import 'package:cashflow/pages/drive_dialog.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/utils/google_http_client.dart';
import 'package:cashflow/widgets/load_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BackupPage extends StatelessWidget {
  static const routeName = '/backup';

  Backuper _backuper = Backuper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).itemMenuService),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Google drive',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Flex(
            direction: Axis.horizontal,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                child: Text(AppLocalizations.of(context).backup.toUpperCase()),
                onPressed: () => _backup(context),
              ),
              RaisedButton(
                child: Text(AppLocalizations.of(context).restore.toUpperCase()),
                onPressed: () => _restore(context),
              )
            ],
          ),
          RaisedButton(
            child: Text('Restore old format'),
            onPressed: () => _restoreOld(context),
          ),
          RaisedButton(
            child: Text('DELETE ALL'),
            onPressed: () => _deleteAll(context),
          ),
         ],
      ),
    );
  }

  _backup(BuildContext context) async {
    final httpClient = await GoogleHttpClient.getClient();

    if (httpClient == null) return;

    String catalogId = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => DriveDialog(httpClient)));

    _backuper.backup(context, httpClient, catalogId);
  }

  _restore(BuildContext context) async {
    final httpClient = await GoogleHttpClient.getClient();

    if (httpClient == null) return;

    String fileId = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => DriveDialog(httpClient)));

    _backuper.restore(context, httpClient, fileId);
  }

  _restoreOld(BuildContext context) async {
    final httpClient = await GoogleHttpClient.getClient();

    if (httpClient == null) return;

    String fileId = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => DriveDialog(httpClient)));

    _backuper.restoreOld(context, httpClient, fileId);
  }

  _deleteAll(BuildContext context){
    showDialog(context: context,
    builder: (context) => AlertDialog(
      title: Text('Delete all'),
      content: Text('Are you sure?'),
      actions: <Widget>[
        FlatButton(
          child: Text('Yes'),
          onPressed: () {
            Provider.of<Model>(context, listen: false).deleteAll();
          },
        ),
      ],
    ),
    );
  }
}
