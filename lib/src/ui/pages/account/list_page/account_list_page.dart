import 'package:flutter/material.dart';
import 'package:money_tracker/src/ui/app.dart';
import 'package:money_tracker/src/ui/blocs/account_balance_bloc.dart';
import 'package:money_tracker/src/ui/widgets/user_avatar.dart';
import 'package:money_tracker/src/utils/extensions.dart';

import '../../../../domain/view_models.dart';

class AccountListPage extends StatelessWidget {
  const AccountListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = context.watchAllBalances();

    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.accounts),
      ),
      body: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (context, _) => Divider(),
        itemBuilder: (context, index) => AccountListItem(account: items[index]),
      ),
    );
  }
}

class AccountListItem extends StatelessWidget {
  final AccountBalanceView account;

  const AccountListItem({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: UserAvatar(photoUrl: account.userPhoto, name: account.userName),
      title: Text(account.accountTitle),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: account.balance.sums
            .map((sum) => Text(
                  context.loc.sumFormat(sum),
                  style: Theme.of(context).textTheme.labelMedium,
                ))
            .toList(),
      ),
      subtitle: account.isDebt ? Text('Debt') : null,
      // TODO
      onTap: () => context.openAccountPage(account.accountId),
    );
  }
}
