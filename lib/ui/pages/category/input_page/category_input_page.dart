import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/local/local_source.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/ui/pages/category/input_page/category_input_page_bloc.dart';
import 'package:money_tracker/ui/pages/item_card.dart';
import 'package:money_tracker/ui/widgets/type_radio_button.dart';
import 'package:money_tracker/utils/app_localization.dart';

class CategoryInputPage extends StatelessWidget {
  final OperationType? type;
  final int? id;

  const CategoryInputPage.byType({required this.type}) : id = null;

  const CategoryInputPage.edit({required this.id}) : type = null;

  @override
  Widget build(BuildContext context) {
    final _bloc = CategoryInputPageBloc(context.read<LocalSource>());
    if (id != null) {
      _bloc.initialById(id!);
    } else {
      _bloc.initialByType(type!);
    }
    return BlocProvider(
      create: (context) => _bloc,
      child: CategoryPage(
        isNew: id == null,
      ),
    );
  }
}

class CategoryPage extends StatefulWidget {
  final bool isNew;

  const CategoryPage({Key? key, required this.isNew}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController budgetController =
      TextEditingController(text: '0');

  @override
  void dispose() {
    titleController.dispose();
    budgetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryInputPageBloc, CategoryInputPageState>(
      listener: (context, state) {
        if (state is Saved) {
          Navigator.of(context).pop(state.category);
        } else if (state is InitState) {
          titleController.text = state.title;
          budgetController.text = state.budget.toString();
        }
      },
      buildWhen: (previous, current) => current is InputState,
      builder: (context, state) {
        if (!(state is InputState)) {
          return SizedBox();
        }
        return ItemCard(
          title: widget.isNew
              ? AppLocalizations.of(context).newCategoryCardTitle
              : AppLocalizations.of(context).categoryCardTitle,
          onSave: (context) {
            context.read<CategoryInputPageBloc>().save();
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
                    Text(AppLocalizations.of(context)
                        .operationTypeTitle(state.type)),
                  ],
                ),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                autofocus: true,
                controller: titleController,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context).title,
                ),
                onChanged: (value) =>
                    context.read<CategoryInputPageBloc>().changeTitle(value),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context).emptyTitleError;
                  }
                  return null;
                },
              ),
              SizedBox(height: 8.0),
              TextFormField(
                controller: budgetController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context).budget,
                ),
                onChanged: (value) =>
                    context.read<CategoryInputPageBloc>().changeBudget(value),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context).emptyTitleError;
                  }
                  return null;
                },
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  Text(AppLocalizations.of(context).budgetType),
                  SizedBox(width: 16.0),
                  TypeRadioButton<BudgetType>(
                    onChange: (type) => context
                        .read<CategoryInputPageBloc>()
                        .setBudgetType(type),
                    type: (state).budgetType,
                    items: [BudgetType.MONTH, BudgetType.YEAR],
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
