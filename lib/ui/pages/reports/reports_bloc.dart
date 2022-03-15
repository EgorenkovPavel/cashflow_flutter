import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/domain/interfaces/data_source.dart';

abstract class ReportsState {}

class InProgress extends ReportsState {}

class Data extends ReportsState {}

class ReportsBloc extends Cubit<ReportsState> {
  final DataSource localSource;

  ReportsBloc(this.localSource) : super(InProgress());

  Future getCashflow(int year) async {
    emit(InProgress());
  }
}
