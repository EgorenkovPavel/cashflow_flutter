// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: json['id'] as String,
  googleId: json['googleId'] as String,
  name: json['name'] as String,
  photo: json['photo'] as String,
  email: json['email'] as String,
  groupId: json['groupId'] as String,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'googleId': instance.googleId,
  'name': instance.name,
  'photo': instance.photo,
  'email': instance.email,
  'groupId': instance.groupId,
};
