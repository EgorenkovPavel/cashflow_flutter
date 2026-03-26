import 'package:flutter/material.dart';
import 'package:money_tracker/src/ui/app.dart';
import 'package:money_tracker/src/ui/blocs/account_balance_bloc.dart';
import 'package:money_tracker/src/ui/widgets/user_avatar.dart';
import 'package:money_tracker/src/utils/extensions.dart';

import '../../../../domain/view_models.dart';

class AccountListPage extends StatefulWidget {
  const AccountListPage({super.key});
  @override
  State<AccountListPage> createState() => _AccountListPageState();
}

class _AccountListPageState extends State<AccountListPage> {
  var _isDebt = false;

  @override
  Widget build(BuildContext context) {
    final items = context.watchAllBalances();
    final listItems = items.where((e) => e.isDebt == _isDebt).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.accounts),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30),
          child: SegmentedButton<bool>(
            segments: [
              ButtonSegment<bool>(
                value: false,
                label: Text(
                  '${context.loc.accounts} (${items.where((e) => !e.isDebt).length})',
                ),
              ),
              ButtonSegment<bool>(
                value: true,
                label: Text(
                  '${context.loc.debts} (${items.where((e) => e.isDebt).length})',
                ),
              ),
            ],
            selected: {_isDebt},
            multiSelectionEnabled: false,
            onSelectionChanged: (value) {
              setState(() {
                _isDebt = value.first;
              });
            },
          ),
        ),
      ),
      body: ListView.separated(
        itemCount: listItems.length,
        separatorBuilder: (context, _) => Divider(),
        itemBuilder: (context, index) => AccountListItem(listItems[index]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_isDebt) {
            context.openDebtInputDialog();
          } else {
            context.openAccountInputDialog();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AccountListItem extends StatelessWidget {
  final AccountBalanceView account;

  const AccountListItem(this.account, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: UserAvatar(photoUrl: account.userPhoto, name: account.userName),
      title: Text(account.accountTitle),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: account.balance.sums
            .map(
              (sum) => Text(
                context.loc.sumFormat(sum),
                style: Theme.of(context).textTheme.labelMedium,
              ),
            )
            .toList(),
      ),
      onTap: () => context.openAccountPage(account.accountId),
    );
  }
}
