import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/data/repository.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/ui/pages/operation/filter_page/operation_filter_page_bloc.dart';
import 'package:money_tracker/utils/app_localization.dart';
import 'package:provider/provider.dart';

class OperationFilterPage extends StatefulWidget {
  OperationFilterPage({Key? key, this.filter}) : super(key: key);

  final OperationListFilter? filter;

  @override
  _OperationFilterPageState createState() => _OperationFilterPageState();
}

class _OperationFilterPageState extends State<OperationFilterPage> {
  final _accountKey = GlobalKey<State<OperationFilterPage>>();
  final _categoryInKey = GlobalKey<State<OperationFilterPage>>();
  final _categoryOutKey = GlobalKey<State<OperationFilterPage>>();

  late OperationFilterPageBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = OperationFilterPageBloc(context.read<Repository>())
      ..init(
        widget.filter ?? OperationListFilter(),
      );
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  RelativeRect buttonMenuPosition(BuildContext c) {
    final bar = c.findRenderObject() as RenderBox;
    final overlay = Overlay.of(c)!.context.findRenderObject() as RenderBox;
    final position = RelativeRect.fromRect(
      Rect.fromPoints(
        bar.localToGlobal(bar.size.bottomLeft(Offset.zero), ancestor: overlay),
        bar.localToGlobal(bar.size.bottomRight(Offset.zero), ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );
    return position;
  }

  void _onAccountChipPressed() async {
    final result = await showMenu<Account>(
        context: context,
        position: buttonMenuPosition(_accountKey.currentContext!),
        items: _bloc.accountList
            .map((a) => PopupMenuItem<Account>(
                  value: a,
                  child: Text(a.title),
                ))
            .toList());
    if (result != null) {
      _bloc.addAccount(result);
    }
  }

  void _onCategoryInPressed() async {
    final result = await showMenu<Category>(
        context: context,
        position: buttonMenuPosition(_categoryInKey.currentContext!),
        items: _bloc.categoryInList
            .map(
              (c) => PopupMenuItem<Category>(
                value: c,
                child: Text(c.title),
              ),
            )
            .toList());
    if (result != null) {
      _bloc.addCategory(result);
    }
  }

  void _onCategoryOutPressed() async {
    final result = await showMenu<Category>(
        context: context,
        position: buttonMenuPosition(_categoryOutKey.currentContext!),
        items: _bloc.categoryOutList
            .map((c) => PopupMenuItem<Category>(
                  value: c,
                  child: Text(c.title),
                ))
            .toList());
    if (result != null) {
      _bloc.addCategory(result);
    }
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
          child: BlocBuilder<OperationFilterPageBloc, StateBloc>(
              bloc: _bloc,
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(AppLocalizations.of(context).period),
                    PeriodButton(
                      date: state.dateRange,
                      onPressed: (date) => _bloc.setPeriod(date),
                      onDelete: () => _bloc.clearPeriod(),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(AppLocalizations.of(context).accounts),
                    InputChip(
                        key: _accountKey,
                        avatar: Icon(Icons.mode_edit),
                        label: Text(AppLocalizations.of(context).chooseAccount),
                        onPressed: _onAccountChipPressed),
                    Wrap(
                      children: state.accounts
                          .map(
                            (account) => InputChip(
                              label: Text(account.title),
                              deleteIcon: Icon(Icons.cancel),
                              onDeleted: () => _bloc.removeAccount(account),
                            ),
                          )
                          .toList(),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(AppLocalizations.of(context).inputCategory),
                    InputChip(
                      key: _categoryInKey,
                      avatar: Icon(Icons.mode_edit),
                      label: Text(AppLocalizations.of(context).chooseCategory),
                      onPressed: _onCategoryInPressed,
                    ),
                    Wrap(
                        children: state.categoryIn
                            .map(
                              (category) => InputChip(
                                label: Text(category.title),
                                deleteIcon: Icon(Icons.cancel),
                                onDeleted: () => _bloc.removeCategory(category),
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
                      onPressed: _onCategoryOutPressed,
                    ),
                    Wrap(
                        children: state.categoryOut
                            .map(
                              (category) => InputChip(
                                label: Text(category.title),
                                deleteIcon: Icon(Icons.cancel),
                                onDeleted: () => _bloc.removeCategory(category),
                              ),
                            )
                            .toList()),
                  ],
                );
              }),
        ),
      ),
      persistentFooterButtons: [
        TextButton(
          onPressed: () => Navigator.pop(
            context,
            OperationListFilter(),
          ),
          child: Text(
            AppLocalizations.of(context).reset.toUpperCase(),
          ),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(
            context,
            _bloc.getFilter(),
          ),
          child: Text(
            AppLocalizations.of(context).apply.toUpperCase(),
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class PeriodButton extends StatelessWidget {
  final DateTimeRange? date;
  final void Function() onDelete;
  final void Function(DateTimeRange) onPressed;

  const PeriodButton(
      {Key? key, this.date, required this.onDelete, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (date != null) {
      var start = DateFormat.yMMMd(Localizations.localeOf(context).languageCode)
          .format(date!.start);
      var end = DateFormat.yMMMd(Localizations.localeOf(context).languageCode)
          .format(date!.end);
      return InputChip(
        label: Text('$start - $end'),
        deleteIcon: Icon(Icons.cancel),
        onDeleted: onDelete,
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
          if (date != null) {
            onPressed(date);
          }
        },
      );
    }
  }
}
