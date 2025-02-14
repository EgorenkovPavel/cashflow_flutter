import 'dart:collection';

import 'package:equatable/equatable.dart';

import '../domain/models/enum/currency.dart';

class Sum extends Equatable {
  final int sum;
  final Currency currency;

  const Sum(this.sum, this.currency);

  Sum operator +(int sum) {
    return Sum(this.sum + sum, this.currency);
  }

  Sum operator *(int sum) {
    return Sum(this.sum * sum, this.currency);
  }

  Sum operator /(int sum) {
    return Sum((this.sum / sum).floor(), this.currency);
  }

  @override
  List<Object?> get props => [sum, currency];

  Sum copyWith({int? sum, Currency? currency})=>Sum(
    sum ?? this.sum,
    currency ?? this.currency,
  );
}

class Balance extends Equatable {
  final List<Sum> _sums;

  const Balance(): _sums = const [];

  UnmodifiableListView<Sum> get sums => UnmodifiableListView(_sums);

  const Balance.fromSums(this._sums);

  bool get isEmpty => _sums.isEmpty;

  Balance operator +(Balance balance) {

    var res = Balance.fromSums(_sums);

    for (var sum in balance._sums) {
      res = res.addSum(sum);
    }

    return res;
  }

  Balance addSum(Sum sum) {

    var items = _sums.toList();
    if (_sums.where((e) => e.currency == sum.currency).isEmpty){
      items.add(sum);
    }else{
      items = _sums.map(
              (e) => e.currency == sum.currency ? e + sum.sum : e)
          .toList();
    }

    return Balance.fromSums(items);
  }

  @override
  List<Object?> get props => [_sums];
}
