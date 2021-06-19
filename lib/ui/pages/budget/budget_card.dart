import 'package:bloc/bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/data/repository.dart';
import 'package:money_tracker/domain/models/budget.dart';
import 'package:money_tracker/domain/models/budget_type.dart';
import 'package:money_tracker/domain/models/category.dart';
import 'package:money_tracker/ui/widgets/dropdown_list.dart';
import 'package:money_tracker/ui/pages/item_card.dart';
import 'package:money_tracker/utils/app_localization.dart';
import 'package:provider/provider.dart';

class BudgetCard extends StatefulWidget {
  late final Category? category;
  late final int month;
  late final int year;
  late final BudgetType budgetType;
  late final int sum;

  BudgetCard({required this.budgetType}) {
    sum = 0;
    var date = DateTime.now();
    month = date.month;
    year = date.year;
    category = null;
  }

  BudgetCard.budget({required Budget budget}) {
    category = budget.category;
    month = budget.month;
    year = budget.year;
    budgetType = budget.type;
    sum = budget.sum;
  }

  @override
  _BudgetCardState createState() => _BudgetCardState();
}

class _BudgetCardState extends State<BudgetCard> {
  late BudgetCardBloc _bloc;
  final TextEditingController sumController = TextEditingController();

  @override
  void initState() {
    _bloc = BlocProvider.of<BudgetCardBloc>(context)
      ..init(widget.category, widget.budgetType, widget.month, widget.year);

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
        } else if (state is Close) {
          Navigator.of(context).pop();
        }
      },
      child: ItemCard(
        title: AppLocalizations.of(context).titleBudget,
        onSave: (context) => _bloc.save(int.parse(sumController.text)),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                widget.budgetType == BudgetType.MONTH
                    ? MonthInput(onChange: (value) => _bloc.setMonth(value))
                    : SizedBox(),
                BlocBuilder<BudgetCardBloc, BudgetCardState>(
                  buildWhen:
                      (BudgetCardState previous, BudgetCardState current) {
                    return current is DataState;
                  },
                  builder: (BuildContext context, BudgetCardState state) {
                    if (state is DataState) {
                      return YearInput(
                          year: state.year,
                          onInc: () => _bloc.incrementYear(),
                          onDec: () => _bloc.decrementYear());
                    } else {
                      return SizedBox();
                    }
                  },
                ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            BlocBuilder<BudgetCardBloc, BudgetCardState>(
                bloc: _bloc,
                buildWhen: (BudgetCardState previous, BudgetCardState current) {
                  return current is DataState;
                },
                builder: (context, state) {
                  if (state is DataState) {
                    return FutureBuilder<List<Category>>(
                        future:
                            Provider.of<Repository>(context).getAllCategories(),
                        builder: (context, snapshot) {
                          var categories = <Category>[];
                          if (snapshot.hasData) {
                            categories.addAll(snapshot.data!);
                          }
                          return CategoryList(
                            category: state.category,
                            categories: categories,
                            onChange: (category) => _bloc.setCategory(category),
                          );
                        });
                  } else {
                    return SizedBox();
                  }
                }),
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
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context).emptyTitleError;
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MonthInput extends StatelessWidget {
  final void Function(int) onChange;

  const MonthInput({Key? key, required this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              onChanged: (value) {
                if (value != null) {
                  onChange(value);
                }
              },
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}

class YearInput extends StatelessWidget {
  final int year;
  final void Function() onInc;
  final void Function() onDec;

  const YearInput(
      {Key? key, required this.year, required this.onInc, required this.onDec})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black38),
          borderRadius: BorderRadius.all(Radius.circular(4.0))),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () => onDec(),
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
            onPressed: () => onInc(),
          ),
        ],
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  final Category? category;
  final List<Category> categories;
  final void Function(Category) onChange;

  const CategoryList(
      {Key? key,
      this.category,
      required this.categories,
      required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownList<Category>(
        value: category,
        hint: AppLocalizations.of(context).hintCategory,
        onChange: (Category? newValue) {
          if (newValue != null) {
            onChange(newValue);
            // setState(() {
            // _category = newValue;
            // });
          }
        },
        items: categories,
        getListItem: (item) => ListTile(title: Text(item.title)));
  }
}

abstract class BudgetCardState {}

class DataState extends BudgetCardState {
  final int month;
  final int year;
  final Category? category;

  DataState(this.month, this.year, this.category);
}

class SumLoaded extends BudgetCardState {
  final int sum;

  SumLoaded(this.sum);
}

class Close extends BudgetCardState {}

class BudgetCardBloc extends Cubit<BudgetCardState> {
  final Repository _repository;
  static List<int> months = List.generate(12, (index) => index + 1);
  late Category? _category;
  late int _month;
  late int _year;
  late BudgetType _budgetType;
  Budget? _oldBudgetData;

  BudgetCardBloc(this._repository) : super(DataState(1, 1, null));

  Future<void> init(
      Category? category, BudgetType budgetType, int month, int year) async {
    _category = category;
    _month = month;
    _year = year;
    _budgetType = budgetType;

    emit(DataState(_month, _year, category));

    if (_category != null) {
      _oldBudgetData = await _repository.getBudget(
          _category!.id, _budgetType, _month, _year);
      if (_oldBudgetData != null) {
        emit(SumLoaded(_oldBudgetData!.sum));
      }
    }
  }

  void incrementYear() {
    ++_year;
    emit(DataState(_month, _year, _category));
  }

  void decrementYear() {
    --_year;
    emit(DataState(_month, _year, _category));
  }

  void setMonth(int month) {
    _month = month;
    emit(DataState(_month, _year, _category));
  }

  void setCategory(Category category) {
    _category = _category;
    emit(DataState(_month, _year, _category));
  }

  Future<void> save(int sum) async {
    if (_oldBudgetData != null) {
      await _repository.deleteBudget(_oldBudgetData!);
      _oldBudgetData = null;
    }
    await _repository.insertBudget(Budget(
        month: _month,
        year: _year,
        category: _category!,
        sum: sum,
        type: _budgetType));
    emit(Close());
  }
}
