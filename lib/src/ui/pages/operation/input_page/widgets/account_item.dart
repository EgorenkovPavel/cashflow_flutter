import 'package:flutter/material.dart';
import 'package:money_tracker/src/utils/extensions.dart';

import '../../../../../domain/models.dart';

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
                child: Container(
                      decoration: BoxDecoration(
                        //border: Border.all(color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        color: Theme.of(context).primaryColor.withAlpha(30),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.0, vertical: 1.0),
                      child: Text(
                        context.loc.sumFormat(e),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Theme.of(context).primaryColor),
                      ),
                    ),
              ))
              .toList(),
        ),
      ],
    );
  }
}
