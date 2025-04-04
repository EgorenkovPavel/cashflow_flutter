import 'package:equatable/equatable.dart';

class CategoryView extends Equatable{

  final int id;
  final String title;

  const CategoryView({required this.id, required this.title});

  @override
  List<Object?> get props => [id, title];

}