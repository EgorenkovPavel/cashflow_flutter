import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models.dart';

part 'cashflow_entity.freezed.dart';

@freezed
abstract class CashflowEntity with _$CashflowEntity{
  const factory CashflowEntity({
    required int categoryId,
    required Sum sum,
  }) = _CashflowEntity;
}