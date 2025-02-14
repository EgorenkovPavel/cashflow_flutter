import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/injection_container.dart';
import 'package:money_tracker/src/ui/app.dart';
import 'package:money_tracker/src/ui/blocs/account_balance_bloc.dart';
import 'package:money_tracker/src/ui/pages/operation/input_page/operation_input_bloc.dart';
import 'package:money_tracker/src/ui/widgets/type_radio_button.dart';
import 'package:money_tracker/src/utils/extensions.dart';

import '../../../blocs/category_cashflow_bloc.dart';
import '../../../widgets/keyboard.dart';
import 'widgets/account_item.dart';
import 'widgets/carousel_list.dart';
import 'widgets/category_item.dart';
import 'widgets/sum_field.dart';

class OperationInputPage extends StatefulWidget {
  const OperationInputPage({super.key});

  @override
  _OperationInputPageState createState() => _OperationInputPageState();
}

class _OperationInputPageState extends State<OperationInputPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    )..addListener(() => setState(() {}));
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _stateListener(BuildContext context, MasterState state) {
    switch (state.action) {
      case MasterStateAction.CLOSE:
        {
          Navigator.of(context).pop();
        }
      case MasterStateAction.SHOW_KEYBOARD:
        {
          _animationController.forward();
        }
      case MasterStateAction.HIDE_KEYBOARD:
        {
          _animationController.reverse();
        }
      case MasterStateAction.SHOW_EMPTY_ACCOUNT_MESSAGE:
        {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(context.loc.emptyAccountError)),
          );
        }
      case MasterStateAction.SHOW_EMPTY_CATEGORY_MESSAGE:
        {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(context.loc.emptyCategoryError)),
          );
        }
      case MasterStateAction.SHOW_EMPTY_REC_ACCOUNT_MESSAGE:
        {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(context.loc.emptyRecAccountError)),
          );
        }
      case MasterStateAction.SHOW_EMPTY_SUM_MESSAGE:
        {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(context.loc.emptySumError)),
          );
        }
      case MasterStateAction.SHOW_OPERATION_CREATED_MESSAGE:
        {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(context.loc.mesOperationCreated),
              action: SnackBarAction(
                label: context.loc.cancel,
                onPressed: () => context.cancelOperation(),
              ),
            ),
          );
        }
      case MasterStateAction.SHOW_OPERATION_CANCELED_MESSAGE:
        {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(context.loc.mesOperationCanceled)),
          );
        }
      case MasterStateAction.DATA:
      case MasterStateAction.SET_ACCOUNT:
      case MasterStateAction.SET_IN_CATEGORY:
      case MasterStateAction.SET_OUT_CATEGORY:
      case MasterStateAction.SET_REC_ACCOUNT:
    }
  }

  Future<bool> _onBackPressed(BuildContext context) {
    context.read<MasterBloc>().add(const MasterEvent.backPressed());

    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MasterBloc>(
      create: (context) => sl<MasterBloc>(),
      child: Builder(builder: (context) {
        return BlocListener<MasterBloc, MasterState>(
          listener: (context, state) => _stateListener(context, state),
          child: WillPopScope(
            onWillPop: () => _onBackPressed(context),
            child: Scaffold(
              appBar: AppBar(title: Text(context.loc.titleMaster)),
              body: Column(
                children: <Widget>[
                  Builder(builder: (context) {
                    return TypeRadioButton<OperationType>(
                      type: context.operationType(),
                      items: const [
                        OperationType.INPUT,
                        OperationType.OUTPUT,
                        OperationType.TRANSFER,
                      ],
                      onChange: context.changeOperationType,
                    );
                  }),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        const AccountList(),
                        context.operationType().map(
                              INPUT: () => const CategoryInList(),
                              OUTPUT: () => const CategoryOutList(),
                              TRANSFER: () => const AccountRecList(),
                            ),
                      ],
                    ),
                  ),
                  Builder(
                    builder: (BuildContext context) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Container(
                          margin: const EdgeInsets.only(top: 6.0),
                          //Same as `blurRadius` i guess
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(16.0),
                            ),
                            color: Theme.of(context)
                                .dialogBackgroundColor, //Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              BarButton(
                                onPressed: context.moreTap,
                                title: context.loc.more,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8.0,
                                      ),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: SumField(
                                              highlight: context.highlightSum(),
                                              sum: context.sum(),
                                              currency: context.currencySent(),
                                              onTap: context.sumTap,
                                            ),
                                          ),
                                          if (context.showRecSum())
                                            const SizedBox(width: 8),
                                          if (context.showRecSum())
                                            Flexible(
                                              flex: 1,
                                              child: SumField(
                                                highlight:
                                                    context.highlightRecSum(),
                                                sum: context.recSum(),
                                                currency: context.currencyReceived(),
                                                onTap: context.recSumTap,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    SizeTransition(
                                      axis: Axis.vertical,
                                      sizeFactor: _animation,
                                      child: Keyboard(
                                        onDigitPressed: context.digitTap,
                                        onBackPressed: context.backKeyTap,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              BarButton(
                                onPressed: context.nextTap,
                                title: context.loc.create,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

extension MasterExt on BuildContext {
  MasterBloc _bloc() => read<MasterBloc>();

  void nextTap() => _bloc().add(const MasterEvent.nextTap());

  void moreTap() => _bloc().add(const MasterEvent.moreTap());

  void backKeyTap() => _bloc().add(const MasterEvent.backKeyTap());

  void digitTap(int digit) => _bloc().add(MasterEvent.digitTap(digit: digit));

  void sumTap() => _bloc().add(const MasterEvent.sumTap());

  void recSumTap() => _bloc().add(const MasterEvent.recSumTap());

  void cancelOperation() => _bloc().add(const MasterEvent.cancelOperation());

  void changeOperationType(OperationType type) =>
      _bloc().add(MasterEvent.changeOperationType(operationType: type));

  void changeAccount(BaseAccountBalance accountBalance) =>
      _bloc().add(MasterEvent.changeAccount(account: accountBalance));

  bool showRecSum() => select<MasterBloc, bool>((bloc) =>
      bloc.state.operationType == OperationType.TRANSFER &&
      bloc.state.account != null &&
      bloc.state.recAccount != null);

  Future<void> addNewAccount() async {
    addNewItem();
    var account = await openAccountInputDialog();
    if (account != null) {
      changeAccount(BaseAccountBalance.fromAccount(account));
    }
  }

  Future<void> addNewInCategory() async {
    addNewItem();
    var category = await openCategoryInputDialog(
      type: OperationType.INPUT,
    );
    if (category != null) {
      changeInCategory(category);
    }
  }

  Future<void> addNewOutCategory() async {
    addNewItem();
    var category = await openCategoryInputDialog(
      type: OperationType.OUTPUT,
    );
    if (category != null) {
      changeOutCategory(category);
    }
  }

  Future<void> addNewRecAccount() async {
    addNewItem();
    var account = await openAccountInputDialog();
    if (account != null) {
      changeRecAccount(BaseAccountBalance.fromAccount(account));
    }
  }

  void addNewItem() => _bloc().add(const MasterEvent.addNewItem());

  void changeRecAccount(BaseAccountBalance accountBalance) =>
      _bloc().add(MasterEvent.changeRecAccount(account: accountBalance));

  void changeInCategory(Category category) =>
      _bloc().add(MasterEvent.changeInCategory(category: category));

  void changeOutCategory(Category category) =>
      _bloc().add(MasterEvent.changeOutCategory(category: category));

  int recSum() => select<MasterBloc, int>((bloc) => bloc.state.recSum.sum);

  Currency currencySent() =>
      select<MasterBloc, Currency>((bloc) => bloc.state.sum.currency);

  Currency currencyReceived() =>
      select<MasterBloc, Currency>((bloc) => bloc.state.recSum.currency);

  bool highlightRecSum() =>
      select<MasterBloc, bool>((bloc) => bloc.state.highlightRecSum);

  int sum() => select<MasterBloc, int>((bloc) => bloc.state.sum.sum);

  bool highlightSum() =>
      select<MasterBloc, bool>((bloc) => bloc.state.highlightSum);

  OperationType operationType() =>
      select<MasterBloc, OperationType>((bloc) => bloc.state.operationType);

  BaseAccountBalance? account() =>
      select<MasterBloc, BaseAccountBalance?>((bloc) => bloc.state.account);

  BaseAccountBalance? recAccount() =>
      select<MasterBloc, BaseAccountBalance?>((bloc) => bloc.state.recAccount);
}

class BarButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;

  const BarButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title.toUpperCase(),
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}

class AccountList extends StatelessWidget {
  const AccountList({super.key});

  @override
  Widget build(BuildContext context) {
    final operationType = context.operationType();
    final accounts = context.select<AccountBalanceBloc, List<BaseAccountBalance>>(
      (bloc) => bloc.state.balances,
    );

    return ItemsList(
      title: operationType == OperationType.TRANSFER
          ? context.loc.source
          : context.loc.accounts,
      onAdd: context.addNewAccount,
      list: AccountPageView(
        accounts: operationType == OperationType.TRANSFER
            ? accounts
            : accounts.whereType<DebtBalance>().toList(),
        onItemChanged: context.changeAccount,
      ),
    );
  }
}

class CategoryInList extends StatelessWidget {
  const CategoryInList({super.key});

  @override
  Widget build(BuildContext context) {
    return ItemsList(
      title: context.loc.categories,
      onAdd: context.addNewInCategory,
      list: CategoryPageView(
        categories: context.select<CategoryCashflowBloc, List<Category>>(
          (bloc) => bloc.state.inCategories,
        ),
        onItemChanged: context.changeInCategory,
      ),
    );
  }
}

class CategoryOutList extends StatelessWidget {
  const CategoryOutList({super.key});

  @override
  Widget build(BuildContext context) {
    return ItemsList(
      title: context.loc.categories,
      onAdd: context.addNewOutCategory,
      list: CategoryPageView(
        categories: context.select<CategoryCashflowBloc, List<Category>>(
          (bloc) => bloc.state.outCategories,
        ),
        onItemChanged: context.changeOutCategory,
      ),
    );
  }
}

class AccountRecList extends StatelessWidget {
  const AccountRecList({super.key});

  @override
  Widget build(BuildContext context) {
    return ItemsList(
      title: context.loc.receiver,
      onAdd: context.addNewRecAccount,
      list: AccountPageView(
        accounts: context.select<AccountBalanceBloc, List<BaseAccountBalance>>(
          (bloc) => bloc.state.balances,
        ),
        onItemChanged: context.changeRecAccount,
      ),
    );
  }
}

class ItemsList extends StatelessWidget {
  final String title;
  final void Function() onAdd;
  final Widget list;

  const ItemsList({
    super.key,
    required this.title,
    required this.onAdd,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: onAdd,
                ),
              ],
            ),
            const Divider(),
            Flexible(
              child: Container(child: list),
            ),
          ],
        ),
      ),
    );
  }
}

class AccountPageView extends StatelessWidget {
  final List<BaseAccountBalance> accounts;
  final void Function(BaseAccountBalance) onItemChanged;

  const AccountPageView({
    super.key,
    required this.accounts,
    required this.onItemChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselList<BaseAccountBalance>(
      items: accounts,
      emptyListMessage: context.loc.noAccounts,
      initialItemFinder: (account) => false,
      // initialItemFinder: (account) =>
      //     state.action == MasterStateAction.SET_ACCOUNT &&
      //     state.account != null &&
      //     account.id == state.account!.id,
      onItemChanged: onItemChanged,
      itemBuilder: (context, account) => AccountItem(account: account),
    );
  }
}

class CategoryPageView extends StatelessWidget {
  final List<Category> categories;
  final void Function(Category) onItemChanged;

  const CategoryPageView({
    super.key,
    required this.categories,
    required this.onItemChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselList<Category>(
      items: categories,
      emptyListMessage: context.loc.noCategories,
      initialItemFinder: (category) => false,
      // initialItemFinder: (category) =>
      //     state.action == MasterStateAction.SET_IN_CATEGORY &&
      //     state.categoryIn != null &&
      //     category.id == state.categoryIn!.id,
      onItemChanged: onItemChanged,
      itemBuilder: (context, category) => CategoryListItem(category: category),
    );
  }
}
