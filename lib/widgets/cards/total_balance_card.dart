import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cashflow/data/objects/account_balance.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/card_title.dart';
import 'package:cashflow/widgets/item_cards/account_card.dart';
import 'package:cashflow/widgets/pages/account_page.dart';
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
    _bloc.add(Fetch());

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    )..addListener(() => setState(() {}));
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
            return current is Empty || current is Loading || current is Success;
          },
          builder: (BuildContext context, TotalBalanceState state) {
            if (state is Empty) {
              return emptyBody(context);
            } else if (state is Loading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is Success) {
              return filledBody(context, state.totalBalance, state.accounts);
            } else {
              return  SizedBox();
            }
          },
        ),
        addButton(context),
      ],
    );
  }

  Widget filledBody(
      BuildContext context, int totalBalance, List<AccountBalance> accounts) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
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
        SizeTransition(
          axis: Axis.vertical,
          sizeFactor: animation,
          child: Column(
            children: accounts
                .map((account) => ListTile(
                      title: Text(account.title),
                      trailing: Text(
                        NumberFormat().format(account.balance),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      onTap: () => AccountPage.open(context, account.id),
                    ))
                .toList(),
          ),
        ),
        //addButton(context),
      ],
    );
  }

  Widget addButton(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.spaceBetween,
      children: [
        FlatButton(
          child: BlocBuilder<TotalBalanceBloc, TotalBalanceState>(
            builder: (BuildContext context, state) {
            if(state is ExpandAccounts){
              return Text(AppLocalizations.of(context).collapse.toUpperCase(),
                style: DefaultTextStyle.of(context).style.copyWith(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.bold),);
            }else if(state is CollapseAccounts){
              return Text(AppLocalizations.of(context).expand.toUpperCase(),
                style: DefaultTextStyle.of(context).style.copyWith(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.bold),);
            }else {
              return Text(AppLocalizations.of(context).expand.toUpperCase(),
                style: DefaultTextStyle.of(context).style.copyWith(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.bold),);
            }
          },),
          onPressed: () {
            _bloc.add(ChangeAccountsVisibility());
          },
        ),
        FlatButton(
          child: Text(
            AppLocalizations.of(context).btnAddAccount.toUpperCase(),
            style: DefaultTextStyle.of(context).style.copyWith(
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            AccountCard.open(context);
          },
        ),
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
        //addButton(context),
      ],
    );
  }
}

abstract class TotalBalanceEvent {}

class Fetch extends TotalBalanceEvent {}

class AccountsChange extends TotalBalanceEvent {
  final List<AccountBalance> accounts;

  AccountsChange(this.accounts);
}

class ChangeAccountsVisibility extends TotalBalanceEvent {}

abstract class TotalBalanceState {}

class Empty extends TotalBalanceState {}

class Loading extends TotalBalanceState {}

class Success extends TotalBalanceState {
  final int totalBalance;
  final List<AccountBalance> accounts;

  Success({this.totalBalance, this.accounts});
}

class ExpandAccounts extends TotalBalanceState {}

class CollapseAccounts extends TotalBalanceState {}

class TotalBalanceBloc extends Bloc<TotalBalanceEvent, TotalBalanceState> {
  final Repository _repository;

  bool showAccounts = false;
  StreamSubscription<List<AccountBalance>> _subscription;

  TotalBalanceBloc(this._repository) : super(Loading()) {
    _subscription = _repository.watchAllAccountsBalance().listen((accounts) {
      add(AccountsChange(accounts));
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }

  @override
  Stream<TotalBalanceState> mapEventToState(TotalBalanceEvent event) async* {
    if (event is Fetch) {

    } else if (event is AccountsChange) {
      int _totalBalance = event.accounts
          .map((account) => account.balance)
          .fold(0, (a, b) => a + b);

      yield Success(totalBalance: _totalBalance, accounts: event.accounts);
    } else if (event is ChangeAccountsVisibility) {
      showAccounts = !showAccounts;
      if (showAccounts) {
        yield ExpandAccounts();
      } else {
        yield CollapseAccounts();
      }
    }
  }
}
