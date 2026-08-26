import 'package:drift_postgres/drift_postgres.dart';
import 'package:dto_models/dto_models.dart';

part 'user.g.dart';

class User {

  User({
    required this.id,
    required this.googleId,
    required this.name,
    required this.photo,
    required this.email,
    required this.groupId,
  });

  final String id;
  final String googleId;
  final String name;
  final String photo;
  final String email;
  final String groupId;

  UserResponce toResponce() =>
      UserResponce(id: UuidValue.fromString(id),
          googleId: googleId,
          name: name,
          photo: photo,
          email: email,
          groupId: UuidValue.fromString(groupId));

}
