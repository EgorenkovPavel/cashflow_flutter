import 'package:cashflow/data/objects/category_cashflow_budget.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/card_title.dart';
import 'package:cashflow/widgets/cards/cashflow_bloc.dart';
import 'package:cashflow/widgets/cards/widgets/card_bar_button.dart';
import 'package:cashflow/widgets/cards/widgets/empty_card_hint.dart';
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
