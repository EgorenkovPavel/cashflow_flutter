import 'package:flutter/material.dart';
import 'package:money_tracker/src/utils/extensions.dart';

import '../../../../../domain/models/enum/currency.dart';

class SumField extends StatelessWidget {
  final bool highlight;
  final int sum;
  final Currency currency;
  final void Function() onTap;

  const SumField({
    super.key,
    required this.highlight,
    required this.sum,
    required this.onTap, required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).bottomAppBarTheme.color,
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
            color: highlight
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.primary,
            width: 2.0,
          ),
        ),
        //width: double.infinity,
        height: 48.0,
        alignment: Alignment.center,
        child: Text(
          context.loc.numberFormat(sum, currency),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}