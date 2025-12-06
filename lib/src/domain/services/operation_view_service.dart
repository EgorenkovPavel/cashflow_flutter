import '../models/operation/operation_list_filter.dart';
import '../view_models/operation_list_item.dart';

/// Service for aggregating operation view data.
/// Combines operations with account and user information for display.
abstract class OperationViewService {
  /// Watch operations filtered by criteria as a stream.
  Stream<List<OperationView>> watchAllOperationsByFilter(
    OperationListFilter filter,
  );

  /// Watch operations for a specific account as a stream.
  Stream<List<OperationView>> watchAllOperationsByAccount(int accountId);

  /// Watch operations for a specific category as a stream.
  Stream<List<OperationView>> watchAllOperationsByCategory(int categoryId);

  /// Watch last N operations as a stream.
  Stream<List<OperationView>> watchLastOperations(int limit);
}

