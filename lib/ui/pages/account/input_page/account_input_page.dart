import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/data_source.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/ui/pages/account/input_page/account_input_page_bloc.dart';
import 'package:money_tracker/ui/pages/item_card.dart';
import 'package:money_tracker/utils/app_localization.dart';

class AccountInputPage extends StatefulWidget {
  @override
  _AccountInputPageState createState() => _AccountInputPageState();

  final int? id;

  const AccountInputPage.input() : id = null;

  const AccountInputPage.edit(this.id);
}

class _AccountInputPageState extends State<AccountInputPage> {
  final TextEditingController _controller = TextEditingController();
  late AccountInputPageBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = AccountInputPageBloc(context.read<DataSource>());
    if (widget.id != null) {
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
        if (state.action == BlocAction.CLOSE) {
          Navigator.of(context).pop(state.account);
        }
      },
      builder: (context, state) {
        _controller.text = state.title;
        return ItemCard<Account>(
          title: widget.id == null
              ? AppLocalizations.of(context).newAccountCardTitle
              : AppLocalizations.of(context).accountCardTitle,
          onSave: (context) => _bloc.save(_controller.text),
          child: Column(
            children: [
              TextFormField(
                autofocus: true,
                controller: _controller,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  // focusedBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(),
                  // ),
                  labelText: AppLocalizations.of(context).title,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context).emptyTitleError;
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  Checkbox(value: state.isDebt, onChanged: (val)=> _bloc.changeIsDebt(val!), ),
                  Text('Is debt'),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
