import 'package:cashflow/data/objects/account_balance.dart';
import 'package:cashflow/widgets/cards/account_card.dart';
import 'package:cashflow/widgets/empty_list_hint.dart';
import 'package:cashflow/widgets/list_tiles/list_tile_account.dart';
import 'package:cashflow/widgets/lists/main_list.dart';
import 'package:flutter/material.dart';

class AccountList extends MainList<AccountBalance> {

  AccountList(Stream<List<AccountBalance>> stream) : super(stream);

  @override
  Widget listBuilder(BuildContext context, List<AccountBalance> accounts) {
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

  static void addItem(BuildContext context) {
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
  Widget emptyListHint() {
    return EmptyListHint(
              title: 'List of accounts is empty', hint: 'Press button to add first one',);
  }

}
