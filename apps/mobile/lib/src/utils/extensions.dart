import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../domain/models.dart';
import '../l10n/app_localizations.dart';

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
  AppLocalizations get loc => AppLocalizations.of(this)!;

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

  String rateFormat(double rate) => NumberFormat.currency(
    //locale: locale.languageCode,
    symbol: Currency.RUB.symbol,
    decimalDigits: 2,
  ).format(rate);

  String sumFormat(Money sum) => numberFormat(sum.sum, sum.currency);

  String operationTypeTitle(OperationType type) => switch (type) {
    .INPUT => typeInput,
    .OUTPUT => typeOutput,
    .TRANSFER => typeTransfer,
    .EXCHANGE => typeExchange,
  };

  String budgetTypeTitle(BudgetType type) => switch (type) {
    .MONTH => budgetTypeMonth,
    .YEAR => budgetTypeYear,
  };

  String currencyTitle(Currency type) => switch (type) {
    .RUB => 'RUB',
    .USD => 'USD',
    .EUR => 'EUR',
  };
}

extension BudgetTypeLocale on BudgetType {
  String toLocaleKey() {
    return switch (this) {
      BudgetType.MONTH => 'month',
      BudgetType.YEAR => 'year',
    };
  }
}

extension OperationTypeUI on OperationType{
  Color get color => switch(this){
    OperationType.INPUT => Colors.green,
    OperationType.OUTPUT => Colors.red,
    OperationType.TRANSFER => Colors.blue,
    OperationType.EXCHANGE => Colors.cyan,
  };

  IconData get icon => switch(this){
    OperationType.INPUT => Icons.add,
    OperationType.OUTPUT => Icons.remove,
    OperationType.TRANSFER => Icons.redo,
    OperationType.EXCHANGE => Icons.currency_exchange,
  };
}