import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:googleapis/drive/v3.dart' as drive;
import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:money_tracker/domain/models/google_drive_file.dart';
import 'package:path_provider/path_provider.dart';

class DriveRepository {
  AuthClient? _client;

  DriveRepository();

  void logIn(AuthClient client){
    _client = client;
  }

  void logOut(){
    _client = null;
  }

  Future<void> backup(Map<String, List<Map<String, dynamic>>> data,
      String catalogId, String fileName) async {

    if(_client == null){
      return Future.value();
    }

    final directory = await getTemporaryDirectory();
    var localFile = File('${directory.path}/$fileName.txt');
    await localFile.writeAsString(jsonEncode(data));

    var media = drive.Media(localFile.openRead(), localFile.lengthSync());

    var file = drive.File();
    file.name = fileName;
    file.parents = [catalogId];
    file.mimeType = 'application/json';

    try {
      var response =
          await drive.DriveApi(_client!).files.create(file, uploadMedia: media);
      print(response);
    } catch (e) {
      print(e);
    }
  }

  Future<Map<String, dynamic>?> restore(String fileId) async {

    if(_client == null){
      return null;
    }

    try {
      var file = await drive.DriveApi(_client!).files.get(fileId,
          downloadOptions: drive.DownloadOptions.fullMedia) as drive.Media;

      final directory = await getTemporaryDirectory();
      var saveFile = File('${directory.path}/test.json');

      var dataStore = <int>[];
      await for (var data in file.stream){
        print('DataReceived: ${data.length}');
        dataStore.insertAll(dataStore.length, data);
      }

      print('Task Done');
      await saveFile.writeAsBytes(dataStore);
      print('File saved at ${saveFile.path}');

      return jsonDecode(saveFile.readAsStringSync());
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<DriveFile>> getFiles(String catalogId) async {

    if(_client == null){
      return Future.value([]);
    }

    var data = await drive.DriveApi(_client!).files.list(
        orderBy: 'folder,name,modifiedTime',
        spaces: 'drive',
        q: "'$catalogId' in parents and trashed = false", //only double ""
        //(mimeType = 'application/vnd.google-apps.folder')
        $fields: 'files(id,name,parents,mimeType,modifiedTime)');

    return data.files!
        .map((f) => DriveFile(
      title: f.name!,
      id: f.id!,
      isFolder:
      f.mimeType == 'application/vnd.google-apps.folder',
      lastChanges: f.modifiedTime!,
      enabled:
      f.mimeType == 'application/vnd.google-apps.folder' ||
          f.mimeType == 'application/json' ||
          f.mimeType == 'text/plain',
    ))
        .toList();
  }
}

