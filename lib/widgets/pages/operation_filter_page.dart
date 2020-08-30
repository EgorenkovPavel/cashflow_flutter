import 'package:cashflow/data/objects/account.dart';
import 'package:cashflow/data/objects/category.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/dropdown_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OperationFilterPage extends StatefulWidget {
  static const routeName = '/operationFilter';

  OperationFilterPage({Key key, this.filter}) : super(key: key);

  static Future<OperationFilter> open(BuildContext context, OperationFilter filter) async {
    return await Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => OperationFilterPage(filter: filter))
    );
  }

  final OperationFilter filter;

  @override
  _OperationFilterPageState createState() => _OperationFilterPageState();
}

class _OperationFilterPageState extends State<OperationFilterPage> {

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).titleFilters),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: <Widget>[
              Wrap(
                children: <Widget>[
                  if (widget.filter.date != null)
                    InputChip(
                      label: Text(
                          '${DateFormat.yMMMd(Localizations.localeOf(context).languageCode).format(widget.filter.date.start)} - ${DateFormat.yMMMd(Localizations.localeOf(context).languageCode).format(widget.filter.date.end)}'),
                      deleteIcon: Icon(Icons.cancel),
                      onDeleted: () {
                        setState(() {
                          widget.filter.date = null;
                        });
                      },
                    ),
                  for (var account in widget.filter.accounts)
                    InputChip(
                      label: Text(account.title),
                      deleteIcon: Icon(Icons.cancel),
                      onDeleted: () {
                        setState(() {
                          widget.filter.accounts.remove(account);
                        });
                      },
                    ),
                  for (var category in widget.filter.categories)
                    InputChip(
                      label: Text(category.title),
                      deleteIcon: Icon(Icons.cancel),
                      onDeleted: () {
                        setState(() {
                          widget.filter.categories.remove(category);
                        });
                      },
                    ),
                ],
              ),
              OutlineButton(
                child: Text('Choose period'),
                onPressed: () async {
                  DateTimeRange date = await showDateRangePicker(
                      context: context,
                      firstDate: DateTime(2020), //TODO
                      lastDate: DateTime.now());
                  setState(() {
                    widget.filter.date = date;
                  });
                },
              ),
              SizedBox(height: 8.0,),
              DropdownList<Account>(
                value: null,
                hint: AppLocalizations.of(context).hintAccount,
                onChange: (Account newValue) {
                  setState(() {
                    widget.filter.accounts.add(newValue);
                  });
                },
                items: accountList,
                getListItem: (item) => ListTile(title: Text(item.title)),
              ),
              SizedBox(height: 16.0,),
              DropdownList<Category>(
                value: null,
                hint: AppLocalizations.of(context).hintCategory,
                onChange: (Category newValue) {
                  setState(() {
                    widget.filter.categories.add(newValue);
                  });
                },
                items: categoryInList,
                getListItem: (item) => ListTile(title: Text(item.title)),
              ),
              SizedBox(height: 16.0,),
              DropdownList<Category>(
                value: null,
                hint: AppLocalizations.of(context).hintCategory,
                onChange: (Category newValue) {
                  setState(() {
                    widget.filter.categories.add(newValue);
                  });
                },
                items: categoryOutList,
                getListItem: (item) => ListTile(title: Text(item.title)),
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        FlatButton(
          child: Text(AppLocalizations.of(context).reset.toUpperCase()),
          onPressed: (){
            widget.filter.reset();
            Navigator.pop(context, widget.filter);
          },
        ),
        RaisedButton(
          child: Text(AppLocalizations.of(context).apply.toUpperCase(),
            style: TextStyle(color: Colors.white),
          ),
          color: Theme.of(context).primaryColor,
          onPressed: (){
            Navigator.pop(context, widget.filter);
          },
        ),
      ],
    );
  }
}

class OperationFilter {
  DateTimeRange date;
  final Set<Account> accounts = {};
  final Set<Category> categories = {};

  void reset(){
    date = null;
    accounts.clear();
    categories.clear();
  }
}
