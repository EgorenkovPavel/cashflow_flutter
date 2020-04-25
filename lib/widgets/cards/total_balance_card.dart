import 'package:bloc/bloc.dart';
import 'package:cashflow/data/objects/account_balance.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/widgets/card_title.dart';
import 'package:cashflow/widgets/item_cards/account_card.dart';
import 'package:cashflow/widgets/pages/account_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TotalBalanceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TotalBalanceBloc>(context).add(Fetch());
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: BlocBuilder<TotalBalanceBloc, TotalBalanceState>(
        builder: (BuildContext context, TotalBalanceState state) {
          if(state is Empty){
            return emptyBody(context);
          }else if(state is Loading){
            return Center(child: CircularProgressIndicator());
          }else if (state is Success){
            return filledBody(context, state.totalBalance, state.accounts);
          }else {
            throw Exception(state.toString());
          }
        },
      ),
    );
  }

  Widget filledBody(BuildContext context, int totalBalance, List<AccountBalance> accounts) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CardTitle('Total balance'),
        Container(
          height: 200.0,
          alignment: Alignment.center,
          color: Colors.grey,
          child: Text('Here will be a chart'),
        ),
        ExpansionTile(
          title: Text(
              NumberFormat().format(totalBalance),
              style: Theme.of(context).textTheme.title),
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
    return Align(
      child: FlatButton(
        child: Text('Add account'),
        onPressed: () {
          AccountCard.open(context);
        },
      ),
    );
  }

  Widget emptyBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CardTitle('Accounts'),
        Align(
            child: Text('No accounts',
                style: DefaultTextStyle.of(context)
                    .style
                    .copyWith(color: Colors.black38))),
        addButton(context),
      ],
    );
  }
}

abstract class TotalBalanceEvent {}

class Fetch extends TotalBalanceEvent{}

abstract class TotalBalanceState {}

class Empty extends TotalBalanceState {}

class Loading extends TotalBalanceState{}

class Success extends TotalBalanceState {
  final int totalBalance;
  final List<AccountBalance> accounts;

  Success({this.totalBalance, this.accounts});
}

class TotalBalanceBloc extends Bloc<TotalBalanceEvent, TotalBalanceState> {
  final Repository _repository;

  TotalBalanceBloc(this._repository);

  @override
  TotalBalanceState get initialState => Loading();

  @override
  Stream<TotalBalanceState> mapEventToState(TotalBalanceEvent event) async* {
    yield Loading();

    await for (List<AccountBalance> accounts in _repository.watchAllAccountsBalance()){
      if(accounts.isEmpty){
        yield Empty();
      }else {
        int _totalBalance =
        accounts.map((account) => account.balance).fold(0, (a, b) => a + b);

        yield Success(totalBalance: _totalBalance, accounts: accounts);
      }
    };
  }
}
