import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/injection_container.dart';
import 'package:money_tracker/ui/page_navigator.dart';
import 'package:money_tracker/ui/pages/home/month_operations/month_operations_bloc.dart';
import 'package:money_tracker/ui/themes.dart';
import 'package:money_tracker/utils/app_localization.dart';
import 'package:money_tracker/utils/date_util.dart';

class MonthOperations extends StatelessWidget {
  const MonthOperations({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '${AppLocalizations.of(context).operationsIn} ',
                  style: Theme.of(context).textTheme.headline6,
                ),
                TextSpan(
                  text: DateFormat.MMMM(
                    Localizations.localeOf(context).toString(),
                  ).format(DateTime.now()),
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlocProvider(
                create: (context) =>
                    sl<MonthOperationsBloc>()..add(Fetch(OperationType.INPUT)),
                child: const _MonthOperation(
                  operationType: OperationType.INPUT,
                ),
              ),
              const SizedBox(
                height: Dimensions.padding,
              ),
              BlocProvider(
                create: (context) =>
                    sl<MonthOperationsBloc>()..add(Fetch(OperationType.OUTPUT)),
                child: const _MonthOperation(
                  operationType: OperationType.OUTPUT,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MonthOperation extends StatelessWidget {
  final OperationType operationType;

  const _MonthOperation({Key? key, required this.operationType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => PageNavigator.openBudgetPage(context, operationType),
      // child: Card(
      //   child: Padding(
      //     padding: const EdgeInsets.all(16.0),
      //     child: Column(
      //       children: [
      //         Text(
      //             operationType == OperationType.INPUT
      //                 ? AppLocalizations.of(context).earning
      //                 : AppLocalizations.of(context).spending,
      //             style: Theme.of(context).textTheme.headline6),
      //         SizedBox(
      //           height: 16,
      //         ),
      //         Stack(
      //           children: [
      //             AspectRatio(
      //               aspectRatio: 1,
      //               child: CircularProgressIndicator(
      //                 value: _progress,
      //                 strokeWidth: 10.0,
      //               ),
      //             ),
      //             AspectRatio(
      //               aspectRatio: 1,
      //               child: Center(
      //                 child: Column(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   children: [
      //                     Text(
      //                       AppLocalizations.of(context)
      //                           .numberFormat(_cashflow),
      //                       style: Theme.of(context)
      //                           .textTheme
      //                           .headline6!
      //                           .copyWith(
      //                             fontSize: 20,
      //                             fontWeight: FontWeight.bold,
      //                           ),
      //                     ),
      //                     Text(
      //                       AppLocalizations.of(context)
      //                           .numberFormat(_budget),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      child: Container(
        padding: const EdgeInsets.all(Dimensions.padding),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: [
            Text(
              operationType == OperationType.INPUT
                  ? AppLocalizations.of(context).earning
                  : AppLocalizations.of(context).spending,
              style: Theme.of(context).textTheme.headline6,
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    child: LinearProgressIndicator(
                      minHeight: 10,
                      color: Theme.of(context).colorScheme.primary,
                      value: context.select<MonthOperationsBloc, double>(
                        (bloc) => _progress(
                          bloc.state.cashflow[operationType] ?? 0,
                          bloc.state.budget[operationType] ?? 0,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(getAlign(), 0.0),
                  child: Container(
                    color: Colors.black,
                    width: 2.0,
                    height: 32.0,
                  ),
                ),
              ],
            ),
            Text(AppLocalizations.of(context).numberFormat(
              context.select<MonthOperationsBloc, int>(
                (bloc) => bloc.state.cashflow[operationType] ?? 0,
              ),
            )),
          ],
        ),
      ),
    );
  }

  double _progress(int cashflow, int budget) {
    var progress = 0.0;
    if (cashflow == 0) {
      progress = 0;
    } else if (cashflow > budget || budget == 0) {
      progress = 1;
    } else {
      progress = cashflow / budget;
    }

    return progress;
  }

  double getAlign() {
    var now = DateTime.now();
    var days = DateUtil.daysInMonth(now.month, now.year);

    return now.day / days * 2 - 1;
  }
}
