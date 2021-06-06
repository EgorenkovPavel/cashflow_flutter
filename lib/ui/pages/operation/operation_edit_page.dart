import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/data/repository.dart';
import 'package:money_tracker/domain/models/account.dart';
import 'package:money_tracker/domain/models/category.dart';
import 'package:money_tracker/domain/models/operation.dart';
import 'package:money_tracker/domain/models/operation_type.dart';
import 'package:money_tracker/ui/widgets/dropdown_list.dart';
import 'package:money_tracker/ui/widgets/operation_type_radio_button.dart';
import 'package:money_tracker/utils/app_localization.dart';
import 'package:provider/provider.dart';

class OperationEditPage extends StatefulWidget {
  static const routeName = '/operation';

  static Future open(BuildContext context, int operationId) async {
    await Navigator.of(context)
        .pushNamed(OperationEditPage.routeName, arguments: operationId);
  }

  final int id;

  const OperationEditPage({Key? key, required this.id}) : super(key: key);

  @override
  _OperationEditPageState createState() => _OperationEditPageState();
}

class _OperationEditPageState extends State<OperationEditPage> {
  final _formKey = GlobalKey<FormState>();

  late OperationType _type;
  DateTime _date = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();
  late Account _account;
  Category? _category;
  Account? _recAccount;
  final TextEditingController _sumController = TextEditingController();
  late StreamSubscription<Operation> subscription;

  late Repository model;
  late List<Account> accountList;
  late List<Category> categoryInList;
  late List<Category> categoryOutList;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    model = Provider.of<Repository>(context);

    model.watchAllAccounts().forEach((list) {
      setState(() {
        accountList = list;
      });
    });

    model
        .watchAllCategoriesByType(OperationType.INPUT)
        .forEach((list) {
      setState(() {
        categoryInList = list;
      });
    });

    model
        .watchAllCategoriesByType(OperationType.OUTPUT)
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
                      if (newValue != null) {
                        setState(() {
                          _account = newValue;
                        });
                      }
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
                ]),
          ),
        ),
        persistentFooterButtons: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(AppLocalizations.of(context).cancel.toUpperCase()),
          ),
          ElevatedButton(
            // style: ElevatedButton.styleFrom(
            //     primary: Theme.of(context).primaryColor),
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

  Widget title(String text) {
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
              if(newValue != null) {
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
      var operation = Operation(
          id: widget.id,
          date: _date,
          type: _type,
          account: _account,
          recAccount: _recAccount,
          sum: int.parse(_sumController.text));

      await Provider.of<Repository>(context, listen: false)
          .insertOperation(operation);
    } else {
      var operation = Operation(
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

  Widget dateButtom(IconData icon, String text, Function() onPressed) {

    return ElevatedButton(onPressed: onPressed,
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            //color: color,
          ),
          Text(
            text,
            //style: TextStyle(color: color),
          ),
        ],
      ),
    );
  }
}
