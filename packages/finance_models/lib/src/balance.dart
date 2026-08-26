import 'package:freezed_annotation/freezed_annotation.dart';

import 'money.dart';

part 'balance.freezed.dart';
part 'balance.g.dart';

@freezed
abstract class Balance with _$Balance {
  const Balance._();

  const factory Balance([@Default([]) List<Money> sums]) = _Balance;

  factory Balance.fromJson(Map<String, Object?> json) => _$BalanceFromJson(json);

  bool get isEmpty => sums.isEmpty || sums.every((e) => e.isEmpty);

  Balance operator +(Balance balance) {
    var res = Balance(sums);

    for (var sum in balance.sums) {
      res = res.addSum(sum);
    }

    return res;
  }

  Balance addSum(Money sum) {
    var items = sums.toList();
    if (sums.where((e) => e.currency == sum.currency).isEmpty) {
      items.add(sum);
    } else {
      items = sums
          .map((e) => e.currency == sum.currency ? e + sum.sum : e)
          .toList();
    }

    return Balance(items);
  }

  Balance sortByCurrency(){
    final preSum = List.of(sums);
    preSum.sort((a, b) => a.currency.index - b.currency.index);
    return Balance(preSum);
  }
}
