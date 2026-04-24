import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';


import 'package:money_tracker/src/domain/interactors/account_interactor.dart';
import 'package:money_tracker/src/domain/interfaces/account_repository.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/domain/services/balance_service.dart';

import 'account_interactor_test.mocks.dart';

@GenerateMocks([AccountRepository, BalanceService])
void main() {
  late MockAccountRepository repository;
  late AccountInteractor interactor;

  setUpAll(() {
    provideDummy<BaseAccount>(
      const BaseAccount.account(
        title: 'dummy',
        userId: null,
      ),
    );
  });

  setUp(() {
    repository = MockAccountRepository();
    interactor = AccountInteractor(repository, MockBalanceService());
  });

  group('AccountInteractor.insert', () {

    test('creates Account when isDebt is false', () async {
      when(repository.insert(any)).thenAnswer((_) async => 42);

      final result = await interactor.insert(
        title: 'Cash',
        isDebt: false,
        userId: 7,
      );

      final savedAccount = result.getOrThrow();

      expect(result.isSuccess, isTrue);
      expect(savedAccount, isA<Account>());
      expect(savedAccount.id, 42);
      expect(savedAccount.title, 'Cash');
      expect(savedAccount.userId, 7);
    });

    test('creates Debt when isDebt is true', () async {
      when(repository.insert(any)).thenAnswer((_) async => 99);

      final result = await interactor.insert(
        title: 'Credit card',
        isDebt: true,
        userId: null,
      );

      final savedAccount = result.getOrThrow();

      expect(result.isSuccess, isTrue);
      expect(savedAccount, isA<Debt>());
      expect(savedAccount.id, 99);
      expect(savedAccount.title, 'Credit card');
      expect(savedAccount.userId, isNull);
    });

    test('exception when insert', () async {
      when(repository.insert(any)).thenThrow(Exception());

      final result = await interactor.insert(
        title: 'Credit card',
        isDebt: true,
        userId: null,
      );

      expect(result.isSuccess, isFalse);
    });
  });

  group('getById', (){
    test('success way', () async {
      when(repository.getById(any)).thenAnswer((_) async => BaseAccount.account(id: 42, title: 'test', userId: 34));

      final result = await interactor.getById(42);

      final savedAccount = result.getOrThrow();

      expect(result.isSuccess, isTrue);
      expect(savedAccount, isA<Account>());
      expect(savedAccount.id, 42);
      expect(savedAccount.title, 'test');
      expect(savedAccount.userId, 34);

    });

    test('fail way', () async {
      when(repository.getById(any)).thenThrow(Exception());

      final result = await interactor.getById(42);

      expect(result.isSuccess, isFalse);

    });
  });

  group('update', (){
    test('success way', () async {
      when(repository.update(any)).thenAnswer((_) async => Account(id: 42, title: 'test', userId: 34));

      final result = await interactor.update(account: Account(id: 42, title: 'ppp', userId: 22), title: 'test', userId: 34);

      final savedAccount = result.getOrThrow();

      expect(result.isSuccess, isTrue);
      expect(savedAccount, isA<Account>());
      expect(savedAccount.id, 42);
      expect(savedAccount.title, 'test');
      expect(savedAccount.userId, 34);
    });

    test('fail way', () async {
      when(repository.update(any)).thenThrow(Exception());

      final result = await interactor.update(account: Account(id: 42, title: 'ppp', userId: 22), title: 'test', userId: 34);

      expect(result.isSuccess, isFalse);
    });
  });

}
