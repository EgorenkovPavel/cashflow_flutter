import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/injection_container.dart';
import 'package:money_tracker/src/ui/blocs/category_cashflow_bloc.dart';
import 'package:money_tracker/src/ui/pages/operation/filter_page/operation_filter_bloc.dart';
import 'package:money_tracker/src/utils/extensions.dart';

import '../../../blocs/account_balance_bloc.dart';

class OperationFilterPage extends StatelessWidget {
  const OperationFilterPage({super.key, this.filter});

  final OperationListFilter? filter;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<OperationFilterBloc>()
        ..add(OperationFilterEvent.init(
          filter: filter ?? const OperationListFilter(),
        )),
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
    final overlay = Overlay.of(c).context.findRenderObject() as RenderBox;
    final position = RelativeRect.fromRect(
      Rect.fromPoints(
        bar.localToGlobal(bar.size.bottomLeft(Offset.zero), ancestor: overlay),
        bar.localToGlobal(bar.size.bottomRight(Offset.zero), ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );

    return position;
  }

  void _onAccountChipPressed(BuildContext context) async {
    final result = await showMenu<BaseAccountListItem>(
      context: context,
      position: buttonMenuPosition(_accountKey.currentContext!),
      items: context
          .readListItems()
          .map((a) => PopupMenuItem<BaseAccountListItem>(
                value: a,
                child: Text(a.title),
              ))
          .toList(),
    );
    if (result != null) {
      if (!context.mounted) return;
      context.onAddAccount(result);
    }
  }

  void _onCategoryInPressed(BuildContext context) async {
    final result = await showMenu<Category>(
      context: context,
      position: buttonMenuPosition(_categoryInKey.currentContext!),
      items: context
          .readInCategories()
          .map(
            (c) => PopupMenuItem<Category>(
              value: c,
              child: Text(c.title),
            ),
          )
          .toList(),
    );
    if (result != null) {
      if (!context.mounted) return;
      context.onAddCategory(result);
    }
  }

  void _onCategoryOutPressed(BuildContext context) async {
    final result = await showMenu<Category>(
      context: context,
      position: buttonMenuPosition(_categoryOutKey.currentContext!),
      items: context
          .readOutCategories()
          .map((c) => PopupMenuItem<Category>(
                value: c,
                child: Text(c.title),
              ))
          .toList(),
    );
    if (result != null) {
      if (!context.mounted) return;
      context.onAddCategory(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.loc.titleFilters)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 8.0),
              Text(context.loc.period),
              PeriodButton(
                date: context.dateRange(),
                onPressed: context.onSetPeriod,
                onDelete: context.onDeletePeriod,
              ),
              const SizedBox(height: 8.0),
              Text(context.loc.accounts),
              InputChip(
                key: _accountKey,
                avatar: const Icon(Icons.add),
                label: Text(context.loc.chooseAccount),
                onPressed: () => _onAccountChipPressed(context),
              ),
              Wrap(
                children: context
                    .accounts()
                    .map((account) => AccountChip(account: account))
                    .toList(),
              ),
              const SizedBox(height: 8.0),
              Text(context.loc.inputCategory),
              InputChip(
                key: _categoryInKey,
                avatar: const Icon(Icons.add),
                label: Text(context.loc.chooseCategory),
                onPressed: () => _onCategoryInPressed(context),
              ),
              Wrap(
                children: context
                    .inCategories()
                    .map((category) => CategoryChip(category: category))
                    .toList(),
              ),
              const SizedBox(height: 8.0),
              Text(context.loc.outputCategory),
              InputChip(
                key: _categoryOutKey,
                avatar: const Icon(Icons.add),
                label: Text(context.loc.chooseCategory),
                onPressed: () => _onCategoryOutPressed(context),
              ),
              Wrap(
                children: context
                    .outCategories()
                    .map((category) => CategoryChip(category: category))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        TextButton(
          onPressed: () => Navigator.pop(
            context,
            const OperationListFilter(),
          ),
          child: Text(context.loc.reset.toUpperCase()),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(
            context,
            context.read<OperationFilterBloc>().state.filter,
          ),
          child: Text(
            context.loc.apply.toUpperCase(),
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

  const PeriodButton({
    super.key,
    this.date,
    required this.onDelete,
    required this.onPressed,
  });

  Future<void> _onChoosePeriod(BuildContext context) async {
    var date = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020), //TODO
      lastDate: DateTime.now(),
    );
    if (date != null) {
      onPressed(date);
    }
  }

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
        avatar: const Icon(Icons.add),
        label: Text(context.loc.choosePeriod),
        onPressed: () => _onChoosePeriod(context),
      );
    }
  }
}

class AccountChip extends StatelessWidget {
  final BaseAccountListItem account;

  const AccountChip({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return InputChip(
      label: Text(account.title),
      deleteIcon: const Icon(Icons.cancel),
      onDeleted: () => context.onDeleteAccount(account),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final Category category;

  const CategoryChip({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return InputChip(
      label: Text(category.title),
      deleteIcon: const Icon(Icons.cancel),
      onDeleted: () => context.onDeleteCategory(category),
    );
  }
}

extension BlocExt on BuildContext {
  DateTimeRange? dateRange() => select<OperationFilterBloc, DateTimeRange?>(
        (bloc) => bloc.state.filter.period,
      );

  Set<BaseAccountListItem> accounts() {
    final ids = select<OperationFilterBloc, Set<int>>(
          (bloc) => bloc.state.filter.accountIds,
    );
    return readListItems().where((e) => ids.contains(e.id)).toSet();
  }

  Set<InputCategoryItem> inCategories() {
    final ids = select<OperationFilterBloc, Set<int>>(
          (bloc) =>
          bloc.state.filter.categoryIds,
    );
    return inCategories().where((e) => ids.contains(e.id)).toSet();
  }

  Set<OutputCategoryItem> outCategories() {
    final ids = select<OperationFilterBloc, Set<int>>(
          (bloc) =>
          bloc.state.filter.categoryIds,
    );
    return outCategories().where((e) => ids.contains(e.id)).toSet();
  }

  onSetPeriod(DateTimeRange date) => read<OperationFilterBloc>()
      .add(OperationFilterEvent.setPeriod(period: date));

  onDeletePeriod() =>
      read<OperationFilterBloc>().add(const OperationFilterEvent.resetPeriod());

  void onAddAccount(BaseAccountListItem account) => read<OperationFilterBloc>()
      .add(OperationFilterEvent.addAccount(account: account));

  void onAddCategory(Category category) => read<OperationFilterBloc>()
      .add(OperationFilterEvent.addCategory(category: category));

  onDeleteAccount(BaseAccountListItem account) =>
      read<OperationFilterBloc>().add(OperationFilterEvent.removeAccount(
        account: account,
      ));

  onDeleteCategory(Category category) =>
      read<OperationFilterBloc>().add(OperationFilterEvent.removeCategory(
        category: category,
      ));
}
