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

  @override
  List<Object?> get props => [id, name, photo, isAdmin];
}
