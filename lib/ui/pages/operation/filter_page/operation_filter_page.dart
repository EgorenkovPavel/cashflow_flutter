import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/domain/interfaces/data_source.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/ui/pages/operation/filter_page/operation_filter_bloc.dart';
import 'package:money_tracker/utils/app_localization.dart';

class OperationFilterPage extends StatelessWidget {
  const OperationFilterPage({Key? key, this.filter}) : super(key: key);

  final OperationListFilter? filter;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OperationFilterBloc(context.read<DataSource>())
        ..add(Init(filter ?? OperationListFilter.empty())),
      child: _OperationFilterPage(),
    );
  }
}

class _OperationFilterPage extends StatefulWidget {
  @override
  _OperationFilterPageState createState() => _OperationFilterPageState();
}

class _OperationFilterPageState extends State<_OperationFilterPage> {
  final _accountKey = GlobalKey<State<_OperationFilterPage>>();
  final _categoryInKey = GlobalKey<State<_OperationFilterPage>>();
  final _categoryOutKey = GlobalKey<State<_OperationFilterPage>>();

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
        items: context
            .read<OperationFilterBloc>().state.accounts
            .map((a) => PopupMenuItem<Account>(
                  value: a,
                  child: Text(a.title),
                ))
            .toList());
    if (result != null) {
      context.read<OperationFilterBloc>().add(AddAccount(result));
    }
  }

  void _onCategoryInPressed() async {
    final result = await showMenu<Category>(
        context: context,
        position: buttonMenuPosition(_categoryInKey.currentContext!),
        items: context
            .read<OperationFilterBloc>().state.inCategories
            .map(
              (c) => PopupMenuItem<Category>(
                value: c,
                child: Text(c.title),
              ),
            )
            .toList());
    if (result != null) {
      context.read<OperationFilterBloc>().add(AddCategory(result));
    }
  }

  void _onCategoryOutPressed() async {
    final result = await showMenu<Category>(
        context: context,
        position: buttonMenuPosition(_categoryOutKey.currentContext!),
        items: context
            .read<OperationFilterBloc>().state.outCategories
            .map((c) => PopupMenuItem<Category>(
                  value: c,
                  child: Text(c.title),
                ))
            .toList());
    if (result != null) {
      context.read<OperationFilterBloc>().add(AddCategory(result));
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 8.0),
              Text(AppLocalizations.of(context).period),
              PeriodButton(
                date: context.select<OperationFilterBloc, DateTimeRange?>(
                    (bloc) => bloc.state.filter.period),
                onPressed: (date) =>
                    context.read<OperationFilterBloc>().add(SetPeriod(date)),
                onDelete: () =>
                    context.read<OperationFilterBloc>().add(ResetPediod()),
              ),
              const SizedBox(height: 8.0),
              Text(AppLocalizations.of(context).accounts),
              InputChip(
                  key: _accountKey,
                  avatar: const Icon(Icons.mode_edit),
                  label: Text(AppLocalizations.of(context).chooseAccount),
                  onPressed: _onAccountChipPressed),
              Wrap(
                children: context
                    .select<OperationFilterBloc, Set<Account>>(
                        (bloc) => bloc.state.filter.accounts)
                    .map(
                      (account) => InputChip(
                        label: Text(account.title),
                        deleteIcon: const Icon(Icons.cancel),
                        onDeleted: () => context
                            .read<OperationFilterBloc>()
                            .add(RemoveAccount(account)),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 8.0),
              Text(AppLocalizations.of(context).inputCategory),
              InputChip(
                key: _categoryInKey,
                avatar: const Icon(Icons.mode_edit),
                label: Text(AppLocalizations.of(context).chooseCategory),
                onPressed: _onCategoryInPressed,
              ),
              Wrap(
                  children: context
                      .select<OperationFilterBloc, Set<Category>>((bloc) => bloc
                          .state.filter.categories
                          .where(
                              (cat) => cat.operationType == OperationType.INPUT)
                          .toSet())
                      .map(
                        (category) => InputChip(
                          label: Text(category.title),
                          deleteIcon: const Icon(Icons.cancel),
                          onDeleted: () => context
                              .read<OperationFilterBloc>()
                              .add(RemoveCategory(category)),
                        ),
                      )
                      .toList()),
              const SizedBox(
                height: 8.0,
              ),
              Text(AppLocalizations.of(context).outputCategory),
              InputChip(
                key: _categoryOutKey,
                avatar: const Icon(Icons.mode_edit),
                label: Text(AppLocalizations.of(context).chooseCategory),
                onPressed: _onCategoryOutPressed,
              ),
              Wrap(
                  children: context
                      .select<OperationFilterBloc, Set<Category>>((bloc) => bloc
                          .state.filter.categories
                          .where((cat) =>
                              cat.operationType == OperationType.OUTPUT)
                          .toSet())
                      .map(
                        (category) => InputChip(
                          label: Text(category.title),
                          deleteIcon: const Icon(Icons.cancel),
                          onDeleted: () => context
                              .read<OperationFilterBloc>()
                              .add(RemoveCategory(category)),
                        ),
                      )
                      .toList()),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        TextButton(
          onPressed: () => Navigator.pop(
            context,
            OperationListFilter.empty(),
          ),
          child: Text(
            AppLocalizations.of(context).reset.toUpperCase(),
          ),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(
            context,
            context.read<OperationFilterBloc>().state.filter,
          ),
          child: Text(
            AppLocalizations.of(context).apply.toUpperCase(),
            style: const TextStyle(color: Colors.white),
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
        deleteIcon: const Icon(Icons.cancel),
        onDeleted: onDelete,
      );
    } else {
      return InputChip(
        avatar: const Icon(Icons.mode_edit),
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
