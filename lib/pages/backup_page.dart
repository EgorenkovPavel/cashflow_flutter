import 'package:cashflow/data/backuper.dart';
import 'package:cashflow/pages/drive_dialog.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/utils/google_http_client.dart';
import 'package:flutter/material.dart';

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        ],
      ),
    );
  }

  _backup(BuildContext context) async {
    final httpClient = await GoogleHttpClient.getClient();

    if (httpClient == null) return;

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => DriveDialog(httpClient)));
  }

  _restore(BuildContext context) async {
    final httpClient = await GoogleHttpClient.getClient();

    if (httpClient == null) return;

    String fileId = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => DriveDialog(httpClient)));

    _backuper.restore(context, httpClient, fileId);
  }
}
