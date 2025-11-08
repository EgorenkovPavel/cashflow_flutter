import 'dart:collection';

import 'package:equatable/equatable.dart';
import 'sum.dart';
import '../domain/models/enum/currency.dart';

class Balance extends Equatable {
  final List<Sum> _sums;

  const Balance() : _sums = const [];

  UnmodifiableListView<Sum> get sums => UnmodifiableListView(_sums);

  const Balance.fromSums(this._sums);

  Sum totalInRub(double usdRate, double eurRate) =>
      Sum(toRub(usdRate, eurRate), Currency.RUB);

  Balance operator +(Balance balance) {
    var res = Balance.fromSums(_sums);

    for (var sum in balance._sums) {
      res = res.addSum(sum);
    }

    return res;
  }

  Balance addSum(Sum sum) {
    var items = _sums.toList();
    if (_sums.where((e) => e.currency == sum.currency).isEmpty) {
      items.add(sum);
    } else {
      items = _sums
          .map((e) => e.currency == sum.currency ? e + sum.sum : e)
          .toList();
    }

    return Balance.fromSums(items);
  }

  bool get isEmpty => _sums.isEmpty || _sums.every((e) => e.isEmpty);

  @override
  List<Object?> get props => [_sums];

  int toRub(double usd, double eur) { //TODO delete method
    return _sums.map<int>((e) {
      return switch (e.currency) {
        Currency.RUB => e.sum,
        Currency.USD => (e.sum / usd).floor(),
        Currency.EUR => (e.sum / eur).floor(),
      };
    }).fold<int>(0, (a, b) => a + b);
  }
}