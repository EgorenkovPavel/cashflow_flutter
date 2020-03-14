import 'dart:convert';
import 'dart:io';

import 'package:cashflow/data/database.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/google_http_client.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:moor_flutter/moor_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class Backuper {
  void backup(BuildContext context, GoogleHttpClient httpClient,
      String catalogId) async {
    final directory = await getTemporaryDirectory();
    var localFile = new File('${directory.path}/Cashflow backup.txt');
    await localFile.writeAsString(jsonEncode(
        await Provider.of<Repository>(context, listen: false).getDbData()));

    var media = new drive.Media(localFile.openRead(), localFile.lengthSync());

    drive.File file = drive.File();
    file.name = 'Cashflow backup';
    file.parents = [catalogId];
    file.mimeType = 'application/json';

    try {
      var response = await drive.DriveApi(httpClient)
          .files
          .create(file, uploadMedia: media);
      print(response);
    } catch (e) {
      print(e);
    }
  }

  void restore(
      BuildContext context, GoogleHttpClient httpClient, String fileId) async {
    try {
      drive.Media file = await drive.DriveApi(httpClient)
          .files
          .get(fileId, downloadOptions: drive.DownloadOptions.FullMedia);

      final directory = await getTemporaryDirectory();
      var saveFile = new File('${directory.path}/test.json');

      List<int> dataStore = [];
      file.stream.listen((data) {
        print("DataReceived: ${data.length}");
        dataStore.insertAll(dataStore.length, data);
      }, onDone: () async {
        print("Task Done");
        await saveFile.writeAsBytes(dataStore);
        print("File saved at ${saveFile.path}");

        await Provider.of<Repository>(context, listen: false).deleteAll();
        _loadFromFile(context, saveFile);
      }, onError: (error) {
        print("Some Error");
      });
    } catch (e) {
      print(e);
    }
  }

  void _loadFromFile(BuildContext context, File file) {
    Map<String, dynamic> data = jsonDecode(file.readAsStringSync());
    print(data.toString());

    Provider.of<Repository>(context, listen: false).loadData(data);
  }

  void restoreOld(
      BuildContext context, GoogleHttpClient httpClient, String fileId) async {
    try {
      drive.Media file = await drive.DriveApi(httpClient)
          .files
          .get(fileId, downloadOptions: drive.DownloadOptions.FullMedia);

      final directory = await getTemporaryDirectory();
      var saveFile = new File('${directory.path}/test.json');

      List<int> dataStore = [];
      file.stream.listen((data) {
        print("DataReceived: ${data.length}");
        dataStore.insertAll(dataStore.length, data);
      }, onDone: () async {
        print("Task Done");
        await saveFile.writeAsBytes(dataStore);
        print("File saved at ${saveFile.path}");

        await Provider.of<Repository>(context, listen: false).deleteAll();
        _loadFromFileOld(context, saveFile);
      }, onError: (error) {
        print("Some Error");
      });
    } catch (e) {
      print(e);
    }
  }

  void _loadFromFileOld(BuildContext context, File file) {
    Map<String, dynamic> data = jsonDecode(file.readAsStringSync());
    print(data.toString());

    Provider.of<Repository>(context, listen: false).loadOldData(data);
  }
}
