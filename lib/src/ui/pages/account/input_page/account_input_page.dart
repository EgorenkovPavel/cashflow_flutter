import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/injection_container.dart';
import 'package:money_tracker/src/ui/pages/account/input_page/account_input_bloc.dart';
import 'package:money_tracker/src/ui/pages/item_card.dart';
import 'package:money_tracker/src/ui/widgets/type_radio_button.dart';
import 'package:money_tracker/src/utils/extensions.dart';

import '../../../../domain/models/enum/currency.dart';

class AccountInputPage extends StatelessWidget {
  final int? id;

  const AccountInputPage.input({super.key}) : id = null;

  const AccountInputPage.edit(this.id, {super.key});

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

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountInputBloc, AccountInputState>(
      listener: _listenState,
      child: ItemCard<Account>(
        title: widget.isNew
            ? context.loc.newAccountCardTitle
            : context.loc.accountCardTitle,
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
              onChanged: (value) => context.onChangeTitle(value),
              validator: _titleValidator,
            ),
            if (widget.isNew)
              Row(
                children: [
                  Checkbox(
                    value: context.isDebt(),
                    onChanged: (val) => context.onChangeIsDebt(val!),
                  ),
                  const Text('Is debt'),
                ],
              ),
            TypeRadioButton<Currency>(
              onChange: (val) => context.onChangeCurrency(val),
              type: context.currency(),
              items: const [
                Currency.RUB,
                Currency.USD,
                Currency.EUR,
              ],
            ),
          ],
        ),
      ),
    );
  }
}

extension BlocExt on BuildContext {
  onChangeCurrency(Currency currency) {
    read<AccountInputBloc>()
        .add(AccountInputEvent.changeCurrency(currency: currency));
  }

  onChangeIsDebt(bool isDebt) {
    read<AccountInputBloc>()
        .add(AccountInputEvent.changeIsDebt(isDebt: isDebt));
  }

  onChangeTitle(String title) {
    read<AccountInputBloc>().add(AccountInputEvent.changeTitle(title: title));
  }

  Currency currency() => select<AccountInputBloc, Currency>(
        (bloc) => bloc.state.currency,
      );

  bool isDebt() => select<AccountInputBloc, bool>(
        (bloc) => bloc.state.isDebt,
      );

  onSave() => read<AccountInputBloc>().add(const AccountInputEvent.save());
}
