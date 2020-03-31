import 'package:cashflow/widgets/item_cards/item_card.dart';
import 'package:cashflow/data/database.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BudgetCard extends StatefulWidget {
  final int categoryId;

  BudgetCard({@required this.categoryId});

  @override
  _BudgetCardState createState() => _BudgetCardState();
}

class _BudgetCardState extends State<BudgetCard> {
  final TextEditingController sumController = TextEditingController();

  static List<int> months = List.generate(12, (index) => index + 1);

  int _month;
  int _year;

  void saveBudget(BuildContext context) {
    Provider.of<Repository>(context, listen: false).insertBudget(BudgetData(
        date: DateTime(_year, _month),
        category: widget.categoryId,
        sum: int.parse(sumController.text)));
  }

  Widget yearInput() {
    return Container(
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              setState(() {
                --_year;
              });
            },
          ),
          Text('$_year'),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              setState(() {
                ++_year;
              });
            },
          ),
        ],
      ),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black38),
            borderRadius: BorderRadius.all(Radius.circular(4.0)))
    );
  }

  Widget monthInput() {
    return Container(
      child: DropdownButton<int>(
        items: months
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
        value: _month,
        onChanged: (value) {
          setState(() {
            _month = value;
          });
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

    DateTime now = DateTime.now();
    _month = now.month;
    _year = now.year;
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
          SizedBox(height: 8.0,),
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
      onSave: (context) {
        saveBudget(context);
      },
    );
  }
}
