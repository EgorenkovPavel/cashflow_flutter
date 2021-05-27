import 'package:bloc/bloc.dart';
import 'package:cashflow/data/database/database.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/pages/item_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class BudgetCard extends StatefulWidget {
  final int categoryId;
  final int month;
  final int year;

  BudgetCard({@required this.categoryId, this.month, this.year});

  static void open(BuildContext context, int categoryId) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: BudgetCard(
                categoryId: categoryId,
              ),);
        });
  }

  static void openExists(BuildContext context, int categoryId, int month, int year) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: BudgetCard(
                categoryId: categoryId,
                month: month,
                year: year,
              ),);
        });
  }

  @override
  _BudgetCardState createState() => _BudgetCardState();
}

class _BudgetCardState extends State<BudgetCard> {
  BudgetCardBloc _bloc;
  final TextEditingController sumController = TextEditingController();

  Widget yearInput() {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black38),
            borderRadius: BorderRadius.all(Radius.circular(4.0))),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () => _bloc.add(DecYear()),
            ),
            BlocBuilder<BudgetCardBloc, BudgetCardState>(
              buildWhen: (BudgetCardState previous, BudgetCardState current) {
                return current is DataState;
              },
              builder: (BuildContext context, BudgetCardState state) {
                if (state is DataState) {
                  return Text('${state.year}');
                } else {
                  return SizedBox();
                }
              },
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _bloc.add(IncYear()),
            ),
          ],
        ),);
  }

  Widget monthInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black38),
          borderRadius: BorderRadius.all(Radius.circular(4.0))),
      child: BlocBuilder<BudgetCardBloc, BudgetCardState>(
        buildWhen: (BudgetCardState previous, BudgetCardState current) {
          return current is DataState;
        },
        builder: (BuildContext context, BudgetCardState state) {
          if (state is DataState) {
            return DropdownButton<int>(
              items: BudgetCardBloc.months
                  .map(
                    (m) => DropdownMenuItem<int>(
                      value: m,
                      child: Text(DateFormat.MMMM(
                              Localizations.localeOf(context).languageCode)
                          .format(DateTime(1970, m, 1))),
                    ),
                  )
                  .toList(),
              underline: SizedBox(),
              value: state.month,
              onChanged: (value) => _bloc.add(SetMonth(value)),
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }

  @override
  void initState() {
    _bloc = BlocProvider.of<BudgetCardBloc>(context)
      ..add(Initial(widget.categoryId, widget.month, widget.year));

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    sumController.dispose();
    //_bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BudgetCardBloc, BudgetCardState>(
      listener: (BuildContext context, state) {
        if (state is SumLoaded) {
          sumController.text = state.sum.toString();
        }
      },
      child: ItemCard(
          title: AppLocalizations.of(context).titleBudget,
          onSave: (context) => _bloc.add(Save(sumController.text)),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  monthInput(),
                  yearInput(),
                ],
              ),
              SizedBox(
                height: 8.0,
              ),
              TextFormField(
                controller: sumController,
                keyboardType: TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: AppLocalizations.of(context).titleSum,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return AppLocalizations.of(context).emptyTitleError;
                  }
                  return null;
                },
              ),
            ],
          ),),
    );
  }
}

abstract class BudgetCardEvent {}

class Initial extends BudgetCardEvent {
  final int categoryId;
  final int month;
  final int year;

  Initial(this.categoryId, this.month, this.year);
}

class Save extends BudgetCardEvent {
  final String sum;

  Save(this.sum);
}

class IncYear extends BudgetCardEvent {}

class DecYear extends BudgetCardEvent {}

class SetMonth extends BudgetCardEvent {
  final int month;

  SetMonth(this.month);
}

abstract class BudgetCardState {}

class DataState extends BudgetCardState {
  final int month;
  final int year;

  DataState(this.month, this.year);
}

class SumLoaded extends BudgetCardState {
  final int sum;

  SumLoaded(this.sum);
}

class BudgetCardBloc extends Bloc<BudgetCardEvent, BudgetCardState> {
  final Repository _repository;
  static List<int> months = List.generate(12, (index) => index + 1);
  int categoryId;
  int _month;
  int _year;
  BudgetDB _oldBudgetData;

  BudgetCardBloc(this._repository) : super(DataState(1, 1));

  @override
  Stream<BudgetCardState> mapEventToState(BudgetCardEvent event) async* {
    if (event is Initial) {
      categoryId = event.categoryId;

      _month = event.month;
      _year = event.year;
      yield DataState(_month, _year);

        _oldBudgetData =
            await _repository.getBudget(event.categoryId, event.month, event.year);
        if (_oldBudgetData != null) {
          yield SumLoaded(_oldBudgetData.sum);
        }

    } else if (event is IncYear) {
      ++_year;
      yield DataState(_month, _year);
    } else if (event is DecYear) {
      --_year;
      yield DataState(_month, _year);
    } else if (event is SetMonth) {
      _month = event.month;
      yield DataState(_month, _year);
    } else if (event is Save) {
      if(_oldBudgetData != null) {
        await _repository.deleteBudget(_oldBudgetData);
        _oldBudgetData = null;
      }
      await _repository.insertBudget(BudgetDB(
          month: _month,
          year: _year,
          category: categoryId,
          sum: int.parse(event.sum)));
    }
  }
}
