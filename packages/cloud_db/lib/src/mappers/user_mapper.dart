// ignore_for_file: constant_identifier_names, avoid_renaming_method_parameters

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user.dart';
import 'cloud_converter.dart';

class UserMapper extends CloudConverter<User>{

  static const String _KEY_NAME = 'name';
  static const String _KEY_PHOTO = 'photo';

  const UserMapper();

  @override
  Map<String, dynamic> mapToCloud(User user) {
    return {
      _KEY_NAME: user.name,
      _KEY_PHOTO: user.photo,
    };
  }

  @override
  User mapToDart(String id, Map<String, dynamic> data) {
    return User(
      id: id,
      name: data[_KEY_NAME],
      photo: data[_KEY_PHOTO],
    );
  }

  @override
  Map<String, dynamic> deletionMark() {
    return {};
  }

  @override
  String get keyUpdated => '';

}