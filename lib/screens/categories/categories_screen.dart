import 'package:delimeals/screens/categories/category_item.dart';
import 'package:flutter/material.dart';
import '../../data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeals'),
      ),
      body: GridView(
        padding: EdgeInsets.all(5),
        children: DUMMY_CATEGORIES
            .map((catData) =>
                CategoryItem(title: catData.title, color: catData.color))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 20),
      ),
    );
  }
}
