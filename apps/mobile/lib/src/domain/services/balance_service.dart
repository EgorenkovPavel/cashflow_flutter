import '../models/account/account_balance_item.dart';

/// Service for aggregating account balance data.
/// Combines accounts, users, and balance information.
abstract class BalanceService {
  /// Watch all account balances as a stream.
  Stream<List<AccountBalanceItem>> watchAllBalance();

  /// Get all account balances.
  Future<List<AccountBalanceItem>> getAllBalance();
}

