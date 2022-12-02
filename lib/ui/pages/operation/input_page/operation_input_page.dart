import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/injection_container.dart';
import 'package:money_tracker/ui/page_navigator.dart';
import 'package:money_tracker/ui/pages/operation/input_page/carousel_list.dart';
import 'package:money_tracker/ui/pages/operation/input_page/operation_input_bloc.dart';
import 'package:money_tracker/ui/widgets/type_radio_button.dart';
import 'package:money_tracker/utils/extensions.dart';

import '../../../widgets/keyboard.dart';
import 'account_item.dart';
import 'category_item.dart';

class OperationInputPage extends StatefulWidget {
  const OperationInputPage({Key? key}) : super(key: key);

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
    )
      ..addListener(() => setState(() {}));
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
    if (state.action == MasterStateAction.CLOSE) {
      Navigator.of(context).pop();
    } else if (state.action == MasterStateAction.SHOW_KEYBOARD) {
      _animationController.forward();
    } else if (state.action == MasterStateAction.HIDE_KEYBOARD) {
      _animationController.reverse();
    } else if (state.action == MasterStateAction.SHOW_EMPTY_ACCOUNT_MESSAGE) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.loc.emptyAccountError),
        ),
      );
    } else if (state.action == MasterStateAction.SHOW_EMPTY_CATEGORY_MESSAGE) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.loc.emptyCategoryError),
        ),
      );
    } else if (state.action ==
        MasterStateAction.SHOW_EMPTY_REC_ACCOUNT_MESSAGE) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.loc.emptyRecAccountError),
        ),
      );
    } else if (state.action == MasterStateAction.SHOW_EMPTY_SUM_MESSAGE) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.loc.emptySumError),
        ),
      );
    } else if (state.action ==
        MasterStateAction.SHOW_OPERATION_CREATED_MESSAGE) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.loc.mesOperationCreated),
          action: SnackBarAction(
            label: context.loc.cancel,
            onPressed: () =>
                context
                    .read<MasterBloc>()
                    .add(const MasterEvent.cancelOperation()),
          ),
        ),
      );
    } else if (state.action ==
        MasterStateAction.SHOW_OPERATION_CANCELED_MESSAGE) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.loc.mesOperationCanceled),
        ),
      );
    }
  }

  Future<bool> _onBackPressed(BuildContext context) {
    context.read<MasterBloc>().add(const MasterEvent.backPressed());

    return Future.value(false);
  }

  void _onChangeOperationType(BuildContext context, OperationType newValue) {
    context.read<MasterBloc>().add(
      MasterEvent.changeOperationType(operationType: newValue),
    );
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
                appBar: AppBar(
                  title: Text(context.loc.titleMaster),
                ),
                body: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 8.0,
                      ),
                      child: TypeRadioButton<OperationType>(
                        type: context.select<MasterBloc, OperationType>(
                                (bloc) => bloc.state.operationType),
                        items: const [
                          OperationType.INPUT,
                          OperationType.OUTPUT,
                          OperationType.TRANSFER,
                        ],
                        onChange: (operationType) =>
                            _onChangeOperationType(context, operationType),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          const AccountList(),
                          context
                              .select<MasterBloc, OperationType>(
                                  (bloc) => bloc.state.operationType)
                              .map(
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
                                    onPressed: () => context
                                        .read<MasterBloc>()
                                        .add(const MasterEvent.moreTap()),
                                    title: context.loc.more),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                          onTap: () => context
                                              .read<MasterBloc>()
                                              .add(const MasterEvent.sumTap()),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .bottomAppBarColor,
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                              border: Border.all(
                                                color: context.select<MasterBloc, bool>((bloc) => bloc.state.showKeyboard)
                                                    ? Theme.of(context)
                                                        .colorScheme
                                                        .secondary
                                                    : Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                                width: 2.0,
                                              ),
                                            ),
                                            width: double.infinity,
                                            height: 48.0,
                                            alignment: Alignment.center,
                                            child: Text(
                                              context.loc
                                                  .numberFormat(context.select<MasterBloc, int>((bloc) => bloc.state.sum)),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline4,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizeTransition(
                                        axis: Axis.vertical,
                                        sizeFactor: _animation,
                                        child: Keyboard(
                                          onDigitPressed: (int digit) =>
                                              context.read<MasterBloc>().add(
                                                    MasterEvent.digitTap(
                                                        digit: digit),
                                                  ),
                                          onBackPressed: () => context
                                              .read<MasterBloc>()
                                              .add(const MasterEvent
                                                  .backKeyTap()),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                BarButton(
                                    onPressed: () => context
                                        .read<MasterBloc>()
                                        .add(const MasterEvent.nextTap()),
                                    title: context.loc.create),
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

class BarButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;

  const BarButton({
    Key? key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          color: Theme
              .of(context)
              .colorScheme
              .primary,
        ),
      ),
    );
  }
}

class AccountList extends StatelessWidget {
  const AccountList({Key? key}) : super(key: key);

  Future<void> _addNewAccount(BuildContext context) async {
    var account = await sl<PageNavigator>().openAccountInputDialog(context);
    if (account != null) {
      var accountBalance = AccountBalance(
        id: account.id,
        cloudId: account.cloudId,
        title: account.title,
        balance: 0,
      );
      context
          .read<MasterBloc>()
          .add(MasterEvent.changeAccount(account: accountBalance));
    }
  }

  void _onChangeAccount(BuildContext context, AccountBalance account) {
    context.read<MasterBloc>().add(MasterEvent.changeAccount(account: account));
  }

  @override
  Widget build(BuildContext context) {
    final operationType = context
        .select<MasterBloc, OperationType>((bloc) => bloc.state.operationType);
    final accounts = context.select<MasterBloc, List<AccountBalance>>(
            (bloc) => bloc.state.accounts);

    return ItemsList(
      title: operationType == OperationType.TRANSFER
          ? context.loc.source
          : context.loc.accounts,
      onAdd: () => _addNewAccount(context),
      list: AccountPageView(
          accounts: operationType == OperationType.TRANSFER
              ? accounts
              : accounts.where((element) => !element.isDebt).toList(),
          onItemChanged: (account) => _onChangeAccount(context, account)),
    );
  }
}

class CategoryInList extends StatelessWidget {
  const CategoryInList({Key? key}) : super(key: key);

  Future<void> _addNewInCategory(BuildContext context) async {
    var category = await sl<PageNavigator>().openCategoryInputDialog(
      context,
      type: OperationType.INPUT,
    );
    if (category != null) {
      context
          .read<MasterBloc>()
          .add(MasterEvent.changeInCategory(category: category));
    }
  }

  void _onChangeInCategory(BuildContext context, Category category) {
    context
        .read<MasterBloc>()
        .add(MasterEvent.changeInCategory(category: category));
  }

  @override
  Widget build(BuildContext context) {
    return ItemsList(
      title: context.loc.categories,
      onAdd: () => _addNewInCategory(context),
      list: CategoryPageView(
        categories: context.select<MasterBloc, List<Category>>(
                (bloc) => bloc.state.inCategories),
        onItemChanged: (category) => _onChangeInCategory(context, category),
      ),
    );
  }
}

class CategoryOutList extends StatelessWidget {
  const CategoryOutList({Key? key}) : super(key: key);

  Future<void> _addNewOutCategory(BuildContext context) async {
    var category = await sl<PageNavigator>().openCategoryInputDialog(
      context,
      type: OperationType.OUTPUT,
    );
    if (category != null) {
      context
          .read<MasterBloc>()
          .add(MasterEvent.changeOutCategory(category: category));
    }
  }

  void _onChangeOutCategory(BuildContext context, Category category) {
    context
        .read<MasterBloc>()
        .add(MasterEvent.changeOutCategory(category: category));
  }

  @override
  Widget build(BuildContext context) {
    return ItemsList(
      title: context.loc.categories,
      onAdd: () => _addNewOutCategory(context),
      list: CategoryPageView(
        categories: context.select<MasterBloc, List<Category>>(
                (bloc) => bloc.state.outCategories),
        onItemChanged: (category) => _onChangeOutCategory(context, category),
      ),
    );
  }
}

class AccountRecList extends StatelessWidget {
  const AccountRecList({Key? key}) : super(key: key);

  Future<void> _addNewRecAccount(BuildContext context) async {
    var account = await sl<PageNavigator>().openAccountInputDialog(context);
    if (account != null) {
      var accountBalance = AccountBalance(
        id: account.id,
        cloudId: account.cloudId,
        title: account.title,
        balance: 0,
      );
      context
          .read<MasterBloc>()
          .add(MasterEvent.changeRecAccount(account: accountBalance));
    }
  }

  void _onChangeRecAccount(BuildContext context, AccountBalance account) {
    context
        .read<MasterBloc>()
        .add(MasterEvent.changeRecAccount(account: account));
  }

  @override
  Widget build(BuildContext context) {
    return ItemsList(
      title: context.loc.receiver,
      onAdd: () => _addNewRecAccount(context),
      list: AccountPageView(
        accounts: context.select<MasterBloc, List<AccountBalance>>(
                (bloc) => bloc.state.accounts),
        onItemChanged: (account) => _onChangeRecAccount(context, account),
      ),
    );
  }
}

class ItemsList extends StatelessWidget {
  final String title;
  final void Function() onAdd;
  final Widget list;

  const ItemsList({
    Key? key,
    required this.title,
    required this.onAdd,
    required this.list,
  }) : super(key: key);

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
                  style: Theme
                      .of(context)
                      .textTheme
                      .subtitle2,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.add,
                    //color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    context
                        .read<MasterBloc>()
                        .add(const MasterEvent.addNewItem());
                    onAdd();
                  },
                ),
              ],
            ),
            const Divider(),
            Flexible(
              child: Container(
                child: list,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AccountPageView extends StatelessWidget {
  final List<AccountBalance> accounts;
  final void Function(AccountBalance) onItemChanged;

  const AccountPageView({
    Key? key,
    required this.accounts,
    required this.onItemChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselList<AccountBalance>(
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
    Key? key,
    required this.categories,
    required this.onItemChanged,
  }) : super(key: key);

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
      itemBuilder: (context, category) => CategoryItem(category: category),
    );
  }
}
