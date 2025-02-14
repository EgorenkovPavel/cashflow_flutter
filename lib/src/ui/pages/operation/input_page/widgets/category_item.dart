import 'package:flutter/material.dart';

import '../../../../../domain/models/category/category.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(category.title));
  }
}