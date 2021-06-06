import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/ui/pages/account/input_page/account_input_page_bloc.dart';
import 'package:money_tracker/ui/pages/item_card.dart';
import 'package:money_tracker/utils/app_localization.dart';

class AccountInputPage extends StatefulWidget {
  @override
  _AccountInputPageState createState() => _AccountInputPageState();
}

class _AccountInputPageState extends State<AccountInputPage> {

  final TextEditingController _controller = TextEditingController();
  late AccountInputPageBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<AccountInputPageBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    //_bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountInputPageBloc, AccountInputPageState>(
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





