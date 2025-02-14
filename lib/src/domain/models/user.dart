import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    @Default(0) int id,
    required String googleId,
    required String name,
    required String photo,
  }) = _User;

  static User fromJson(Map<String, dynamic> json) => User(
        googleId: json['id'],
        name: json['name'],
        photo: json['photo'],
      );

  static Map<String, dynamic> toJson(User user) => {
        'id': user.googleId,
        'name': user.name,
        'photo': user.photo,
      };

}
