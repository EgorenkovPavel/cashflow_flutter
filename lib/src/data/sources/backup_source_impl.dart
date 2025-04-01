import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import '../../domain/models/google_drive_file.dart';
import '../interfaces/backup_source.dart';

class GoogleDrive extends BackupSource {
  final http.Client _client;

  GoogleDrive(this._client);

  @override
  Future<void> backup(
    Map<String, List<Map<String, dynamic>>> data,
    String catalogId,
    String fileName,
  ) async {
    final directory = await getTemporaryDirectory();
    var localFile = File('${directory.path}/$fileName.txt');
    await localFile.writeAsString(jsonEncode(data));

    var media = drive.Media(localFile.openRead(), localFile.lengthSync());

    var file = drive.File();
    file.name = fileName;
    file.parents = [catalogId];
    file.mimeType = 'application/json';

    await drive.DriveApi(_client).files.create(file, uploadMedia: media);
  }

  @override
  Future<Map<String, dynamic>> restore(String fileId) async {
      var file = await drive.DriveApi(_client).files.get(
            fileId,
            downloadOptions: drive.DownloadOptions.fullMedia,
          ) as drive.Media;

      final directory = await getTemporaryDirectory();
      var saveFile = File('${directory.path}/test.json');

      var dataStore = <int>[];
      await for (var data in file.stream) {
        debugPrint('DataReceived: ${data.length}');
        dataStore.insertAll(dataStore.length, data);
      }

      debugPrint('Task Done');

      await saveFile.writeAsBytes(dataStore);

      debugPrint('File saved at ${saveFile.path}');

      return jsonDecode(saveFile.readAsStringSync());
  }

  @override
  Future<List<DriveFile>> getFiles(String catalogId) async {
    var data = await drive.DriveApi(_client).files.list(
          orderBy: 'folder,name,modifiedTime',
          spaces: 'drive',
          q: "'$catalogId' in parents and trashed = false", //only double ""
          //(mimeType = 'application/vnd.google-apps.folder')
          $fields: 'files(id,name,parents,mimeType,modifiedTime)',
        );

    return data.files!
        .map((f) => DriveFile(
              title: f.name!,
              id: f.id!,
              isFolder: f.mimeType == 'application/vnd.google-apps.folder',
              lastChanges: f.modifiedTime!,
              enabled: f.mimeType == 'application/vnd.google-apps.folder' ||
                  f.mimeType == 'application/json' ||
                  f.mimeType == 'text/plain',
            ))
        .toList();
  }
}
