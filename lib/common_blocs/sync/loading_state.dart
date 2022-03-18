import 'package:equatable/equatable.dart';

class LoadingState extends Equatable{
  final int accountCount;
  final int categoryCount;
  final int operationCount;

  const LoadingState({
    required this.accountCount,
    required this.categoryCount,
    required this.operationCount,
  });

  @override
  List<Object?> get props => [accountCount,categoryCount,operationCount];
}
