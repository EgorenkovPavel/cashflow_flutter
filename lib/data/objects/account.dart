class Account{
  final int id;
  final String title;

  const Account({this.id = 0, required this.title});

  Account copyWith({int? id, String? title}) => Account(
    id: id ?? this.id,
    title: title ?? this.title,
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