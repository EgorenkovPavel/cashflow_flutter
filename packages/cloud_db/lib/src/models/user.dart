class User {
  final String id;
  final String name;
  final String photo;

  User({required this.id, required this.name, required this.photo});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          photo == other.photo;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ photo.hashCode;
}
