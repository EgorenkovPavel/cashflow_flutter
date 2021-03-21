import 'package:cashflow/data/objects/account_balance.dart';
import 'package:cashflow/data/objects/category.dart' as data;
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/carousel.dart';
import 'package:cashflow/widgets/keyboard.dart';
import 'package:cashflow/widgets/operation_type_radio_button.dart';
import 'package:cashflow/widgets/pages/account/account_input_page.dart';
import 'package:cashflow/widgets/pages/category/category_input_page.dart';
import 'package:cashflow/widgets/pages/operation/operation_input_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class OperationInputPage extends StatefulWidget {
  static const routeName = '/masterPageNew';

  static void open(BuildContext context) {
    Navigator.of(context).pushNamed(routeName);
  }

  @override
  _OperationInputPageState createState() => _OperationInputPageState();
}

class _OperationInputPageState extends State<OperationInputPage>
    with SingleTickerProviderStateMixin {
  MasterBloc _bloc;
  AnimationController _animationController;
  Animation<double> _animation;

  Widget accountPageView(BuildContext context) {
    return CarouselList<AccountBalance>(
      stream: _bloc.accountStream,
      emptyListMessage: AppLocalizations.of(context).noAccounts,
      initialItemFinder: (account) => _bloc.account != null && account.id == _bloc.account.id,
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
      initialItemFinder: (category) => _bloc.categoryIn != null && category.id == _bloc.categoryIn.id,
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
      initialItemFinder: (category) => _bloc.categoryOut != null && category.id == _bloc.categoryOut.id,
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
      initialItemFinder:(account) => _bloc.recAccount != null && account.id == _bloc.recAccount.id,
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
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    _bloc.add(OnAddNewItem());
                    onAdd();
                  },
                )
              ],
            ),
            Divider(),
            Flexible(child: Container(child: list)),
          ],
        ),
      ),
    );
  }

  Widget buildAnalylicList(OperationType type) {
    switch (type) {
      case OperationType.INPUT:
        return buildList(
            AppLocalizations.of(context).categories,
            () => CategoryInputPage.open(context, type: OperationType.INPUT),
            categoryInPageView(context));
      case OperationType.OUTPUT:
        return buildList(
            AppLocalizations.of(context).categories,
            () => CategoryInputPage.open(context, type: OperationType.OUTPUT),
            categoryOutPageView(context));
      case OperationType.TRANSFER:
        return buildList(AppLocalizations.of(context).receiver,
            () => AccountInputPage.open(context), recAccountPageView(context));
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _bloc.add(BackPressed());
        return Future(() => false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).titleMaster),
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
                    type: (state as DataState).type,
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
                          (state as DataState).type == OperationType.TRANSFER ? AppLocalizations.of(context).source : AppLocalizations.of(context).accounts,
                          () => AccountInputPage.open(context),
                          accountPageView(context)),
                      buildAnalylicList((state as DataState).type),
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
                        color: Colors.white,
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
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                          border: Border.all(
                                              color: (state as DataState)
                                                      .showKeyboard
                                                  ? Theme.of(context)
                                                      .accentColor
                                                  : Theme.of(context)
                                                      .primaryColor,
                                              width: 2.0)),
                                      width: double.infinity,
                                      height: 48.0,
                                      alignment: Alignment.center,
                                      child: Text(
                                        NumberFormat()
                                            .format((state as DataState).sum),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4
                                            .copyWith(color: Colors.black),
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
    Key key,
    Stream<List<T>> stream,
    String emptyListMessage,
    bool Function(T) initialItemFinder,
    Function(T) onItemChanged,
    Function(BuildContext, T) itemBuilder,
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
        if (!snapshot.hasData || snapshot.data.isEmpty) {
          return Center(
            child: Text(_emptyListMessage),
          );
        }

        var items = snapshot.data;

        return Carousel(
            key: GlobalKey(),
            items: items,
            initialItemFinder: _initialItemFinder,
            onPageChanged: (pos) => _onItemChanged(items[pos]),
            itemHeight: 60.0,
            itemBuilder: (context, pos) => _itemBuilder(context, items[pos]));
      },
    );
  }
}