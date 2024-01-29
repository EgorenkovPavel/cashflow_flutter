import 'package:flutter/material.dart';
import 'package:money_tracker/src/utils/extensions.dart';

import '../../../../../domain/models.dart';

class AccountItem extends StatelessWidget {
  const AccountItem({
    super.key,
    required this.account,
  });

  final AccountBalance account;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(account.title),
        Text(
          context.loc.numberFormat(account.balance, account.currency),
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
