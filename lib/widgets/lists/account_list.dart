import 'package:cashflow/data/objects/account_balance.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/empty_list_hint.dart';
import 'package:cashflow/widgets/list_tiles/list_tile_account.dart';
import 'package:cashflow/widgets/lists/main_list.dart';
import 'package:cashflow/widgets/pages/account_edit_page.dart';
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
          onTap: () => AccountEditPage.open(context, itemAccount.id),
        );
      },
      separatorBuilder: (BuildContext context, int index) => Divider(),
    );
  }

  @override
  Widget emptyListHint(BuildContext context) {
    return EmptyListHint(
              title: AppLocalizations.of(context).emptyListAccounts,
      hint: AppLocalizations.of(context).hintEmptyList,);
  }

}
