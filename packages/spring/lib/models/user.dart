import 'user_group.dart';

typedef UserId = int;

class User {
  final UserId id;
  final String name;
  final String email;
  final String photo;
  final UserGroupId userGroup;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.photo,
    required this.userGroup,
  });

  factory User.fromJson(Map<String, dynamic> data) => User(
    id: data['id'],
    name: data['name'],
    email: data['email'],
    photo: data['photo'],
    userGroup: data['group'],
  );
}
