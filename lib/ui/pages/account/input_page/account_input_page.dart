import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/domain/interfaces/data_repository.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/ui/pages/account/input_page/account_input_bloc.dart';
import 'package:money_tracker/ui/pages/item_card.dart';
import 'package:money_tracker/utils/app_localization.dart';

class AccountInputPage extends StatelessWidget {
  final int? id;

  const AccountInputPage.input({Key? key}) : id = null, super(key: key);

  const AccountInputPage.edit(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _bloc = AccountInputBloc(context.read<DataRepository>());
    if (id != null) {
      _bloc.add(Fetch(id!));
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
    return BlocListener<AccountInputBloc, AccountInputState>(
      listener: (context, state) {
        if (state is SavedAccount) {
          Navigator.of(context).pop(state.account);
        } else if (state is FetchAccount) {
          _controller.text = state.title;
        }
      },
      child: ItemCard<Account>(
        title: widget.isNew
            ? AppLocalizations.of(context).newAccountCardTitle
            : AppLocalizations.of(context).accountCardTitle,
        onSave: (context) => context.read<AccountInputBloc>().add(Save()),
        child: Column(
          children: [
            TextFormField(
              //autofocus: true,
              controller: _controller,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context).title,
              ),
              onChanged: (value) =>
                  context.read<AccountInputBloc>().add(ChangeTitle(value)),
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
                  value: context.select<AccountInputBloc, bool>(
                      (bloc) => bloc.state.isDebt),
                  onChanged: (val) =>
                      context.read<AccountInputBloc>().add(ChangeIsDebt(val!)),
                ),
                const Text('Is debt'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
