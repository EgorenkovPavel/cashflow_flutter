import 'package:equatable/equatable.dart';

class CloudAccount extends Equatable{
  final String id;
  final String title;
  final bool isDebt;
  final bool deleted;

  const CloudAccount({
    required this.id,
    required this.title,
    required this.isDebt,
    required this.deleted,
  });

  CloudAccount copyWith({
    String? id,
    String? title,
    bool? isDebt,
    bool? deleted,
  }) =>
      CloudAccount(
        id: id ?? this.id,
        title: title ?? this.title,
        isDebt: isDebt ?? this.isDebt,
        deleted: deleted ?? this.deleted,
      );

  @override
  List<Object?> get props => [id,title,isDebt,deleted];
}
