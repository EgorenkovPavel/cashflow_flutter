import 'package:flutter/material.dart';

import '../../../../domain/models/category/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(category.title));
  }
}