import 'package:money_tracker/domain/models/operation_type.dart';

class CloudOperation {
  final String id;
  final DateTime date;
  final OperationType operationType;
  final String account;
  final String? category;
  final String? recAccount;
  final int sum;

  CloudOperation({required this.id,
    required this.date,
    required this.operationType,
    required this.account,
    this.category,
    this.recAccount,
    required this.sum});
}
