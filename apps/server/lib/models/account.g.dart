// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
  id: json['id'] as String,
  name: json['name'] as String,
  userId: json['userId'] as String,
  isDebt: json['isDebt'] as bool,
  groupId: json['groupId'] as String,
);

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'isDebt': instance.isDebt,
  'userId': instance.userId,
  'groupId': instance.groupId,
};
