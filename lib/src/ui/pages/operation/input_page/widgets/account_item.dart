import 'package:flutter/material.dart';

import '../../../../../domain/models.dart';
import '../../../../widgets/list_item_sum.dart';

class AccountItem extends StatelessWidget {
  const AccountItem({
    super.key,
    required this.account,
  });

  final BaseAccountBalanceListItem account;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          account.account.title,
          overflow: TextOverflow.ellipsis,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: account.balance.sums
              .map((e) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: ListItemSum(sum: e),
              ))
              .toList(),
        ),
      ],
    );
  }
}


