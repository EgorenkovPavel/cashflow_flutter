import 'package:cashflow/data/objects/account_balance.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/cards/card_bar_button.dart';
import 'package:cashflow/widgets/cards/empty_card_hint.dart';
import 'package:cashflow/widgets/cards/total_balance_bloc.dart';
import 'package:cashflow/widgets/charts/balance_chart.dart';
import 'package:cashflow/widgets/pages/account/account_input_page.dart';
import 'package:cashflow/widgets/pages/account/account_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class TotalBalanceCard extends StatefulWidget {
  @override
  _TotalBalanceCardState createState() => _TotalBalanceCardState();
}

class _TotalBalanceCardState extends State<TotalBalanceCard>
    with SingleTickerProviderStateMixin {
  TotalBalanceBloc _bloc;
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    _bloc = BlocProvider.of<TotalBalanceBloc>(context);
    _bloc.fetch();

    animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 400),
        value: _bloc.isShowAccounts() ? 1.0 : 0.0)
      ..addListener(() => setState(() {}));
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocConsumer<TotalBalanceBloc, TotalBalanceState>(
          listenWhen: (TotalBalanceState previous, TotalBalanceState current) {
            return current is ExpandAccounts || current is CollapseAccounts;
          },
          listener: (BuildContext context, TotalBalanceState state) {
            if (state is ExpandAccounts) {
              animationController.forward();
            } else if (state is CollapseAccounts) {
              animationController.reverse();
            }
          },
          buildWhen: (TotalBalanceState previous, TotalBalanceState current) {
            return current is Loading || current is Success;
          },
          builder: (BuildContext context, TotalBalanceState state) {
            if (state is Loading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is Success) {
              return filledBody(context, state.totalBalance, state.accounts);
            } else {
              return SizedBox();
            }
          },
        ),
        buttonBar(context),
      ],
    );
  }

  Widget filledBody(
      BuildContext context, int totalBalance, List<AccountBalance> accounts) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _Header(totalBalance: totalBalance),
        if (accounts.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(height: 200.0, child: BalanceChart()),
          ),
        SizeTransition(
          axis: Axis.vertical,
          sizeFactor: animation,
          child: _AccountList(accounts: accounts),
        ),
      ],
    );
  }

  Widget buttonBar(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder<TotalBalanceBloc, TotalBalanceState>(
          builder: (BuildContext context, state) {
            if (state is ExpandAccounts) {
              return CardBarButton(
                title: AppLocalizations.of(context).collapse,
                onPressed: () => _bloc.add(ChangeAccountsVisibility()),
              );
            } else if (state is CollapseAccounts) {
              return CardBarButton(
                title: AppLocalizations.of(context).expand,
                onPressed: () => _bloc.add(ChangeAccountsVisibility()),
              );
            } else {
              return CardBarButton(
                title: AppLocalizations.of(context).expand.toUpperCase(),
                onPressed: () => _bloc.add(ChangeAccountsVisibility()),
              );
            }
          },
        ),
        CardBarButton(
          title: AppLocalizations.of(context).btnAddAccount,
          onPressed: () => AccountInputPage.open(context).then((res) {
            if (res) {
              _bloc.add(AddAccount());
            }
          }),
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  final int totalBalance;

  const _Header({Key key, this.totalBalance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            AppLocalizations.of(context).titleTotalBalance,
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(NumberFormat().format(totalBalance),
              style: Theme.of(context).textTheme.headline6)
        ],
      ),
    );
  }
}

class _AccountList extends StatelessWidget {
  final List<AccountBalance> accounts;

  const _AccountList({Key key, this.accounts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (accounts.isEmpty) {
      return EmptyCardHint(title: AppLocalizations.of(context).noAccounts,);
    } else {
      return Column(
        children: accounts
            .map((account) => accountItem(context, account))
            .expand((element) => [Divider(), element])
            .toList()
              ..add(Divider()),
      );
    }
  }

  Widget accountItem(BuildContext context, AccountBalance account) {
    return ListTile(
      title: Text(account.title),
      trailing: Text(
        NumberFormat().format(account.balance),
        style: Theme.of(context).textTheme.headline6,
      ),
      onTap: () => AccountEditPage.open(context, account.id),
    );
  }
}
