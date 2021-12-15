import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/local/local_source.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/ui/pages/category/input_page/category_input_page_bloc.dart';
import 'package:money_tracker/ui/pages/item_card.dart';
import 'package:money_tracker/ui/widgets/type_radio_button.dart';
import 'package:money_tracker/utils/app_localization.dart';

class CategoryInputPage extends StatefulWidget {
  final OperationType? type;
  final int? id;

  const CategoryInputPage.byType({required this.type}) : id = null;

  const CategoryInputPage.edit({required this.id}) : type = null;

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
    _bloc = CategoryInputPageBloc(context.read<LocalSource>());
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

        if (state.title != null) {
          titleController.text = state.title!;
        }

        if (state.budget != null) {
          budgetController.text = state.budget.toString();
        }

        return ItemCard(
          title: widget.id == null
              ? AppLocalizations.of(context).newCategoryCardTitle
              : AppLocalizations.of(context).categoryCardTitle,
          onSave: (context) {
            _bloc.save(titleController.text, budgetController.text);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context).titleType,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    BlocBuilder<CategoryInputPageBloc, CategoryInputPageState>(
                        bloc: _bloc,
                        builder: (context, state) {
                          if (state is InputState) {
                            return Text(AppLocalizations.of(context)
                                .operationTypeTitle(state.type));
                          } else {
                            return SizedBox();
                          }
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextFormField(
                autofocus: true,
                controller: titleController,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  // focusedBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(),
                  // ),
                  labelText: AppLocalizations.of(context).title,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context).emptyTitleError;
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 8.0,
              ),
              TextFormField(
                controller: budgetController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  // focusedBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(),
                  // ),
                  labelText: AppLocalizations.of(context).budget,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context).emptyTitleError;
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  Text(AppLocalizations.of(context).budgetType),
                  SizedBox(
                    width: 16.0,
                  ),
                  TypeRadioButton<BudgetType>(
                      onChange: (type) => _bloc.setBudgetType(type),
                      type: (state).budgetType,
                      items: [BudgetType.MONTH, BudgetType.YEAR])
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
