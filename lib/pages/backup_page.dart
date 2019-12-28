import 'dart:convert';
import 'dart:io';


import 'package:cashflow/data/database.dart';
import 'package:cashflow/data/model.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:googleapis/drive/v3.dart'as drive;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/io_client.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import 'drive_dialog.dart';

class BackupPage extends StatelessWidget {
  static const routeName = '/backup';

  void _backup(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/drive',
      ],
    );

    var GoogleAccount = await _googleSignIn.signIn();
    if (GoogleAccount == null) return;

    final authHeaders = await _googleSignIn.currentUser.authHeaders;

    // custom IOClient from below
    final httpClient = GoogleHttpClient(authHeaders);

    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return DriveDialog(httpClient);
    }));
//    showDialog(context: context,
//        builder: (context){
//          return BackupDialog(httpClient);
//        });
  }

  void _restore(BuildContext context) async{
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/drive',
      ],
    );

    var GoogleAccount = await _googleSignIn.signIn();
    if (GoogleAccount == null) return;

    final authHeaders = await _googleSignIn.currentUser.authHeaders;

    // custom IOClient from below
    final httpClient = GoogleHttpClient(authHeaders);

    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return DriveDialog(httpClient);
    })).then((fileId) async {

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

    });
  }

  void _loadFromFile(BuildContext context, File file){
    Map<String, dynamic> data = jsonDecode(file.readAsStringSync());
    print(data.toString());

    data.forEach((String key, dynamic value){
      if(key == 'account'){

        value.forEach((dynamic d){
          if(d is Map<String, dynamic>){
            Map<String, dynamic> p = d;
            var account = AccountData(title: p['account_title'], id: int.parse(p['_id']));
            Provider.of<Model>(context).insertAccount(account);
          }
        });

      }else if(key == 'category'){

        value.forEach((dynamic d){
          var converter = OperationTypeConverter();
          if(d is Map<String, dynamic>){
            Map<String, dynamic> p = d;
            var category = CategoryData(
                title: p['category_title'],
                id: int.parse(p['_id']),
                operationType: converter.mapToDart(int.parse(p['category_type'])),
                budget: p['category_budget'] == '' ? 0 : int.parse(p['category_budget'])
            );
            Provider.of<Model>(context).insertCategory(category);
          }
        });

      }else if(key == 'operation'){

        value.forEach((dynamic d){
          var converter = OperationTypeConverter();
          if(d is Map<String, dynamic>){
            Map<String, dynamic> p = d;
            var operation = OperationData(
                id: int.parse(p['_id']),
                date: DateTime.fromMicrosecondsSinceEpoch(int.parse(p['operation_date'])),
                operationType: converter.mapToDart(int.parse(p['operation_type'])),
                account: int.parse(p['operation_account_id']),
                category: int.parse(p['operation_category_id']),
                recAccount: int.parse(p['operation_recipient_account_id']),
                sum: int.parse(p['operation_sum'])
            );
            Provider.of<Model>(context).insertOperation(operation);
          }
        });

      }
    });



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Backup'),
      ),
      body: Column(
        children: <Widget>[
          Text('Google drive'),
          Row(
            children: <Widget>[
              RaisedButton(
                child: Text('BACKUP'),
                onPressed: () => _backup(context),
              ),
              RaisedButton(
                child: Text('RESTORE'),
                onPressed: () => _restore(context),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class GoogleHttpClient extends IOClient {
  Map<String, String> _headers;

  GoogleHttpClient(this._headers) : super();

  @override
  Future<StreamedResponse> send(BaseRequest request) =>
      super.send(request..headers.addAll(_headers));

  @override
  Future<Response> head(Object url, {Map<String, String> headers}) =>
      super.head(url, headers: headers..addAll(_headers));
}

