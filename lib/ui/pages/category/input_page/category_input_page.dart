import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/repository.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/domain/models/operation_type.dart';
import 'package:money_tracker/ui/pages/category/input_page/category_input_page_bloc.dart';
import 'package:money_tracker/ui/pages/item_card.dart';
import 'package:money_tracker/utils/app_localization.dart';

class CategoryInputPage extends StatefulWidget {
  OperationType? type;
  int? id;

  CategoryInputPage.byType({required this.type});

  CategoryInputPage.edit({required this.id});

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
    _bloc = CategoryInputPageBloc(context.read<Repository>());
    if (widget.id != null) {
      _bloc.initialById(widget.id!);
    } else {
      _bloc.initialByType(widget.type!);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
    titleController.dispose();
    budgetController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryInputPageBloc, CategoryInputPageState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state is Saved) {
          Navigator.of(context).pop(state.category);
        }
      },
      builder: (context, state) {
        if (!(state is InputState)) {
          return SizedBox();
        }

        if ((state as InputState).title != null) {
          titleController.text = (state as InputState).title!;
        }

        if ((state as InputState).budget != null) {
          budgetController.text = (state as InputState).budget.toString();
        }

        return ItemCard(
          title: widget.id == null
              ? AppLocalizations.of(context).newCategoryCardTitle
              : AppLocalizations.of(context).categoryCardTitle,
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
                            CategoryInputPageState>(
                        bloc: _bloc,
                        builder: (context, state) {
                          if (state is InputState) {
                            return Text(getOperationTitle(context, state.type));
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
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
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
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
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
              Row(
                children: [
                  Text('Budget type'),
                  SizedBox(
                    width: 16.0,
                  ),
                  ToggleButtons(
                    children: BudgetType.values
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(getBudgetTypeTitle(e).toUpperCase()),
                            ))
                        .toList(),
                    isSelected: BudgetType.values
                        .map((e) => e == (state as InputState).budgetType)
                        .toList(),
                    onPressed: (pos) =>
                        _bloc.setbudgetType(BudgetType.values[pos]),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
