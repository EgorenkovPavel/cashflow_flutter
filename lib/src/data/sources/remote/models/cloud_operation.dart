import 'package:equatable/equatable.dart';

class CloudOperation extends Equatable {
  final String id;
  final DateTime date;
  final int operationType;
  final String account;
  final String? category;
  final String? recAccount;
  final int sum;
  final bool deleted;

  const CloudOperation({
    required this.id,
    required this.date,
    required this.operationType,
    required this.account,
    this.category,
    this.recAccount,
    required this.sum,
    required this.deleted,
  });

  CloudOperation copyWith({
    String? id,
    DateTime? date,
    int? operationType,
    String? account,
    String? category,
    String? recAccount,
    int? sum,
    bool? deleted,
  }) =>
      CloudOperation(
        id: id ?? this.id,
        date: date ?? this.date,
        operationType: operationType ?? this.operationType,
        account: account ?? this.account,
        category: category ?? this.category,
        recAccount: recAccount ?? this.recAccount,
        sum: sum ?? this.sum,
        deleted: deleted ?? this.deleted,
      );

  @override
  List<Object?> get props =>
      [id, date, operationType, account, category, recAccount, sum, deleted];
}
