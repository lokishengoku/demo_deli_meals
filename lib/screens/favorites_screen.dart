import 'package:delimeals/models/meal.dart';
import 'package:delimeals/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoritesScreen({Key? key, required this.favoriteMeals})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.length == 0
        ? Center(
            child: Text('You have no favorites yet - start adding some'),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return MealItem(
                key: ValueKey(favoriteMeals[index].id),
                id: favoriteMeals[index].id,
                title: favoriteMeals[index].title,
                imageUrl: favoriteMeals[index].imageUrl,
                duration: favoriteMeals[index].duration,
                complexity: favoriteMeals[index].complexity,
                affordability: favoriteMeals[index].affordability,
                // removeItemFunction: () {},
              );
            },
            itemCount: favoriteMeals.length,
          );
  }
}
