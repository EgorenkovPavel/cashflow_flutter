class Account {
  final int id;
  final String cloudId;
  final String title;
  final bool isDebt;

  const Account({
    this.id = 0,
    this.cloudId = '',
    required this.title,
    required this.isDebt,
  });

  Account copyWith({
    int? id,
    String? cloudId,
    String? title,
    bool? isDebt,
  }) =>
      Account(
        id: id ?? this.id,
        cloudId: cloudId ?? this.cloudId,
        title: title ?? this.title,
        isDebt: isDebt ?? this.isDebt,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Account && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
