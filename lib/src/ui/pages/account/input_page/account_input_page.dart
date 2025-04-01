import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/injection_container.dart';
import 'package:money_tracker/src/ui/pages/account/input_page/account_input_bloc.dart';
import 'package:money_tracker/src/ui/pages/item_card.dart';
import 'package:money_tracker/src/utils/extensions.dart';

class AccountInputPage extends StatelessWidget {
  final int? id;
  final bool? isDebt;

  const AccountInputPage.inputAccount({super.key})
      : id = null,
        isDebt = false;

  const AccountInputPage.inputDebt({super.key})
      : id = null,
        isDebt = true;

  const AccountInputPage.edit(this.id, {super.key}) : isDebt = null;

  @override
  Widget build(BuildContext context) {
    final bloc = sl<AccountInputBloc>();
    if (id != null) {
      bloc.add(AccountInputEvent.fetch(accountId: id!));
    } else if (isDebt != null) {
      bloc.add(AccountInputEvent.input(isDebt: isDebt!));
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

  const AccountPage({super.key, required this.isNew});

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
    } else if (_controller.text != state.title) {
      _controller.text = state.title;
    }
  }

  String? _titleValidator(String? value) {
    if (value == null || value.isEmpty) {
      return context.loc.emptyTitleError;
    }

    return null;
  }

  String _cardTitle(BuildContext context) {
    if (widget.isNew) {
      if (context.isDebt()) {
        return context.loc.newDebtCardTitle;
      } else {
        return context.loc.newAccountCardTitle;
      }
    } else {
      if (context.isDebt()) {
        return context.loc.debtCardTitle;
      } else {
        return context.loc.accountCardTitle;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountInputBloc, AccountInputState>(
      listener: _listenState,
      child: ItemCard<Account>(
        title: _cardTitle(context),
        onSave: (context) => context.onSave(),
        child: Column(
          children: [
            TextFormField(
              //autofocus: true,
              controller: _controller,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: context.loc.title,
              ),
              onChanged: context.onChangeTitle,
              validator: _titleValidator,
            ),
            _UserChooser(
              initialId: context.userId(),
              users: context.users(),
              onChange: context.onChangeUser,
            ),
          ],
        ),
      ),
    );
  }
}

class _UserChooser extends StatelessWidget {
  final int? initialId;
  final List<User> users;
  final void Function(User?) onChange;

  const _UserChooser({
    super.key,
    this.initialId,
    required this.users,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: users
          .map((e) => InkWell(
                onTap: () => onChange(e.id == initialId ? null : e),
                child: CircleAvatar(
                  backgroundColor:
                      e.id == initialId ? Colors.amberAccent : null,
                  child: Text(e.name),
                ),
              ))
          .toList(),
    );
  }
}

extension AccountInputBlocExt on BuildContext {

  onChangeTitle(String title) =>
      read<AccountInputBloc>().add(AccountInputEvent.changeTitle(title: title));

  bool isDebt() => select<AccountInputBloc, bool>(
        (bloc) => bloc.state.isDebt,
      );

  int? userId() => select<AccountInputBloc, int?>(
        (bloc) => bloc.state.userId,
      );

  List<User> users() => select<AccountInputBloc, List<User>>(
        (bloc) => bloc.state.users,
      );

  onChangeUser(User? user) =>
      read<AccountInputBloc>().add(AccountInputEvent.changeUser(user: user));

  onSave() => read<AccountInputBloc>().add(const AccountInputEvent.save());
}
