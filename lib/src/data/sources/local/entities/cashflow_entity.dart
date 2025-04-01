import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../utils/sum.dart';

part 'cashflow_entity.freezed.dart';

@freezed
class CashflowEntity with _$CashflowEntity{
  const factory CashflowEntity({
    required int categoryId,
    required Sum sum,
  }) = _CashflowEntity;
}