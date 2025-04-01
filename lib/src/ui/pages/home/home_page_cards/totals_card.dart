import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/src/ui/blocs/currency_rate_bloc.dart';
import 'package:money_tracker/src/utils/extensions.dart';
import 'package:money_tracker/src/utils/sum.dart';

import '../../../blocs/account_balance_bloc.dart';

class TotalsCard extends StatelessWidget {
  const TotalsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              context.loc.titleTotalBalance,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Chip(
                    label: Text(
                        'USD ${1 / context.watch<CurrencyRateBloc>().state.usd}'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Chip(
                    label: Text(
                        'EUR ${1 / context.watch<CurrencyRateBloc>().state.eur}'),
                  ),
                ),
              ],
            ),
            Wrap(
              children: context.watchTotals()
                  .sums
                  .map((sum) => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SumChip(
                          sum: sum,
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class SumChip extends StatelessWidget {
  final Sum sum;

  const SumChip({
    super.key,
    required this.sum,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        context.loc.sumFormat(sum),
      ),
    );
  }
}
