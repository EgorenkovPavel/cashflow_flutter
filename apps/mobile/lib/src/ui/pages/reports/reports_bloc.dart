import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ReportsState {}

class InProgress extends ReportsState {}

class Data extends ReportsState {}

class ReportsBloc extends Cubit<ReportsState> {

  ReportsBloc() : super(InProgress());

  void getCashflow(int year) {
    emit(Data());
  }
}
