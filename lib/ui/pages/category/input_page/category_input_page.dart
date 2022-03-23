import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/domain/interfaces/data_repository.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/ui/pages/category/input_page/category_input_bloc.dart';
import 'package:money_tracker/ui/pages/item_card.dart';
import 'package:money_tracker/ui/widgets/type_radio_button.dart';
import 'package:money_tracker/utils/app_localization.dart';

class CategoryInputPage extends StatelessWidget {
  final OperationType? type;
  final int? id;

  const CategoryInputPage.byType({Key? key, required this.type})
      : id = null,
        super(key: key);

  const CategoryInputPage.edit({Key? key, required this.id})
      : type = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final _bloc = CategoryInputBloc(context.read<DataRepository>());
    if (id != null) {
      _bloc.add(InitById(id!));
    } else {
      _bloc.add(InitByType(type!));
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
    return BlocListener<CategoryInputBloc, CategoryInputState>(
      listener: (context, state) {
        if (state is Saved) {
          Navigator.of(context).pop(state.category);
        } else if (state is Restore) {
          titleController.text = state.title;
          budgetController.text = state.budget.toString();
        }
      },
      child: ItemCard(
        title: widget.isNew
            ? AppLocalizations.of(context).newCategoryCardTitle
            : AppLocalizations.of(context).categoryCardTitle,
        onSave: (context) {
          context.read<CategoryInputBloc>().add(Save());
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
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text(AppLocalizations.of(context).operationTypeTitle(
                    context.select<CategoryInputBloc, OperationType>(
                      (bloc) => bloc.state.operationType,
                    ),
                  )),
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              //autofocus: true,
              controller: titleController,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context).title,
              ),
              onChanged: (value) =>
                  context.read<CategoryInputBloc>().add(ChangeTitle(value)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context).emptyTitleError;
                }

                return null;
              },
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              controller: budgetController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context).budget,
              ),
              onChanged: (value) => context
                  .read<CategoryInputBloc>()
                  .add(ChangeBudget(int.parse(value))),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context).emptyTitleError;
                }

                return null;
              },
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                Text(AppLocalizations.of(context).budgetType),
                const SizedBox(width: 16.0),
                TypeRadioButton<BudgetType>(
                  onChange: (type) => context
                      .read<CategoryInputBloc>()
                      .add(ChangeBudgetType(type)),
                  type: context.select<CategoryInputBloc, BudgetType>(
                    (bloc) => bloc.state.budgetType,
                  ),
                  items: const [BudgetType.MONTH, BudgetType.YEAR],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
