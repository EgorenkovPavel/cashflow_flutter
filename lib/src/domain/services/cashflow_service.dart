import '../models/category/category_cashflow.dart';
import '../models/enum/category_type.dart';
import '../../utils/balance.dart';

/// Service for aggregating category cashflow data.
/// Combines categories with their cashflow information.
abstract class CashflowService {
  /// Watch cashflow for all categories for a specific date.
  Stream<List<CategoryCashFlow>> watchCashFlow(DateTime date);

  /// Watch cashflow for categories of a specific type for a specific date.
  Stream<List<CategoryCashFlow>> watchCashFlowByType(
    DateTime date,
    CategoryType type,
  );

  Future<Map<DateTime, Balance>> getMonthlyExpenses(
      int categoryId,
      int monthCount,
      );
}

