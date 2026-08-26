import '../models.dart';

/// Service for aggregating operation view data.
/// Combines operations with account and user information for display.
abstract class OperationViewService {
  /// Watch operations filtered by criteria as a stream.
  Stream<List<OperationListItem>> watchAllOperationsByFilter(
    OperationListFilter filter,
  );

  /// Watch operations for a specific account as a stream.
  Stream<List<OperationListItem>> watchAllOperationsByAccount(int accountId);

  /// Watch operations for a specific category as a stream.
  Stream<List<OperationListItem>> watchAllOperationsByCategory(int categoryId);

  /// Watch last N operations as a stream.
  Stream<List<OperationListItem>> watchLastOperations(int limit);
}

