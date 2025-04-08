import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/src/injection_container.dart';
import 'package:money_tracker/src/ui/blocs/account_balance_bloc.dart';
import 'package:money_tracker/src/ui/blocs/category_cashflow_bloc.dart';
import 'package:money_tracker/src/ui/pages/operation/edit_page/operation_edit_bloc.dart';
import 'package:money_tracker/src/ui/widgets/currency_menu.dart';
import 'package:money_tracker/src/ui/widgets/dropdown_list.dart';
import 'package:money_tracker/src/ui/widgets/type_radio_button.dart';
import 'package:money_tracker/src/utils/extensions.dart';

import '../../../../domain/view_models.dart';

class OperationEditPage extends StatelessWidget {
  final int? id;

  const OperationEditPage.input({super.key}) : id = null;

  const OperationEditPage.edit(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = sl<OperationEditBloc>();
    if (id != null) {
      bloc.add(OperationEditEvent.fetch(operationId: id!));
    }

    return BlocProvider(
      create: (context) => bloc,
      child: _OperationEditPage(
        isNew: id == null,
      ),
    );
  }
}

class _OperationEditPage extends StatefulWidget {
  final bool isNew;

  const _OperationEditPage({required this.isNew});

  @override
  _OperationEditPageState createState() => _OperationEditPageState();
}

class _OperationEditPageState extends State<_OperationEditPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _sumController = TextEditingController();
  final TextEditingController _recSumController = TextEditingController();

  @override
  void dispose() {
    _sumController.dispose();
    _recSumController.dispose();
    super.dispose();
  }

  void _listenState(BuildContext context, OperationEditState state) {
    if (_sumController.text != state.sum.sum.toString()) {
      _sumController.text = state.sum.sum.toString();
    }
    if (_recSumController.text != state.recSum.sum.toString()) {
      _recSumController.text = state.recSum.sum.toString();
    }
    if (state.isSaved) {
      Navigator.of(context).pop();
    }
  }

  String? _sumValidator(String? value) {
    if (value == null || value.isEmpty) {
      return context.loc.emptySumError;
    }

    return null;
  }

  void _onSavePressed(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<OperationEditBloc>().add(const OperationEditEvent.save());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OperationEditBloc, OperationEditState>(
      listener: _listenState,
      child: Form(
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(
            title: Text(context.loc.operationCardTitle),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Title(text: 'Cloud ID ${context.cloudId()}'),
                  Title(text: context.loc.titleDate),
                  Row(
                    children: <Widget>[
                      DateButton(
                        icon: Icons.calendar_today,
                        text: context.date(),
                        onPressed: context.selectDate,
                      ),
                      const SizedBox(width: 16.0),
                      DateButton(
                        icon: Icons.access_time,
                        text: context.time(),
                        onPressed: context.selectTime,
                      ),
                    ],
                  ),
                  Title(text: context.loc.titleType),
                  TypeRadioButton<OperationType>(
                    type: context.operationType(),
                    onChange: context.onChangeOperationType,
                    items: OperationType.values,
                  ),
                  Title(text: context.loc.titleAccount),
                  DropdownList<AccountView>(
                    value: context.account(context.watchListItems()),
                    hint: context.loc.hintAccount,
                    items: context.watchListItems(),
                    onChange: context.onChangeAccount,
                    getListItem: (data) => ListTile(title: Text(data.title)),
                  ),
                  Title(text: context.loc.titleAnalytic),
                  context.operationType().map(
                        INPUT: () => DropdownList<CategoryView>(
                          value: context.category(context.watchInCategoryItems()),
                          hint: context.loc.hintCategory,
                          onChange: context.onCategoryChange,
                          items: context.watchInCategoryItems(),
                          getListItem: (item) =>
                              ListTile(title: Text(item.title)),
                        ),
                        OUTPUT: () => DropdownList<CategoryView>(
                          value: context.category(context.watchOutCategoryItems()),
                          hint: context.loc.hintCategory,
                          onChange: context.onCategoryChange,
                          items: context.watchOutCategoryItems(),
                          getListItem: (item) =>
                              ListTile(title: Text(item.title)),
                        ),
                        TRANSFER: () => DropdownList<AccountView>(
                          value: context.recAccount(context.watchListItems()),
                          hint: context.loc.hintAccount,
                          onChange: context.onRecAccountChange,
                          items: context.watchListItems(),
                          getListItem: (item) =>
                              ListTile(title: Text(item.title)),
                        ),
                      ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: _sumController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText:
                                '${context.loc.titleSum}, ${context.currencySent().symbol}',
                          ),
                          onChanged: context.onChangeSum,
                          validator: _sumValidator,
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      CurrencyMenu(
                          currency: context.currencySent(),
                          onChange: context.onChangeCurrency),
                    ],
                  ),
                  if (context.showRecSum())
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: _recSumController,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText:
                                    '${context.loc.titleSum}, ${context.currencyReceived().symbol}',
                              ),
                              onChanged: context.onChangeRecSum,
                              validator: _sumValidator,
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          CurrencyMenu(
                              currency: context.currencyReceived(),
                              onChange: context.onChangeRecCurrency),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          persistentFooterButtons: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(context.loc.cancel.toUpperCase()),
            ),
            ElevatedButton(
              onPressed: () => _onSavePressed(context),
              child: Text(context.loc.save.toUpperCase()),
            ),
          ],
        ),
      ),
    );
  }
}

class DateButton extends StatelessWidget {
  const DateButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  final IconData icon;
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        children: <Widget>[
          Icon(icon),
          const SizedBox(width: 4.0),
          Text(text),
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0, top: 8.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
