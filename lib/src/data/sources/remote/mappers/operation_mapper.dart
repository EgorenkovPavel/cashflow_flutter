// ignore_for_file: constant_identifier_names, avoid_renaming_method_parameters

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money_tracker/src/data/sources/remote/mappers/cloud_converter.dart';
import 'package:money_tracker/src/data/sources/remote/models/cloud_operation.dart';
import 'package:money_tracker/src/utils/extensions.dart';

class OperationMapper extends CloudConverter<CloudOperation> {
  static const String _KEY_DATE = 'date';
  static const String _KEY_OPERATION_TYPE = 'operation_type';
  static const String _KEY_ACCOUNT = 'account';
  static const String _KEY_CATEGORY = 'category';
  static const String _KEY_REC_ACCOUNT = 'rec_account';
  static const String _KEY_SUM = 'sum';
  static const String KEY_UPDATED = 'updated';
  static const String _KEY_DELETION_MARK = 'deleted';

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
      _KEY_DELETION_MARK: operation.deleted,
    };
  }

  @override
  CloudOperation mapToDart(QueryDocumentSnapshot<Object?> doc) {
    var data = doc.data() as Map<String, dynamic>;

    return CloudOperation(
      id: doc.id,
      date: DateTime.fromMillisecondsSinceEpoch(
        (doc.get(_KEY_DATE) as Timestamp).millisecondsSinceEpoch,
      ),
      operationType: doc.get(_KEY_OPERATION_TYPE),
      account: doc.get(_KEY_ACCOUNT),
      category: doc.get(_KEY_CATEGORY) == '' ? null : doc.get(_KEY_CATEGORY),
      recAccount:
          doc.get(_KEY_REC_ACCOUNT) == '' ? null : doc.get(_KEY_REC_ACCOUNT),
      sum: data.getOrDefault(_KEY_SUM, 0),
      deleted: data.getOrDefault(_KEY_DELETION_MARK, false),
    );
  }

  @override
  Map<String, dynamic> deletionMark() {
    return {_KEY_DELETION_MARK: true};
  }
}
