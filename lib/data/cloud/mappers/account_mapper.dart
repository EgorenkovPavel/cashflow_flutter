import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money_tracker/data/cloud/models/cloud_account.dart';

import 'cloud_converter.dart';

class AccountMapper extends CloudConverter<CloudAccount> {
  static const String _KEY_TITLE = 'title';
  static const String KEY_UPDATED = 'updated';

  const AccountMapper();

  @override
  Map<String, dynamic> mapToCloud(CloudAccount value) => {
        _KEY_TITLE: value.title,
        KEY_UPDATED: DateTime.now(),
      };

  @override
  CloudAccount mapToDart(QueryDocumentSnapshot<Object?> doc) => CloudAccount(
        id: doc.id,
        title: doc.get(_KEY_TITLE),
      );
}
