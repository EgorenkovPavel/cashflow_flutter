import 'package:bloc/bloc.dart';
import 'package:cashflow/data/objects/account.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/item_cards/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountCard extends StatefulWidget {

  static void open(BuildContext context){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
              child: AccountCard(),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))));
        });
  }

  @override
  _AccountCardState createState() => _AccountCardState();
}

class _AccountCardState extends State<AccountCard> {

  final TextEditingController _controller = TextEditingController();
  AccountCardBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<AccountCardBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ItemCard(
      title: AppLocalizations.of(context).newAccountCardTitle,
      child: TextFormField(
        autofocus: true,
        controller: _controller,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: AppLocalizations.of(context).title,
        ),
        validator: (value) {
          if (value.isEmpty) {
            return AppLocalizations.of(context).emptyTitleError;
          }
          return null;
        },
      ),
      onSave: (context) {
        _bloc.add(Save(title: _controller.text));
      },
    );
  }
}

abstract class AccountCardEvent{}

class Save extends AccountCardEvent{
  final String title;

  Save({this.title});
}

abstract class AccountCardState{}

class EmptyState extends AccountCardState{

}

class CloseState extends AccountCardState{

}

class AccountCardBloc extends Bloc<AccountCardEvent, AccountCardState>{

  final Repository _repository;

  AccountCardBloc(this._repository) : super(EmptyState());

  @override
  Stream<AccountCardState> mapEventToState(AccountCardEvent event) async* {

    if (event is Save){
      await _repository.insertAccount(Account(title: event.title));
      yield CloseState();
    }

  }
}