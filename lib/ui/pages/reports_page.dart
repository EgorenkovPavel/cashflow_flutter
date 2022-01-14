import 'package:flutter/material.dart';
import 'package:money_tracker/domain/models/category_cashflow.dart';
import 'package:money_tracker/utils/app_localization.dart';

class ReportsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).titleReports),
      ),

    );
  }
}
