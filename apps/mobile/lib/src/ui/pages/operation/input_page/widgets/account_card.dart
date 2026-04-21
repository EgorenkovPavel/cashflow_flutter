import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:money_tracker/src/ui/blocs/account_balance_bloc.dart';

import '../../../../../domain/models.dart';
import '../../../../../domain/view_models.dart';
import '../../../../../utils/extensions.dart';
import '../../../../widgets/user_avatar.dart';

class AccountCard extends StatelessWidget {
  final int? accountId;
  final Currency balanceCurrency;
  final void Function(int) onChangeAccount;

  const AccountCard({
    super.key,
    required this.accountId,
    required this.onChangeAccount,
    required this.balanceCurrency,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return _AccountDialog(
                  onChangeAccount: onChangeAccount,
                  balanceCurrency: balanceCurrency,
                );
              },
            );
          },
          child: switch (accountId) {
            final id? => _InfoCard(accountId: id),
            _ => _EmptyCard(),
          },
        ),
      ),
    );
  }
}

class _EmptyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Text(context.loc.hintAccount),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final int accountId;

  const _InfoCard({super.key, required this.accountId});

  @override
  Widget build(BuildContext context) {
    final account = context.watchAllBalances().firstWhere(
      (e) => e.accountId == accountId,
    );

    return Card(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              account.accountTitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ...account.balance.sums.map((s) => Text(context.loc.sumFormat(s))),
          ],
        ),
      ),
    );
  }
}

class _AccountDialog extends StatelessWidget {
  const _AccountDialog({
    super.key,
    required this.onChangeAccount,
    required this.balanceCurrency,
  });

  final void Function(int) onChangeAccount;
  final Currency balanceCurrency;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(context.loc.hintAccount),
        ),
        Expanded(
          child: ListView(
            children: context
                .watchAllBalances()
                .map(
                  (e) => _AccountItem(
                    account: e,
                    onChangeAccount: onChangeAccount,
                    balanceCurrency: balanceCurrency,
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class _AccountItem extends StatelessWidget {
  const _AccountItem({
    super.key,
    required this.onChangeAccount,
    required this.balanceCurrency,
    required this.account,
  });

  final AccountBalanceView account;
  final void Function(int) onChangeAccount;
  final Currency balanceCurrency;

  void _onTap(BuildContext context) {
    onChangeAccount(account.accountId);
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final sum = account.balance.sums.firstWhere(
      (s) => s.currency == balanceCurrency,
      orElse: () => Money(0, balanceCurrency),
    );

    return ListTile(
      onTap: () => _onTap(context),
      leading: UserAvatar(photoUrl: account.userPhoto, name: account.userName),
      title: Text(account.accountTitle),
      trailing: Text(context.loc.sumFormat(sum)),
    );
  }
}
