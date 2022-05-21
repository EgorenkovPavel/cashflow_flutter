
import 'package:equatable/equatable.dart';

class SumOnDate extends Equatable{
  final DateTime date;
  final int sum;

  const SumOnDate({required this.date, required this.sum});

  @override
  List<Object?> get props => [date, sum];
}
