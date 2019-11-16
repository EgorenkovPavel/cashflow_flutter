import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/data/database.dart';
import 'package:cashflow/widgets/dropdown_list.dart';
import 'package:cashflow/widgets/operation_type_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../data/model.dart';

class OperationPage extends StatefulWidget {
  static const routeName = '/operation';

  final OperationItem operation;

  const OperationPage({Key key, this.operation}) : super(key: key);

  @override
  _OperationPageState createState() => _OperationPageState();
}

class _OperationPageState extends State<OperationPage> {

  int _id;
  OperationType _type;
  DateTime _date;
  TimeOfDay _time;
  AccountData _account;
  CategoryData _category;
  AccountData _recAccount;
  TextEditingController _sumController = TextEditingController();

  List<AccountData> accountList;
  List<CategoryData> categoryInList;
  List<CategoryData> categoryOutList;

  @override
  void initState() {
    _id = widget.operation.operationData.id;
    _type = widget.operation.type;
    _date = widget.operation.date;
    _account = widget.operation.account;
    _category = widget.operation.category;
    _recAccount = widget.operation.recAccount;
    _sumController.text = widget.operation.sum.toString();

    _time = TimeOfDay.fromDateTime(_date);
  }

  Widget AnalyticMenu() {
    switch (_type) {
      case OperationType.INPUT:
        return DropdownList<CategoryData>(
            value: _category,
            hint: 'Choose Category',
            onChange: (CategoryData newValue) {
              setState(() {
                _category = newValue;
              });
            },
            items: categoryInList,
            getListItem: (item) =>
                ListTile(title: Text(item.title)));
      case OperationType.OUTPUT:
        return DropdownList<CategoryData>(
            value: _category,
            hint: 'Choose Category',
            onChange: (CategoryData newValue) {
              setState(() {
                _category = newValue;
              });
            },
            items: categoryOutList,
            getListItem: (item) =>
                ListTile(title: Text(item.title)));
      case OperationType.TRANSFER:
        return DropdownList<AccountData>(
            value: _recAccount,
            hint: 'Choose Account',
            onChange: (AccountData newValue) {
              setState(() {
                _recAccount = newValue;
              });
            },
            items: accountList,
            getListItem: (item) =>
                ListTile(title: Text(item.title)));
      default:
        return SizedBox();
    }
  }

  void _saveOperation(){
    _date = DateTime(_date.year, _date.month, _date.day, _time.hour, _time.minute);
    if (_type == OperationType.TRANSFER) {
      OperationData operation = OperationData(
        id: _id,
          date: _date,
          operationType: _type,
          account: _account.id,
          recAccount: _recAccount.id,
          sum: int.parse(_sumController.text));

      Provider.of<Model>(context).insertOperation(operation);
    } else {
      OperationData operation = OperationData(
          id: _id,
          date: _date,
          operationType: _type,
          account: _account.id,
          category: _category.id,
          sum: int.parse(_sumController.text));

      Provider.of<Model>(context).insertOperation(operation);
    }
    Navigator.pop(context);
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
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: _time
    );
    if (picked != null && picked != _time)
      setState(() {
        _time = picked;
      });
  }

  @override
  Widget build(BuildContext context) {

    Provider.of<Model>(context).watchAllAccounts().forEach((list) {
      setState(() {
        accountList = list;
      });
    });

    Provider.of<Model>(context)
        .watchAllCategoriesByType(OperationType.INPUT)
        .forEach((list) {
      setState(() {
        categoryInList = list;
      });
    });

    Provider.of<Model>(context)
        .watchAllCategoriesByType(OperationType.OUTPUT)
        .forEach((list) {
      setState(() {
        categoryOutList = list;
      });
    });

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.operation == null ? 'New operation' : 'Operation'),
          actions: <Widget>[
            FlatButton(
              child: Text('Save'),
              onPressed: _saveOperation,
            )
          ],
        ),
        body: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                FlatButton(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.calendar_today),
                      Text(DateFormat.yMMMd().format(_date)),
                    ],
                  ),
                  onPressed: _selectDate,
                ),
                FlatButton(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.access_time),
                      Text(_time.format(context)),
                    ],
                  ),
                  onPressed: _selectTime,
                ),
              ],
            ),
            OperationTypeRadioButton(
              type: _type,
              onChange: (newValue){
                setState(() {
                  _type = newValue;
                  _category = null;
                });
              },
              items: [OperationType.INPUT, OperationType.OUTPUT, OperationType.TRANSFER],
            ),
            DropdownList(
              value: _account,
              hint: 'Account',
              items: accountList,
              onChange: (newValue){
                setState(() {
                  _account = newValue;
                });
              },
              getListItem: (data)=>
                ListTile(title: Text(data.title)),
            ),
            AnalyticMenu(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _sumController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Sum',
                ),
              ),
            )
          ],
        )
    );
  }
}
