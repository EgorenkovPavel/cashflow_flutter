
import 'package:flutter/material.dart';
import 'package:money_tracker/ui/pages/operation/operation_list.dart';
import 'package:money_tracker/utils/app_localization.dart';

class OperationListPage extends StatelessWidget {
  const OperationListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).operations),
      ),
      body: OperationList(),
    );
  }
}
