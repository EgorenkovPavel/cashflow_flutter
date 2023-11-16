import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import '../domain/models/enum/budget_type.dart';
import '../domain/models/enum/currency.dart';
import '../domain/models/enum/operation_type.dart';

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

  String operationTypeTitle(OperationType type) {
    switch (type) {
      case OperationType.INPUT:
        return typeInput;
      case OperationType.OUTPUT:
        return typeOutput;
      case OperationType.TRANSFER:
        return typeTransfer;
      default:
        return '';
    }
  }

  String budgetTypeTitle(BudgetType type) {
    switch (type) {
      case BudgetType.MONTH:
        return budgetTypeMonth;
      case BudgetType.YEAR:
        return budgetTypeYear;
    }
  }

  String currencyTitle(Currency type) {
    switch (type) {
      case Currency.RUB:
        return 'RUB';
      case Currency.USD:
        return 'USD';
      case Currency.EUR:
        return 'EUR';
    }
  }
}
