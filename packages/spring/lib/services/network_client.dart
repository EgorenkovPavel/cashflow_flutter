import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../models/models.dart';
import 'package:http/http.dart' as http;

class NetworkClient {
  String _token;
  User? _user;

  NetworkClient(this._token);

  User? get user => _user;

  set token(String token) {
    _token = token;
  }

  Future<bool> connect() async {
    _user = await get<User>('register', (data) => User.fromJson(data));
    return true;
  }

  Uri _url(String path) => Uri.http('192.168.1.135:8080', 'api/$path');

  Map<String, String> get _headers => {"Authorization": "Bearer $_token"};

  Future<T> get<T>(String path, T Function(dynamic) mapper) async {
    if (kDebugMode) {
      print('GET request: ${_url(path)}');
    }

    try {
      final response = await http.get(
        _url(path),
        headers: _headers,
      );
      if (kDebugMode) {
        print('GET response ${response.statusCode}: ${response.body}');
      }
      return mapper(jsonDecode(response.body));
    }catch (e){
      if (kDebugMode) {
        print(e.toString());
      }
      rethrow;
    }
  }

  Future<T> post<T>(String path, dynamic body) async {
    final encodedString = jsonEncode(body, toEncodable: (item) {
      if (item is DateTime) {
        return item.toIso8601String();
      }
      return item;
    });

    if (kDebugMode) {
      print('POST request: ${_url(path)}');
      print('POST body: $encodedString');
    }

    final response = await http.post(
      _url(path),
      headers: _headers
        ..addAll({
          'Content-type': 'application/json',
          'Accept': 'application/json',
        }),
      body: encodedString,
    );

    if (kDebugMode) {
      print('POST response ${response.statusCode}: ${response.body}');
    }

    if (T is int) {
      return response.body as T;
    } else {
      return jsonDecode(response.body) as T;
    }
  }

  Future<T> update<T>({
    required String path,
    required Map<String, dynamic> body,
    required T Function(dynamic) mapper,
  }) async {
    final encodedString = jsonEncode(body, toEncodable: (item) {
      if (item is DateTime) {
        return item.toIso8601String();
      }
      return item;
    });

    if (kDebugMode) {
      print('UPDATE request: ${_url(path)}');
      print('UPDATE body: $encodedString');
    }

    final response = await http.put(
      _url(path),
      headers: _headers
        ..addAll({
          'Content-type': 'application/json',
          'Accept': 'application/json',
        }),
      body: encodedString,
    );

    if (kDebugMode) {
      print('UPDATE response ${response.statusCode}: ${response.body}');
    }

    return mapper(jsonDecode(response.body));
  }

  Future<void> delete<T>(String path) async {
    if (kDebugMode) {
      print('DELETE request: ${_url(path)}');
    }

    final response = await http.delete(
      _url(path),
      headers: _headers,
    );

    if (kDebugMode) {
      print('DELETE response ${response.statusCode}: ${response.body}');
    }
  }
}
