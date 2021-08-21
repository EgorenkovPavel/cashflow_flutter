import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/repository.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/ui/pages/account/input_page/account_input_page_bloc.dart';
import 'package:money_tracker/ui/pages/item_card.dart';
import 'package:money_tracker/utils/app_localization.dart';

class AccountInputPage extends StatefulWidget {
  @override
  _AccountInputPageState createState() => _AccountInputPageState();

  int? id;

  AccountInputPage.input();

  AccountInputPage.edit(this.id);

}

class _AccountInputPageState extends State<AccountInputPage> {
  final TextEditingController _controller = TextEditingController();
  late AccountInputPageBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = AccountInputPageBloc(context.read<Repository>());
    if (widget.id != null){
      _bloc.fetch(widget.id!);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountInputPageBloc, AccountInputPageState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state is CloseState) {
          Navigator.of(context).pop(state.account);
        }
      },
      builder: (context, state){
        if (state is AccountState){
          _controller.text = state.title;
        }
        return ItemCard<Account>(
          title: AppLocalizations.of(context).newAccountCardTitle,
          onSave: (context) {
            _bloc.save(_controller.text);
          },
          child: TextFormField(
            autofocus: true,
            controller: _controller,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
              labelStyle: TextStyle(color: Theme.of(context).primaryColor),
              labelText: AppLocalizations.of(context).title,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppLocalizations.of(context).emptyTitleError;
              }
              return null;
            },
          ),
        );
      },
    );
  }
}
