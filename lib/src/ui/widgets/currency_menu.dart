import 'package:flutter/material.dart';
import '../../domain/models.dart';

class CurrencyMenu extends StatefulWidget {
  final Currency currency;
  final void Function(Currency) onChange;

  const CurrencyMenu(
      {super.key, required this.currency, required this.onChange});

  @override
  State<CurrencyMenu> createState() => _CurrencyMenuState();
}

class _CurrencyMenuState extends State<CurrencyMenu> {
  late Currency _currency;

  @override
  void initState() {
    super.initState();
    _currency = widget.currency;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Currency>(
        value: _currency,
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
          widget.onChange(value);
          setState(() {
            _currency = value;
          });
        });
  }
}
