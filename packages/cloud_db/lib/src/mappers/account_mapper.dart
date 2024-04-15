import 'package:cloud_db/src/extensions.dart';

import '../models/account.dart';
import 'cloud_converter.dart';

class AccountMapper extends CloudConverter<Account> {
  static const String _KEY_TITLE = 'title';
  static const String _KEY_IS_DEBT = 'is_debt';
  static const String _KEY_UPDATED = 'updated';
  static const String _KEY_DELETION_MARK = 'deleted';
  static const String _KEY_CURRENCY = 'currency';

  const AccountMapper();

  @override
  Map<String, dynamic> mapToCloud(Account value) => {
        _KEY_TITLE: value.title,
        _KEY_IS_DEBT: value.isDebt,
        _KEY_UPDATED: DateTime.now(),
        _KEY_DELETION_MARK: value.deleted,
        _KEY_CURRENCY: value.currency,
      };

  @override
  Account mapToDart(
    String id,
    Map<String, dynamic> data,
  ) =>
      Account(
        id: id,
        title: data.getOrDefault(_KEY_TITLE, ''),
        isDebt: data.getOrDefault(_KEY_IS_DEBT, false),
        deleted: data.getOrDefault(_KEY_DELETION_MARK, false),
        currency: data.getOrDefault(_KEY_CURRENCY, 'RUB'),
      );

  @override
  Map<String, dynamic> deletionMark() {
    return {_KEY_DELETION_MARK: true};
  }

  @override
  String get keyUpdated => _KEY_UPDATED;
}
