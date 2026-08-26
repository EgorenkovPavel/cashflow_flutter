// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserResponce _$UserResponceFromJson(Map<String, dynamic> json) =>
    _UserResponce(
      id: const UuidValueConverter().fromJson(json['id'] as String),
      googleId: json['googleId'] as String,
      name: json['name'] as String,
      photo: json['photo'] as String,
      email: json['email'] as String,
      groupId: const UuidValueConverter().fromJson(json['groupId'] as String),
    );

Map<String, dynamic> _$UserResponceToJson(_UserResponce instance) =>
    <String, dynamic>{
      'id': const UuidValueConverter().toJson(instance.id),
      'googleId': instance.googleId,
      'name': instance.name,
      'photo': instance.photo,
      'email': instance.email,
      'groupId': const UuidValueConverter().toJson(instance.groupId),
    };
