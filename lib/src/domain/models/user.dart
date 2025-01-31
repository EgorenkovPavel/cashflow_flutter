import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String name,
    required String photo,
    required String idToken,
  }) = _User;

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        photo: json['photo'],
        idToken: '',
      );

  static Map<String, dynamic> toJson(User user) => {
        'id': user.id,
        'name': user.name,
        'photo': user.photo,
      };
}
