import 'package:equatable/equatable.dart';

import '../domain/models/enum/currency.dart';

class Sum extends Equatable {
  final int sum;
  final Currency currency;

  const Sum(this.sum, this.currency);

  Sum operator +(int sum) => Sum(this.sum + sum, currency);

  Sum operator *(int sum) => Sum(this.sum * sum, currency);

  Sum operator /(int sum) => Sum((this.sum / sum).floor(), currency);

  bool get isEmpty => sum == 0;

  @override
  List<Object?> get props => [sum, currency];

  Sum copyWith({int? sum, Currency? currency}) =>
      Sum(sum ?? this.sum, currency ?? this.currency);
}


