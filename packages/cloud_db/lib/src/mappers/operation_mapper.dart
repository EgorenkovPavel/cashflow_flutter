import 'package:cloud_db/src/extensions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/operation.dart';
import 'cloud_converter.dart';

class OperationMapper extends CloudConverter<Operation> {
  static const String _KEY_DATE = 'date';
  static const String _KEY_OPERATION_TYPE = 'operation_type';
  static const String _KEY_ACCOUNT = 'account';
  static const String _KEY_CATEGORY = 'category';
  static const String _KEY_REC_ACCOUNT = 'rec_account';
  static const String _KEY_SUM = 'sum';
  static const String _KEY_REC_SUM = 'rec_sum';
  static const String _KEY_UPDATED = 'updated';
  static const String _KEY_DELETION_MARK = 'deleted';

  const OperationMapper();

  @override
  Map<String, dynamic> mapToCloud(Operation operation) {
    return {
      _KEY_DATE: operation.date,
      _KEY_OPERATION_TYPE: operation.operationType,
      _KEY_ACCOUNT: operation.account,
      _KEY_CATEGORY: operation.category ?? '',
      _KEY_REC_ACCOUNT: operation.recAccount ?? '',
      _KEY_SUM: operation.sum,
      _KEY_UPDATED: DateTime.now(),
      _KEY_DELETION_MARK: operation.deleted,
      _KEY_REC_SUM: operation.recSum,
    };
  }

  @override
  Operation mapToDart(
    String id,
    final Map<String, dynamic> data,
  ) =>
      Operation(
        id: id,
        date: DateTime.fromMillisecondsSinceEpoch(
          (data[_KEY_DATE] as Timestamp).millisecondsSinceEpoch,
        ),
        operationType: data[_KEY_OPERATION_TYPE],
        account: data[_KEY_ACCOUNT],
        category: data[_KEY_CATEGORY] == '' ? null : data[_KEY_CATEGORY],
        recAccount:
            data[_KEY_REC_ACCOUNT] == '' ? null : data[_KEY_REC_ACCOUNT],
        sum: data.getOrDefault(_KEY_SUM, 0),
        recSum: data.getOrDefault(_KEY_REC_SUM, 0),
        deleted: data.getOrDefault(_KEY_DELETION_MARK, false),
      );

  @override
  Map<String, dynamic> deletionMark() {
    return {_KEY_DELETION_MARK: true};
  }

  @override
  String get keyUpdated => _KEY_UPDATED;
}
