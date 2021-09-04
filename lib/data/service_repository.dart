
import 'dart:convert';
import 'dart:io';

import 'package:money_tracker/data/database/database.dart';
import 'package:money_tracker/data/google_http_client.dart';
import 'package:path_provider/path_provider.dart';
import 'package:googleapis/drive/v3.dart' as drive;

class ServiceRepository {
  final Database db;

  ServiceRepository(this.db);

  Future deleteAll() => db.deleteAll();

  Future backup(
      GoogleHttpClient httpClient, String catalogId, String fileName) async {
    final directory = await getTemporaryDirectory();
    var localFile = File('${directory.path}/$fileName.txt');
    await localFile.writeAsString(jsonEncode(await db.getDbData()));

    var media = drive.Media(localFile.openRead(), localFile.lengthSync());

    var file = drive.File();
    file.name = fileName;
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

  Future restore(GoogleHttpClient httpClient, String fileId) async {
    try {
      var file = await drive.DriveApi(httpClient).files.get(fileId,
          downloadOptions: drive.DownloadOptions.fullMedia) as drive.Media;

      final directory = await getTemporaryDirectory();
      var saveFile = File('${directory.path}/test.json');

      var dataStore = <int>[];
      file.stream.listen((data) {
        print('DataReceived: ${data.length}');
        dataStore.insertAll(dataStore.length, data);
      }, onDone: () async {
        print('Task Done');
        await saveFile.writeAsBytes(dataStore);
        print('File saved at ${saveFile.path}');

        await deleteAll();

        Map<String, dynamic> data = jsonDecode(saveFile.readAsStringSync());
        print(data.toString());

        await db.loadData(data);
      }, onError: (error) {
        print('Some Error');
      });
    } catch (e) {
      print(e);
    }
  }
}
