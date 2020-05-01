import 'package:bloc/bloc.dart';
import 'package:cashflow/data/database.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/item_cards/item_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class BudgetCard extends StatefulWidget {
  final int categoryId;

  BudgetCard({@required this.categoryId});

  @override
  _BudgetCardState createState() => _BudgetCardState();
}

class _BudgetCardState extends State<BudgetCard> {
  BudgetCardBloc _bloc;
  final TextEditingController sumController = TextEditingController();

  Widget yearInput() {
    return Container(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () => _bloc.add(DecYear()),
            ),
            BlocBuilder<BudgetCardBloc, BudgetCardState>(
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
        ),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black38),
            borderRadius: BorderRadius.all(Radius.circular(4.0))));
  }

  Widget monthInput() {
    return Container(
      child: BlocBuilder<BudgetCardBloc, BudgetCardState>(
        builder: (BuildContext context, BudgetCardState state) {
          if (state is DataState) {
            return DropdownButton<int>(
              items: BudgetCardBloc.months
                  .map(
                    (m) => DropdownMenuItem<int>(
                      child: Text(DateFormat.MMMM(
                              Localizations.localeOf(context).languageCode)
                          .format(DateTime(1970, m, 1))),
                      value: m,
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
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black38),
          borderRadius: BorderRadius.all(Radius.circular(4.0))),
    );
  }

  @override
  void initState() {
    super.initState();

    _bloc = BlocProvider.of<BudgetCardBloc>(context)
      ..add(Initial(widget.categoryId));
  }

  @override
  void dispose() {
    super.dispose();
    sumController.dispose();
    //_bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return ItemCard(
      title: 'Budget', // TODO
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
      ),
      onSave: (context) => _bloc.add(Save(sumController.text)),
    );
  }
}

abstract class BudgetCardEvent {}

class Initial extends BudgetCardEvent {
  final int categoryId;

  Initial(this.categoryId);
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

class BudgetCardBloc extends Bloc<BudgetCardEvent, BudgetCardState> {
  final Repository _repository;
  static List<int> months = List.generate(12, (index) => index + 1);
  int categoryId;
  int _month;
  int _year;

  BudgetCardBloc(this._repository);

  @override
  BudgetCardState get initialState => DataState(1, 1);

  @override
  Stream<BudgetCardState> mapEventToState(BudgetCardEvent event) async* {
    if (event is Initial) {
      categoryId = event.categoryId;
      DateTime now = DateTime.now();
      _month = now.month;
      _year = now.year;
      yield DataState(_month, _year);
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
      _repository.insertBudget(BudgetData(
          date: DateTime(_year, _month),
          category: categoryId,
          sum: int.parse(event.sum)));
    }
  }
}
