import 'package:bloc/bloc.dart';
import 'package:cashflow/data/mappers/account_balance_mapper.dart';
import 'package:cashflow/data/objects/account.dart';
import 'package:cashflow/data/objects/account_balance.dart';
import 'package:cashflow/data/objects/category.dart';
import 'package:cashflow/data/objects/operation.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/carousel.dart';
import 'package:cashflow/widgets/item_cards/account_card.dart';
import 'package:cashflow/widgets/item_cards/category_card.dart';
import 'package:cashflow/widgets/keyboard.dart';
import 'package:cashflow/widgets/operation_type_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MasterPage extends StatefulWidget {
  static const routeName = '/masterPageNew';

  @override
  _MasterPageState createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage>
    with SingleTickerProviderStateMixin{
  MasterBloc _bloc;
  AnimationController animationController;
  Animation<double> animation;

  double _heigth = 0;

  Widget accountPageView(BuildContext context) {
    return StreamBuilder(
      stream: _bloc.accountStream,
      initialData: <AccountBalance>[],
      builder:
          (BuildContext context, AsyncSnapshot<List<AccountBalance>> snapshot) {
        if (!snapshot.hasData || snapshot.data.isEmpty) {
          return Center(
            child: Text(AppLocalizations.of(context).noAccounts),
          );
        }

        List<AccountBalance> accounts = snapshot.data;

        return Carousel(
          key: GlobalKey(),
          items: accounts,
          initialItem: _bloc.account,
          onPageChanged: (pos) => _bloc.add(OnAccountChanged(accounts[pos])),
          itemHeight: 60.0,
          itemBuilder: (context, pos) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(accounts[pos].title),
                Text(
                  NumberFormat().format(accounts[pos].balance),
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            );
          },
        );
      },
    );
  }

  Widget categoryInPageView(BuildContext context) {
    return StreamBuilder(
      stream: _bloc.categoryInStream,
      initialData: <Category>[],
      builder: (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
        if (!snapshot.hasData || snapshot.data.isEmpty) {
          return Center(
            child: Text(AppLocalizations.of(context).noCategories),
          );
        }

        List<Category> categories = snapshot.data;

        return Carousel(
          key: GlobalKey(),
          initialItem: _bloc.categoryIn,
          items: categories,
          onPageChanged: (pos) =>
              _bloc.add(OnCategoryInChanged(categories[pos])),
          itemHeight: 60.0,
          itemBuilder: (context, pos) {
            return Center(child: Text(categories[pos].title));
          },
        );
      },
    );
  }

  Widget categoryOutPageView(BuildContext context) {
    return StreamBuilder(
      stream: _bloc.categoryOutStream,
      initialData: <Category>[],
      builder: (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
        if (!snapshot.hasData || snapshot.data.isEmpty) {
          return Center(
            child: Text(AppLocalizations.of(context).noCategories),
          );
        }

        List<Category> categories = snapshot.data;

        return Carousel(
          key: GlobalKey(),
          initialItem: _bloc.categoryOut,
          items: categories,
          onPageChanged: (pos) =>
              _bloc.add(OnCategoryOutChanged(categories[pos])),
          itemHeight: 60.0,
          itemBuilder: (context, pos) {
            return Center(child: Text(categories[pos].title));
          },
        );
      },
    );
  }

  Widget recAccountPageView(BuildContext context) {
    return StreamBuilder(
      stream: _bloc.accountStream,
      initialData: <AccountBalance>[],
      builder:
          (BuildContext context, AsyncSnapshot<List<AccountBalance>> snapshot) {
        if (!snapshot.hasData || snapshot.data.isEmpty) {
          return Center(
            child: Text(AppLocalizations.of(context).noAccounts),
          );
        }

        List<AccountBalance> accounts = snapshot.data;

        return Carousel(
          key: GlobalKey(),
          items: accounts,
          initialItem: _bloc.recAccount,
          onPageChanged: (pos) => _bloc.add(OnRecAccountChanged(accounts[pos])),
          itemHeight: 60.0,
          itemBuilder: (context, pos) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(accounts[pos].title),
                Text(
                  NumberFormat().format(accounts[pos].balance),
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            );
          },
        );
      },
    );
  }

  Widget title(String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.subtitle,
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
                title(titleStr),
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

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<MasterBloc>(context);
    _bloc.add(Start());

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    )..addListener(() => setState(() {}));
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
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
          listener: (BuildContext context, MasterState state) {
            if (state is ClosePage) {
              Navigator.of(context).pop();
            } else if(state is ShowKeyboad) {
              animationController.forward();
            } else if(state is HideKeyBoard){
              animationController.reverse();
            } else if (state is EmptyAccountMessage) {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(AppLocalizations.of(context).emptyAccountError),
              ));
            } else if (state is EmptyCategoryMessage) {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(AppLocalizations.of(context).emptyCategoryError),
              ));
            } else if (state is EmptyRecAccountMessage) {
              Scaffold.of(context).showSnackBar(SnackBar(
                content:
                    Text(AppLocalizations.of(context).emptyRecAccountError),
              ));
            } else if (state is EmptySumMessage) {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(AppLocalizations.of(context).emptySumError),
              ));
            } else if (state is OperationCreatedMessage) {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(AppLocalizations.of(context).mesOperationCreated),
                action: SnackBarAction(
                  label: AppLocalizations.of(context).cancel,
                  onPressed: () {
                    _bloc.add(CancelOperation());
                  },
                ),
              ));
            } else if (state is OperationCanceled){
              Scaffold.of(context).showSnackBar(
                SnackBar(content: Text(AppLocalizations.of(context).mesOperationCanceled),)
              );
            }
          },
          buildWhen: (oldState, newState) {
            return newState is DataState;
          },
          builder: (BuildContext context, MasterState state) {
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
                          AppLocalizations.of(context).accounts,
                          () => AccountCard.open(context),
                          accountPageView(context)),
                      (state as DataState).type == OperationType.INPUT
                          ? buildList(
                              AppLocalizations.of(context).categories,
                              () => CategoryCard.open(context,
                                  type: OperationType.INPUT),
                              categoryInPageView(context))
                          : SizedBox(),
                      (state as DataState).type == OperationType.OUTPUT
                          ? buildList(
                              AppLocalizations.of(context).categories,
                              () => CategoryCard.open(context,
                                  type: OperationType.OUTPUT),
                              categoryOutPageView(context))
                          : SizedBox(),
                      (state as DataState).type == OperationType.TRANSFER
                          ? buildList(
                              AppLocalizations.of(context).accounts,
                              () => AccountCard.open(context),
                              recAccountPageView(context))
                          : SizedBox(),
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
                          FlatButton(
                            child: Text(AppLocalizations.of(context)
                                .more
                                .toUpperCase()),
                            onPressed: () => _bloc.add(OnMoreTap()),
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
                                      child: Text(
                                        NumberFormat()
                                            .format((state as DataState).sum),
                                        style: Theme.of(context)
                                            .textTheme
                                            .display1
                                            .copyWith(color: Colors.black),
                                      ),
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
                                    ),
                                  ),
                                ),
                                SizeTransition(
                                  axis: Axis.vertical,
                                  sizeFactor: animation,
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
                          FlatButton(
                            child: Text(AppLocalizations.of(context)
                                .create
                                .toUpperCase()),
                            onPressed: () => _bloc.add(OnNextTap()),
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

abstract class MasterEvent {}

class Start extends MasterEvent {}

class BackPressed extends MasterEvent {}

class TypeChanged extends MasterEvent {
  final OperationType type;

  TypeChanged(this.type);
}

class OnSumTap extends MasterEvent {}

class OnDigitTap extends MasterEvent {
  final int digit;

  OnDigitTap(this.digit);
}

class OnBackKeyTap extends MasterEvent {}

class OnAddNewItem extends MasterEvent {}

class OnMoreTap extends MasterEvent {}

class OnNextTap extends MasterEvent {}

class OnAccountChanged extends MasterEvent {
  final AccountBalance account;

  OnAccountChanged(this.account);
}

class OnCategoryInChanged extends MasterEvent {
  final Category category;

  OnCategoryInChanged(this.category);
}

class OnCategoryOutChanged extends MasterEvent {
  final Category category;

  OnCategoryOutChanged(this.category);
}

class OnRecAccountChanged extends MasterEvent {
  final AccountBalance account;

  OnRecAccountChanged(this.account);
}

class CancelOperation extends MasterEvent{
  
}

abstract class MasterState {}

class DataState extends MasterState {
  final OperationType type;
  final AccountBalance account;
  final Category categoryIn;
  final Category categoryOut;
  final AccountBalance recAccount;
  final int sum;
  final bool showKeyboard;
  final int operationId;

  DataState(
      {this.type,
      this.account,
      this.categoryIn,
      this.categoryOut,
      this.recAccount,
      this.sum,
      this.showKeyboard,
      this.operationId});

  DataState copyWith(
          {OperationType type,
          AccountBalance account,
          Category categoryIn,
          Category categoryOut,
          AccountBalance recAccount,
          int sum,
          bool showKeyboard,
          int operationId}) =>
      DataState(
        type: type ?? this.type,
        account: account ?? this.account,
        categoryIn: categoryIn ?? this.categoryIn,
        categoryOut: categoryOut ?? this.categoryOut,
        recAccount: recAccount ?? this.recAccount,
        sum: sum ?? this.sum,
        showKeyboard: showKeyboard ?? this.showKeyboard,
        operationId: operationId ?? this.operationId,
      );
}

class ClosePage extends MasterState {}

class ShowKeyboad extends MasterState{}

class HideKeyBoard extends MasterState{}

class EmptyAccountMessage extends MasterState {}

class EmptyCategoryMessage extends MasterState {}

class EmptyRecAccountMessage extends MasterState {}

class EmptySumMessage extends MasterState {}

class OperationCreatedMessage extends MasterState {}

class OperationCanceled extends MasterState{}

class MasterBloc extends Bloc<MasterEvent, MasterState> {
  final Repository _repository;
  final Stream<List<AccountBalance>> accountStream;
  final Stream<List<Category>> categoryInStream;
  final Stream<List<Category>> categoryOutStream;

  static DataState _data =
      DataState(type: OperationType.INPUT, showKeyboard: false, sum: 0);

  MasterBloc(this._repository)
      : accountStream = _repository.watchAllAccountsBalance(),
        categoryInStream =
            _repository.watchAllCategoriesByType(OperationType.INPUT),
        categoryOutStream =
            _repository.watchAllCategoriesByType(OperationType.OUTPUT),
        super(_data);

  @override
  MasterState get initialState => _data;

  AccountBalance get account => _data.account;

  Category get categoryIn => _data.categoryIn;

  Category get categoryOut => _data.categoryOut;

  AccountBalance get recAccount => _data.recAccount;

  @override
  Stream<MasterState> mapEventToState(MasterEvent event) async* {
    if (event is Start) {
      Operation op = await _repository.getLastOperation();

      if (op == null){
        return;
      }

      _data = _data.copyWith(
          account: AccountBalance(
              id: op.account.id,
              title: op.account.title,
              archive: op.account.archive,
              balance: 0),
          type: op.type);
      switch (op.type) {
        case OperationType.INPUT:
          _data = _data.copyWith(categoryIn: op.category);
          break;
        case OperationType.OUTPUT:
          _data = _data.copyWith(categoryOut: op.category);
          break;
        case OperationType.TRANSFER:
          _data = _data.copyWith(
              recAccount: AccountBalance(
                  id: op.recAccount.id,
                  title: op.recAccount.title,
                  archive: op.recAccount.archive,
                  balance: 0));
          break;
      }
    } else if (event is BackPressed) {
      if (_data.showKeyboard) {
        _data = _data.copyWith(showKeyboard: false);
        yield HideKeyBoard();
      } else {
        yield ClosePage();
        return;
      }
    } else if (event is OnAddNewItem) {
      if (_data.showKeyboard) {
        _data = _data.copyWith(showKeyboard: false);
        yield HideKeyBoard();
      } else {
        return;
      }
    } else if (event is OnSumTap) {
      if (!_data.showKeyboard) {
        _data = _data.copyWith(showKeyboard: true);
        yield ShowKeyboad();
      }
    } else if (event is TypeChanged) {
      _data = _data.copyWith(type: event.type);
    } else if (event is OnDigitTap) {
      _data = _data.copyWith(sum: _data.sum * 10 + event.digit);
    } else if (event is OnBackKeyTap) {
      _data = _data.copyWith(sum: (_data.sum / 10).floor());
    } else if (event is OnMoreTap) {
      yield ClosePage();
      return;
    } else if (event is OnAccountChanged) {
      _data = _data.copyWith(account: event.account);
      return;
    } else if (event is OnCategoryInChanged) {
      _data = _data.copyWith(categoryIn: event.category);
      return;
    } else if (event is OnCategoryOutChanged) {
      _data = _data.copyWith(categoryOut: event.category);
      return;
    } else if (event is OnRecAccountChanged) {
      _data = _data.copyWith(recAccount: event.account);
      return;
    } else if (event is CancelOperation){
      
      await _repository.deleteOperationById(_data.operationId);
      _data = _data.copyWith(operationId: null);
      yield OperationCanceled();
      
    } else if (event is OnNextTap) {
      if (_data.account == null) {
        yield EmptyAccountMessage();
        return;
      }

      if (_data.type == OperationType.TRANSFER && _data.recAccount == null) {
        yield EmptyRecAccountMessage();
        return;
      }

      if (_data.type == OperationType.INPUT && _data.categoryIn == null) {
        yield EmptyCategoryMessage();
        return;
      }

      if (_data.type == OperationType.OUTPUT && _data.categoryOut == null) {
        yield EmptyCategoryMessage();
        return;
      }

      if (_data.sum == 0) {
        yield EmptySumMessage();
        return;
      }

      int opId = await _saveOperation();
      print(opId.toString());
      _data = _data.copyWith(operationId: opId);

      yield OperationCreatedMessage();

      _data = _data.copyWith(sum: 0, showKeyboard: false);
      yield HideKeyBoard();
    }
    yield _data;
  }

  Future<int> _saveOperation() {
    switch (_data.type) {
      case OperationType.INPUT:
        {
          Operation operation = Operation(
              date: DateTime.now(),
              type: _data.type,
              account: const AccountBalanceMapper().mapToAccount(_data.account),
              category: _data.categoryIn,
              sum: _data.sum);

          return _repository.insertOperation(operation);
        }
      case OperationType.OUTPUT:
        {
          Operation operation = Operation(
              date: DateTime.now(),
              type: _data.type,
              account: const AccountBalanceMapper().mapToAccount(_data.account),
              category: _data.categoryOut,
              sum: _data.sum);

          return _repository.insertOperation(operation);
        }
      case OperationType.TRANSFER:
        {
          Operation operation = Operation(
              date: DateTime.now(),
              type: _data.type,
              account: const AccountBalanceMapper().mapToAccount(_data.account),
              recAccount:
                  const AccountBalanceMapper().mapToAccount(_data.recAccount),
              sum: _data.sum);

          return _repository.insertOperation(operation);
        }
    }
  }
}
