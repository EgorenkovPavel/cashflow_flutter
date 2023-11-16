import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/injection_container.dart';
import 'package:money_tracker/src/ui/blocs/account_balance_bloc.dart';
import 'package:money_tracker/src/ui/blocs/category_cashflow_bloc.dart';
import 'package:money_tracker/src/ui/pages/operation/edit_page/operation_edit_bloc.dart';
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

  const _OperationEditPage({super.key, required this.isNew});

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
    if (_sumController.text != state.sum.toString()) {
      _sumController.text = state.sum.toString();
    }
    if (_recSumController.text != state.recSum.toString()) {
      _recSumController.text = state.recSum.toString();
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
                  const Title(text: 'Cloud ID'), // TODO
                  Text(context.select<OperationEditBloc, String>(
                    (bloc) => bloc.state.operation?.cloudId ?? '',
                  )),
                  Title(text: context.loc.titleDate),
                  Row(
                    children: <Widget>[
                      DateButton(
                        icon: Icons.calendar_today,
                        text: context.date(),
                        onPressed: () => context.selectDate(),
                      ),
                      const SizedBox(width: 16.0),
                      DateButton(
                        icon: Icons.access_time,
                        text: context.time(),
                        onPressed: () => context.selectTime(),
                      ),
                    ],
                  ),
                  Title(text: context.loc.titleType),
                  TypeRadioButton<OperationType>(
                    type: context.operationType(),
                    onChange: (newValue) =>
                        context.onChangeOperationType(newValue),
                    items: const [
                      OperationType.INPUT,
                      OperationType.OUTPUT,
                      OperationType.TRANSFER,
                    ],
                  ),
                  Title(text: context.loc.titleAccount),
                  DropdownList<Account>(
                    value: context.account(),
                    hint: context.loc.hintAccount,
                    items: context.accounts(),
                    onChange: (newValue) => context.onChangeAccount(newValue),
                    getListItem: (data) => ListTile(title: Text(data.title)),
                  ),
                  Title(text: context.loc.titleAnalytic),
                  context.operationType().map(
                        INPUT: () => DropdownList<Category>(
                          value: context.category(),
                          hint: context.loc.hintCategory,
                          onChange: (newValue) =>
                              context.onCategoryChange(newValue),
                          items: context.inCategory(),
                          getListItem: (item) =>
                              ListTile(title: Text(item.title)),
                        ),
                        OUTPUT: () => DropdownList<Category>(
                          value: context.category(),
                          hint: context.loc.hintCategory,
                          onChange: (newValue) =>
                              context.onCategoryChange(newValue),
                          items: context.outCategory(),
                          getListItem: (item) =>
                              ListTile(title: Text(item.title)),
                        ),
                        TRANSFER: () => DropdownList<Account>(
                          value: context.recAccount(),
                          hint: context.loc.hintAccount,
                          onChange: (newValue) =>
                              context.onRecAccountChange(newValue),
                          items: context.accounts(),
                          getListItem: (item) =>
                              ListTile(title: Text(item.title)),
                        ),
                      ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _sumController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText:
                            '${context.loc.titleSum}, ${context.account()?.currency.symbol ?? ''}',
                      ),
                      onChanged: (value) => context.onChangeSum(value),
                      validator: _sumValidator,
                    ),
                  ),
                  if (context.showRecSum())
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _recSumController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText:
                              '${context.loc.titleSum}, ${context.recAccount()?.currency.symbol ?? ''}',
                        ),
                        onChanged: (value) => context.onChangeRecSum(value),
                        validator: _sumValidator,
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

extension BlocExt on BuildContext {
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

  Category? category() => select<OperationEditBloc, Category?>(
        (bloc) => bloc.state.category,
      );

  Account? recAccount() => select<OperationEditBloc, Account?>(
        (bloc) => bloc.state.recAccount,
      );

  Account? account() => select<OperationEditBloc, Account?>(
        (bloc) => bloc.state.account,
      );

  bool showRecSum() => select<OperationEditBloc, bool>((bloc) =>
      bloc.state.operationType == OperationType.TRANSFER &&
      bloc.state.account != null &&
      bloc.state.recAccount != null &&
      bloc.state.account!.currency != bloc.state.recAccount!.currency);

  List<Account> accounts() => select<AccountBalanceBloc, List<Account>>(
        (bloc) => bloc.state.accounts.map((a) => a.account).toList(),
      );

  List<Category> outCategory() => select<CategoryCashflowBloc, List<Category>>(
        (bloc) => bloc.state.categories
            .map((a) => a.category)
            .where((c) => c.operationType == OperationType.OUTPUT)
            .toList(),
      );

  List<Category> inCategory() => select<CategoryCashflowBloc, List<Category>>(
        (bloc) => bloc.state.categories
            .map((a) => a.category)
            .where((c) => c.operationType == OperationType.INPUT)
            .toList(),
      );

  void onChangeOperationType(newValue) =>
      read<OperationEditBloc>().add(OperationEditEvent.changeOperationType(
        operationType: newValue,
      ));

  void onChangeAccount(Account? newValue) {
    if (newValue != null) {
      _bloc().add(OperationEditEvent.changeAccount(account: newValue));
    }
  }

  void onChangeRecSum(String value) =>
      _bloc().add(OperationEditEvent.changeRecSum(sum: int.parse(value)));

  void onChangeSum(String value) =>
      _bloc().add(OperationEditEvent.changeSum(sum: int.parse(value)));

  void onRecAccountChange(Account? newValue) {
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
