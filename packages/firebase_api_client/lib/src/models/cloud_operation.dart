import 'package:finance_models/finance_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cloud_operation.freezed.dart';

@freezed
abstract class CloudOperation with _$CloudOperation {
  const factory CloudOperation({
    required String id,
    required DateTime date,
    required OperationType operationType,
    required String account,
    String? category,
    String? recAccount,
    required Money sum,
    Money? recSum,
    required bool deleted,
  }) = _CloudOperation;
}
