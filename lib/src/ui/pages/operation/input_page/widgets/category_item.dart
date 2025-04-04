import 'package:flutter/material.dart';

import '../../../../../domain/models.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    super.key,
    required this.category,
  });

  final CategoryView category;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(category.title));
  }
}