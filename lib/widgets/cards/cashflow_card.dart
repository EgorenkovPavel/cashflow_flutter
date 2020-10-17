import 'package:bloc/bloc.dart';
import 'package:cashflow/data/objects/category_cashflow_budget.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/card_title.dart';
import 'package:cashflow/widgets/cards/card_bar_button.dart';
import 'package:cashflow/widgets/cards/empty_card_hint.dart';
import 'package:cashflow/widgets/charts/month_cashflow_chart.dart';
import 'package:cashflow/widgets/pages/category/category_list_page.dart';
import 'package:cashflow/widgets/pages/reports_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CashflowCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CashflowCardBloc>(context)..add(Fetch());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CardTitle(AppLocalizations.of(context).titleCashflow),
        BlocBuilder<CashflowCardBloc, CashflowCardState>(
          builder: (BuildContext context, CashflowCardState state) {
            if (state is Empty) {
              return successState(context, [], []);
            } else if (state is Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is Success) {
              return successState(
                  context, state.categoriesInput, state.categoriesOutput);
            } else {
              return SizedBox();
            }
          },
        ),
        ButtonBar(
          children: [
            CardBarButton(
              title: AppLocalizations.of(context).btnShowReports,
              onPressed: () => ReportsPage.open(context),
            ),
            CardBarButton(
              title: AppLocalizations.of(context).categories,
              onPressed: () => CategoryListPage.open(context),
            ),
          ],
        )
      ],
    );
  }

  Widget successState(
      BuildContext context,
      List<CategoryCashflowBudget> categoriesInput,
      List<CategoryCashflowBudget> categoriesOutput) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: categoriesInput.isEmpty && categoriesOutput.isEmpty
          ? EmptyCardHint(title: AppLocalizations.of(context).noCategories,)
          : SizedBox(
              child: MonthCashflowChart(categoriesInput, categoriesOutput),
              height: 200,
            ),
    );
  }
}

abstract class CashflowCardEvent {}

class Fetch extends CashflowCardEvent {}

abstract class CashflowCardState {}

class Empty extends CashflowCardState {}

class Loading extends CashflowCardState {}

class Success extends CashflowCardState {
  final List<CategoryCashflowBudget> categoriesInput;
  final List<CategoryCashflowBudget> categoriesOutput;

  Success(this.categoriesInput, this.categoriesOutput);
}

class CashflowCardBloc extends Bloc<CashflowCardEvent, CashflowCardState> {
  final Repository _repository;

  CashflowCardBloc(this._repository) : super(Loading());

  @override
  Stream<CashflowCardState> mapEventToState(CashflowCardEvent event) async* {
    await for (List<CategoryCashflowBudget> categories
        in _repository.watchAllCategoryCashflowBudget(DateTime.now())) {
      if (categories.isEmpty) {
        yield Empty();
      } else {
        List<CategoryCashflowBudget> categoriesInput = categories
            .where((category) => category.type == OperationType.INPUT)
            .toList();

        List<CategoryCashflowBudget> categoriesOutput = categories
            .where((category) => category.type == OperationType.OUTPUT)
            .toList();

        yield Success(categoriesInput, categoriesOutput);
      }
    }
  }
}
