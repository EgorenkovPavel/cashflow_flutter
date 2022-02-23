import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/data_source.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/ui/page_navigator.dart';
import 'package:money_tracker/ui/pages/operation/list_page/operation_list_bloc.dart';
import 'package:money_tracker/ui/pages/operation/operation_list.dart';
import 'package:money_tracker/utils/app_localization.dart';

class OperationListPage extends StatelessWidget {
  const OperationListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OperationListBloc(context.read<DataSource>())
        ..add(Fetch(OperationListFilter.empty())),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context).operations),
            actions: [
              IconButton(
                  onPressed: () async {
                    var newFilter = await PageNavigator.openOperationFilterPage(
                        context,
                        context.read<OperationListBloc>().state.filter);
                    if (newFilter != null) {
                      context.read<OperationListBloc>().add(Fetch(newFilter));
                    }
                  },
                  icon: const Icon(Icons.filter_list))
            ],
          ),
          body: OperationList(context.watch<OperationListBloc>().state.operations),
          floatingActionButton: FloatingActionButton(
            onPressed: () => PageNavigator.openOperationInputPage(context),
            child: const Icon(Icons.add),
          ),
        );
      }),
    );
  }
}
