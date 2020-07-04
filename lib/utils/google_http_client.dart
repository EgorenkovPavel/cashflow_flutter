
import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleHttpClient extends IOClient {
  Map<String, String> _headers;

  GoogleHttpClient(this._headers) : super();

  static Future<GoogleHttpClient> getClient() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/drive',
      ],
    );

    var googleAccount = await _googleSignIn.signIn();
    if (googleAccount == null) return null;

    final authHeaders = await _googleSignIn.currentUser.authHeaders;

    // custom IOClient from below
    return GoogleHttpClient(authHeaders);
  }

  @override
  Future<IOStreamedResponse> send(BaseRequest request) =>
      super.send(request..headers.addAll(_headers));

  @override
  Future<Response> head(Object url, {Map<String, String> headers}) =>
      super.head(url, headers: headers..addAll(_headers));
}