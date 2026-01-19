import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ReportsState {}

class InProgress extends ReportsState {}

class Data extends ReportsState {}

class ReportsBloc extends Cubit<ReportsState> {

  ReportsBloc() : super(InProgress());

  Future getCashflow(int year) async {
    emit(InProgress());
  }
}
