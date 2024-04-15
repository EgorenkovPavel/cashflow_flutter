import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/injection_container.dart';
import 'package:money_tracker/src/ui/pages/category/input_page/category_input_bloc.dart';
import 'package:money_tracker/src/ui/pages/item_card.dart';
import 'package:money_tracker/src/ui/widgets/type_radio_button.dart';
import 'package:money_tracker/src/utils/extensions.dart';

import '../../../../domain/models/enum/currency.dart';

class CategoryInputPage extends StatelessWidget {
  final OperationType? type;
  final int? id;

  const CategoryInputPage.byType({super.key, required this.type}) : id = null;

  const CategoryInputPage.edit({super.key, required this.id}) : type = null;

  @override
  Widget build(BuildContext context) {
    final bloc = sl<CategoryInputBloc>();
    if (id != null) {
      bloc.add(CategoryInputEvent.initById(categoryId: id!));
    } else {
      bloc.add(CategoryInputEvent.initByType(operationType: type!));
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
      if (budgetController.text != state.budget.toString()) {
        budgetController.text = state.budget.toString();
      }
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
        title: widget.isNew
            ? context.loc.newCategoryCardTitle
            : context.loc.categoryCardTitle,
        onSave: (context) => context.onSave(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  context.loc.titleType,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text(context.loc.operationTypeTitle(
                  context.operationType(),
                )),
              ],
            ),
            const SizedBox(height: 8.0),
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
            const SizedBox(height: 8.0),
            TextFormField(
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
            const SizedBox(height: 8.0),
            Row(
              children: [
                Text(context.loc.budgetType),
                const SizedBox(width: 16.0),
                TypeRadioButton<BudgetType>(
                  onChange: context.onChangeBudgetType,
                  type: context.budgetType(),
                  items: const [BudgetType.MONTH, BudgetType.YEAR],
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            TypeRadioButton<Currency>(
              onChange: context.onChangeCurrency,
              type: context.currency(),
              items: const [
                Currency.RUB,
                Currency.USD,
                Currency.EUR,
              ],
            ),
          ],
        ),
      ),
    );
  }
}

extension BlocExt on BuildContext{
  onChangeCurrency(Currency val) => read<CategoryInputBloc>()
      .add(CategoryInputEvent.changeCurrency(currency: val));

  onChangeBudgetType(BudgetType type) => read<CategoryInputBloc>().add(
    CategoryInputEvent.changeBudgetType(budgetType: type),
  );

  onChangeBudget(String value) => read<CategoryInputBloc>().add(
    CategoryInputEvent.changeBudget(
      budget: int.parse(value.isEmpty ? "0" : value),
    ),
  );

  onChangeTitle(String value) => read<CategoryInputBloc>()
      .add(CategoryInputEvent.changeTitle(title: value));

  onSave() => read<CategoryInputBloc>()
      .add(const CategoryInputEvent.save());

  Currency currency() => select<CategoryInputBloc, Currency>(
        (bloc) => bloc.state.currency,
  );

  BudgetType budgetType() => select<CategoryInputBloc, BudgetType>(
        (bloc) => bloc.state.budgetType,
  );

  OperationType operationType() => select<CategoryInputBloc, OperationType>(
        (bloc) => bloc.state.operationType,
  );
}
