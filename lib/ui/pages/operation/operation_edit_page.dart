import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/data/local/local_source.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/ui/widgets/dropdown_list.dart';
import 'package:money_tracker/ui/widgets/type_radio_button.dart';
import 'package:money_tracker/utils/app_localization.dart';
import 'package:provider/provider.dart';

class OperationEditPage extends StatefulWidget {
  final int id;

  const OperationEditPage({Key? key, required this.id}) : super(key: key);

  @override
  _OperationEditPageState createState() => _OperationEditPageState();
}

class _OperationEditPageState extends State<OperationEditPage> {
  final _formKey = GlobalKey<FormState>();

  Operation? _operation;
  OperationType _type = OperationType.INPUT;
  DateTime _date = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();
  late Account _account;
  Category? _category;
  Account? _recAccount;
  final TextEditingController _sumController = TextEditingController();

  late LocalSource model;
  late List<Account> accountList;
  late List<Category> categoryInList;
  late List<Category> categoryOutList;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    model = Provider.of<LocalSource>(context);

    model.accounts.watchAll().forEach((list) {
      setState(() {
        accountList = list;
      });
    });

    model.categories.watchAllByType(OperationType.INPUT).forEach((list) {
      setState(() {
        categoryInList = list;
      });
    });

    model.categories.watchAllByType(OperationType.OUTPUT).forEach((list) {
      setState(() {
        categoryOutList = list;
      });
    });
  }

  @override
  void initState() {
    super.initState();

    Provider.of<LocalSource>(context, listen: false)
        .operations
        .getById(widget.id)
        .then((Operation data) {
      setState(() {
        _operation = data;
        _type = data.type;
        _date = data.date;
        _account = data.account;
        _category = data.category;
        _recAccount = data.recAccount;
        _sumController.text = data.sum.toString();

        _time = TimeOfDay.fromDateTime(_date);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _sumController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context).operationCardTitle,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Title(text: AppLocalizations.of(context).titleDate),
                Row(
                  children: <Widget>[
                    DateButton(
                        icon: Icons.calendar_today,
                        text: DateFormat.yMMMd(
                                Localizations.localeOf(context).languageCode)
                            .format(_date),
                        onPressed: _selectDate),
                    SizedBox(
                      width: 16.0,
                    ),
                    DateButton(
                        icon: Icons.access_time,
                        text: _time.format(context),
                        onPressed: _selectTime),
                  ],
                ),
                Title(text: AppLocalizations.of(context).titleType),
                TypeRadioButton<OperationType>(
                  type: _type,
                  onChange: (newValue) {
                    setState(() {
                      _type = newValue;
                      _category = null;
                    });
                  },
                  items: [
                    OperationType.INPUT,
                    OperationType.OUTPUT,
                    OperationType.TRANSFER
                  ],
                ),
                Title(text: AppLocalizations.of(context).titleAccount),
                DropdownList<Account>(
                  value: _account,
                  hint: AppLocalizations.of(context).hintAccount,
                  items: accountList,
                  onChange: (newValue) {
                    if (newValue != null) {
                      setState(() {
                        _account = newValue;
                      });
                    }
                  },
                  getListItem: (data) => ListTile(title: Text(data.title)),
                ),
                Title(text: AppLocalizations.of(context).titleAnalytic),
                analyticMenu(),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _sumController,
                    //style: ,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: AppLocalizations.of(context).titleSum,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context).emptySumError;
                      }
                      return null;
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        persistentFooterButtons: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              AppLocalizations.of(context).cancel.toUpperCase(),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _saveOperation(context);
                Navigator.pop(context);
              }
            },
            child: Text(
              AppLocalizations.of(context).save.toUpperCase(),
              //style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Widget analyticMenu() {
    switch (_type) {
      case OperationType.INPUT:
        return DropdownList<Category>(
            value: _category,
            hint: AppLocalizations.of(context).hintCategory,
            onChange: (Category? newValue) {
              if (newValue != null) {
                setState(() {
                  _category = newValue;
                });
              }
            },
            items: categoryInList,
            getListItem: (item) => ListTile(title: Text(item.title)));
      case OperationType.OUTPUT:
        return DropdownList<Category>(
            value: _category,
            hint: AppLocalizations.of(context).hintCategory,
            onChange: (Category? newValue) {
              if (newValue != null) {
                setState(() {
                  _category = newValue;
                });
              }
            },
            items: categoryOutList,
            getListItem: (item) => ListTile(title: Text(item.title)));
      case OperationType.TRANSFER:
        return DropdownList<Account>(
            value: _recAccount,
            hint: AppLocalizations.of(context).hintAccount,
            onChange: (Account? newValue) {
              if (newValue != null) {
                setState(() {
                  _recAccount = newValue;
                });
              }
            },
            items: accountList,
            getListItem: (item) => ListTile(title: Text(item.title)));
      default:
        return SizedBox();
    }
  }

  Future _saveOperation(BuildContext context) async {
    _date =
        DateTime(_date.year, _date.month, _date.day, _time.hour, _time.minute);
    if (_type == OperationType.TRANSFER) {
      var _newOperation = _operation!.copyWith(
        date: _date,
        type: _type,
        account: _account,
        category: null,
        recAccount: _recAccount,
        sum: int.parse(_sumController.text),
      );

      await Provider.of<LocalSource>(context, listen: false)
          .operations
          .insert(_newOperation);
    } else {
      var _newOperation = _operation!.copyWith(
        date: _date,
        type: _type,
        account: _account,
        category: _category,
        recAccount: null,
        sum: int.parse(_sumController.text),
      );

      await Provider.of<LocalSource>(context, listen: false)
          .operations
          .update(_newOperation);
    }
  }

  void _selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
      });
    }
  }

  void _selectTime() async {
    final picked = await showTimePicker(context: context, initialTime: _time);
    if (picked != null && picked != _time) {
      setState(() {
        _time = picked;
      });
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
          SizedBox(width: 4.0),
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
