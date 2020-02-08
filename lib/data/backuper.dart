
import 'dart:convert';
import 'dart:io';

import 'package:cashflow/data/model.dart';
import 'package:cashflow/pages/drive_dialog.dart';
import 'package:cashflow/utils/google_http_client.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/drive/v3.dart'as drive;
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class Backuper{

  void backup(BuildContext context) async {

    final httpClient = await GoogleHttpClient.getClient();

    if(httpClient == null) return;

    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return DriveDialog(httpClient);
    }));
  }

  void restore(BuildContext context, GoogleHttpClient httpClient, String fileId) async{

      try {
        drive.Media file = await drive.DriveApi(httpClient)
            .files.get(fileId, downloadOptions: drive.DownloadOptions.FullMedia);

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

          await Provider.of<Model>(context, listen: false).deleteAll();
          _loadFromFile(context, saveFile);
        }, onError: (error) {
          print("Some Error");
        });

      } catch (e) {
        print(e);
      }

  }

  void _loadFromFile(BuildContext context, File file){
    Map<String, dynamic> data = jsonDecode(file.readAsStringSync());
    print(data.toString());

    Model model = Provider.of<Model>(context, listen: false);

    data.forEach((String key, dynamic value) async {
      if(key == 'account'){

        List<Map<String, dynamic>> data = [];
        value.forEach((dynamic d) async {
          if (d is Map<String, dynamic>) {
            data.add(d);
          }
        });
        await model.batchInsertAccounts(data);

      }else if(key == 'category'){

        List<Map<String, dynamic>> data = [];
        value.forEach((dynamic d) async {
          if (d is Map<String, dynamic>) {
            data.add(d);
          }
        });
        await model.batchInsertCategories(data);

      }else if(key == 'operation'){

        List<Map<String, dynamic>> data = [];
        value.forEach((dynamic d) async {
          if (d is Map<String, dynamic>) {
            data.add(d);
          }
        });
        await model.batchInsertOperations(data);

      }
    });
  }
}