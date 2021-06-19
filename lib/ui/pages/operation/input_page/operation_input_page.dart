import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/domain/models/account_balance.dart';
import 'package:money_tracker/domain/models/category.dart' as data;
import 'package:money_tracker/domain/models/operation_type.dart';
import 'package:money_tracker/ui/pages/operation/input_page/operation_input_bloc.dart';
import 'package:money_tracker/ui/page_navigator.dart';
import 'package:money_tracker/ui/widgets/carousel.dart';
import 'package:money_tracker/ui/widgets/keyboard.dart';
import 'package:money_tracker/ui/widgets/operation_type_radio_button.dart';
import 'package:money_tracker/utils/app_localization.dart';

class OperationInputPage extends StatefulWidget {
  @override
  _OperationInputPageState createState() => _OperationInputPageState();
}

class _OperationInputPageState extends State<OperationInputPage>
    with SingleTickerProviderStateMixin {
  late MasterBloc _bloc;
  late AnimationController _animationController;
  late Animation<double> _animation;

  Widget accountPageView(BuildContext context) {
    return CarouselList<AccountBalance>(
      stream: _bloc.accountStream,
      emptyListMessage: AppLocalizations.of(context).noAccounts,
      initialItemFinder: (account) =>
          _bloc.account != null && account.id == _bloc.account!.id,
      onItemChanged: (account) => _bloc.add(OnAccountChanged(account)),
      itemBuilder: (context, account) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(account.title),
            Text(
              NumberFormat().format(account.balance),
              style: Theme.of(context).textTheme.caption,
            )
          ],
        );
      },
    );
  }

  Widget categoryInPageView(BuildContext context) {
    return CarouselList<data.Category>(
      stream: _bloc.categoryInStream,
      emptyListMessage: AppLocalizations.of(context).noCategories,
      initialItemFinder: (category) =>
          _bloc.categoryIn != null && category.id == _bloc.categoryIn!.id,
      onItemChanged: (category) => _bloc.add(OnCategoryInChanged(category)),
      itemBuilder: (context, category) {
        return Center(child: Text(category.title));
      },
    );
  }

  Widget categoryOutPageView(BuildContext context) {
    return CarouselList<data.Category>(
      stream: _bloc.categoryOutStream,
      emptyListMessage: AppLocalizations.of(context).noCategories,
      initialItemFinder: (category) =>
          _bloc.categoryOut != null && category.id == _bloc.categoryOut!.id,
      onItemChanged: (category) => _bloc.add(OnCategoryOutChanged(category)),
      itemBuilder: (context, category) {
        return Center(child: Text(category.title));
      },
    );
  }

  Widget recAccountPageView(BuildContext context) {
    return CarouselList<AccountBalance>(
      stream: _bloc.accountStream,
      emptyListMessage: AppLocalizations.of(context).noAccounts,
      initialItemFinder: (account) =>
          _bloc.recAccount != null && account.id == _bloc.recAccount!.id,
      onItemChanged: (account) => _bloc.add(OnRecAccountChanged(account)),
      itemBuilder: (context, account) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(account.title),
            Text(
              NumberFormat().format(account.balance),
              style: Theme.of(context).textTheme.caption,
            )
          ],
        );
      },
    );
  }

  Widget buildList(String titleStr, Function onAdd, Widget list) {
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
                  titleStr,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                IconButton(
                  icon: Icon(
                    Icons.add,
                    //color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    _bloc.add(OnAddNewItem());
                    onAdd();
                  },
                )
              ],
            ),
            Divider(),
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

  Widget buildAnalyticList(OperationType type) {
    switch (type) {
      case OperationType.INPUT:
        return buildList(AppLocalizations.of(context).categories,
            addNewInCategory, categoryInPageView(context));
      case OperationType.OUTPUT:
        return buildList(AppLocalizations.of(context).categories,
            addNewOutCategory, categoryOutPageView(context));
      case OperationType.TRANSFER:
        return buildList(AppLocalizations.of(context).receiver,
            addNewRecAccount, recAccountPageView(context));
      default:
        return SizedBox();
    }
  }

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<MasterBloc>(context);
    _bloc.add(Start());

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
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

  void stateListener(BuildContext context, MasterState state) {
    if (state is ClosePage) {
      Navigator.of(context).pop();
    } else if (state is ShowKeyboard) {
      _animationController.forward();
    } else if (state is HideKeyBoard) {
      _animationController.reverse();
    } else if (state is EmptyAccountMessage) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(AppLocalizations.of(context).emptyAccountError),
      ));
    } else if (state is EmptyCategoryMessage) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(AppLocalizations.of(context).emptyCategoryError),
      ));
    } else if (state is EmptyRecAccountMessage) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(AppLocalizations.of(context).emptyRecAccountError),
      ));
    } else if (state is EmptySumMessage) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(AppLocalizations.of(context).emptySumError),
      ));
    } else if (state is OperationCreatedMessage) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(AppLocalizations.of(context).mesOperationCreated),
        action: SnackBarAction(
          label: AppLocalizations.of(context).cancel,
          onPressed: () {
            _bloc.add(CancelOperation());
          },
        ),
      ));
    } else if (state is OperationCanceled) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(AppLocalizations.of(context).mesOperationCanceled),
      ));
    }
  }

  Future<void> addNewAccount() async {
    var account = await PageNavigator.openAccountInputPage(context);
    if (account != null) {
      var accountBalance =
          AccountBalance(id: account.id, title: account.title, balance: 0);
      _bloc.add(OnAccountChanged(accountBalance));
    }
  }

  Future<void> addNewInCategory() async {
    var category = await PageNavigator.openCategoryInputPage(context,
        type: OperationType.INPUT);
    if (category != null) {
      _bloc.add(OnCategoryInChanged(category));
    }
  }

  Future<void> addNewOutCategory() async {
    var category = await PageNavigator.openCategoryInputPage(context,
        type: OperationType.OUTPUT);
    if (category != null) {
      _bloc.add(OnCategoryOutChanged(category));
    }
  }

  Future<void> addNewRecAccount() async {
    var account = await PageNavigator.openAccountInputPage(context);
    if (account != null) {
      var accountBalance =
          AccountBalance(id: account.id, title: account.title, balance: 0);
      _bloc.add(OnRecAccountChanged(accountBalance));
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _bloc.add(BackPressed());
        return Future(() => false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context).titleMaster,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        body: BlocConsumer<MasterBloc, MasterState>(
          listener: (BuildContext context, MasterState state) =>
              stateListener(context, state),
          buildWhen: (oldState, newState) {
            return newState is DataState;
          },
          builder: (BuildContext context, MasterState state) {
            if (!(state is DataState)) {
              return SizedBox();
            }
            return Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 8.0),
                  child: OperationTypeRadioButton(
                    type: state.type,
                    items: [
                      OperationType.INPUT,
                      OperationType.OUTPUT,
                      OperationType.TRANSFER
                    ],
                    onChange: (newValue) => _bloc.add(TypeChanged(newValue)),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      buildList(
                          state.type == OperationType.TRANSFER
                              ? AppLocalizations.of(context).source
                              : AppLocalizations.of(context).accounts,
                          addNewAccount,
                          accountPageView(context)),
                      buildAnalyticList(state.type),
                    ],
                  ),
                ),
                Builder(builder: (BuildContext context) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Container(
                      margin: const EdgeInsets.only(top: 6.0),
                      //Same as `blurRadius` i guess
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16.0)),
                        color: Theme.of(context)
                            .dialogBackgroundColor, //Colors.white,
                        boxShadow: [
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
                          TextButton(
                            onPressed: () => _bloc.add(OnMoreTap()),
                            child: Text(AppLocalizations.of(context)
                                .more
                                .toUpperCase()),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () => _bloc.add(OnSumTap()),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .bottomAppBarColor,
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                          border: Border.all(
                                              color: state.showKeyboard
                                                  ? Theme.of(context)
                                                      .accentColor
                                                  : Theme.of(context)
                                                      .primaryColor,
                                              width: 2.0)),
                                      width: double.infinity,
                                      height: 48.0,
                                      alignment: Alignment.center,
                                      child: Text(
                                          NumberFormat().format(state.sum),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4
                                          //.copyWith(color: Colors.black),
                                          ),
                                    ),
                                  ),
                                ),
                                SizeTransition(
                                  axis: Axis.vertical,
                                  sizeFactor: _animation,
                                  child: Keyboard(
                                    onDigitPressed: (int digit) =>
                                        _bloc.add(OnDigitTap(digit)),
                                    onBackPressed: () =>
                                        _bloc.add(OnBackKeyTap()),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () => _bloc.add(OnNextTap()),
                            child: Text(AppLocalizations.of(context)
                                .create
                                .toUpperCase()),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            );
          },
        ),
      ),
    );
  }
}

class CarouselList<T> extends StatelessWidget {
  CarouselList({
    Key? key,
    required Stream<List<T>> stream,
    required String emptyListMessage,
    required bool Function(T) initialItemFinder,
    required Function(T) onItemChanged,
    required Function(BuildContext, T) itemBuilder,
  })  : _emptyListMessage = emptyListMessage,
        _stream = stream,
        _initialItemFinder = initialItemFinder,
        _onItemChanged = onItemChanged,
        _itemBuilder = itemBuilder,
        super(key: key);

  final Stream<List<T>> _stream;
  final String _emptyListMessage;
  final bool Function(T) _initialItemFinder;
  final Function _onItemChanged;
  final Function(BuildContext, T) _itemBuilder;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _stream,
      initialData: <T>[],
      builder: (BuildContext context, AsyncSnapshot<List<T>> snapshot) {
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Text(_emptyListMessage),
          );
        }

        var items = snapshot.data;

        return Carousel(
          key: GlobalKey(),
          items: items!,
          initialItemFinder: _initialItemFinder,
          onPageChanged: (pos) => _onItemChanged(items[pos]),
          itemHeight: 60.0,
          itemBuilder: (context, pos) => _itemBuilder(context, items[pos]),
        );
      },
    );
  }
}
