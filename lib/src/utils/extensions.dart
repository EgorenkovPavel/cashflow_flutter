import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import '../domain/models.dart';
import 'sum.dart';

extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

extension DateTimeExtension on DateTime {
  DateTime startOfMonth(DateTime date) {
    return DateTime(date.year, date.month).add(const Duration());
  }
}

extension MapExtension on Map<String, dynamic> {
  dynamic getOrDefault(String key, dynamic value) {
    return containsKey(key) ? this[key] : value;
  }
}

extension AppLocalization on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this);

  MaterialLocalizations get materialLoc => MaterialLocalizations.of(this);
}

extension AppLocalizationExtended on AppLocalizations {
  String numberFormat(int number, Currency currency) {
    return NumberFormat.currency(
      //locale: locale.languageCode,
      symbol: currency.symbol,
      decimalDigits: 0,
    ).format(number);
  }

  String sumFormat(Sum sum) => numberFormat(sum.sum, sum.currency);

  String operationTypeTitle(OperationType type) => switch (type) {
        OperationType.INPUT => typeInput,
        OperationType.OUTPUT => typeOutput,
        OperationType.TRANSFER => typeTransfer,
      };

  String budgetTypeTitle(BudgetType type) => switch (type) {
        BudgetType.MONTH => budgetTypeMonth,
        BudgetType.YEAR => budgetTypeYear,
      };

  String currencyTitle(Currency type) => switch (type) {
        Currency.RUB => 'RUB',
        Currency.USD => 'USD',
        Currency.EUR => 'EUR',
      };
}
