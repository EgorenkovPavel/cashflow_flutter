import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/src/injection_container.dart';
import 'package:money_tracker/src/ui/pages/service/data_control_page/data_control_bloc.dart';
import 'package:money_tracker/src/utils/extensions.dart';

class DataControlPage extends StatelessWidget {
  const DataControlPage({Key? key}) : super(key: key);

  void _listenState(BuildContext context, DataControlState state) {
    state.mapOrNull(success: (_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(context.loc.mesDatabaseDeleted),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    var bloc = sl<DataControlBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.titleDataControl),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () => bloc.add(const DataControlEvent.deleteAll()),
              child: Text(context.loc.btnDeleteAll.toUpperCase()),
            ),
          ),
          BlocConsumer<DataControlBloc, DataControlState>(
            bloc: bloc,
            builder: (context, state) => state.maybeMap(
              inProgress: (_) =>
                  const Center(child: CircularProgressIndicator()),
              orElse: () => const SizedBox(),
            ),
            listener: _listenState,
          ),
        ],
      ),
    );
  }
}
