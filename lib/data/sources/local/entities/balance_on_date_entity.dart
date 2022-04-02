import 'package:equatable/equatable.dart';

class BalanceOnDate extends Equatable{
  DateTime date;
  int sum;

  BalanceOnDate(this.date, this.sum);

  @override
  List<Object?> get props => [date, sum];
}
