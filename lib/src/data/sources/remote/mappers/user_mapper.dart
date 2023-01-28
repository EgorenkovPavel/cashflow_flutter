// ignore_for_file: constant_identifier_names, avoid_renaming_method_parameters

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money_tracker/src/data/sources/remote/mappers/cloud_converter.dart';
import 'package:money_tracker/src/domain/models/user.dart';

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
  User mapToDart(QueryDocumentSnapshot<Object?> doc) {
    return User(
      id: doc.id,
      name: doc.get(_KEY_NAME),
      photo: doc.get(_KEY_PHOTO),
    );
  }

  @override
  Map<String, dynamic> deletionMark() {
    return {};
  }

}