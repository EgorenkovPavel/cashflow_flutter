import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String photo;
  final bool isAdmin;

  User({
    required this.id,
    required this.name,
    required this.photo,
    required this.isAdmin,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        photo = json['photo'],
        isAdmin = false;

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'photo': photo,
  };

  @override
  List<Object?> get props => [id, name, photo, isAdmin];
}
