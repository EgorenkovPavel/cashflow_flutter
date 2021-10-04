
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money_tracker/data/cloud/mappers/cloud_converter.dart';
import 'package:money_tracker/domain/models/account.dart';

class AccountMapper extends CloudConverter<Account>{

  static const String _KEY_TITLE = 'title';
  static const String KEY_UPDATED = 'updated';

  const AccountMapper();

  @override
  Map<String, dynamic> mapToCloud(Account value) {
    return {
      _KEY_TITLE: value.title,
      KEY_UPDATED: DateTime.now(),
    };
  }

  @override
  Account mapToDart(QueryDocumentSnapshot<Object?> doc) {
    return Account(
      cloudId: doc.id,
      title: doc.get(_KEY_TITLE),
    );
  }
}