import 'package:delimeals/widgets/category_item.dart';
import 'package:flutter/material.dart';
import '../../data/dummy_categories_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(5),
      children: DUMMY_CATEGORIES
          .map((catData) => CategoryItem(
              id: catData.id, title: catData.title, color: catData.color))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200, childAspectRatio: 3 / 2, mainAxisSpacing: 5),
    );
  }
}
