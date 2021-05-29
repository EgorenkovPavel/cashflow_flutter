import 'package:cashflow/data/stack.dart' as lib;
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/utils/google_http_client.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:intl/intl.dart';

enum DialogMode { CHOOSE_FILE, CHOOSE_FOLDER }

class DriveDialog extends StatefulWidget {
  final GoogleHttpClient httpClient;
  final DialogMode mode;

  const DriveDialog({required this.httpClient, required this.mode});

  static Future<DriveFile> chooseFile(
      BuildContext context, GoogleHttpClient httpClient) async {
    return await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            DriveDialog(httpClient: httpClient, mode: DialogMode.CHOOSE_FILE)));
  }

  static Future<DriveFile> chooseFolder(
      BuildContext context, GoogleHttpClient httpClient) async {
    return await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DriveDialog(
            httpClient: httpClient, mode: DialogMode.CHOOSE_FOLDER)));
  }

  @override
  _DriveDialogState createState() => _DriveDialogState();
}

class _DriveDialogState extends State<DriveDialog> {
  lib.Stack<DriveFile> rootFolder = lib.Stack();
  List<drive.File> folderList = [];
  final ScrollController _listController = ScrollController();

  void loadFolders() async {
    try {
      var data = await drive.DriveApi(widget.httpClient).files.list(
          orderBy: 'folder,name,modifiedTime',
          spaces: 'drive',
          q: "'${rootFolder.top().id}' in parents and trashed = false",
          //(mimeType = 'application/vnd.google-apps.folder')
          $fields: 'files(id,name,parents,mimeType,modifiedTime)');

      setState(() {
        folderList = data.files!.toList();
        _listController.jumpTo(0);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    rootFolder.push(DriveFile(id: 'root', title: 'root', isFolder: true));
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
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
              itemBuilder: (BuildContext context, int index) {
                var f = folderList[index];
                var isFolder =
                    f.mimeType == 'application/vnd.google-apps.folder';
                return ListTile(
                  leading: isFolder ? Icon(Icons.folder) : Icon(Icons.remove),
                  title: Text(f.name!),
                  subtitle: Text(
                      'Last changes ${DateFormat.yMMMd().format(f.modifiedTime!)}'),
                  enabled: isFolder ||
                      f.mimeType == 'application/json' ||
                      f.mimeType == 'text/plain',
                  onTap: () {
                    if (isFolder) {
                      rootFolder.push(DriveFile(
                          id: f.id!, title: f.name!, isFolder: isFolder));
                      loadFolders();
                    } else if (widget.mode == DialogMode.CHOOSE_FILE) {
                      Navigator.of(context).pop<DriveFile>(
                          DriveFile(id: f.id!, title: f.name!, isFolder: false));
                    }
                  },
                );
              },
            )),
            ButtonBar(
              children: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child:
                      Text(AppLocalizations.of(context).cancel.toUpperCase()),
                ),
                ElevatedButton(
                  //style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
                  onPressed: () {
                    if (widget.mode == DialogMode.CHOOSE_FOLDER) {
                      Navigator.of(context).pop<DriveFile>(rootFolder.top());
                    }
                  },
                  child: Text(AppLocalizations.of(context).choose.toUpperCase(),
                      style: TextStyle(color: Colors.white)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DriveFile {
  final String title;
  final String id;
  final bool isFolder;

  DriveFile({required this.title, required this.id, required this.isFolder});
}
