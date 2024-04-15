import 'package:freezed_annotation/freezed_annotation.dart';

part 'cloud_operation.freezed.dart';

@freezed
class CloudOperation with _$CloudOperation {
  const factory CloudOperation({
    required String id,
    required DateTime date,
    required int operationType,
    required String account,
    String? category,
    String? recAccount,
    required int sum,
    int? recSum,
    required bool deleted,
  }) = _CloudOperation;
}
