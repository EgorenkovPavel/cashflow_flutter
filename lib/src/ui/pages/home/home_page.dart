import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/ui/app.dart';
import 'package:money_tracker/src/ui/blocs/account_balance_bloc.dart';
import 'package:money_tracker/src/ui/pages/home/last_operations/last_operations.dart';
import 'package:money_tracker/src/ui/pages/home/month_operations/month_operations.dart';
import 'package:money_tracker/src/ui/pages/home/sync_button.dart';
import 'package:money_tracker/src/utils/extensions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Money tracker'),
        actions: [
          const SyncButton(),
          IconButton(
            onPressed: () => context.openReportsPage(),
            icon: const Icon(Icons.analytics, color: Colors.black),
          ),
          IconButton(
            onPressed: () => context.openSettingsPage(),
            icon: const Icon(Icons.settings_sharp, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: TotalsCard(),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: AccountsCard(
                  title: 'Accounts',
                  accounts: context
                      .watch<AccountBalanceBloc>()
                      .state
                      .accounts
                      .where((account) => !account.isDebt)
                      .toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: AccountsCard(
                  title: 'Debts',
                  accounts: context
                      .watch<AccountBalanceBloc>()
                      .state
                      .accounts
                      .where((account) => account.isDebt)
                      .toList(),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: MonthOperations(operationType: OperationType.INPUT),
              ),
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: MonthOperations(operationType: OperationType.OUTPUT),
              ),
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: LastOperations(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.openOperationInputPage(),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TotalsCard extends StatelessWidget {
  const TotalsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: []
            ..add(Text(
              'Totals',
              style: Theme.of(context).textTheme.titleLarge,
            ))
            ..add(Wrap(
              children: context
                  .watch<AccountBalanceBloc>()
                  .state
                  .totals
                  .entries
                  .map((item) => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Chip(
                          label: Text(
                            context.loc.numberFormat(item.value, item.key),
                          ),
                        ),
                      ))
                  .toList(),
            )),
        ),
      ),
    );
  }
}

class AccountsCard extends StatefulWidget {
  final String title;
  final List<AccountBalance> accounts;

  const AccountsCard({super.key, required this.title, required this.accounts});

  @override
  State<AccountsCard> createState() => _AccountsCardState();
}

class _AccountsCardState extends State<AccountsCard> {
  bool _showAll = true;

  List<AccountBalance> _accounts() {
    if (widget.accounts.where((account) => account.balance != 0).isEmpty) {
      return widget.accounts;
    } else {
      return widget.accounts
          .where((account) => !_showAll || account.balance != 0)
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        ListTile(
          title: Text(
            widget.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        if (widget.accounts.isEmpty) const Text('No items'),
        ...(_accounts().map((account) => _AccountListTile(account)).toList()),
        ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            if (widget.accounts
                .where((account) => account.balance != 0)
                .isNotEmpty)
              TextButton(
                onPressed: () {
                  setState(() {
                    _showAll = !_showAll;
                  });
                },
                child: Text(_showAll ? 'Show all' : 'Hide'),
              ),
            const Spacer(),
            TextButton(
              child: const Text('Add'),
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

  const _AccountListTile(AccountBalance account, {super.key})
      : _account = account;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_account.title),
      trailing:
          Text(context.loc.numberFormat(_account.balance, _account.currency)),
      onTap: () => context.openAccountPage(_account.id),
    );
  }
}
