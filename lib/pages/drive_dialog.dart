import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cashflow/data/stack.dart' as lib;
import 'backup_page.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:path_provider/path_provider.dart';

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
          orderBy: 'name',
          spaces: 'drive',
//          q: "mimeType = 'application/vnd.google-apps.folder' and '${rootFolder.top()}' in parents");
          q: "'${rootFolder.top()}' in parents");

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
        appBar: AppBar(),
        body: Column(
          children: <Widget>[
            Expanded(
                child: ListView(
              children: folderList.map((f) {
                bool isFolder =
                    f.mimeType == 'application/vnd.google-apps.folder';
                return ListTile(
                  leading: isFolder ? Icon(Icons.folder) : Icon(Icons.remove),
                  title: Text(f.name),
                  onTap: () {
                    if(isFolder) {
                      rootFolder.push(f.id);
                      loadFolders();
                    }else{
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
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  child: Text('Choose'),
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
