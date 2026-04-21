// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Balance _$BalanceFromJson(Map<String, dynamic> json) => _Balance(
  (json['sums'] as List<dynamic>?)
          ?.map((e) => Money.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$BalanceToJson(_Balance instance) => <String, dynamic>{
  'sums': instance.sums,
};
