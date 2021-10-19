import 'package:delimeals/data/dummy_meals_data.dart';
import 'package:delimeals/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meal';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS
        .where((element) => element.categories.contains(categoryId))
        .toList();
    return Scaffold(
        appBar: AppBar(
          title: Text('The Recipes'),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                key: ValueKey(categoryMeals[index].id),
                id: categoryMeals[index].id,
                title: categoryMeals[index].title,
                imageUrl: categoryMeals[index].imageUrl,
                duration: categoryMeals[index].duration,
                complexity: categoryMeals[index].complexity,
                affordability: categoryMeals[index].affordability);
          },
          itemCount: categoryMeals.length,
        ));
  }
}
