import 'dart:convert';
import 'dart:io';

import 'package:cashflow/data/database.dart';
import 'package:cashflow/data/model.dart';
import 'package:cashflow/data/operation_type.dart';
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
    await localFile.writeAsString(jsonEncode(await getDbData(context)));

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

  Future<Map<String, List<Map<String, dynamic>>>> getDbData(
      BuildContext context) async {
    Model model = Provider.of<Model>(context, listen: false);

    Map<String, List<Map<String, dynamic>>> data = {};

    List<AccountData> accounts = await model.getAllAccounts();
    List<CategoryData> categories = await model.getAllCategories();
    List<OperationData> operations = await model.getAllOperations();

    data.putIfAbsent('account', () => accounts.map((p) => p.toJson(serializer: _DefaultValueSerializer())).toList());

    data.putIfAbsent(
        'category', () => categories.map((p) => p.toJson(serializer: _DefaultValueSerializer())).toList());

    data.putIfAbsent(
        'operation', () => operations.map((p) => p.toJson(serializer: _DefaultValueSerializer())).toList());

    return data;
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

        await Provider.of<Model>(context, listen: false).deleteAll();
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

    Model model = Provider.of<Model>(context, listen: false);

    data.forEach((String key, dynamic value) async {
      if (key == 'account') {
        List<AccountData> accounts = [];
        value.forEach((dynamic d) async {
          if (d is Map<String, dynamic>) {
            accounts.add(AccountData.fromJson(d, serializer: _DefaultValueSerializer()));
          }
        });
        await model.batchInsertAccounts(accounts);
      } else if (key == 'category') {
        List<CategoryData> categories = [];
        value.forEach((dynamic d) async {
          if (d is Map<String, dynamic>) {
            categories.add(CategoryData.fromJson(d, serializer: _DefaultValueSerializer()));
          }
        });
        await model.batchInsertCategories(categories);
      } else if (key == 'operation') {
        List<OperationData> operations = [];
        value.forEach((dynamic d) async {
          if (d is Map<String, dynamic>) {
            operations.add(OperationData.fromJson(d, serializer: _DefaultValueSerializer()));
          }
        });
        await model.batchInsertOperations(operations);
      }
    });
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

        await Provider.of<Model>(context, listen: false).deleteAll();
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

    var converter = OperationTypeConverter();
    Model model = Provider.of<Model>(context, listen: false);

    data.forEach((String key, dynamic value) async {
      if (key == 'account') {
        List<AccountData> accounts = [];
        value.forEach((dynamic d) async {
          if (d is Map<String, dynamic>) {
            accounts.add(AccountData(
              id: int.parse(d['_id']),
              title: d['account_title'],
              archive: false,
            ));
          }
        });
        await model.batchInsertAccounts(accounts);
      } else if (key == 'category') {
        List<CategoryData> categories = [];
        value.forEach((dynamic d) async {
          if (d is Map<String, dynamic>) {
            categories.add(CategoryData(
              id: int.parse(d['_id']),
              title: d['category_title'],
              operationType: converter.mapToDart(int.parse(d['category_type'])),
              archive: false,
            ));
          }
        });
        await model.batchInsertCategories(categories);
      } else if (key == 'operation') {
        List<OperationData> operations = [];
        value.forEach((dynamic d) async {
          if (d is Map<String, dynamic>) {
            operations.add(OperationData(
              id: int.parse(d['_id']),
              date: DateTime.fromMillisecondsSinceEpoch(
                  int.parse(d['operation_date'])),
              operationType:
                  converter.mapToDart(int.parse(d['operation_type'])),
              account: int.parse(d['operation_account_id']),
              category: _getId(d['operation_category_id']),
              recAccount: _getId(d['operation_recipient_account_id']),
              sum: int.parse(d['operation_sum']),
            ));
          }
        });
        await model.batchInsertOperations(operations);
      }
    });
  }

  int _getId(String id) {
    if (id.isEmpty) {
      return null;
    } else {
      return int.parse(id);
    }
  }
}

class _DefaultValueSerializer extends ValueSerializer {
  const _DefaultValueSerializer();
  final _converter = const OperationTypeConverter();

  @override
  T fromJson<T>(dynamic json) {
    if (T == DateTime) {
      if (json == null) {
        return null;
      } else {
        return DateTime.fromMillisecondsSinceEpoch(json as int) as T;
      }
    }else if(T == OperationType){
      return _converter.mapToDart(json as int) as T;
    }

    return json as T;
  }

  @override
  dynamic toJson<T>(T value) {
    if (value is DateTime) {
      return value.millisecondsSinceEpoch;
    }else if (value is OperationType){
      return _converter.mapToSql(value);
    }

    return value;
  }
}