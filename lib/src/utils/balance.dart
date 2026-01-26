import 'package:freezed_annotation/freezed_annotation.dart';

import 'sum.dart';

part 'balance.freezed.dart';

@freezed
abstract class Balance with _$Balance {
  const Balance._();

  const factory Balance([@Default([]) List<Sum> sums]) = _Balance;

  bool get isEmpty => sums.isEmpty || sums.every((e) => e.isEmpty);

  Balance operator +(Balance balance) {
    var res = Balance(sums);

    for (var sum in balance.sums) {
      res = res.addSum(sum);
    }

    return res;
  }

  Balance addSum(Sum sum) {
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
}
