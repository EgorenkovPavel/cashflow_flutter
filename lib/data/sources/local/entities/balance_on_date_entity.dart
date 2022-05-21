import 'package:equatable/equatable.dart';

class BalanceOnDate extends Equatable{
  final DateTime date;
  final int sum;

  const BalanceOnDate(this.date, this.sum);

  @override
  List<Object?> get props => [date, sum];
}
