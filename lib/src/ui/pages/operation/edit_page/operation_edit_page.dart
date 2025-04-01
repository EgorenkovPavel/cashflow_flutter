import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/injection_container.dart';
import 'package:money_tracker/src/ui/blocs/account_balance_bloc.dart';
import 'package:money_tracker/src/ui/blocs/category_cashflow_bloc.dart';
import 'package:money_tracker/src/ui/pages/operation/edit_page/operation_edit_bloc.dart';
import 'package:money_tracker/src/ui/widgets/currency_menu.dart';
import 'package:money_tracker/src/ui/widgets/dropdown_list.dart';
import 'package:money_tracker/src/ui/widgets/type_radio_button.dart';
import 'package:money_tracker/src/utils/extensions.dart';

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
                    items: const [
                      OperationType.INPUT,
                      OperationType.OUTPUT,
                      OperationType.TRANSFER,
                    ],
                  ),
                  Title(text: context.loc.titleAccount),
                  DropdownList<BaseAccountListItem>(
                    value: context.account(context.watchListItems()),
                    hint: context.loc.hintAccount,
                    items: context.watchListItems(),
                    onChange: context.onChangeAccount,
                    getListItem: (data) => ListTile(title: Text(data.title)),
                  ),
                  Title(text: context.loc.titleAnalytic),
                  context.operationType().map(
                        INPUT: () => DropdownList<Category>(
                          value: context.category(context.watchInCategories()),
                          //TODO
                          hint: context.loc.hintCategory,
                          onChange: context.onCategoryChange,
                          items: context.watchInCategories(),
                          getListItem: (item) =>
                              ListTile(title: Text(item.title)),
                        ),
                        OUTPUT: () => DropdownList<Category>(
                          value: context.category(context.watchOutCategories()),
                          hint: context.loc.hintCategory,
                          onChange: context.onCategoryChange,
                          items: context.watchOutCategories(),
                          getListItem: (item) =>
                              ListTile(title: Text(item.title)),
                        ),
                        TRANSFER: () => DropdownList<BaseAccountListItem>(
                          value: context.recAccount(context.watchListItems()),
                          hint: context.loc.hintAccount,
                          onChange: context.onRecAccountChange,
                          items: context.watchListItems(),
                          getListItem: (item) =>
                              ListTile(title: Text(item.title)),
                        ),
                      ),
                  SizedBox(height: 16.0),
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
                      SizedBox(width: 16.0),
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
                          SizedBox(width: 16.0),
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

extension OperationEditBlocExt on BuildContext {
  OperationEditBloc _bloc() => read<OperationEditBloc>();

  OperationType operationType() => select<OperationEditBloc, OperationType>(
        (bloc) => bloc.state.operationType,
      );

  String date() => DateFormat.yMMMd(
        Localizations.localeOf(this).languageCode,
      ).format(select<OperationEditBloc, DateTime>(
        (bloc) => bloc.state.date,
      ));

  String time() => select<OperationEditBloc, TimeOfDay>(
        (bloc) => bloc.state.time,
      ).format(this);

  Category? category(List<Category> categories) {
    final categoryId = select<OperationEditBloc, int?>(
      (bloc) => bloc.state.categoryId,
    );
    return categories.where((e) => e.id == categoryId).firstOrNull;
  }

  BaseAccountListItem? recAccount(List<BaseAccountListItem> accounts) {
    final accountId = select<OperationEditBloc, int?>(
      (bloc) => bloc.state.recAccountId,
    );
    return accounts.where((e) => e.id == accountId).firstOrNull;
  }

  BaseAccountListItem? account(List<BaseAccountListItem> accounts) {
    final accountId = select<OperationEditBloc, int?>(
      (bloc) => bloc.state.accountId,
    );
    return accounts.where((e) => e.id == accountId).firstOrNull;
  }

  Currency currencySent() => select<OperationEditBloc, Currency>(
        (bloc) => bloc.state.sum.currency,
      );

  Currency currencyReceived() => select<OperationEditBloc, Currency>(
        (bloc) => bloc.state.recSum.currency,
      );

  String cloudId() => select<OperationEditBloc, String>(
        (bloc) => bloc.state.operation?.cloudId ?? '',
      );

  bool showRecSum() => select<OperationEditBloc, bool>((bloc) =>
      bloc.state.operationType == OperationType.TRANSFER &&
      bloc.state.accountId != null &&
      bloc.state.recAccountId != null);

  void onChangeOperationType(newValue) =>
      read<OperationEditBloc>().add(OperationEditEvent.changeOperationType(
        operationType: newValue,
      ));

  void onChangeAccount(BaseAccountListItem? newValue) {
    if (newValue != null) {
      _bloc().add(OperationEditEvent.changeAccount(account: newValue));
    }
  }

  void onChangeRecSum(String value) =>
      _bloc().add(OperationEditEvent.changeRecSum(sum: int.parse(value)));

  void onChangeSum(String value) =>
      _bloc().add(OperationEditEvent.changeSum(sum: int.parse(value)));

  void onChangeCurrency(Currency currency) =>
      _bloc().add(OperationEditEvent.changeCurrency(currency: currency));

  void onChangeRecCurrency(Currency currency) =>
      _bloc().add(OperationEditEvent.changeRecCurrency(currency: currency));

  void onRecAccountChange(BaseAccountListItem? newValue) {
    if (newValue != null) {
      _bloc().add(OperationEditEvent.changeRecAccount(recAccount: newValue));
    }
  }

  void onCategoryChange(Category? newValue) {
    if (newValue != null) {
      _bloc().add(OperationEditEvent.changeCategory(category: newValue));
    }
  }

  void selectTime() async {
    final picked = await showTimePicker(
      context: this,
      initialTime: _bloc().state.time,
    );
    if (picked != null) {
      _bloc().add(OperationEditEvent.changeTime(time: picked));
    }
  }

  void selectDate() async {
    final picked = await showDatePicker(
      context: this,
      initialDate: _bloc().state.date,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      _bloc().add(OperationEditEvent.changeDate(date: picked));
    }
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
