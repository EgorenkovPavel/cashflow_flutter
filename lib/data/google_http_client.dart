
import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleHttpClient extends IOClient {
  final Map<String, String> _headers;
  final String _userId;

  GoogleHttpClient(this._headers, this._userId) : super();

  String get userId => _userId;

  static Future<GoogleHttpClient?> getClient() async {
    var _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/drive',
      ],
    );

    var googleAccount = await _googleSignIn.signIn();
    if (googleAccount == null) return null;

    final authHeaders = await _googleSignIn.currentUser?.authHeaders;

    if (authHeaders == null) return null;
    // custom IOClient from below
    return GoogleHttpClient(authHeaders, _googleSignIn.currentUser!.id);
  }

  @override
  Future<IOStreamedResponse> send(BaseRequest request) =>
      super.send(request..headers.addAll(_headers));

  @override
  Future<Response> head(Uri url, {Map<String, String>? headers}) =>
      super.head(url, headers: headers?..addAll(_headers));
}