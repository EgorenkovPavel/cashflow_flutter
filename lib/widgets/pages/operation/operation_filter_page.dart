import 'package:cashflow/data/objects/account.dart';
import 'package:cashflow/data/objects/category.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OperationFilterPage extends StatefulWidget {
  static const routeName = '/operationFilter';

  OperationFilterPage({Key key, this.filter}) : super(key: key);

  static Future<OperationFilter> open(
      BuildContext context, OperationFilter filter) async {
    return await Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) =>
            OperationFilterPage(filter: filter)));
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

  Widget _periodChoise(OperationFilter filter) {
    if (filter?.date != null) {
      return InputChip(
        label: Text(
            '${DateFormat.yMMMd(Localizations.localeOf(context).languageCode).format(widget.filter.date.start)} - ${DateFormat.yMMMd(Localizations.localeOf(context).languageCode).format(widget.filter.date.end)}'),
        deleteIcon: Icon(Icons.cancel),
        onDeleted: () {
          setState(() {
            widget.filter.date = null;
          });
        },
      );
    } else {
      return InputChip(
        avatar: Icon(Icons.mode_edit),
        label: Text('Choose period'),
        onPressed: () async {
          var date = await showDateRangePicker(
              context: context,
              firstDate: DateTime(2020), //TODO
              lastDate: DateTime.now());
          setState(() {
            widget.filter.date = date;
          });
        },
      );
    }
  }

  RelativeRect buttonMenuPosition(BuildContext c) {
    final RenderBox bar = c.findRenderObject();
    final RenderBox overlay = Overlay.of(c).context.findRenderObject();
    final position = RelativeRect.fromRect(
      Rect.fromPoints(
        bar.localToGlobal(bar.size.bottomLeft(Offset.zero), ancestor: overlay),
        bar.localToGlobal(bar.size.bottomRight(Offset.zero), ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );
    return position;
  }

  @override
  Widget build(BuildContext context) {
    final _accountKey = GlobalKey<State<OperationFilterPage>>();
    final _categoryInKey = GlobalKey<State<OperationFilterPage>>();
    final _categoryOutKey = GlobalKey<State<OperationFilterPage>>();


    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).titleFilters),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 8.0,
              ),
              Text('Period'),
              _periodChoise(widget.filter),
              SizedBox(
                height: 8.0,
              ),
              Text('Accounts'),
              InputChip(
                key: _accountKey,
                avatar: Icon(Icons.mode_edit),
                label: Text('Choose account'),
                onPressed: () async {
                  final result = await showMenu<Account>(
                      context: context,
                      position: buttonMenuPosition(_accountKey.currentContext),
                      items: accountList
                          .map((a) => PopupMenuItem<Account>(
                                value: a,
                                child: Text(a.title),
                              ))
                          .toList());
                  if (result != null) {
                    setState(() {
                      widget.filter.accounts.add(result);
                    });
                  }
                },
              ),
              Wrap(
                children: [
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
                ],
              ),
              SizedBox(
                height: 8.0,
              ),
              Text('Input categories'),
              InputChip(
                key: _categoryInKey,
                avatar: Icon(Icons.mode_edit),
                label: Text('Choose category'),
                onPressed: () async {
                  final result = await showMenu<Category>(
                      context: context,
                      position: buttonMenuPosition(_categoryInKey.currentContext),
                      items: categoryInList
                          .map((c) => PopupMenuItem<Category>(
                        value: c,
                        child: Text(c.title),
                      ))
                          .toList());
                  if (result != null) {
                    setState(() {
                      widget.filter.categories.add(result);
                    });
                  }
                },
              ),
              Wrap(
                  children: widget.filter.categories
                      .where((element) => element.type == OperationType.INPUT)
                      .map(
                        (category) => InputChip(
                          label: Text(category.title),
                          deleteIcon: Icon(Icons.cancel),
                          onDeleted: () {
                            setState(() {
                              widget.filter.categories.remove(category);
                            });
                          },
                        ),
                      )
                      .toList()),
              SizedBox(
                height: 8.0,
              ),
              Text('Output categories'),
              InputChip(
                key: _categoryOutKey,
                avatar: Icon(Icons.mode_edit),
                label: Text('Choose category'),
                onPressed: () async {
                  final result = await showMenu<Category>(
                      context: context,
                      position: buttonMenuPosition(_categoryOutKey.currentContext),
                      items: categoryOutList
                          .map((c) => PopupMenuItem<Category>(
                        value: c,
                        child: Text(c.title),
                      ))
                          .toList());
                  if (result != null) {
                    setState(() {
                      widget.filter.categories.add(result);
                    });
                  }
                },
              ),
              Wrap(
                  children: widget.filter.categories
                      .where((element) => element.type == OperationType.OUTPUT)
                      .map(
                        (category) => InputChip(
                          label: Text(category.title),
                          deleteIcon: Icon(Icons.cancel),
                          onDeleted: () {
                            setState(() {
                              widget.filter.categories.remove(category);
                            });
                          },
                        ),
                      )
                      .toList()),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        TextButton(
          onPressed: () {
            widget.filter.reset();
            Navigator.pop(context, widget.filter);
          },
          child: Text(AppLocalizations.of(context).reset.toUpperCase()),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
          onPressed: () =>
            Navigator.pop(context, widget.filter),
          child: Text(
            AppLocalizations.of(context).apply.toUpperCase(),
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class OperationFilter {
  DateTimeRange date;
  final Set<Account> accounts = {};
  final Set<Category> categories = {};

  void reset() {
    date = null;
    accounts.clear();
    categories.clear();
  }
}
