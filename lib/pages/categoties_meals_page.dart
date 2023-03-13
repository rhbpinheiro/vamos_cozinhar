import 'package:flutter/material.dart';

import 'package:shop/widgets/meal_item.dart';

import '../models/category.dart';
import '../models/meal.dart';

class CategotiesMealsPage extends StatelessWidget {
   final List<Meal>? meals;
  const CategotiesMealsPage({
    Key? key,
    this.meals,
  }) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category?;

     final categoryMeals = meals!.where((meal) {
      return meal.categories!.contains(category!.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(category!.title!),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (context, index) {
            return MealItem(meal: categoryMeals[index]);
          },
        ),
      ),
    );
  }
}
