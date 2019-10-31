import 'package:flutter/material.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:googleapis/storage/v1.dart';
import 'package:google_sign_in/google_sign_in.dart';

class BackupPage extends StatelessWidget {
  static const routeName = '/backup';

  void _backup() async {

//    var id = new auth.ClientId("421798510489-viufkh1aicbk0ikjfqt9dri0s2j3srra.apps.googleusercontent.com", null);
//
//    const _SCOPES = const [StorageApi.DevstorageReadOnlyScope];
//
//    auth.clientViaUserConsent(id, _SCOPES, auth.PromptUserForConsent())

    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/drive',
      ],
    );

//    try {
//      await _googleSignIn.signIn();
//    } catch (error) {
//      print(error);
//    };
    await _googleSignIn.signIn().then((data) {
      data.authHeaders.then((result) {
        var header = {'Authorization': result['Authorization'], 'X-Goog-AuthUser': result['X-Goog-AuthUser']};
//        testingEmail(data.email, header);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('BACKUP'),
            onPressed: () => _backup(),
          ),
          RaisedButton(
            child: Text('RESTORE'),
          )
        ],
      ),
    );
  }
}
