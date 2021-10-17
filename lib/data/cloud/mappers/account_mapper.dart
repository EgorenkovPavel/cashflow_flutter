import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money_tracker/data/cloud/models/cloud_account.dart';

import 'cloud_converter.dart';

class AccountMapper extends CloudConverter<CloudAccount> {
  static const String _KEY_TITLE = 'title';
  static const String _KEY_IS_DEBT = 'is_debt';
  static const String KEY_UPDATED = 'updated';

  const AccountMapper();

  @override
  Map<String, dynamic> mapToCloud(CloudAccount value) => {
        _KEY_TITLE: value.title,
        _KEY_IS_DEBT: value.isDebt,
        KEY_UPDATED: DateTime.now(),
      };

  @override
  CloudAccount mapToDart(QueryDocumentSnapshot<Object?> doc) {
    var data = doc.data() as Map<String,dynamic>;

    return CloudAccount(
      id: doc.id,
      title: data.containsKey(_KEY_TITLE) ? doc.get(_KEY_TITLE) : '',
      isDebt: data.containsKey(_KEY_IS_DEBT) ? doc.get(_KEY_IS_DEBT) : false,
    );
  }
}
