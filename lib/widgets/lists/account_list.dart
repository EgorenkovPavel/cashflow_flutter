import 'package:cashflow/widgets/cards/account_card.dart';
import 'package:cashflow/data/objects/account_balance.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/widgets/lists/main_list.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/empty_list_hint.dart';
import 'package:cashflow/widgets/list_tiles/list_tile_account.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountList extends StatelessWidget implements MainList<AccountBalance> {
  Widget accountList(BuildContext context, List<AccountBalance> accounts) {
    return ListView.separated(
      itemCount: accounts.length,
      itemBuilder: (_, index) {
        final itemAccount = accounts[index];
        return ListTileAccount(
          itemAccount,
          onTap: () => onItemTap(context, itemAccount),
        );
      },
      separatorBuilder: (BuildContext context, int index) => Divider(),
    );
  }

  Widget totalSum(BuildContext context, List<AccountBalance> accounts) {
    if (accounts.length <= 1) {
      return SizedBox();
    }

    int sum = accounts.fold(0, (prev, next) => prev + next.balance);

    return Container(
      child: ListTile(
        title: Text(
          AppLocalizations.of(context).titleTotalSum,
          style: Theme.of(context).textTheme.title,
        ),
        trailing: Text(
          sum.toString(),
          style: Theme.of(context).textTheme.headline,
        ),
      ),
      height: 44.0, //TODO hardcode
    );
  }

  @override
  void addItem(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
              child: AccountCard(),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))));
        });
  }

  @override
  void filterList() {
    // TODO: implement filterList
  }

  @override
  void onItemTap(BuildContext context, AccountBalance item) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
              child: AccountCard(
                account: item,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))));
        });
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<Repository>(context);

    return StreamBuilder<List<AccountBalance>>(
      stream: model.watchAllAccountsBalance(),
      builder:
          (BuildContext context, AsyncSnapshot<List<AccountBalance>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.data.isEmpty) {
          return EmptyListHint(
              title: 'List of accounts is empty', hint: 'Press button to add first one',);
        }

        final accounts = snapshot.data ?? List();

        return Column(
          children: <Widget>[
            //totalSum(context, accounts),
            Expanded(child: accountList(context, accounts)),
          ],
        );
      },
    );
  }
}
