import '../../domain/interfaces/data/account_data_repository.dart';
import '../../domain/interfaces/data/category_data_repository.dart';
import '../../domain/interfaces/data/data_repository.dart';
import '../../domain/interfaces/data/operation_data_repository.dart';

class DataRepositoryImpl implements DataRepository {
  final AccountDataRepository accountRepo;
  final CategoryDataRepository categoryRepo;
  final OperationDataRepository operationRepo;

  DataRepositoryImpl({
    required this.accountRepo,
    required this.categoryRepo,
    required this.operationRepo,
  });

  @override
  AccountDataRepository get accounts => accountRepo;

  @override
  CategoryDataRepository get categories => categoryRepo;

  @override
  OperationDataRepository get operations => operationRepo;
}
