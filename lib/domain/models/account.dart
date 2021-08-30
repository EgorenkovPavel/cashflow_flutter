class Account{
  final int id;
  final String title;
  final bool isDebt;

  const Account({this.id = 0, required this.title, this.isDebt = false});

  Account copyWith({int? id, String? title, bool? isDebt}) => Account(
    id: id ?? this.id,
    title: title ?? this.title,
    isDebt: isDebt ?? this.isDebt,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Account &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  int get hashCode => id.hashCode;

}