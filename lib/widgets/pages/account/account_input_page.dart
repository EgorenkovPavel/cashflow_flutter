import 'package:bloc/bloc.dart';
import 'package:cashflow/data/objects/account.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/pages/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountInputPage extends StatefulWidget {

  static Future<Account?> open(BuildContext context){
    return showDialog<Account>(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: AccountInputPage(),);
        });
  }

  @override
  _AccountInputPageState createState() => _AccountInputPageState();
}

class _AccountInputPageState extends State<AccountInputPage> {

  final TextEditingController _controller = TextEditingController();
  late AccountCardBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<AccountCardBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    //_bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountCardBloc, AccountInputPageState>(
      bloc: _bloc,
      listener: (context, state){
        if (state is CloseState){
          Navigator.of(context).pop(state.account);
        }
      },
      child: ItemCard<Account>(
        title: AppLocalizations.of(context).newAccountCardTitle,
        onSave: (context) {
          _bloc.save(_controller.text);
        },
        child: TextFormField(
          autofocus: true,
          controller: _controller,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: AppLocalizations.of(context).title,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppLocalizations.of(context).emptyTitleError;
            }
            return null;
          },
        ),
      ),
    );
  }
}

abstract class AccountInputPageState{}

class EmptyState extends AccountInputPageState{}

class CloseState extends AccountInputPageState{
  final Account account;

  CloseState(this.account);
}

class AccountCardBloc extends Cubit<AccountInputPageState>{

  final Repository _repository;

  AccountCardBloc(this._repository) : super(EmptyState());

  Future<void> save(String title) async {
    var account = Account(title: title);
    var id = await _repository.insertAccount(account);
    emit(CloseState(account.copyWith(id: id)));
  }
}




