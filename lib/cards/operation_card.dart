import 'package:cashflow/cards/item_card.dart';
import 'package:cashflow/data/database.dart';
import 'package:cashflow/data/model.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/dropdown_list.dart';
import 'package:cashflow/widgets/operation_type_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OperationCard extends StatefulWidget {
  final OperationItem operation;

  const OperationCard({Key key, this.operation}) : super(key: key);

  @override
  _OperationCardState createState() => _OperationCardState();
}

class _OperationCardState extends State<OperationCard> {
  int _id;
  OperationType _type;
  DateTime _date;
  TimeOfDay _time;
  AccountData _account;
  CategoryData _category;
  AccountData _recAccount;
  TextEditingController _sumController = TextEditingController();

  Model model;
  List<AccountData> accountList;
  List<CategoryData> categoryInList;
  List<CategoryData> categoryOutList;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    model = Provider.of<Model>(context);

    model.watchAllAccounts().forEach((list) {
      setState(() {
        accountList = list;
      });
    });

    model.watchAllCategoriesByType(OperationType.INPUT).forEach((list) {
      setState(() {
        categoryInList = list;
      });
    });

    model.watchAllCategoriesByType(OperationType.OUTPUT).forEach((list) {
      setState(() {
        categoryOutList = list;
      });
    });
  }

  @override
  void initState() {
    super.initState();

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
            hint: AppLocalizations.of(context).hintCategory,
            onChange: (CategoryData newValue) {
              setState(() {
                _category = newValue;
              });
            },
            items: categoryInList,
            getListItem: (item) => ListTile(title: Text(item.title)));
      case OperationType.OUTPUT:
        return DropdownList<CategoryData>(
            value: _category,
            hint: AppLocalizations.of(context).hintCategory,
            onChange: (CategoryData newValue) {
              setState(() {
                _category = newValue;
              });
            },
            items: categoryOutList,
            getListItem: (item) => ListTile(title: Text(item.title)));
      case OperationType.TRANSFER:
        return DropdownList<AccountData>(
            value: _recAccount,
            hint: AppLocalizations.of(context).hintAccount,
            onChange: (AccountData newValue) {
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

  void _saveOperation(BuildContext context) {
    _date =
        DateTime(_date.year, _date.month, _date.day, _time.hour, _time.minute);
    if (_type == OperationType.TRANSFER) {
      OperationData operation = OperationData(
          id: _id,
          date: _date,
          operationType: _type,
          account: _account.id,
          recAccount: _recAccount.id,
          sum: int.parse(_sumController.text));

      Provider.of<Model>(context, listen: false).insertOperation(operation);
    } else {
      OperationData operation = OperationData(
          id: _id,
          date: _date,
          operationType: _type,
          account: _account.id,
          category: _category.id,
          sum: int.parse(_sumController.text));

      Provider.of<Model>(context, listen: false).insertOperation(operation);
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

  @override
  Widget build(BuildContext context) {
    return ItemCard(
      title: widget.operation == null
          ? AppLocalizations.of(context).newOperationCardTitle
          : AppLocalizations.of(context).operationCardTitle,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            title(AppLocalizations.of(context).titleDate),
            Row(
              children: <Widget>[
                dateButtom(Icons.calendar_today,
                    DateFormat.yMMMd(Localizations.localeOf(context).languageCode).format(_date), _selectDate),
                SizedBox(
                  width: 16.0,
                ),
                dateButtom(
                    Icons.access_time, _time.format(context), _selectTime),
              ],
            ),
            title(AppLocalizations.of(context).titleType),
            Row(
              children: <Widget>[
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
              ],
            ),
            title(AppLocalizations.of(context).titleAccount),
            DropdownList(
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
            AnalyticMenu(),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextFormField(
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
      onSave: (context) {
        _saveOperation(context);
      },
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
}
