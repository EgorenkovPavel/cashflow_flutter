import 'package:flutter/material.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/ui/app.dart';
import 'package:money_tracker/src/ui/blocs/currency_rate_bloc.dart';
import 'package:money_tracker/src/ui/blocs/user_bloc.dart';
import 'package:money_tracker/src/utils/balance.dart';
import 'package:money_tracker/src/utils/extensions.dart';
import 'package:money_tracker/src/utils/sum.dart';

import '../../../blocs/account_balance_bloc.dart';

class TotalsCard extends StatelessWidget {
  const TotalsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        child: Column(
          children: [
            _Header(context.loc.titleTotalBalance, context.watchTotalSum()),
            Table(
              columnWidths: const <int, TableColumnWidth>{
                0: FixedColumnWidth(90),
                1: FlexColumnWidth(),
                2: FlexColumnWidth(),
              },
              children: context
                  .watchTotals()
                  .sums
                  .map((sum) => TableRow(
                        children: [
                          switch (sum.currency) {
                            Currency.RUB => Text('RUB'),
                            Currency.USD =>
                              Text('USD (${context.usdRateFormat()})'),
                            Currency.EUR =>
                              Text('EUR (${context.eurRateFormat()})'),
                          },
                          Text(
                            context.loc.sumFormat(sum),
                            textAlign: TextAlign.end,
                          ),
                          Text(
                            context.loc.sumFormat(context.sumToRub(sum)),
                            textAlign: TextAlign.end,
                          )
                        ],
                      ))
                  .toList(),
            ),
            ...context.watchUsers().map((user) => _UserAccounts(user: user)),
            _UserAccounts(user: null),
            OverflowBar(
              alignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () => context.openAccountListPage(),
                    child: Text('Details')), //TODO
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _UserAccounts extends StatelessWidget {
  final User? user;

  const _UserAccounts({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final total = Sum(
        context.balanceToRub(context
            .watchBalances()
            .where((e) => e.userId == user?.id)
            .map((e) => e.balance)
            .fold(Balance(), (a, b) => a + b)),
        Currency.RUB);

    final balances = context
        .watchBalances()
        .where((e) => e.userId == user?.id)
        .where((balance) => context.balanceToRub(balance.balance) != 0);

    if (user == null && balances.isEmpty) {
      return SizedBox();
    }

    return Column(
      children: [
        Divider(),
        _Title(
            user?.name ?? 'Other', //TODO
            total),
        ...balances.map((balance) => _SubTitle(balance.accountTitle,
            Sum(context.balanceToRub(balance.balance), Currency.RUB))),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  final String title;
  final Sum sum;

  const _Header(this.title, this.sum, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          // style: TextStyle(fontWeight: FontWeight.bold),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          context.loc.sumFormat(sum),
          // style: TextStyle(fontWeight: FontWeight.bold),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  final String title;
  final Sum sum;

  const _Title(this.title, this.sum, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          context.loc.sumFormat(sum),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class _SubTitle extends StatelessWidget {
  final String title;
  final Sum sum;

  const _SubTitle(this.title, this.sum, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(child: Text(title, overflow: TextOverflow.ellipsis)),
        Text(context.loc.sumFormat(sum)),
      ],
    );
  }
}
