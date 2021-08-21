import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/data/repository.dart';
import 'package:money_tracker/domain/models/account_balance.dart';
import 'package:money_tracker/ui/pages/list_card.dart';
import 'package:money_tracker/ui/page_navigator.dart';
import 'package:money_tracker/ui/widgets/sliver_header_delegate.dart';
import 'package:money_tracker/utils/app_localization.dart';

class AccountList extends StatelessWidget {
  const AccountList();

  @override
  Widget build(BuildContext context) {
    var stream = context.read<Repository>().watchAllAccountsBalance();
    return StreamBuilder<List<AccountBalance>>(
      stream: stream,
      builder: (context, state) {
        var _accounts = <AccountBalance>[];
        if (state.hasData && state.data != null) {
          _accounts = state.data!;
        }
        var _balance = _accounts.fold<int>(
            0, (previousValue, element) => previousValue + element.balance);
        return CustomScrollView(
          slivers: [
            AccountListHeader(
              balance: _balance,
              onAdd: () => PageNavigator.openAccountInputPage(context),
            ),
            SliverPadding(
              padding: EdgeInsets.all(16.0),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 2.0,
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16.0,
                    mainAxisExtent: 100.0),
                delegate: SliverChildListDelegate.fixed(
                  _accounts
                      .map<Widget>(
                        (e) => AccountTile(
                          account: e,
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class AccountListHeader extends StatelessWidget {
  const AccountListHeader({Key? key, required int balance, required this.onAdd})
      : _balance = balance,
        super(key: key);

  final int _balance;
  final void Function() onAdd;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverHeaderDelegate(
        minHeight: 60,
        maxHeight: 60,
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: Stack(alignment: Alignment.center, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  AppLocalizations.of(context).titleTotalBalance,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  NumberFormat().format(_balance),
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
            Positioned(
              right: 0.0,
              child: IconButton(
                icon: Icon(Icons.add),
                onPressed: onAdd,
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class AccountTile extends StatelessWidget {
  final AccountBalance account;

  const AccountTile({Key? key, required this.account}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListCard(
      onTap: () => PageNavigator.openAccountPage(context, account.id),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            account.title,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Text(
            NumberFormat().format(account.balance),
          ),
        ],
      ),
    );
  }
}
