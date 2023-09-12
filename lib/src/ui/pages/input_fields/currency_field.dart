import 'package:flutter/material.dart';
import 'package:money_tracker/src/domain/models/enum/currency.dart';

class CurrencyField extends StatelessWidget {
  final Currency currency;
  final void Function(Currency) onChange;

  const CurrencyField({
    Key? key,
    required this.currency,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Currency>(
      value: currency,
      items: Currency.values
          .map((e) => DropdownMenuItem<Currency>(
                value: e,
                child: Text(e.name),
              ))
          .toList(),
      onChanged: (currency) {
        if (currency != null) {
          onChange(currency);
        }
      },
    );
  }
}
