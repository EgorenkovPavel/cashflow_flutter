import 'package:flutter/material.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/ui/page_navigator.dart';
import 'package:money_tracker/ui/pages/operation/operation_list.dart';
import 'package:money_tracker/utils/app_localization.dart';

class OperationListPage extends StatefulWidget {
  const OperationListPage({Key? key}) : super(key: key);

  @override
  _OperationListPageState createState() => _OperationListPageState();
}

class _OperationListPageState extends State<OperationListPage> {
  OperationListFilter _filter = OperationListFilter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).operations),
        actions: [
          IconButton(
              onPressed: () async {
                var newFilter =  await PageNavigator.openOperationFilterPage(context, _filter);
                if (newFilter != null){
                  setState(() {
                    _filter = newFilter;
                  });
                }
              },
              icon: Icon(Icons.filter_list))
        ],
      ),
      body: OperationList(filter: _filter),
      floatingActionButton: FloatingActionButton(
        onPressed: () => PageNavigator.openOperationInputPage(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
