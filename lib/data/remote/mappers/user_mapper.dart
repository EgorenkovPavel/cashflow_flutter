import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money_tracker/data/remote/mappers/cloud_converter.dart';
import 'package:money_tracker/domain/models/user.dart';

class UserMapper extends CloudConverter<User>{

  static const String _KEY_ADMIN = 'isAdmin';
  static const String _KEY_NAME = 'name';
  static const String _KEY_PHOTO = 'photo';

  const UserMapper();

  @override
  Map<String, dynamic> mapToCloud(User user) {
    return {
      _KEY_ADMIN: user.isAdmin,
      _KEY_NAME: user.name,
      _KEY_PHOTO: user.photo,
    };
  }

  @override
  User mapToDart(QueryDocumentSnapshot<Object?> doc) {
    var data = doc.data() as Map<String,dynamic>;

    return User(
      id: doc.id,
      name: doc.get(_KEY_NAME),
      photo: doc.get(_KEY_PHOTO),
      isAdmin: doc.get(_KEY_ADMIN)
    );
  }

}