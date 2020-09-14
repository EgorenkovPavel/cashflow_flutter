import 'package:bloc/bloc.dart';
import 'package:cashflow/data/objects/operation.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/card_title.dart';
import 'package:cashflow/widgets/list_tiles/list_divider_operation.dart';
import 'package:cashflow/widgets/list_tiles/list_tile_operation.dart';
import 'package:cashflow/widgets/lists/operation_list.dart';
import 'package:cashflow/widgets/pages/operation_list_page.dart';
import 'package:cashflow/widgets/pages/operation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LastOperationsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<LastOperationsBloc>(context)..add(Fetch());
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CardTitle(AppLocalizations.of(context).titleLastOperations),
          BlocBuilder<LastOperationsBloc, LastOperationsState>(
            builder: (BuildContext context, LastOperationsState state) {
              if (state is Empty) {
                return ListTile(
                  title: Text(AppLocalizations.of(context).noOperations,
                      style: DefaultTextStyle.of(context)
                          .style
                          .copyWith(color: Colors.black38)),
                );
              } else if (state is Loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is Success) {
                return Column(
                  children: state.operations
                      .map<Widget>((op) => Column(
                            children: <Widget>[
                              ListDividerOperation.createByDate(context, op.date),
                              ListTileOperation(
                                op,
                                onTap: () => OperationPage.open(context, op.id),
                              ),
                            ],
                          ))
                      .toList(),
                );
              } else {
                return SizedBox();
              }
            },
          ),
          ButtonBar(
            children: [
              FlatButton(
                child:
                    Text(AppLocalizations.of(context).btnShowAll.toUpperCase(),style: DefaultTextStyle.of(context)
                        .style
                        .copyWith(color: Theme.of(context).accentColor, fontWeight: FontWeight.bold),
                    ),
                onPressed: () {
                  Navigator.of(context).pushNamed(OperationListPage.routeName);
                },
              )
            ],
          )
        ],
    );
  }
}

abstract class LastOperationsEvent {}

class Fetch extends LastOperationsEvent {}

abstract class LastOperationsState {}

class Loading extends LastOperationsState {}

class Success extends LastOperationsState {
  final List<Operation> operations;

  Success(this.operations);
}

class Empty extends LastOperationsState {}

class LastOperationsBloc
    extends Bloc<LastOperationsEvent, LastOperationsState> {
  final Repository _repository;

  LastOperationsBloc(this._repository) : super(Loading());

  @override
  Stream<LastOperationsState> mapEventToState(
      LastOperationsEvent event) async* {
    await for (List<Operation> operations
        in _repository.watchLastOperations(5)) {
      if (operations.isEmpty) {
        yield Empty();
      } else {
        yield Success(operations);
      }
    }
  }
}
