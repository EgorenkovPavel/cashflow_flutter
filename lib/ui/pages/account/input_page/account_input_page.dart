import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/injection_container.dart';
import 'package:money_tracker/ui/pages/account/input_page/account_input_bloc.dart';
import 'package:money_tracker/ui/pages/item_card.dart';
import 'package:money_tracker/utils/extensions.dart';

class AccountInputPage extends StatelessWidget {
  final int? id;

  const AccountInputPage.input({Key? key})
      : id = null,
        super(key: key);

  const AccountInputPage.edit(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = sl<AccountInputBloc>();
    if (id != null) {
      bloc.add(AccountInputEvent.fetch(accountId: id!));
    }

    return BlocProvider(
      create: (context) => bloc,
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

  void _listenState(BuildContext context, AccountInputState state) {
    if (state.isSaved) {
      Navigator.of(context).pop(state.account);
    } else if (state.isFetched) {
      _controller.text = state.title;
    }
  }

  String? _titleValidator(String? value) {
    if (value == null || value.isEmpty) {
      return context.loc.emptyTitleError;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountInputBloc, AccountInputState>(
      listener: _listenState,
      child: ItemCard<Account>(
        title: widget.isNew
            ? context.loc.newAccountCardTitle
            : context.loc.accountCardTitle,
        onSave: (context) =>
            context.read<AccountInputBloc>().add(AccountInputEvent.save()),
        child: Column(
          children: [
            TextFormField(
              //autofocus: true,
              controller: _controller,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                labelText: context.loc.title,
              ),
              onChanged: (value) => context
                  .read<AccountInputBloc>()
                  .add(AccountInputEvent.changeTitle(title: value)),
              validator: _titleValidator,
            ),
            Row(
              children: [
                Checkbox(
                  value: context.select<AccountInputBloc, bool>(
                    (bloc) => bloc.state.isDebt,
                  ),
                  onChanged: (val) => context
                      .read<AccountInputBloc>()
                      .add(AccountInputEvent.changeIsDebt(isDebt: val!)),
                ),
                const Text('Is debt'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
