import 'package:flutter/material.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/ui/app.dart';
import 'package:money_tracker/src/ui/blocs/currency_rate_bloc.dart';
import 'package:money_tracker/src/ui/blocs/user_bloc.dart';
import 'package:money_tracker/src/utils/extensions.dart';

import '../../../blocs/account_balance_bloc.dart';

class TotalsCard extends StatelessWidget {
  const TotalsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const .only(top: 16.0, left: 16.0, right: 16.0),
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
                  .watchTotalBalance()
                  .sums
                  .map(
                    (sum) => TableRow(
                      children: [
                        Text(switch (sum.currency) {
                          .RUB => Currency.RUB.toString(),
                          .USD => 'USD (${context.formatedRate(.USD)})',
                          .EUR => 'EUR (${context.formatedRate(.EUR)})',
                        }),
                        SumText(sum, textAlign: .end),
                        SumText(context.sumToRub(sum), textAlign: .end),
                      ],
                    ),
                  )
                  .toList(),
            ),
            ...context.watchUsers().map((user) => _UserAccounts(user: user)),
            _UserAccounts(user: null),
            _Debts(),
            OverflowBar(
              alignment: .end,
              children: [
                TextButton(
                  onPressed: () => context.openAccountListPage(),
                  child: Text(context.loc.accounts),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SumText extends StatelessWidget {
  final Money sum;
  final TextStyle? style;
  final TextAlign? textAlign;

  const SumText(this.sum, {super.key, this.style, this.textAlign});

  @override
  Widget build(BuildContext context) {
    TextStyle? newStyle = TextStyle();
    if (sum.sum < 0) {
      if (style == null) {
        newStyle = TextStyle(color: Colors.red);
      } else {
        newStyle = style!.copyWith(color: Colors.red);
      }
    } else {
      newStyle = style;
    }
    return Text(
      context.loc.sumFormat(sum),
      style: newStyle,
      textAlign: textAlign,
    );
  }
}

class _UserAccounts extends StatelessWidget {
  final User? user;

  const _UserAccounts({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final total = context.balanceToRub(
      context
          .watchAccountBalances()
          .where((e) => e.userId == user?.id)
          .map((e) => e.balance)
          .fold(Balance(), (a, b) => a + b),
    );

    final balances = context
        .watchAccountBalances()
        .where((e) => e.userId == user?.id)
        .where((balance) => context.balanceToRub(balance.balance).sum != 0);

    if (user == null && balances.isEmpty) {
      return SizedBox();
    }

    return Column(
      children: [
        Divider(),
        _Title(user?.name ?? context.loc.other, total),
        ...balances.map(
          (balance) => _SubTitle(
            balance.accountTitle,
            context.balanceToRub(balance.balance),
          ),
        ),
      ],
    );
  }
}

class _Debts extends StatelessWidget {
  const _Debts({super.key});

  @override
  Widget build(BuildContext context) {
    final total = context.balanceToRub(
      context
          .watchDebtBalances()
          .map((e) => e.balance)
          .fold(Balance(), (a, b) => a + b),
    );

    final balances = context.watchDebtBalances().where(
      (balance) => context.balanceToRub(balance.balance).sum != 0,
    );

    if (balances.isEmpty) {
      return SizedBox();
    }

    return Column(
      children: [
        Divider(),
        _Title(context.loc.debts, total),
        ...balances.map(
          (balance) => _SubTitle(
            balance.accountTitle,
            context.balanceToRub(balance.balance),
          ),
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  final String title;
  final Money sum;

  const _Header(this.title, this.sum, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        SumText(sum, style: Theme.of(context).textTheme.titleLarge),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  final String title;
  final Money sum;

  const _Title(this.title, this.sum, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        SumText(sum, style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }
}

class _SubTitle extends StatelessWidget {
  final String title;
  final Money sum;

  const _SubTitle(this.title, this.sum, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(child: Text(title, overflow: TextOverflow.ellipsis)),
        SumText(sum),
      ],
    );
  }
}
