// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryGroupResponse _$CategoryGroupResponseFromJson(
  Map<String, dynamic> json,
) => CategoryGroupResponse(
  id: const UuidValueConverter().fromJson(json['id'] as String),
  type: $enumDecode(_$CategoryTypeEnumMap, json['type']),
  title: json['title'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$CategoryGroupResponseToJson(
  CategoryGroupResponse instance,
) => <String, dynamic>{
  'id': const UuidValueConverter().toJson(instance.id),
  'type': _$CategoryTypeEnumMap[instance.type]!,
  'title': instance.title,
  'runtimeType': instance.$type,
};

const _$CategoryTypeEnumMap = {
  CategoryType.INPUT: 'INPUT',
  CategoryType.OUTPUT: 'OUTPUT',
};

CategoryItemResponse _$CategoryItemResponseFromJson(
  Map<String, dynamic> json,
) => CategoryItemResponse(
  id: const UuidValueConverter().fromJson(json['id'] as String),
  type: $enumDecode(_$CategoryTypeEnumMap, json['type']),
  title: json['title'] as String,
  budget: (json['budget'] as num).toInt(),
  budgetType: $enumDecode(_$BudgetTypeEnumMap, json['budgetType']),
  parentId: _$JsonConverterFromJson<String, UuidValue>(
    json['parentId'],
    const UuidValueConverter().fromJson,
  ),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$CategoryItemResponseToJson(
  CategoryItemResponse instance,
) => <String, dynamic>{
  'id': const UuidValueConverter().toJson(instance.id),
  'type': _$CategoryTypeEnumMap[instance.type]!,
  'title': instance.title,
  'budget': instance.budget,
  'budgetType': _$BudgetTypeEnumMap[instance.budgetType]!,
  'parentId': _$JsonConverterToJson<String, UuidValue>(
    instance.parentId,
    const UuidValueConverter().toJson,
  ),
  'runtimeType': instance.$type,
};

const _$BudgetTypeEnumMap = {
  BudgetType.MONTH: 'MONTH',
  BudgetType.YEAR: 'YEAR',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);

ItemCreateCategoryRequest _$ItemCreateCategoryRequestFromJson(
  Map<String, dynamic> json,
) => ItemCreateCategoryRequest(
  type: $enumDecode(_$CategoryTypeEnumMap, json['type']),
  title: json['title'] as String,
  budget: (json['budget'] as num).toInt(),
  budgetType: $enumDecode(_$BudgetTypeEnumMap, json['budgetType']),
  parentId: _$JsonConverterFromJson<String, UuidValue>(
    json['parentId'],
    const UuidValueConverter().fromJson,
  ),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ItemCreateCategoryRequestToJson(
  ItemCreateCategoryRequest instance,
) => <String, dynamic>{
  'type': _$CategoryTypeEnumMap[instance.type]!,
  'title': instance.title,
  'budget': instance.budget,
  'budgetType': _$BudgetTypeEnumMap[instance.budgetType]!,
  'parentId': _$JsonConverterToJson<String, UuidValue>(
    instance.parentId,
    const UuidValueConverter().toJson,
  ),
  'runtimeType': instance.$type,
};

GroupCreateCategoryRequest _$GroupCreateCategoryRequestFromJson(
  Map<String, dynamic> json,
) => GroupCreateCategoryRequest(
  type: $enumDecode(_$CategoryTypeEnumMap, json['type']),
  title: json['title'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$GroupCreateCategoryRequestToJson(
  GroupCreateCategoryRequest instance,
) => <String, dynamic>{
  'type': _$CategoryTypeEnumMap[instance.type]!,
  'title': instance.title,
  'runtimeType': instance.$type,
};

ItemUpdateCategoryRequest _$ItemUpdateCategoryRequestFromJson(
  Map<String, dynamic> json,
) => ItemUpdateCategoryRequest(
  id: const UuidValueConverter().fromJson(json['id'] as String),
  title: json['title'] as String,
  budget: (json['budget'] as num).toInt(),
  budgetType: $enumDecode(_$BudgetTypeEnumMap, json['budgetType']),
  parentId: _$JsonConverterFromJson<String, UuidValue>(
    json['parentId'],
    const UuidValueConverter().fromJson,
  ),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ItemUpdateCategoryRequestToJson(
  ItemUpdateCategoryRequest instance,
) => <String, dynamic>{
  'id': const UuidValueConverter().toJson(instance.id),
  'title': instance.title,
  'budget': instance.budget,
  'budgetType': _$BudgetTypeEnumMap[instance.budgetType]!,
  'parentId': _$JsonConverterToJson<String, UuidValue>(
    instance.parentId,
    const UuidValueConverter().toJson,
  ),
  'runtimeType': instance.$type,
};

GroupUpdateCategoryRequest _$GroupUpdateCategoryRequestFromJson(
  Map<String, dynamic> json,
) => GroupUpdateCategoryRequest(
  id: const UuidValueConverter().fromJson(json['id'] as String),
  title: json['title'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$GroupUpdateCategoryRequestToJson(
  GroupUpdateCategoryRequest instance,
) => <String, dynamic>{
  'id': const UuidValueConverter().toJson(instance.id),
  'title': instance.title,
  'runtimeType': instance.$type,
};
