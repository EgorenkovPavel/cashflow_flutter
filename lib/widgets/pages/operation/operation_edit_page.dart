import 'dart:async';

import 'package:cashflow/data/objects/account.dart';
import 'package:cashflow/data/objects/category.dart';
import 'package:cashflow/data/objects/operation.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/dropdown_list.dart';
import 'package:cashflow/widgets/operation_type_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OperationEditPage extends StatefulWidget {
  static const routeName = '/operation';

  static open(BuildContext context, int operationId) {
    Navigator.of(context)
        .pushNamed(OperationEditPage.routeName, arguments: operationId);
  }

  final int id;

  const OperationEditPage({Key key, this.id}) : super(key: key);

  @override
  _OperationEditPageState createState() => _OperationEditPageState();
}

class _OperationEditPageState extends State<OperationEditPage> {
  final _formKey = GlobalKey<FormState>();

  OperationType _type;
  DateTime _date = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();
  Account _account;
  Category _category;
  Account _recAccount;
  TextEditingController _sumController = TextEditingController();
  StreamSubscription<Operation> subscription;

  Repository model;
  List<Account> accountList;
  List<Category> categoryInList;
  List<Category> categoryOutList;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    model = Provider.of<Repository>(context);

    model.watchAllAccounts(archive: true).forEach((list) {
      setState(() {
        accountList = list;
      });
    });

    model
        .watchAllCategoriesByType(OperationType.INPUT, archive: true)
        .forEach((list) {
      setState(() {
        categoryInList = list;
      });
    });

    model
        .watchAllCategoriesByType(OperationType.OUTPUT, archive: true)
        .forEach((list) {
      setState(() {
        categoryOutList = list;
      });
    });
  }

  @override
  void initState() {
    super.initState();

    subscription = Provider.of<Repository>(context, listen: false)
        .getOperationById(widget.id)
        .listen((Operation data) {
      setState(() {
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
    subscription.cancel();
    _sumController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
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
                  title(AppLocalizations.of(context).titleDate),
                  Row(
                    children: <Widget>[
                      dateButtom(
                          Icons.calendar_today,
                          DateFormat.yMMMd(
                                  Localizations.localeOf(context).languageCode)
                              .format(_date),
                          _selectDate),
                      SizedBox(
                        width: 16.0,
                      ),
                      dateButtom(Icons.access_time, _time.format(context),
                          _selectTime),
                    ],
                  ),
                  title(AppLocalizations.of(context).titleType),
                  OperationTypeRadioButton(
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
                  title(AppLocalizations.of(context).titleAccount),
                  DropdownList<Account>(
                    value: _account,
                    hint: AppLocalizations.of(context).hintAccount,
                    items: accountList,
                    onChange: (newValue) {
                      setState(() {
                        _account = newValue;
                      });
                    },
                    getListItem: (data) => ListTile(title: Text(data.title)),
                  ),
                  title(AppLocalizations.of(context).titleAnalytic),
                  analyticMenu(),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _sumController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: AppLocalizations.of(context).titleSum,
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return AppLocalizations.of(context).emptySumError;
                        }
                        return null;
                      },
                    ),
                  )
                ]),
          ),
        ),
        persistentFooterButtons: <Widget>[
          FlatButton(
            child: Text(AppLocalizations.of(context).cancel.toUpperCase()),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          RaisedButton(
            child: Text(
              AppLocalizations.of(context).save.toUpperCase(),
              style: TextStyle(color: Colors.white),
            ),
            color: Theme.of(context).primaryColor,
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _saveOperation(context);
                Navigator.pop(context);
              }
            },
          )
        ],
      ),
    );
  }

  Padding title(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0, top: 8.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }

  Widget analyticMenu() {
    switch (_type) {
      case OperationType.INPUT:
        return DropdownList<Category>(
            value: _category,
            hint: AppLocalizations.of(context).hintCategory,
            onChange: (Category newValue) {
              setState(() {
                _category = newValue;
              });
            },
            items: categoryInList,
            getListItem: (item) => ListTile(title: Text(item.title)));
      case OperationType.OUTPUT:
        return DropdownList<Category>(
            value: _category,
            hint: AppLocalizations.of(context).hintCategory,
            onChange: (Category newValue) {
              setState(() {
                _category = newValue;
              });
            },
            items: categoryOutList,
            getListItem: (item) => ListTile(title: Text(item.title)));
      case OperationType.TRANSFER:
        return DropdownList<Account>(
            value: _recAccount,
            hint: AppLocalizations.of(context).hintAccount,
            onChange: (Account newValue) {
              setState(() {
                _recAccount = newValue;
              });
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
      Operation operation = Operation(
          id: widget.id,
          date: _date,
          type: _type,
          account: _account,
          recAccount: _recAccount,
          sum: int.parse(_sumController.text));

      await Provider.of<Repository>(context, listen: false)
          .insertOperation(operation);
    } else {
      Operation operation = Operation(
          id: widget.id,
          date: _date,
          type: _type,
          account: _account,
          category: _category,
          sum: int.parse(_sumController.text));

      await Provider.of<Repository>(context, listen: false)
          .insertOperation(operation);
    }
  }

  void _selectDate() async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _date)
      setState(() {
        _date = picked;
      });
  }

  void _selectTime() async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: _time);
    if (picked != null && picked != _time)
      setState(() {
        _time = picked;
      });
  }

  Widget dateButtom(IconData icon, String text, Function() onPressed) {
    final color = Theme.of(context).primaryColor;

    return FlatButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: BorderSide(color: color)),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: color,
          ),
          Text(
            text,
            style: TextStyle(color: color),
          ),
        ],
      ),
      onPressed: onPressed,
    );
  }
}
