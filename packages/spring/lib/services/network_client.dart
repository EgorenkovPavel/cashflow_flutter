import 'dart:convert';

import '../models/models.dart';
import 'package:http/http.dart' as http;

class NetworkClient{
  String _token;
  User? _user;

  NetworkClient(this._token);

  User? get user => _user;

  set token(String token) {
    _token = token;
  }

  Future<bool> connect() async {
    _user = await get<User>('register');
    return true;
  }

  Future<T> get<T>(String path) async {
    final url = Uri.http('192.168.1.135:8080', 'api/$path');
    final response =
    await http.get(url, headers: {"Authorization": "Bearer $_token"});
    return jsonDecode(response.body);
  }

  Future<T> post<T>(String path, dynamic body) async {
    final url = Uri.http('192.168.1.135:8080', 'api/$path');
    final response = await http.post(url,
        headers: {"Authorization": "Bearer $_token"}, body: jsonEncode(body));
    return jsonDecode(response.body);
  }

  Future<T> update<T>(String path, dynamic body) async {
    final url = Uri.http('192.168.1.135:8080', 'api/$path');
    final response = await http.put(url,
        headers: {"Authorization": "Bearer $_token"}, body: jsonEncode(body));
    return jsonDecode(response.body);
  }

  Future<T> delete<T>(String path, dynamic id) async {
    final url = Uri.http('192.168.1.135:8080', 'api/$path');
    final response = await http.delete(url,
        headers: {"Authorization": "Bearer $_token"},
        body: jsonEncode({'id': id}));
    return jsonDecode(response.body);
  }
}