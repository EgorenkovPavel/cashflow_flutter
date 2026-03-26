import 'package:flutter_test/flutter_test.dart';
import 'package:money_tracker/data/sources/local/data/database.dart';
import 'package:money_tracker/domain/models/account/account.dart';

void main() {
  late AccountMapper mapper;

  setUp(() {
    mapper = const AccountMapper();
  });

  test('should map to sql with syncked = false', () {
    expect(
        AccountDB(
          id: 1,
          title: 'title',
          cloudId: '1',
          isDebt: false,
          synced: false,
        ),
        mapper.mapToSql(Account(
          id: 1,
          title: 'title',
          isDebt: false,
          cloudId: '1',
        )));
  });
}
