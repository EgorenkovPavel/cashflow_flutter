import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models.dart';

part 'operation_list_item.freezed.dart';

@freezed
abstract class OperationListItem with _$OperationListItem{
  const factory OperationListItem({
    required Operation operation,
    required String accountTitle,
    required String analyticTitle,
    required User? user,
}) = _OperationListItem;
}