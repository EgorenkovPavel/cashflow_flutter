import 'package:flutter/material.dart';

import '../../../../domain/models/category/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(category.title));
  }
}