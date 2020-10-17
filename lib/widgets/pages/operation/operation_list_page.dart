import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/pages/operation/operation_list.dart';
import 'package:cashflow/widgets/pages/operation/operation_filter_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OperationListPage extends StatefulWidget {
  static const routeName = '/operationList';

  const OperationListPage({Key key}) : super(key: key);

  static open(BuildContext context) {
    Navigator.of(context).pushNamed(routeName);
  }

  @override
  _OperationListPageState createState() => _OperationListPageState();
}

class _OperationListPageState extends State<OperationListPage> {

  OperationFilter _filter = OperationFilter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).operations),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.filter_list),
          onPressed: ()async{
            var filter = await OperationFilterPage.open(context, _filter);
            setState(() {
              _filter = filter;
            });
          },),
        ],
      ),
      body: OperationList(
        _filter == null ? Provider.of<Repository>(context).watchAllOperations() :
        Provider.of<Repository>(context).watchAllOperationsByFilter(_filter),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => OperationList.addItem(context),
      ),
    );
  }
}
