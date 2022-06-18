import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/injection_container.dart';
import 'package:money_tracker/ui/page_navigator.dart';
import 'package:money_tracker/ui/pages/home/top_header/top_header_bloc.dart';
import 'package:money_tracker/ui/themes.dart';
import 'package:money_tracker/utils/app_localization.dart';

const double _itemSize = 100.0;

class TopHeader extends StatelessWidget {
  const TopHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TopHeaderBloc>()..add(Fetch()),
      child: Column(
        children: [
          _TotalBalance(),
          _AccountsList(),
        ],
      ),
    );
  }
}

class _AccountsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: _itemSize / 2,
          width: double.infinity,
          margin: EdgeInsets.only(
            bottom: context.watch<TopHeaderBloc>().state.accounts.isEmpty
                ? 0
                : _itemSize / 2 + Dimensions.padding * 1,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(24.0),
              bottomRight: Radius.circular(24.0),
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: AccountList(
            accounts: context.watch<TopHeaderBloc>().state.accounts,
          ),
        ),
      ],
    );
  }
}

class _TotalBalance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context).titleTotalBalance,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.white.withOpacity(0.5),
                      ),
                ),
                Text(
                  AppLocalizations.of(context).numberFormat(
                    context.select<TopHeaderBloc, int>(
                      (bloc) => bloc.state.totalBalance,
                    ),
                  ),
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AccountList extends StatelessWidget {
  const AccountList({
    Key? key,
    required this.accounts,
  }) : super(key: key);

  final List<AccountBalance> accounts;

  @override
  Widget build(BuildContext context) {
    if (accounts.isEmpty) {
      return const SizedBox();
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(bottom: Dimensions.padding * 1),
        child: Row(
          children: accounts
              .map((e) => _AccountItem(account: e))
              .expand((element) =>
                  [const SizedBox(width: Dimensions.padding), element])
              .toList()..add(const SizedBox(width: Dimensions.padding)),
        ),
      ),
    );
  }
}

class _AccountItem extends StatelessWidget {
  const _AccountItem({
    Key? key,
    required this.account,
  }) : super(key: key);

  final AccountBalance account;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => PageNavigator.openAccountPage(context, account.id),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 20.0,
              color: Colors.black38,
            ),
          ],
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.all(16.0),
        height: _itemSize,
        width: 200.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              account.title,
              style: Theme.of(context).textTheme.caption!.copyWith(
                    fontSize: 13,
                    color: Colors.black87,
                  ),
            ),
            Text(
              AppLocalizations.of(context).numberFormat(account.balance),
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
