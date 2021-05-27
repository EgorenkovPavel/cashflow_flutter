import 'package:cashflow/data/objects/account.dart';
import 'package:cashflow/data/objects/category.dart';
import 'package:cashflow/data/objects/operation_list_filter.dart';
import 'package:cashflow/data/objects/operation_type.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OperationFilterPage extends StatefulWidget {
  static const routeName = '/operationFilter';

  OperationFilterPage({Key key, this.filter}) : super(key: key);

  static Future<OperationListFilter> open(
      BuildContext context, OperationListFilter filter) async {
    return await Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) =>
            OperationFilterPage(filter: filter)));
  }

  final OperationListFilter filter;

  @override
  _OperationFilterPageState createState() => _OperationFilterPageState();
}

class _OperationFilterPageState extends State<OperationFilterPage> {
  Repository model;
  List<Account> accountList;
  List<Category> categoryInList;
  List<Category> categoryOutList;
  OperationListFilter filter;

  @override
  void initState() {
    super.initState();
    filter = widget.filter;
  }

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

  Widget _periodChoise(OperationListFilter filter) {
    if (filter?.date != null) {
      return InputChip(
        label: Text(
            '${DateFormat.yMMMd(Localizations.localeOf(context).languageCode).format(widget.filter.date.start)} - ${DateFormat.yMMMd(Localizations.localeOf(context).languageCode).format(widget.filter.date.end)}'),
        deleteIcon: Icon(Icons.cancel),
        onDeleted: () {
          setState(() {
            filter = filter.copyWith(date: null);
          });
        },
      );
    } else {
      return InputChip(
        avatar: Icon(Icons.mode_edit),
        label: Text(AppLocalizations.of(context).choosePeriod),
        onPressed: () async {
          var date = await showDateRangePicker(
              context: context,
              firstDate: DateTime(2020), //TODO
              lastDate: DateTime.now());
          setState(() {
            filter = filter.copyWith(date: date);
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
              Text(AppLocalizations.of(context).period),
              _periodChoise(widget.filter),
              SizedBox(
                height: 8.0,
              ),
              Text(AppLocalizations.of(context).accounts),
              InputChip(
                key: _accountKey,
                avatar: Icon(Icons.mode_edit),
                label: Text(AppLocalizations.of(context).chooseAccount),
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
                      filter = filter.copyWith(accountsIds: filter.accountsIds..add(result.id));
                    });
                  }
                },
              ),
              Wrap(
                children: [
                  for (var account in widget.filter.accountsIds)
                    InputChip(
                      label: Text(accountList.firstWhere((element) => element.id == account).title),
                      deleteIcon: Icon(Icons.cancel),
                      onDeleted: () {
                        setState(() {
                          widget.filter.accountsIds.remove(account);
                        });
                      },
                    ),
                ],
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(AppLocalizations.of(context).inputCategory),
              InputChip(
                key: _categoryInKey,
                avatar: Icon(Icons.mode_edit),
                label: Text(AppLocalizations.of(context).chooseCategory),
                onPressed: () async {
                  final result = await showMenu<Category>(
                      context: context,
                      position:
                          buttonMenuPosition(_categoryInKey.currentContext),
                      items: categoryInList
                          .map((c) => PopupMenuItem<Category>(
                                value: c,
                                child: Text(c.title),
                              ))
                          .toList());
                  if (result != null) {
                    setState(() {
                      widget.filter.categoriesIds.add(result.id);
                    });
                  }
                },
              ),
              Wrap(
                  children: categoryInList
                      .where((element) => filter.categoriesIds.contains(element.id))
                      .map(
                        (category) => InputChip(
                          label: Text(category.title),
                          deleteIcon: Icon(Icons.cancel),
                          onDeleted: () {
                            setState(() {
                              widget.filter.categoriesIds.remove(category.id);
                            });
                          },
                        ),
                      )
                      .toList()),
              SizedBox(
                height: 8.0,
              ),
              Text(AppLocalizations.of(context).outputCategory),
              InputChip(
                key: _categoryOutKey,
                avatar: Icon(Icons.mode_edit),
                label: Text(AppLocalizations.of(context).chooseCategory),
                onPressed: () async {
                  final result = await showMenu<Category>(
                      context: context,
                      position:
                          buttonMenuPosition(_categoryOutKey.currentContext),
                      items: categoryOutList
                          .map((c) => PopupMenuItem<Category>(
                                value: c,
                                child: Text(c.title),
                              ))
                          .toList());
                  if (result != null) {
                    setState(() {
                      widget.filter.categoriesIds.add(result.id);
                    });
                  }
                },
              ),
              Wrap(
                  children: categoryOutList
                      .where((element) => filter.categoriesIds.contains(element.id))
                      .map(
                        (category) => InputChip(
                          label: Text(category.title),
                          deleteIcon: Icon(Icons.cancel),
                          onDeleted: () {
                            setState(() {
                              widget.filter.categoriesIds.remove(category.id);
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
            Navigator.pop(context, OperationListFilter());
          },
          child: Text(AppLocalizations.of(context).reset.toUpperCase()),
        ),
        ElevatedButton(
          style:
              ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
          onPressed: () => Navigator.pop(context, filter),
          child: Text(
            AppLocalizations.of(context).apply.toUpperCase(),
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}