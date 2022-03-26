import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/domain/interfaces/data_repository.dart';
import 'package:money_tracker/ui/pages/service/data_control_page/data_control_page_bloc.dart';
import 'package:money_tracker/utils/app_localization.dart';

class DataControlPage extends StatelessWidget {
  const DataControlPage({Key? key}) : super(key: key);

  void _listenState(BuildContext context, DataControlState state){
    if (state == DataControlState.SUCCESS) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          AppLocalizations.of(context).mesDatabaseDeleted,
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    var _bloc = DataControlBloc(context.read<DataRepository>());

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).titleDataControl),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () => _bloc.deleteAll(),
              child: Text(
                AppLocalizations.of(context).btnDeleteAll.toUpperCase(),
              ),
            ),
          ),
          BlocConsumer<DataControlBloc, DataControlState>(
            bloc: _bloc,
            builder: (context, state) {
              return state == DataControlState.IN_PROGRESS
                  ? const Center(child: CircularProgressIndicator())
                  : const SizedBox();
            },
            listener: _listenState,
          ),
        ],
      ),
    );
  }
}
