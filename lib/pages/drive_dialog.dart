import 'dart:io';

import 'package:cashflow/data/stack.dart' as lib;
import 'package:flutter/material.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import 'backup_page.dart';

class DriveDialog extends StatefulWidget {
  final GoogleHttpClient httpClient;

  const DriveDialog(this.httpClient);

  @override
  _DriveDialogState createState() => _DriveDialogState();
}

class _DriveDialogState extends State<DriveDialog> {
  lib.Stack<String> rootFolder = lib.Stack();
  List<drive.File> folderList = [];

  void loadFolders() async {
    try {
      drive.FileList data = await drive.DriveApi(widget.httpClient).files.list(
          orderBy: 'folder,name,modifiedTime',
          spaces: 'drive',
          q: "'${rootFolder.top()}' in parents and trashed = false", //(mimeType = 'application/vnd.google-apps.folder')
        $fields: 'files(id,name,parents,mimeType,modifiedTime)'
      );

      setState(() {
        folderList = data.files.toList();
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void uploadFile() async {
    final directory = await getTemporaryDirectory();
    var localFile = new File('${directory.path}/test.txt');
    localFile.writeAsString('Test string');

    var media = new drive.Media(localFile.openRead(), localFile.lengthSync());

    drive.File file = drive.File();
    file.name = 'New test file';
    file.parents = [rootFolder.top()];
    file.mimeType = 'application/json';

    try {
      await drive.DriveApi(widget.httpClient)
          .files
          .create(file, uploadMedia: media);
    } catch (e) {
      print(e);
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
                child: ListView(
              padding: EdgeInsets.zero,
              children: folderList.map((f) {

                bool isFolder =
                    f.mimeType == 'application/vnd.google-apps.folder';
                return ListTile(
                  leading: isFolder ? Icon(Icons.folder) : Icon(Icons.remove),
                  title: Text(f.name),
                  subtitle: Text('Last changes ${DateFormat.yMMMd().format(f.modifiedTime)}'),
                  enabled: isFolder || f.mimeType == 'application/json' || f.mimeType == 'text/plain',
                  onTap: () {
                    if (isFolder) {
                      rootFolder.push(f.id);
                      loadFolders();
                    } else {
                      Navigator.of(context).pop(f.id);
                    }
                  },
                );
              }).toList(),
              shrinkWrap: true,
            )),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text('Cancel'.toUpperCase()),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                RaisedButton(
                  child: Text('Choose'.toUpperCase(),
                      style: TextStyle(color: Colors.white)),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    uploadFile();
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