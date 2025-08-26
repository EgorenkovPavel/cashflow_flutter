import 'package:flutter/material.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/ui/blocs/currency_rate_bloc.dart';
import 'package:money_tracker/src/ui/blocs/user_bloc.dart';
import 'package:money_tracker/src/utils/extensions.dart';
import 'package:money_tracker/src/utils/sum.dart';

import '../../../blocs/account_balance_bloc.dart';

class TotalsCard extends StatelessWidget {
  const TotalsCard({super.key});

  double _rate(double rate) {
    return ((1 / rate) * 100).floor() / 100;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        child: Column(
          children: [
            _Title(context.loc.titleTotalBalance, context.watchTotalSum()),
            Table(
              columnWidths: const <int, TableColumnWidth>{
                0: FixedColumnWidth(70),
                1: FlexColumnWidth(),
                2: FlexColumnWidth(),
              },
              children: context
                  .watchTotals()
                  .sums
                  .map((sum) => TableRow(
                        children: [
                          switch (sum.currency) {
                            Currency.RUB => SizedBox(),
                            Currency.USD => Text('USD ${_rate(context.usd())}'),
                            Currency.EUR => Text('EUR ${_rate(context.eur())}'),
                          },
                          Text(
                            context.loc.sumFormat(sum),
                            textAlign: TextAlign.end,
                          ),
                          Text(
                            context.loc.sumFormat(
                              switch (sum.currency) {
                                Currency.RUB => sum,
                                Currency.USD => Sum(
                                    (sum.sum / context.usd()).toInt(),
                                    Currency.RUB),
                                Currency.EUR => Sum(
                                    (sum.sum / context.eur()).toInt(),
                                    Currency.RUB),
                              },
                            ),
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
                TextButton(onPressed: () {}, child: Text('Details') //TODO
                    ),
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
    final total = context
        .watchBalances()
        .where((e) => e.userId == user?.id)
        .map((e) => e.balance)
        .reduce((a, b) => a + b)
        .totalInRub(context.usd(), context.eur());

    final balances = context
        .watchBalances()
        .where((e) => e.userId == user?.id)
        .where((balance) =>
            balance.balance.totalInRub(context.usd(), context.eur()).sum != 0);

    if (user == null && balances.isEmpty){
      return SizedBox();
    }

    return Column(
      children: [
        Divider(),
        _Title(
            user?.name ?? 'Other', //TODO
            total),
        ...balances.map((balance) => _SubTitle(balance.accountTitle,
            balance.balance.totalInRub(context.usd(), context.eur()))),
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
        Flexible(
            child: Text(
          title,
          overflow: TextOverflow.ellipsis,
        )),
        Text(context.loc.sumFormat(sum)),
      ],
    );
  }
}
