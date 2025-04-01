import 'package:equatable/equatable.dart';
import '../../../utils/sum.dart';
import '../enum/operation_type.dart';

class OperationListItem extends Equatable {
  final int id;
  final DateTime date;
  final bool deleted;
  final bool synced;
  final String account;
  final String analytic;
  final String userPhotoUrl;
  final Sum sum;
  final OperationType type;

  const OperationListItem({
    required this.id,
    required this.date,
    required this.account,
    required this.analytic,
    required this.deleted,
    required this.synced,
    required this.sum,
    required this.type,
    required this.userPhotoUrl,
  });

  @override
  List<Object?> get props =>
      [id, date, deleted, synced, account, analytic, sum, type, userPhotoUrl];
}
