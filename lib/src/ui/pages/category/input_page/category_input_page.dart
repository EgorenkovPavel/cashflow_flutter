import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/injection_container.dart';
import 'package:money_tracker/src/ui/pages/category/input_page/category_input_bloc.dart';
import 'package:money_tracker/src/ui/pages/item_card.dart';
import 'package:money_tracker/src/ui/widgets/category_parent_field.dart';
import 'package:money_tracker/src/utils/extensions.dart';

class CategoryInputPage extends StatelessWidget {
  final CategoryType? type;
  final bool? isGroup;
  final int? id;

  const CategoryInputPage.byType(
      {super.key, required this.type, required this.isGroup})
      : id = null;

  const CategoryInputPage.edit({super.key, required this.id})
      : type = null,
        isGroup = null;

  @override
  Widget build(BuildContext context) {
    final bloc = sl<CategoryInputBloc>();
    if (id != null) {
      bloc.add(CategoryInputEvent.initById(categoryId: id!));
    } else {
      bloc.add(CategoryInputEvent.initByType(type: type!, isGroup: isGroup!));
    }

    return BlocProvider(
      create: (context) => bloc,
      child: CategoryPage(
        isNew: id == null,
      ),
    );
  }
}

class CategoryPage extends StatefulWidget {
  final bool isNew;

  const CategoryPage({super.key, required this.isNew});

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

  void _listenState(BuildContext context, CategoryInputState state) {
    if (state.isSaved) {
      Navigator.of(context).pop(state.category);
    } else {
      if (titleController.text != state.title) {
        titleController.text = state.title;
      }
      state.maybeMap(
          inputItem: (s) {
            if (budgetController.text != s.budget.toString()) {
              budgetController.text = s.budget.toString();
            }
          },
          outputItem: (s) {
            if (budgetController.text != s.budget.toString()) {
              budgetController.text = s.budget.toString();
            }
          },
          orElse: () {});
    }
  }

  String? _titleValidator(String? value) {
    if (value == null || value.isEmpty) {
      return context.loc.emptyTitleError;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoryInputBloc, CategoryInputState>(
      listener: _listenState,
      child: ItemCard(
        title: context.isGroup()
            ? widget.isNew
                ? 'New group'
                : 'Group' //TODO
            : widget.isNew
                ? context.loc.newCategoryCardTitle
                : context.loc.categoryCardTitle,
        onSave: (context) => context.onSave(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              //autofocus: true,
              controller: titleController,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: context.loc.title,
              ),
              onChanged: context.onChangeTitle,
              validator: _titleValidator,
            ),
            const SizedBox(height: 16.0),
            if (!context.isGroup())
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: budgetController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: context.loc.budget,
                      ),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: context.onChangeBudget,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  DropdownButton<BudgetType>(
                      underline: SizedBox(),
                      value: context.budgetType(),
                      items: BudgetType.values
                          .map((e) => DropdownMenuItem<BudgetType>(
                                value: e,
                                child: Text(e.name),
                              ))
                          .toList(),
                      onChanged: (value) {
                        context.onChangeBudgetType(value);
                      })
                ],
              ),
            const SizedBox(height: 16.0),
            if (!context.isGroup())
              CategoryParentField(
                initialId: context.parent(),
                type: context.type(),
                onChange: context.onChangeParent,
              ),
            if (!context.isGroup()) const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}

extension CategoryInputBlocExt on BuildContext {
  onChangeBudgetType(BudgetType? type) {
    if (type != null) {
      read<CategoryInputBloc>().add(
        CategoryInputEvent.changeBudgetType(budgetType: type),
      );
    }
  }

  onChangeBudget(String value) => read<CategoryInputBloc>().add(
        CategoryInputEvent.changeBudget(
          budget: int.parse(value.isEmpty ? "0" : value),
        ),
      );

  onChangeTitle(String value) => read<CategoryInputBloc>()
      .add(CategoryInputEvent.changeTitle(title: value));

  onChangeParent(int? parentId) => read<CategoryInputBloc>()
      .add(CategoryInputEvent.changeParent(parentId: parentId));

  onSave() => read<CategoryInputBloc>().add(const CategoryInputEvent.save());

  BudgetType budgetType() => select<CategoryInputBloc, BudgetType>(
        (bloc) => bloc.state.maybeMap(
            inputItem: (s) => s.budgetType,
            outputItem: (s) => s.budgetType,
            orElse: () => BudgetType.MONTH),
      );

  int? parent() => select<CategoryInputBloc, int?>(
        (bloc) => bloc.state.maybeMap(
            inputItem: (s) => s.parent,
            outputItem: (s) => s.parent,
            orElse: () => null),
      );

  bool isGroup() =>
      select<CategoryInputBloc, bool>((bloc) => bloc.state.isGroup);

  CategoryType type() =>
      select<CategoryInputBloc, CategoryType>((bloc) => bloc.state.type);
}
