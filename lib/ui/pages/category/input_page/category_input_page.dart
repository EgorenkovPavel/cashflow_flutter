import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/domain/models/operation_type.dart';
import 'package:money_tracker/ui/pages/category/input_page/category_input_page_bloc.dart';
import 'package:money_tracker/ui/pages/item_card.dart';
import 'package:money_tracker/utils/app_localization.dart';

class CategoryInputPage extends StatefulWidget {
  final OperationType type;

  CategoryInputPage({required this.type});

  @override
  _CategoryInputPageState createState() => _CategoryInputPageState();
}

class _CategoryInputPageState extends State<CategoryInputPage> {
  late CategoryInputPageBloc _bloc;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController budgetController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<CategoryInputPageBloc>(context)
      ..initial(widget.type);
  }

  @override
  void dispose() {
    super.dispose();
    //_bloc.close();
    titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoryInputPageBloc, CategoryInputPageState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state is Saved) {
          Navigator.of(context).pop(state.category);
        }
      },
      child: ItemCard(
        title: AppLocalizations.of(context).newCategoryCardTitle,
        onSave: (context) {
          _bloc.save(titleController.text, budgetController.text);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    AppLocalizations.of(context).titleType,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocBuilder<CategoryInputPageBloc,
                      CategoryInputPageState>(builder: (context, state) {
                    if (state is InputState) {
                      return Text(getOperationTitle(context, widget.type));
                    } else {
                      return SizedBox();
                    }
                  }),
                )
              ],
            ),
            TextFormField(
              autofocus: true,
              controller: titleController,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                labelText: AppLocalizations.of(context).title,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context).emptyTitleError;
                }
                return null;
              },
            ),
            TextFormField(
              controller: budgetController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                labelText: 'budget',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context).emptyTitleError;
                }
                return null;
              },
            ),
            BlocBuilder<CategoryInputPageBloc, CategoryInputPageState>(
              bloc: _bloc,
                buildWhen: (previous, current){
                return current is InputState;
                },
                builder: (context, state){
                  return Row(
                    children: [
                      Text('Budget type'),
                      SizedBox(width: 16.0,),
                      ToggleButtons(
                        children: BudgetType.values
                            .map((e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(getBudgetTypeTitle(e).toUpperCase()),
                            ))
                            .toList(),
                        isSelected: BudgetType.values.map((e) => e == (state as InputState).budgetType).toList(),
                        onPressed: (pos) =>
                        _bloc.setbudgetType(BudgetType.values[pos]),
                      ),
                    ],
                  );
                }),

          ],
        ),
      ),
    );
  }
}
