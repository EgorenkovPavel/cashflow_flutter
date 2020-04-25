import 'package:cashflow/data/stack.dart' as lib;
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/utils/google_http_client.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:intl/intl.dart';

class DriveDialog extends StatefulWidget {
  final GoogleHttpClient httpClient;

  const DriveDialog(this.httpClient);

  static Future<String> open(BuildContext context, GoogleHttpClient httpClient) async {
    return await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => DriveDialog(httpClient)));
  }

  @override
  _DriveDialogState createState() => _DriveDialogState();
}

class _DriveDialogState extends State<DriveDialog> {
  lib.Stack<String> rootFolder = lib.Stack();
  List<drive.File> folderList = [];
  ScrollController _listController = ScrollController();

  void loadFolders() async {
    try {
      drive.FileList data = await drive.DriveApi(widget.httpClient).files.list(
          orderBy: 'folder,name,modifiedTime',
          spaces: 'drive',
          q: "'${rootFolder.top()}' in parents and trashed = false",
          //(mimeType = 'application/vnd.google-apps.folder')
          $fields: 'files(id,name,parents,mimeType,modifiedTime)');

      setState(() {
        folderList = data.files.toList();
        _listController.jumpTo(0);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    rootFolder.push('root');
    loadFolders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (rootFolder.isEmpty()) {
          return true;
        } else {
          rootFolder.pop();
          loadFolders();

          return false;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Google drive'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: ListView.separated(
                  controller: _listController,
                  itemCount: folderList.length,
                  separatorBuilder: (BuildContext context, int index) {return Divider();},
                  itemBuilder: (BuildContext context, int index) {
                  var f = folderList[index];
                bool isFolder =
                        f.mimeType == 'application/vnd.google-apps.folder';
                    return ListTile(
                      leading: isFolder ? Icon(Icons.folder) : Icon(Icons.remove),
                      title: Text(f.name),
                      subtitle: Text(
                          'Last changes ${DateFormat.yMMMd().format(f.modifiedTime)}'),
                      enabled: isFolder ||
                          f.mimeType == 'application/json' ||
                          f.mimeType == 'text/plain',
                      onTap: () {
                        if (isFolder) {
                          rootFolder.push(f.id);
                          loadFolders();
                        } else {
                          Navigator.of(context).pop(f.id);
                        }
                      },
                    );
                  },
            )),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child:
                      Text(AppLocalizations.of(context).cancel.toUpperCase()),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                RaisedButton(
                  child: Text(AppLocalizations.of(context).choose.toUpperCase(),
                      style: TextStyle(color: Colors.white)),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    Navigator.of(context).pop(rootFolder.top());
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
