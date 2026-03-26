// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as String,
      title: json['title'] as String,
      budget: (json['budget'] as num).toInt(),
      budgetType: $enumDecode(_$BudgetTypeEnumMap, json['budgetType']),
      parentId: json['parentId'] as String?,
      groupId: json['groupId'] as String,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'budget': instance.budget,
      'budgetType': _$BudgetTypeEnumMap[instance.budgetType]!,
      'parentId': instance.parentId,
      'groupId': instance.groupId,
    };

const _$BudgetTypeEnumMap = {
  BudgetType.MONTH: 'MONTH',
  BudgetType.YEAR: 'YEAR',
};
