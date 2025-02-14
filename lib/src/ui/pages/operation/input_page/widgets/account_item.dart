import 'package:flutter/material.dart';
import 'package:money_tracker/src/utils/extensions.dart';

import '../../../../../domain/models.dart';

class AccountItem extends StatelessWidget {
  const AccountItem({
    super.key,
    required this.account,
  });

  final BaseAccountBalance account;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(account.account.title),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: account.balance.sums.map((e)=> Text(
            context.loc.sumFormat(e),
            style: Theme.of(context).textTheme.bodySmall,
          )).toList(),
        ),
      ],
    );
  }
}
