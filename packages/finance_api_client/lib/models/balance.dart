import 'models.dart';

class Balance {
  final int sum;
  final Currency currency;

  Balance({
    required this.sum,
    required this.currency,
  });

  factory Balance.fromJson(Map<String, dynamic> data) => Balance(
        sum: data['sum'],
        currency: Currency.byName(data['currency']),
      );
}
