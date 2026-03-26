import 'package:flutter/material.dart';
import '../../domain/models.dart';

class CurrencyMenu extends StatelessWidget {
  final Currency currency;
  final void Function(Currency) onChange;

  const CurrencyMenu(
      {super.key, required this.currency, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Currency>(
      underline: SizedBox(),
        value: currency,
        items: Currency.values
            .map((e) => DropdownMenuItem<Currency>(
                  value: e,
                  child: Text(e.toString()),
                ))
            .toList(),
        onChanged: (value) {
          if (value == null) {
            return;
          }
          onChange(value);
        });
  }
}
