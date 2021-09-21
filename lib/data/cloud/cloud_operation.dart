import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money_tracker/data/cloud/cloud_converter.dart';
import 'package:money_tracker/data/database/operation_type_converter.dart';
import 'package:money_tracker/domain/models/operation_type.dart';

class CloudOperation {
  final String id;
  final DateTime date;
  final OperationType operationType;
  final String account;
  final String? category;
  final String? recAccount;
  final int sum;

  CloudOperation(
      {required this.id,
      required this.date,
      required this.operationType,
      required this.account,
      this.category,
      this.recAccount,
      required this.sum});
}

class CloudOperationConverter extends CloudConverter<CloudOperation> {
  static const String _KEY_DATE = 'date';
  static const String _KEY_OPERATION_TYPE = 'operation_type';
  static const String _KEY_ACCOUNT = 'account';
  static const String _KEY_CATEGORY = 'category';
  static const String _KEY_REC_ACCOUNT = 'rec_account';
  static const String _KEY_SUM = 'sum';
  static const String KEY_UPDATED = 'updated';

  const CloudOperationConverter();

  @override
  Map<String, dynamic> mapToCloud(CloudOperation operation) {
    return {
      _KEY_DATE: operation.date,
      _KEY_OPERATION_TYPE:
          const OperationTypeConverter().mapToSql(operation.operationType),
      _KEY_ACCOUNT: operation.account,
      _KEY_CATEGORY: operation.category ?? '',
      _KEY_REC_ACCOUNT: operation.recAccount ?? '',
      _KEY_SUM: operation.sum,
      KEY_UPDATED: DateTime.now().microsecondsSinceEpoch,
    };
  }

  @override
  CloudOperation mapToDart(QueryDocumentSnapshot<Object?> doc) {
    return CloudOperation(
      id: doc.id,
      date: doc.get(_KEY_DATE),
      operationType: const OperationTypeConverter()
          .mapToDart(doc.get(_KEY_OPERATION_TYPE))!,
      account: doc.get(_KEY_ACCOUNT),
      category: doc.get(_KEY_CATEGORY) == '' ? null : doc.get(_KEY_CATEGORY),
      recAccount: doc.get(_KEY_REC_ACCOUNT) == '' ? null : doc.get(_KEY_REC_ACCOUNT),
      sum: doc.get(_KEY_SUM),
    );
  }
}
