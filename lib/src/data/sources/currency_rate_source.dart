import 'dart:convert';

import 'package:http/http.dart' as http;

import '../interfaces/settings_source.dart';
import '../../domain/models.dart';

class CurrencyRateSource {
  final SettingsSource settingsSource;

  CurrencyRateSource({required this.settingsSource});

  Future<double> getUSD() => _getRate(Currency.USD);

  Future<double> getEUR() => _getRate(Currency.EUR);

  Future<double> _getRate(Currency currency) async {
    final rateDate = settingsSource.rateDate;
    final now = DateTime.now();
    if (rateDate != DateTime(now.year, now.month, now.day)){
      await _updateRateFromNetwork();
    }

    return switch (currency){
      Currency.RUB => 1,
      Currency.USD => settingsSource.rateUsd,
      Currency.EUR => settingsSource.rateEur,
    };
  }

  Future<void> _updateRateFromNetwork() async {
    final url = Uri.parse('http://www.cbr-xml-daily.ru/latest.js');
    try {
      final response = await http.get(url);
      final body = jsonDecode(response.body);

      final date = DateTime.fromMillisecondsSinceEpoch(body['timestamp'] * 1000);

      settingsSource.setRateDate(date);
      settingsSource.setRateUsd(body['rates']['USD']);
      settingsSource.setRateEur(body['rates']['EUR']);
    } catch (e, stacktrace) {
      print(stacktrace);
    }
  }
}
