import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/injection_container.dart';
import 'package:money_tracker/src/ui/app.dart';
import 'package:money_tracker/src/ui/pages/operation/list_page/operation_list_bloc.dart';
import 'package:money_tracker/src/ui/pages/operation/operation_list.dart';
import 'package:money_tracker/src/utils/extensions.dart';

class OperationListPage extends StatelessWidget {
  const OperationListPage({super.key});

  Future<void> _onFilterPressed(BuildContext context) async {
    var newFilter = await context.openOperationFilterPage(
      context.read<OperationListBloc>().state.filter,
    );
    if (newFilter != null) {
      if (!context.mounted) return;
      context.read<OperationListBloc>().add(Fetch(newFilter));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<OperationListBloc>()
        ..add(Fetch(const OperationListFilter())),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(context.loc.operations),
            actions: [
              IconButton(
                onPressed: () => _onFilterPressed(context),
                icon: const Icon(Icons.filter_list, color: Colors.black,),
              ),
            ],
          ),
          body: OperationList(
            context.watch<OperationListBloc>().state.operations,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => context.openOperationInputPage(),
            child: const Icon(Icons.add),
          ),
        );
      }),
    );
  }
}
