class CloudOperation{
  final String id;
  final DateTime date;
  final int operationType;
  final String account;
  final String? category;
  final String? recAccount;
  final int sum;

  CloudOperation({required this.id,
    required this.date,
    required this.operationType,
    required this.account,
    this.category,
    this.recAccount,
    required this.sum});
}