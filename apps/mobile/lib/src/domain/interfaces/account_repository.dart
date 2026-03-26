import '../models.dart';

/// Repository for managing accounts (regular accounts and debts).
abstract interface class AccountRepository {
  /// Watch all accounts as a stream.
  Stream<List<BaseAccount>> watchAllAccounts();

  /// Get all accounts.
  Future<List<BaseAccount>> getAllAccounts();

  /// Watch a specific account by id as a stream.
  Stream<BaseAccount> watchAccountById(int id);

  /// Get a specific account by id.
  Future<BaseAccount> getAccountById(int id);

  /// Insert a new account and return its id.
  Future<int> insertAccount(BaseAccount account);

  /// Update an existing account.
  Future<void> updateAccount(BaseAccount account);
}

