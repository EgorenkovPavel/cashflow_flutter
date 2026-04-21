// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InputOperationResponse _$InputOperationResponseFromJson(
  Map<String, dynamic> json,
) => InputOperationResponse(
  id: const UuidValueConverter().fromJson(json['id'] as String),
  deleted: json['deleted'] as bool? ?? false,
  date: DateTime.parse(json['date'] as String),
  account: const UuidValueConverter().fromJson(json['account'] as String),
  category: const UuidValueConverter().fromJson(json['category'] as String),
  sum: Money.fromJson(json['sum'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$InputOperationResponseToJson(
  InputOperationResponse instance,
) => <String, dynamic>{
  'id': const UuidValueConverter().toJson(instance.id),
  'deleted': instance.deleted,
  'date': instance.date.toIso8601String(),
  'account': const UuidValueConverter().toJson(instance.account),
  'category': const UuidValueConverter().toJson(instance.category),
  'sum': instance.sum,
  'runtimeType': instance.$type,
};

OutputOperationResponse _$OutputOperationResponseFromJson(
  Map<String, dynamic> json,
) => OutputOperationResponse(
  id: const UuidValueConverter().fromJson(json['id'] as String),
  deleted: json['deleted'] as bool? ?? false,
  date: DateTime.parse(json['date'] as String),
  account: const UuidValueConverter().fromJson(json['account'] as String),
  category: const UuidValueConverter().fromJson(json['category'] as String),
  sum: Money.fromJson(json['sum'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$OutputOperationResponseToJson(
  OutputOperationResponse instance,
) => <String, dynamic>{
  'id': const UuidValueConverter().toJson(instance.id),
  'deleted': instance.deleted,
  'date': instance.date.toIso8601String(),
  'account': const UuidValueConverter().toJson(instance.account),
  'category': const UuidValueConverter().toJson(instance.category),
  'sum': instance.sum,
  'runtimeType': instance.$type,
};

TransferOperationResponse _$TransferOperationResponseFromJson(
  Map<String, dynamic> json,
) => TransferOperationResponse(
  id: const UuidValueConverter().fromJson(json['id'] as String),
  deleted: json['deleted'] as bool? ?? false,
  date: DateTime.parse(json['date'] as String),
  account: const UuidValueConverter().fromJson(json['account'] as String),
  recAccount: const UuidValueConverter().fromJson(json['recAccount'] as String),
  sum: Money.fromJson(json['sum'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$TransferOperationResponseToJson(
  TransferOperationResponse instance,
) => <String, dynamic>{
  'id': const UuidValueConverter().toJson(instance.id),
  'deleted': instance.deleted,
  'date': instance.date.toIso8601String(),
  'account': const UuidValueConverter().toJson(instance.account),
  'recAccount': const UuidValueConverter().toJson(instance.recAccount),
  'sum': instance.sum,
  'runtimeType': instance.$type,
};

ExchangeOperationResponse _$ExchangeOperationResponseFromJson(
  Map<String, dynamic> json,
) => ExchangeOperationResponse(
  id: const UuidValueConverter().fromJson(json['id'] as String),
  deleted: json['deleted'] as bool? ?? false,
  date: DateTime.parse(json['date'] as String),
  account: const UuidValueConverter().fromJson(json['account'] as String),
  sum: Money.fromJson(json['sum'] as Map<String, dynamic>),
  recSum: Money.fromJson(json['recSum'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ExchangeOperationResponseToJson(
  ExchangeOperationResponse instance,
) => <String, dynamic>{
  'id': const UuidValueConverter().toJson(instance.id),
  'deleted': instance.deleted,
  'date': instance.date.toIso8601String(),
  'account': const UuidValueConverter().toJson(instance.account),
  'sum': instance.sum,
  'recSum': instance.recSum,
  'runtimeType': instance.$type,
};

InputCreateOperationRequest _$InputCreateOperationRequestFromJson(
  Map<String, dynamic> json,
) => InputCreateOperationRequest(
  date: DateTime.parse(json['date'] as String),
  account: const UuidValueConverter().fromJson(json['account'] as String),
  category: const UuidValueConverter().fromJson(json['category'] as String),
  sum: Money.fromJson(json['sum'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$InputCreateOperationRequestToJson(
  InputCreateOperationRequest instance,
) => <String, dynamic>{
  'date': instance.date.toIso8601String(),
  'account': const UuidValueConverter().toJson(instance.account),
  'category': const UuidValueConverter().toJson(instance.category),
  'sum': instance.sum,
  'runtimeType': instance.$type,
};

OutputCreateOperationRequest _$OutputCreateOperationRequestFromJson(
  Map<String, dynamic> json,
) => OutputCreateOperationRequest(
  date: DateTime.parse(json['date'] as String),
  account: const UuidValueConverter().fromJson(json['account'] as String),
  category: const UuidValueConverter().fromJson(json['category'] as String),
  sum: Money.fromJson(json['sum'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$OutputCreateOperationRequestToJson(
  OutputCreateOperationRequest instance,
) => <String, dynamic>{
  'date': instance.date.toIso8601String(),
  'account': const UuidValueConverter().toJson(instance.account),
  'category': const UuidValueConverter().toJson(instance.category),
  'sum': instance.sum,
  'runtimeType': instance.$type,
};

TransferCreateOperationRequest _$TransferCreateOperationRequestFromJson(
  Map<String, dynamic> json,
) => TransferCreateOperationRequest(
  date: DateTime.parse(json['date'] as String),
  account: const UuidValueConverter().fromJson(json['account'] as String),
  recAccount: const UuidValueConverter().fromJson(json['recAccount'] as String),
  sum: Money.fromJson(json['sum'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$TransferCreateOperationRequestToJson(
  TransferCreateOperationRequest instance,
) => <String, dynamic>{
  'date': instance.date.toIso8601String(),
  'account': const UuidValueConverter().toJson(instance.account),
  'recAccount': const UuidValueConverter().toJson(instance.recAccount),
  'sum': instance.sum,
  'runtimeType': instance.$type,
};

ExchangeCreateOperationRequest _$ExchangeCreateOperationRequestFromJson(
  Map<String, dynamic> json,
) => ExchangeCreateOperationRequest(
  date: DateTime.parse(json['date'] as String),
  account: const UuidValueConverter().fromJson(json['account'] as String),
  sum: Money.fromJson(json['sum'] as Map<String, dynamic>),
  recSum: Money.fromJson(json['recSum'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ExchangeCreateOperationRequestToJson(
  ExchangeCreateOperationRequest instance,
) => <String, dynamic>{
  'date': instance.date.toIso8601String(),
  'account': const UuidValueConverter().toJson(instance.account),
  'sum': instance.sum,
  'recSum': instance.recSum,
  'runtimeType': instance.$type,
};

InputUpdateOperationRequest _$InputUpdateOperationRequestFromJson(
  Map<String, dynamic> json,
) => InputUpdateOperationRequest(
  id: const UuidValueConverter().fromJson(json['id'] as String),
  deleted: json['deleted'] as bool? ?? false,
  date: DateTime.parse(json['date'] as String),
  account: const UuidValueConverter().fromJson(json['account'] as String),
  category: const UuidValueConverter().fromJson(json['category'] as String),
  sum: Money.fromJson(json['sum'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$InputUpdateOperationRequestToJson(
  InputUpdateOperationRequest instance,
) => <String, dynamic>{
  'id': const UuidValueConverter().toJson(instance.id),
  'deleted': instance.deleted,
  'date': instance.date.toIso8601String(),
  'account': const UuidValueConverter().toJson(instance.account),
  'category': const UuidValueConverter().toJson(instance.category),
  'sum': instance.sum,
  'runtimeType': instance.$type,
};

OutputUpdateOperationRequest _$OutputUpdateOperationRequestFromJson(
  Map<String, dynamic> json,
) => OutputUpdateOperationRequest(
  id: const UuidValueConverter().fromJson(json['id'] as String),
  deleted: json['deleted'] as bool? ?? false,
  date: DateTime.parse(json['date'] as String),
  account: const UuidValueConverter().fromJson(json['account'] as String),
  category: const UuidValueConverter().fromJson(json['category'] as String),
  sum: Money.fromJson(json['sum'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$OutputUpdateOperationRequestToJson(
  OutputUpdateOperationRequest instance,
) => <String, dynamic>{
  'id': const UuidValueConverter().toJson(instance.id),
  'deleted': instance.deleted,
  'date': instance.date.toIso8601String(),
  'account': const UuidValueConverter().toJson(instance.account),
  'category': const UuidValueConverter().toJson(instance.category),
  'sum': instance.sum,
  'runtimeType': instance.$type,
};

TransferUpdateOperationRequest _$TransferUpdateOperationRequestFromJson(
  Map<String, dynamic> json,
) => TransferUpdateOperationRequest(
  id: const UuidValueConverter().fromJson(json['id'] as String),
  deleted: json['deleted'] as bool? ?? false,
  date: DateTime.parse(json['date'] as String),
  account: const UuidValueConverter().fromJson(json['account'] as String),
  recAccount: const UuidValueConverter().fromJson(json['recAccount'] as String),
  sum: Money.fromJson(json['sum'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$TransferUpdateOperationRequestToJson(
  TransferUpdateOperationRequest instance,
) => <String, dynamic>{
  'id': const UuidValueConverter().toJson(instance.id),
  'deleted': instance.deleted,
  'date': instance.date.toIso8601String(),
  'account': const UuidValueConverter().toJson(instance.account),
  'recAccount': const UuidValueConverter().toJson(instance.recAccount),
  'sum': instance.sum,
  'runtimeType': instance.$type,
};

ExchangeUpdateOperationRequest _$ExchangeUpdateOperationRequestFromJson(
  Map<String, dynamic> json,
) => ExchangeUpdateOperationRequest(
  id: const UuidValueConverter().fromJson(json['id'] as String),
  deleted: json['deleted'] as bool? ?? false,
  date: DateTime.parse(json['date'] as String),
  account: const UuidValueConverter().fromJson(json['account'] as String),
  sum: Money.fromJson(json['sum'] as Map<String, dynamic>),
  recSum: Money.fromJson(json['recSum'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ExchangeUpdateOperationRequestToJson(
  ExchangeUpdateOperationRequest instance,
) => <String, dynamic>{
  'id': const UuidValueConverter().toJson(instance.id),
  'deleted': instance.deleted,
  'date': instance.date.toIso8601String(),
  'account': const UuidValueConverter().toJson(instance.account),
  'sum': instance.sum,
  'recSum': instance.recSum,
  'runtimeType': instance.$type,
};
