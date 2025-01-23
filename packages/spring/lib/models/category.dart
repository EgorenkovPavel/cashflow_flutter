import 'models.dart';

typedef CategoryId = AnalyticId;

abstract base class Category {
  final CategoryId? id;
  final String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> data) {
    final bool isGroup = (data['isGroup']);
    final CategoryType type = CategoryType.fromString(data['type']);
    final id = data['id'];
    final name = data['name'];
    final budget = data['budget'];
    final parent = data['parent'];

    if (!isGroup) {
      return switch (type) {
        CategoryType.input => InputCategoryItem(
            id: id,
            name: name,
            budget: budget,
            parent: parent,
          ),
        CategoryType.output => OutputCategoryItem(
            id: id,
            name: name,
            budget: budget,
            parent: parent,
          ),
      };
    } else {
      return switch (type) {
        CategoryType.input => InputCategoryGroup(
            id: id,
            name: name,
          ),
        CategoryType.output => OutputCategoryGroup(
            id: id,
            name: name,
          ),
      };
    }
  }

  Category copyWithId(CategoryId id);

  Map<String, dynamic> toJson();
}

abstract base class CategoryItem extends Category {
  final int budget;
  final CategoryId? parent;

  CategoryItem({
    super.id,
    required super.name,
    required this.budget,
    this.parent,
  });

  CategoryItem copyWith({String? name, int? budget, CategoryId? parent});
}

final class InputCategoryItem extends CategoryItem {
  InputCategoryItem({
    super.id,
    required super.name,
    required super.budget,
    super.parent,
  });

  @override
  InputCategoryItem copyWithId(CategoryId id) => InputCategoryItem(
        id: id,
        name: name,
        budget: budget,
        parent: parent,
      );

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'type': CategoryType.input.toString(),
        'budget': budget,
        'isGroup': false,
        'parent': parent,
      };

  @override
  InputCategoryItem copyWith({String? name, int? budget, CategoryId? parent}) =>
      InputCategoryItem(
        id: id,
        name: name ?? this.name,
        budget: budget ?? this.budget,
        parent: parent ?? this.parent,
      );
}

final class OutputCategoryItem extends CategoryItem {
  OutputCategoryItem({
    super.id,
    required super.name,
    required super.budget,
    super.parent,
  });

  @override
  OutputCategoryItem copyWithId(CategoryId id) => OutputCategoryItem(
        id: id,
        name: name,
        budget: budget,
        parent: parent,
      );

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'type': CategoryType.output.toString(),
        'budget': budget,
        'isGroup': false,
        'parent': parent,
      };

  @override
  OutputCategoryItem copyWith(
          {String? name, int? budget, CategoryId? parent}) =>
      OutputCategoryItem(
        id: id,
        name: name ?? this.name,
        budget: budget ?? this.budget,
        parent: parent ?? this.parent,
      );
}

abstract base class CategoryGroup extends Category {
  CategoryGroup({
    super.id,
    required super.name,
  });

  CategoryGroup copyWith({String? name});

}

final class InputCategoryGroup extends CategoryGroup {
  InputCategoryGroup({
    super.id,
    required super.name,
  });

  @override
  InputCategoryGroup copyWithId(CategoryId id) => InputCategoryGroup(
        id: id,
        name: name,
      );

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'type': CategoryType.input.toString(),
        'budget': 0,
        'isGroup': true,
        'parent': null,
      };

  @override
  InputCategoryGroup copyWith({String? name}) => InputCategoryGroup(
        id: id,
        name: name ?? this.name,
      );
}

final class OutputCategoryGroup extends CategoryGroup {
  OutputCategoryGroup({
    super.id,
    required super.name,
  });

  @override
  OutputCategoryGroup copyWithId(CategoryId id) => OutputCategoryGroup(
        id: id,
        name: name,
      );

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'type': CategoryType.output.toString(),
        'budget': 0,
        'isGroup': true,
        'parent': null,
      };

  @override
  OutputCategoryGroup copyWith({String? name}) => OutputCategoryGroup(
        id: id,
        name: name ?? this.name,
      );
}

/*
sealed class Category {
  final CategoryId? id;
  final String name;
  final CategoryType type;
  final UserGroupId userGroup;

  factory Category.fromJson(Map<String, dynamic> data) {
    if (data['isGroup']) {
      return CategoryGroup(
        id: data['id'],
        name: data['name'],
        type: CategoryType.fromString(data['type']),
        userGroup: data['userGroup'],
      );
    } else {
      return CategoryItem(
        id: data['id'],
        name: data['name'],
        type: CategoryType.fromString(data['type']),
        userGroup: data['userGroup'],
        budget: data['budget'],
        parent: data['parent'],
      );
    }
  }

  Category copyWithId(CategoryId id);

  Category({
    required this.id,
    required this.name,
    required this.type,
    required this.userGroup,
  });
}

class CategoryItem extends Category {
  final int budget;
  final CategoryId? parent;

  CategoryItem(
      {required super.id,
      required super.name,
      required super.type,
      required super.userGroup,
      required this.budget,
      this.parent});

  @override
  Category copyWithId(CategoryId id) => CategoryItem(
        id: id,
        name: this.name,
        type: this.type,
        userGroup: this.userGroup,
        budget: this.budget,
        parent: this.parent,
      );
}

class CategoryGroup extends Category {
  CategoryGroup(
      {required super.id,
      required super.name,
      required super.type,
      required super.userGroup});

  @override
  Category copyWithId(CategoryId id) => CategoryGroup(
        id: id,
        name: this.name,
        type: this.type,
        userGroup: this.userGroup,
      );
}

*/

/*
Категория.fromJson
  - элемент
    - вх InputCategoryItem
    - исх
  - группа
    - вх
    - исх

Операция
  - поступление (эл вх)
  - списание (эл исх)

class InputOpertion{
  id

  InputCategoryItem

}

Category.fromJson(data)

 */
