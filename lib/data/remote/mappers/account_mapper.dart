import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money_tracker/data/remote/models/cloud_account.dart';
import 'package:money_tracker/utils/extensions.dart';

import 'cloud_converter.dart';

class AccountMapper extends CloudConverter<CloudAccount> {
  static const String _KEY_TITLE = 'title';
  static const String _KEY_IS_DEBT = 'is_debt';
  static const String KEY_UPDATED = 'updated';
  static const String _KEY_DELETION_MARK = 'deleted';

  const AccountMapper();

  @override
  Map<String, dynamic> mapToCloud(CloudAccount value) => {
        _KEY_TITLE: value.title,
        _KEY_IS_DEBT: value.isDebt,
        KEY_UPDATED: DateTime.now(),
        _KEY_DELETION_MARK: value.deleted,
      };

  @override
  CloudAccount mapToDart(QueryDocumentSnapshot<Object?> doc) {
    var data = doc.data() as Map<String, dynamic>;

    return CloudAccount(
      id: doc.id,
      title: data.getOrDefault(_KEY_TITLE, ''),
      isDebt: data.getOrDefault(_KEY_IS_DEBT, false),
      deleted: data.getOrDefault(_KEY_DELETION_MARK, false),
    );
  }
}
