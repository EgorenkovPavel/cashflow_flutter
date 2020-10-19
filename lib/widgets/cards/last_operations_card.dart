import 'package:cashflow/data/objects/operation.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/card_title.dart';
import 'package:cashflow/widgets/cards/last_operations_bloc.dart';
import 'package:cashflow/widgets/cards/widgets/card_bar_button.dart';
import 'package:cashflow/widgets/cards/widgets/empty_card_hint.dart';
import 'package:cashflow/widgets/pages/operation/list_divider_operation.dart';
import 'package:cashflow/widgets/pages/operation/list_tile_operation.dart';
import 'package:cashflow/widgets/pages/operation/operation_edit_page.dart';
import 'package:cashflow/widgets/pages/operation/operation_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LastOperationsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<LastOperationsBloc>(context)..add(Fetch());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CardTitle(AppLocalizations.of(context).titleLastOperations),
        BlocBuilder<LastOperationsBloc, LastOperationsState>(
          builder: (BuildContext context, LastOperationsState state) {
            if (state is Empty) {
              return EmptyCardHint(title: AppLocalizations.of(context).noOperations,);
            } else if (state is Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is Success) {
              return _operationList(context, state.operations);
            } else {
              return SizedBox();
            }
          },
        ),
        ButtonBar(
          children: [
            CardBarButton(
              title: AppLocalizations.of(context).btnShowAll,
              onPressed: () => OperationListPage.open(context),
            ),
          ],
        )
      ],
    );
  }

  Widget _operationList(BuildContext context, List<Operation> operations) {
    return Column(
      children: operations
          .map((op) {
            int index = operations.indexOf(op);

            Widget divider = Divider();
            if (index == 0) {
              divider = ListDividerOperation(null, op);
            } else {
              divider = ListDividerOperation(
                operations[index - 1],
                operations[index],
              );
            }

            return [
              divider,
              ListTileOperation(
                op,
                onTap: () => OperationEditPage.open(context, op.id),
              ),
            ];
          })
          .expand((element) => element)
          .toList()..add(Divider()),
    );
  }
}

