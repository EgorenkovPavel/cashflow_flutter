// ignore_for_file: constant_identifier_names, avoid_renaming_method_parameters

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_models/finance_models.dart';
import 'package:firebase_api_client/src/converters/currency_converter.dart';
import 'package:firebase_api_client/src/converters/operation_type_converter.dart';

import '../extensions.dart';
import '../models/cloud_models.dart';
import 'cloud_converter.dart';

class OperationMapper extends CloudConverter<CloudOperation> {
  static const String _KEY_DATE = 'date';
  static const String _KEY_OPERATION_TYPE = 'operation_type';
  static const String _KEY_ACCOUNT = 'account';
  static const String _KEY_CATEGORY = 'category';
  static const String _KEY_REC_ACCOUNT = 'rec_account';
  static const String _KEY_SUM = 'sum';
  static const String _KEY_REC_SUM = 'rec_sum';
  static const String KEY_UPDATED = 'updated';
  static const String _KEY_DELETION_MARK = 'deleted';
  static const String _KEY_CURRENCY_SENT = 'currency_sent';
  static const String _KEY_CURRENCY_RECEIVED = 'currency_received';

  const OperationMapper();

  @override
  Map<String, dynamic> mapToCloud(CloudOperation operation) {
    return {
      _KEY_DATE: operation.date,
      _KEY_OPERATION_TYPE: const OperationTypeConverter().toCloud(operation.operationType),
      _KEY_ACCOUNT: operation.account,
      _KEY_CATEGORY: operation.category ?? '',
      _KEY_REC_ACCOUNT: operation.recAccount ?? '',
      _KEY_SUM: operation.sum.sum,
      KEY_UPDATED: DateTime.now(),
      _KEY_DELETION_MARK: operation.deleted,
      _KEY_REC_SUM: operation.recSum?.sum ?? 0,
      _KEY_CURRENCY_SENT: const CurrencyConverter().toCloud(
        operation.sum.currency,
      ),
      _KEY_CURRENCY_RECEIVED: const CurrencyConverter().toCloud(
        operation.recSum?.currency ?? Currency.RUB,
      ),
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
      operationType: const OperationTypeConverter().fromCloud(doc.get(_KEY_OPERATION_TYPE)),
      account: doc.get(_KEY_ACCOUNT),
      category: doc.get(_KEY_CATEGORY) == '' ? null : doc.get(_KEY_CATEGORY),
      recAccount: doc.get(_KEY_REC_ACCOUNT) == ''
          ? null
          : doc.get(_KEY_REC_ACCOUNT),
      sum: _getMoney(data, _KEY_SUM, _KEY_CURRENCY_SENT),
      recSum: _getMoney(data, _KEY_REC_SUM, _KEY_CURRENCY_RECEIVED),
      deleted: data.getOrDefault(_KEY_DELETION_MARK, false),
    );
  }

  @override
  Map<String, dynamic> deletionMark() {
    return {_KEY_DELETION_MARK: true};
  }

  Money _getMoney(
    Map<String, dynamic> data,
    String keySum,
    String keyCurrency,
  ) {
    return Money(
      data.getOrDefault(keySum, 0),
      const CurrencyConverter().fromCloud(
        data.getOrDefault(keyCurrency, 'RUB'),
      ),
    );
  }
}
