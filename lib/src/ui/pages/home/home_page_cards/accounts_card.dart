import 'package:flutter/material.dart';
import 'package:money_tracker/src/ui/app.dart';
import 'package:money_tracker/src/utils/extensions.dart';

import '../../../../domain/models.dart';
import 'card_title.dart';

class AccountsCard extends StatefulWidget {
  final String title;
  final List<AccountBalance> accounts;

  const AccountsCard({super.key, required this.title, required this.accounts});

  @override
  State<AccountsCard> createState() => _AccountsCardState();
}

class _AccountsCardState extends State<AccountsCard> {
  bool _showAll = true;

  List<AccountBalance> _visibleAccounts() {
    if (widget.accounts.where((account) => account.balance != 0).isEmpty) {
      return widget.accounts;
    } else {
      return widget.accounts
          .where((account) => !_showAll || account.balance != 0)
          .toList();
    }
  }

  _onHide() {
    setState(() {
      _showAll = !_showAll;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        CardTitle(title: widget.title),
        if (widget.accounts.isEmpty) Text(context.loc.noItems),
        ...(_visibleAccounts()
            .map((account) => _AccountListTile(account))
            .toList()),
        ButtonBar(
          //alignment: MainAxisAlignment.spaceBetween,
          children: [
            if (widget.accounts
                .where((account) => account.balance != 0)
                .isNotEmpty)
              TextButton(
                onPressed: _onHide,
                child: Text(_showAll ? context.loc.btnShowAll : context.loc.btnHide),
              ),
            TextButton(
              child: Text(context.loc.btnAdd),
              onPressed: () => context.openAccountInputDialog(),
            ),
          ],
        ),
      ]),
    );
  }
}

class _AccountListTile extends StatelessWidget {
  final AccountBalance _account;

  const _AccountListTile(AccountBalance account) : _account = account;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_account.title),
      trailing: Text(
        context.loc.numberFormat(_account.balance, _account.currency),
        style: Theme.of(context).textTheme.titleMedium,
      ),
      onTap: () => context.openAccountPage(_account.id),
    );
  }
}
