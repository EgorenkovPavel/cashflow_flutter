import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/domain/interfaces/data_repository.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/ui/pages/operation/edit_page/operation_edit_bloc.dart';
import 'package:money_tracker/ui/widgets/dropdown_list.dart';
import 'package:money_tracker/ui/widgets/type_radio_button.dart';
import 'package:money_tracker/utils/app_localization.dart';

class OperationEditPage extends StatelessWidget {
  final int id;

  const OperationEditPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          OperationEditBloc(context.read<DataRepository>())..add(Fetch(id)),
      child: _OperationEditPage(),
    );
  }
}

class _OperationEditPage extends StatefulWidget {
  @override
  _OperationEditPageState createState() => _OperationEditPageState();
}

class _OperationEditPageState extends State<_OperationEditPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _sumController = TextEditingController();

  @override
  void dispose() {
    _sumController.dispose();
    super.dispose();
  }

  void _listenState(BuildContext context, OperationEditState state) {
    if (state is FetchOperation) {
      _sumController.text = state.sum.toString();
    } else if (state is Saved) {
      Navigator.of(context).pop();
    }
  }

  void _onChangeAccount(Account? newValue) {
    if (newValue != null) {
      context.read<OperationEditBloc>().add(ChangeAccount(newValue));
    }
  }

  String? _sumValidator(String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context).emptySumError;
    }

    return null;
  }

  void _onSavePressed(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<OperationEditBloc>().add(Save());
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
            title: Text(AppLocalizations.of(context).operationCardTitle),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Title(text: 'Cloud ID'),
                  Text(context.select<OperationEditBloc, String>(
                      (bloc) => bloc.state.operation.cloudId)),
                  Title(text: AppLocalizations.of(context).titleDate),
                  Row(
                    children: <Widget>[
                      DateButton(
                        icon: Icons.calendar_today,
                        text: DateFormat.yMMMd(
                          Localizations.localeOf(context).languageCode,
                        ).format(context.select<OperationEditBloc, DateTime>(
                          (bloc) => bloc.state.date,
                        )),
                        onPressed: _selectDate,
                      ),
                      const SizedBox(width: 16.0),
                      DateButton(
                        icon: Icons.access_time,
                        text: context
                            .select<OperationEditBloc, TimeOfDay>(
                              (bloc) => bloc.state.time,
                            )
                            .format(context),
                        onPressed: _selectTime,
                      ),
                    ],
                  ),
                  Title(text: AppLocalizations.of(context).titleType),
                  TypeRadioButton<OperationType>(
                    type: context.select<OperationEditBloc, OperationType>(
                      (bloc) => bloc.state.operationType,
                    ),
                    onChange: (newValue) => context
                        .read<OperationEditBloc>()
                        .add(ChangeOperationType(newValue)),
                    items: const [
                      OperationType.INPUT,
                      OperationType.OUTPUT,
                      OperationType.TRANSFER,
                    ],
                  ),
                  Title(text: AppLocalizations.of(context).titleAccount),
                  DropdownList<Account>(
                    value: context.select<OperationEditBloc, Account>(
                      (bloc) => bloc.state.account,
                    ),
                    hint: AppLocalizations.of(context).hintAccount,
                    items: context.select<OperationEditBloc, List<Account>>(
                      (bloc) => bloc.state.accounts,
                    ),
                    onChange: _onChangeAccount,
                    getListItem: (data) => ListTile(title: Text(data.title)),
                  ),
                  Title(text: AppLocalizations.of(context).titleAnalytic),
                  analyticMenu(),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _sumController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: AppLocalizations.of(context).titleSum,
                      ),
                      onChanged: (value) => context
                          .read<OperationEditBloc>()
                          .add(ChangeSum(int.parse(value))),
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
              child: Text(AppLocalizations.of(context).cancel.toUpperCase()),
            ),
            ElevatedButton(
              onPressed: () => _onSavePressed(context),
              child: Text(AppLocalizations.of(context).save.toUpperCase()),
            ),
          ],
        ),
      ),
    );
  }

  void _onCategoryChange(Category? newValue) {
    if (newValue != null) {
      context.read<OperationEditBloc>().add(ChangeCategory(newValue));
    }
  }

  void _onRecAccountChange(Account? newValue) {
    if (newValue != null) {
      context.read<OperationEditBloc>().add(ChangeRecAccount(newValue));
    }
  }

  Widget analyticMenu() {
    return BlocBuilder<OperationEditBloc, OperationEditState>(
      builder: (context, state) {
        switch (state.operationType) {
          case OperationType.INPUT:
            return DropdownList<Category>(
              value: state.category,
              hint: AppLocalizations.of(context).hintCategory,
              onChange: _onCategoryChange,
              items: state.inCategories,
              getListItem: (item) => ListTile(title: Text(item.title)),
            );
          case OperationType.OUTPUT:
            return DropdownList<Category>(
              value: state.category,
              hint: AppLocalizations.of(context).hintCategory,
              onChange: _onCategoryChange,
              items: state.outCategories,
              getListItem: (item) => ListTile(title: Text(item.title)),
            );
          case OperationType.TRANSFER:
            return DropdownList<Account>(
              value: state.recAccount,
              hint: AppLocalizations.of(context).hintAccount,
              onChange: _onRecAccountChange,
              items: state.accounts,
              getListItem: (item) => ListTile(title: Text(item.title)),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }

  void _selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: context.read<OperationEditBloc>().state.date,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      context.read<OperationEditBloc>().add(ChangeDate(picked));
    }
  }

  void _selectTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: context.read<OperationEditBloc>().state.time,
    );
    if (picked != null) {
      context.read<OperationEditBloc>().add(ChangeTime(picked));
    }
  }
}

class DateButton extends StatelessWidget {
  const DateButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

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
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0, top: 8.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }
}
