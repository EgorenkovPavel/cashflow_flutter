import 'package:flutter_test/flutter_test.dart';
import 'package:money_tracker/data/sources/local/data/database.dart';
import 'package:money_tracker/data/sources/local/entities/account_balance_entity.dart';
import 'package:money_tracker/data/sources/local/mappers/account_balance_mapper.dart';
import 'package:money_tracker/domain/models.dart';

void main() {
  late AccountBalanceMapper mapper;

  setUp(() {
    mapper = const AccountBalanceMapper();
  });

  test('should return account with synced = false', () {
    expect(
        AccountBalanceEntity(
            AccountDB(
              id: 1,
              cloudId: '1',
              isDebt: false,
              title: 'title',
              synced: false,
            ),
            1000),
        mapper.mapToSql(AccountBalance(
          id: 1,
          cloudId: '1',
          title: 'title',
          balance: 1000,
        )));
  });
}
