import 'package:flutter/material.dart';
import 'package:shop/widgets/meal_item.dart';

import '../models/meal.dart';

class FavoritePage extends StatelessWidget {
  final List<Meal> favoritesMeals;

  const FavoritePage({
    Key? key,
    required this.favoritesMeals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoritesMeals.isEmpty) {
      return Center(
        child: Text(
          'Nenhuma refeição foi marcada como favorita',
        ),
      );
    } else {
      return ListView.builder(
        itemCount: favoritesMeals.length,
        itemBuilder: (context, index) {
          return MealItem(
            meal: favoritesMeals[index],
          );
        },
      );
    }
  }
}
