import 'package:flutter/material.dart';
import 'package:money_tracker/src/ui/app.dart';
import 'package:money_tracker/src/utils/extensions.dart';

import '../../../../domain/models.dart';
import 'card_title.dart';

class AccountsCard extends StatefulWidget {
  final String title;
  final List<BaseAccountBalance> accounts;

  const AccountsCard({super.key, required this.title, required this.accounts});

  @override
  State<AccountsCard> createState() => _AccountsCardState();
}

class _AccountsCardState extends State<AccountsCard> {
  bool _showAll = true;

  List<BaseAccountBalance> _visibleAccounts() {
    if (widget.accounts.where((account) => !account.balance.isEmpty).isEmpty) {
      return widget.accounts;
    } else {
      return widget.accounts
          .where((account) => !_showAll || !account.balance.isEmpty)
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
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        CardTitle(title: widget.title),
        if (widget.accounts.isEmpty) Text(context.loc.noItems),
        GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 2,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: _visibleAccounts().map((e) => _AccountListTile(e)).toList(),
        ),
        OverflowBar(
          alignment: MainAxisAlignment.end,
          children: [
            if (widget.accounts
                .where((account) => !account.balance.isEmpty)
                .isNotEmpty)
              TextButton(
                onPressed: _onHide,
                child: Text(
                    _showAll ? context.loc.btnShowAll : context.loc.btnHide),
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
  final BaseAccountBalance _account;

  const _AccountListTile(BaseAccountBalance account) : _account = account;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.openAccountPage(_account.account.id),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Theme.of(context).primaryColor),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 10,
              child: Text(
                _account.account.title,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: _account.balance.sums
                    .map((e) => Text(
                          context.loc.sumFormat(e),
                        ))
                    .toList(),
              ),
            ),
            const Positioned(
              bottom: 10,
              left: 10,
              child: CircleAvatar(
                child: Icon(Icons.account_circle),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
