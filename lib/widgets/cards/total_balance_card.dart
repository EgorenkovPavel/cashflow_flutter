import 'package:cashflow/data/objects/account_balance.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/cards/widgets/empty_card_hint.dart';
import 'package:cashflow/widgets/pages/account/account_input_page.dart';
import 'package:cashflow/widgets/pages/account/list_tile_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TotalBalanceCard extends StatelessWidget {
  int _totalBalance(List<AccountBalance> accounts) => accounts.fold(
      0, (previousValue, element) => previousValue + element.balance);

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
        return Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context).accounts,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    IconButton(
                        icon: Icon(Icons.add, color: Theme.of(context).accentColor,),
                        onPressed: () => AccountInputPage.open(context))
                  ],
                ),
              ),
              _AccountList(context, _accounts),
            ],
          ),
        );
      },
    );
  }

  Widget _AccountList(BuildContext context, List<AccountBalance> accounts) {
    if (accounts.isEmpty) {
      return EmptyCardHint(
        title: AppLocalizations.of(context).noAccounts,
      );
    } else {
      return ExpansionTile(
        //trailing: Text('1000'),
       // subtitle: Text(AppLocalizations.of(context).titleTotalBalance),
        //leading: Text('2222'),

        title: Text(
          '${AppLocalizations.of(context).titleTotalBalance}: ${_totalBalance(accounts)}',
          style: Theme.of(context).textTheme.headline6,
        ),
        children: accounts
            .map((account) => ListTileAccount(account))
            .expand((element) => [Divider(), element])
            .toList()
              ..add(Divider()),
      );
    }
  }
}
