import 'package:flutter/material.dart';

import '../../../../../domain/view_models.dart';
import '../../../../widgets/list_item_sum.dart';

class AccountItem extends StatelessWidget {
  const AccountItem({
    super.key,
    required this.account,
  });

  final AccountBalanceView account;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            account.account.title,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: account.balance.sums
                .map((e) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: ListItemSum(sum: e),
                ))
                .toList(),
          ),
        ],
      ),
    );
  }
}


