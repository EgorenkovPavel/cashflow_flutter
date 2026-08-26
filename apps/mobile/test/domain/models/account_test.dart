import 'package:flutter_test/flutter_test.dart';
import 'package:money_tracker/src/domain/models.dart';

void main(){
  test('Account should have isDebt false', (){
    expect(false, Account(title: '', userId: null).isDebt);
  });

  test('Debt should have isDebt false', (){
    expect(true, Debt(title: '', userId: null).isDebt);
  });
}