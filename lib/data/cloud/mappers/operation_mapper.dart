import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money_tracker/data/cloud/mappers/cloud_converter.dart';
import 'package:money_tracker/data/cloud/models/cloud_operation.dart';

class OperationMapper extends CloudConverter<CloudOperation> {
  static const String _KEY_DATE = 'date';
  static const String _KEY_OPERATION_TYPE = 'operation_type';
  static const String _KEY_ACCOUNT = 'account';
  static const String _KEY_CATEGORY = 'category';
  static const String _KEY_REC_ACCOUNT = 'rec_account';
  static const String _KEY_SUM = 'sum';
  static const String KEY_UPDATED = 'updated';

  const OperationMapper();

  @override
  Map<String, dynamic> mapToCloud(CloudOperation operation) {
    return {
      _KEY_DATE: operation.date,
      _KEY_OPERATION_TYPE: operation.operationType,
      _KEY_ACCOUNT: operation.account,
      _KEY_CATEGORY: operation.category ?? '',
      _KEY_REC_ACCOUNT: operation.recAccount ?? '',
      _KEY_SUM: operation.sum,
      KEY_UPDATED: DateTime.now(),
    };
  }

  @override
  CloudOperation mapToDart(QueryDocumentSnapshot<Object?> doc) =>
      CloudOperation(
        id: doc.id,
        date: doc.get(_KEY_DATE),
        operationType: doc.get(_KEY_OPERATION_TYPE),
        account: doc.get(_KEY_ACCOUNT),
        category: doc.get(_KEY_CATEGORY) == '' ? null : doc.get(_KEY_CATEGORY),
        recAccount:
            doc.get(_KEY_REC_ACCOUNT) == '' ? null : doc.get(_KEY_REC_ACCOUNT),
        sum: doc.get(_KEY_SUM),
      );
}
