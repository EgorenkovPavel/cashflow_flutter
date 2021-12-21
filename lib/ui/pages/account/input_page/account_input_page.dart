import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/local/local_source.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/ui/pages/account/input_page/account_input_page_bloc.dart';
import 'package:money_tracker/ui/pages/item_card.dart';
import 'package:money_tracker/utils/app_localization.dart';

class AccountInputPage extends StatelessWidget {
  final int? id;

  const AccountInputPage.input() : id = null;

  const AccountInputPage.edit(this.id);

  @override
  Widget build(BuildContext context) {
    final _bloc = AccountInputPageBloc(context.read<LocalSource>());
    if (id != null) {
      _bloc.fetch(id!);
    }
    return BlocProvider(
      create: (context) => _bloc,
      child: AccountPage(
        isNew: id == null,
      ),
    );
  }
}

class AccountPage extends StatefulWidget {
  final bool isNew;

  const AccountPage({Key? key, required this.isNew}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountInputPageBloc, AccountInputPageState>(
      listener: (context, state) {
        if (state is Close) {
          Navigator.of(context).pop(state.account);
        } else if (state is InitTitle) {
          _controller.text = state.title;
        }
      },
      buildWhen: (previous, current) => current is Data,
      builder: (context, state) {
        return ItemCard<Account>(
          title: widget.isNew
              ? AppLocalizations.of(context).newAccountCardTitle
              : AppLocalizations.of(context).accountCardTitle,
          onSave: (context) => context.read<AccountInputPageBloc>().save(),
          child: Column(
            children: [
              TextFormField(
                autofocus: true,
                controller: _controller,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context).title,
                ),
                onChanged: (value) =>
                    context.read<AccountInputPageBloc>().changeTitle(value),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context).emptyTitleError;
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  Checkbox(
                    value: (state as Data).isDebt,
                    onChanged: (val) =>
                        context.read<AccountInputPageBloc>().changeIsDebt(val!),
                  ),
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
