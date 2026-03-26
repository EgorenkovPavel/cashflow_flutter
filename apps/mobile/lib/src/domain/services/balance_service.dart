import '../view_models/account_balance_view.dart';

/// Service for aggregating account balance data.
/// Combines accounts, users, and balance information.
abstract class BalanceService {
  /// Watch all account balances as a stream.
  Stream<List<AccountBalanceView>> watchAllBalance();

  /// Get all account balances.
  Future<List<AccountBalanceView>> getAllBalance();
}

