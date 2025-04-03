import 'package:flutter/material.dart';
import 'package:money_tracker/src/utils/extensions.dart';

import '../../../../../utils/sum.dart';

class SumField extends StatelessWidget {
  final bool highlight;
  final Sum sum;
  final void Function() onTap;

  const SumField({
    super.key,
    required this.highlight,
    required this.sum,
    required this.onTap,
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
            width: highlight ? 2.0 : 1.0,
          ),
        ),
        //width: double.infinity,
        height: 48.0,
        alignment: Alignment.center,
        child: Text(
          context.loc.sumFormat(sum),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}