import 'package:bloc/bloc.dart';
import 'package:cashflow/data/objects/account_balance.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/card_title.dart';
import 'package:cashflow/widgets/charts/balance_chart.dart';
import 'package:cashflow/widgets/item_cards/account_card.dart';
import 'package:cashflow/widgets/pages/account_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class TotalBalanceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TotalBalanceBloc>(context).add(Fetch());
    return BlocBuilder<TotalBalanceBloc, TotalBalanceState>(
        builder: (BuildContext context, TotalBalanceState state) {
          if (state is Empty) {
            return emptyBody(context);
          } else if (state is Loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is Success) {
            return filledBody(context, state.totalBalance, state.accounts);
          } else {
            throw Exception(state.toString());
          }
        },
    );
  }

  Widget filledBody(
      BuildContext context, int totalBalance, List<AccountBalance> accounts) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //CardTitle(AppLocalizations.of(context).titleTotalBalance),
        Padding(
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
        ),
        Column(
          children: accounts
              .map<Widget>((account) => Column(
                    children: <Widget>[
                      Divider(),
                      ListTile(
                        title: Text(account.title),
                        trailing: Text(
                          NumberFormat().format(account.balance),
                          style: Theme.of(context).textTheme.title,
                        ),
                        onTap: () => AccountPage.open(context, account.id),
                      ),
                    ],
                  ))
              .toList()
                ..add(addButton(context)),
        ),
      ],
    );
  }

  Widget addButton(BuildContext context) {
    return ButtonBar(
      children: [
        FlatButton(
          child: Text(AppLocalizations.of(context).btnAddAccount.toUpperCase(),
            style: DefaultTextStyle.of(context)
                .style
                .copyWith(color: Theme.of(context).accentColor, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            AccountCard.open(context);
          },
        )
      ],
    );
  }

  Widget emptyBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CardTitle(AppLocalizations.of(context).accounts),
        Align(
            child: Text(AppLocalizations.of(context).noAccounts,
                style: DefaultTextStyle.of(context)
                    .style
                    .copyWith(color: Colors.black38))),
        addButton(context),
      ],
    );
  }
}

abstract class TotalBalanceEvent {}

class Fetch extends TotalBalanceEvent {}

abstract class TotalBalanceState {}

class Empty extends TotalBalanceState {}

class Loading extends TotalBalanceState {}

class Success extends TotalBalanceState {
  final int totalBalance;
  final List<AccountBalance> accounts;

  Success({this.totalBalance, this.accounts});
}

class TotalBalanceBloc extends Bloc<TotalBalanceEvent, TotalBalanceState> {
  final Repository _repository;

  TotalBalanceBloc(this._repository) : super(Loading());

  @override
  TotalBalanceState get initialState => Loading();

  @override
  Stream<TotalBalanceState> mapEventToState(TotalBalanceEvent event) async* {
    yield Loading();

    await for (List<AccountBalance> accounts
        in _repository.watchAllAccountsBalance()) {
      if (accounts.isEmpty) {
        yield Empty();
      } else {
        int _totalBalance =
            accounts.map((account) => account.balance).fold(0, (a, b) => a + b);

        yield Success(totalBalance: _totalBalance, accounts: accounts);
      }
    }
    ;
  }
}
