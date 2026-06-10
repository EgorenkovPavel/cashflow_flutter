import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
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

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
