// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountResponse _$AccountResponseFromJson(Map<String, dynamic> json) =>
    AccountResponse(
      id: const UuidValueConverter().fromJson(json['id'] as String),
      title: json['title'] as String,
      userId: const UuidValueConverter().fromJson(json['userId'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$AccountResponseToJson(AccountResponse instance) =>
    <String, dynamic>{
      'id': const UuidValueConverter().toJson(instance.id),
      'title': instance.title,
      'userId': const UuidValueConverter().toJson(instance.userId),
      'runtimeType': instance.$type,
    };

DebtResponse _$DebtResponseFromJson(Map<String, dynamic> json) => DebtResponse(
  id: const UuidValueConverter().fromJson(json['id'] as String),
  title: json['title'] as String,
  userId: const UuidValueConverter().fromJson(json['userId'] as String),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$DebtResponseToJson(DebtResponse instance) =>
    <String, dynamic>{
      'id': const UuidValueConverter().toJson(instance.id),
      'title': instance.title,
      'userId': const UuidValueConverter().toJson(instance.userId),
      'runtimeType': instance.$type,
    };

CreateAccountRequest _$CreateAccountRequestFromJson(
  Map<String, dynamic> json,
) => CreateAccountRequest(
  title: json['title'] as String,
  userId: const UuidValueConverter().fromJson(json['userId'] as String),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$CreateAccountRequestToJson(
  CreateAccountRequest instance,
) => <String, dynamic>{
  'title': instance.title,
  'userId': const UuidValueConverter().toJson(instance.userId),
  'runtimeType': instance.$type,
};

CreateDebtRequest _$CreateDebtRequestFromJson(Map<String, dynamic> json) =>
    CreateDebtRequest(
      title: json['title'] as String,
      userId: const UuidValueConverter().fromJson(json['userId'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$CreateDebtRequestToJson(CreateDebtRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'userId': const UuidValueConverter().toJson(instance.userId),
      'runtimeType': instance.$type,
    };

_UpdateBaseAccountRequest _$UpdateBaseAccountRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateBaseAccountRequest(
  id: const UuidValueConverter().fromJson(json['id'] as String),
  name: json['name'] as String,
);

Map<String, dynamic> _$UpdateBaseAccountRequestToJson(
  _UpdateBaseAccountRequest instance,
) => <String, dynamic>{
  'id': const UuidValueConverter().toJson(instance.id),
  'name': instance.name,
};
