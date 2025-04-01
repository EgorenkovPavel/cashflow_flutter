import 'dart:convert';

import 'package:http/http.dart' as http;

class CurrencyRateSource{

  Future<double> getUSD() => _getRate('USD');

  Future<double> getEUR() => _getRate('EUR');

  Future<double> _getRate(String cur) async {
    final url = Uri.https('www.cbr-xml-daily.ru', 'latest.js');
    try {
      final response = await http.get(url, headers: {'Host': 'www.example.com'});
      final body = jsonDecode(response.body);

      return body['rates'][cur];
    }catch (e, stacktrace){
     print(stacktrace);
     return 1;
    }
  }

}