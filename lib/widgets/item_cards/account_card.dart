import 'package:cashflow/widgets/item_cards/item_card.dart';
import 'package:cashflow/data/objects/account.dart';
import 'package:cashflow/data/objects/account_balance.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountCard extends StatelessWidget {
  final AccountBalance account;
  final TextEditingController controller = TextEditingController();

  AccountCard({this.account}) {
    if (account != null) {
      controller.text = account.title;
    }
  }

  void saveAccount(BuildContext context) {
    if (account == null) {
      Provider.of<Repository>(context, listen: false)
          .insertAccount(Account(title: controller.text));
    } else {
      Provider.of<Repository>(context, listen: false)
          .updateAccount(account.getAccount().copyWith(title: controller.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ItemCard(
      title: account == null
          ? AppLocalizations.of(context).newAccountCardTitle
          : AppLocalizations.of(context).accountCardTitle,
      child: TextFormField(
        controller: controller,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: AppLocalizations.of(context).title,
        ),
        validator: (value) {
          if (value.isEmpty) {
            return AppLocalizations.of(context).emptyTitleError;
          }
          return null;
        },
      ),
      onSave: (context) {
        saveAccount(context);
      },
    );
  }
}
