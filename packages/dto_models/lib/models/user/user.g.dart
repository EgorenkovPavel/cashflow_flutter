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
      userGroup: const UuidValueConverter().fromJson(
        json['userGroup'] as String,
      ),
    );

Map<String, dynamic> _$UserResponceToJson(_UserResponce instance) =>
    <String, dynamic>{
      'id': const UuidValueConverter().toJson(instance.id),
      'googleId': instance.googleId,
      'name': instance.name,
      'photo': instance.photo,
      'userGroup': const UuidValueConverter().toJson(instance.userGroup),
    };
