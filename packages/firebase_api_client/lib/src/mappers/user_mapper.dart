// ignore_for_file: constant_identifier_names, avoid_renaming_method_parameters

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/cloud_models.dart';
import 'cloud_converter.dart';

class UserMapper extends CloudConverter<CloudUser>{

  static const String _KEY_NAME = 'name';
  static const String _KEY_PHOTO = 'photo';

  const UserMapper();

  @override
  Map<String, dynamic> mapToCloud(CloudUser user) {
    return {
      _KEY_NAME: user.name,
      _KEY_PHOTO: user.photo,
    };
  }

  @override
  CloudUser mapToDart(QueryDocumentSnapshot<Object?> doc) {
    return CloudUser(
      googleId: doc.id,
      name: doc.get(_KEY_NAME),
      photo: doc.get(_KEY_PHOTO),
    );
  }

  @override
  Map<String, dynamic> deletionMark() {
    return {};
  }

}