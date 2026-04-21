// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserGroupResponce _$UserGroupResponceFromJson(Map<String, dynamic> json) =>
    _UserGroupResponce(
      id: const UuidValueConverter().fromJson(json['id'] as String),
      name: json['name'] as String,
    );

Map<String, dynamic> _$UserGroupResponceToJson(_UserGroupResponce instance) =>
    <String, dynamic>{
      'id': const UuidValueConverter().toJson(instance.id),
      'name': instance.name,
    };
