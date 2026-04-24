import 'package:flutter_test/flutter_test.dart';
import 'package:money_tracker/src/domain/models.dart';

void main(){
  test('Base currency should be RUB', (){
    expect(Currency.RUB, baseCurrency);
  });
}