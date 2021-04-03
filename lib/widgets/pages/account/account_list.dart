import 'package:cashflow/data/objects/account_balance.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/widgets/pages/account/account_edit_page.dart';
import 'package:cashflow/widgets/pages/account/account_input_page.dart';
import 'package:cashflow/widgets/pages/add_list_item_button.dart';
import 'package:cashflow/widgets/sliver_header_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountList extends StatelessWidget {
  const AccountList();

  @override
  Widget build(BuildContext context) {
    var stream = context.read<Repository>().watchAllAccountsBalance();
    return StreamBuilder<List<AccountBalance>>(
        stream: stream,
        builder: (context, state) {
          var _accounts = <AccountBalance>[];
          if (state.hasData) {
            _accounts = state.data;
          }
          return CustomScrollView(
            slivers: [
              AccountListHeader(
                title: 'Total balance',
              ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 2.0,
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20.0,
                    mainAxisExtent: 100.0),
                delegate: SliverChildListDelegate.fixed(_accounts
                    .map<Widget>((e) => AccountTile(
                          account: e,
                        ))
                    .toList()
                      ..add(AddButton(
                        onTap: () {
                          AccountInputPage.open(context);
                        },
                      ))),
              ),
            ],
          );
        });
  }
}

class AccountListHeader extends StatelessWidget {
  const AccountListHeader({Key key, @required String title})
      : _title = title,
        super(key: key);

  final String _title;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverHeaderDelegate(
        minHeight: 60,
        maxHeight: 60,
        child:
            Container(color: Colors.white, child: Center(child: Text(_title))),
      ),
    );
  }
}

class AccountTile extends StatelessWidget {
  final AccountBalance account;

  const AccountTile({Key key, this.account}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AccountEditPage.open(context, account.id);
      },
      child: Card(
        //color: Colors.amber,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              account.title,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Text(account.balance.toString()),
          ],
        )),
      ),
    );
  }
}
