import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/ui/app.dart';
import 'package:money_tracker/src/ui/blocs/account_balance_bloc.dart';
import 'package:money_tracker/src/ui/pages/home/last_operations/last_operations.dart';
import 'package:money_tracker/src/ui/pages/home/month_operations/month_operations.dart';
import 'package:money_tracker/src/ui/pages/home/sync_button.dart';
import 'package:money_tracker/src/utils/extensions.dart';

import '../../../domain/models/enum/currency.dart';

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
                  where: (account) => !account.isDebt,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: AccountsCard(
                  title: 'Debts',
                  where: (account) => account.isDebt,
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

  Map<Currency, int> _calcTotals(List<AccountBalance> list) {
    final res = <Currency, int>{};
    list.forEach((item) {
      res[item.currency] = (res[item.currency] ?? 0) + item.balance;
    });

    return res;
  }

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
              children: _calcTotals(
                context.watch<AccountBalanceBloc>().state.accounts,
              )
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
  final bool Function(AccountBalance) where;

  const AccountsCard({super.key, required this.where, required this.title});

  @override
  State<AccountsCard> createState() => _AccountsCardState();
}

class _AccountsCardState extends State<AccountsCard> {
  bool _showAll = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: []
          ..add(ListTile(
            title: Text(
              widget.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ))
          ..addAll(context
              .watch<AccountBalanceBloc>()
              .state
              .accounts
              .where(widget.where)
              .where((account) => !_showAll || account.balance != 0)
              .map((account) => ListTile(
                    title: Text(account.title),
                    trailing: Text(context.loc
                        .numberFormat(account.balance, account.currency)),
                    onTap: () => context.openAccountPage(account.id),
                  ))
              .toList())
          ..add(ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    _showAll = !_showAll;
                  });
                },
                child: Text(_showAll ? 'Show all' : 'Hide'),
              ),
              TextButton(
                child: const Text('Add'),
                onPressed: () => context.openAccountInputDialog(),
              ),
            ],
          )),
      ),
    );
  }
}
