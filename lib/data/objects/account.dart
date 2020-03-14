class Account{
  final int id;
  final String title;
  final bool archive;

  const Account({this.id, this.title, this.archive});

  Account copyWith({int id, String title, bool archive}) => Account(
    id: id ?? this.id,
    title: title ?? this.title,
    archive: archive ?? this.archive,
  );
}